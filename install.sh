#!/bin/sh
# ЯLAB one-line installer for ЯBOWZR (default) and ЯBOT — ad-hoc signed apps, no Gatekeeper warning, $0.
#   curl -fsSL https://rizal.info/install.sh | sh              → ЯBOWZR
#   curl -fsSL https://rizal.info/install.sh | sh -s -- ybot   → ЯBOT        (or: curl -fsSL https://rizal.info/install-ybot.sh | sh)
# What it does: finds the newest GitHub release for the app → downloads the DMG + SHA256SUMS over HTTPS only → checks the SHA-256
# (and the ed25519 signature on SHA256SUMS when this Mac's openssl supports ed25519) → mounts read-only (-nobrowse) → copies the app with
# ditto into ~/ЯLAB/APPS ONLY (created if missing) and REPLACES IT IN PLACE → clears com.apple.quarantine → unmounts.
# ONE APP · ONE TILE: the only seat is ~/ЯLAB/APPS/<App>.app. Nothing is ever written to /Applications or ~/Applications. The previous
# seat is parked (not deleted) as ~/ЯLAB/UPDATES/<App>/old/<App>-<version>-<time>.app.parked (not a .app → no second tile) and
# unregistered from LaunchServices. A copy found in /Applications or ~/Applications is only REPORTED (remove it yourself to keep one tile).
# Slim+heart (ЯBOT 0.3.3+): when the release also publishes YBOT-*-heart.gguf, downloads and verifies heart, seats it at
# Contents/Resources/heart.gguf, then re-ad-hoc-signs so the resource seal stays valid. On update, a matching heart already seated in
# ~/ЯLAB/APPS (or, read-only, in a legacy /Applications copy) is reused (no 2 GiB re-download).
# Why no warning: free ad-hoc signature (Apple silicon runs only signed code) and curl does not add the quarantine flag, so there is no
# App Translocation wherever the app lives. ЯMAX ЯID-0003 for the Decider ЯID-0001 · rizal.info · one-tile revision 2026-09-28
# Settings (env): INSTALL_APP=rbowzr|ybot · INSTALL_REPO=owner/repo · INSTALL_YES=1 (no questions) · INSTALL_WORK (download folder) ·
#   test only: INSTALL_LAB_ROOT (default ~/ЯLAB; the seat is always <root>/APPS) · INSTALL_API_URL / INSTALL_BASE_URL =
#   http://127.0.0.1:<port>/… (plain http is accepted ONLY for 127.0.0.1/localhost).
set -eu

APP_KEY="${1:-${INSTALL_APP:-rbowzr}}"
REPO="${INSTALL_REPO:-rizalward/rizal.info}"                 # ← set at publish time (see RELEASES/PUBLISH-STEPS.md)
LAB_ROOT="${INSTALL_LAB_ROOT:-$HOME/ЯLAB}"
INSTALL_DIR="$LAB_ROOT/APPS"                                   # the ONLY install target (one app · one tile)
LSREG=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister
PUBKEY_B64="zs7M4OOB0zQhWOQw3SHpAY+XYxbZJvcPESy1y400Ti0="   # ЯLAB release signing (ed25519) public key

say() { printf '%s\n' "ЯLAB install · $*"; }
die() { printf '%s\n' "ЯLAB install · ERROR · $*" >&2; exit 1; }

case "$APP_KEY" in
  rbowzr|RBOWZR|ЯBOWZR) APPNAME="ЯBOWZR"; ASSET="RBOWZR"; TAG="rbowzr-v" ;;
  ybot|YBOT|ЯBOT)       APPNAME="ЯBOT";   ASSET="YBOT";   TAG="ybot-v" ;;
  *) die "unknown app '$APP_KEY' (use rbowzr or ybot)" ;;
esac

[ "$(uname -s)" = Darwin ] || die "macOS only"
[ "$(uname -m)" = arm64 ] || say "note: this build is Apple-silicon (arm64); on an Intel Mac it will not run"
for t in curl shasum hdiutil ditto xattr plutil codesign; do command -v "$t" >/dev/null 2>&1 || die "missing $t"; done

API="${INSTALL_API_URL:-}"
[ -n "$API" ] || API="${INSTALL_BASE_URL:+${INSTALL_BASE_URL%/}/releases.json}"
[ -n "$API" ] || { [ "$REPO" != "OWNER/REPO" ] || die "release repo not set yet (INSTALL_REPO=owner/repo)"; API="https://api.github.com/repos/$REPO/releases?per_page=30"; }
PROTO="=https"
case "$API" in
  http://127.0.0.1:*|http://127.0.0.1/*|http://localhost:*|http://localhost/*) PROTO="=http,https"; say "TEST MODE · local server $API" ;;
  https://*) ;;
  *) die "refusing non-HTTPS source $API" ;;
esac
fetch() { curl -fsSL --proto "$PROTO" --proto-redir "$PROTO" --tlsv1.2 --retry 2 --connect-timeout 20 "$@"; }

W="${INSTALL_WORK:-}"
if [ -z "$W" ]; then W="$(mktemp -d "${TMPDIR:-/tmp}/rlab-install.XXXXXX")"; else mkdir -p "$W"; fi
MNT="$W/mnt"; MOUNTED=0
cleanup() { if [ "$MOUNTED" = 1 ]; then hdiutil detach "$MNT" -quiet 2>/dev/null || hdiutil detach "$MNT" -force -quiet 2>/dev/null || true; fi; }
trap cleanup EXIT INT TERM

# 1) newest non-draft, non-prerelease release whose tag starts with $TAG (works for /releases lists and /releases/latest objects)
say "looking up the newest $APPNAME release…"
fetch -H 'Accept: application/vnd.github+json' "$API" -o "$W/releases.json" || die "cannot reach $API"
x() { plutil -extract "$1" raw -o - "$W/releases.json" 2>/dev/null; }
P=""
if x tag_name >/dev/null; then P=""; else
  i=0; P="none"
  while t="$(x "$i.tag_name")"; do
    case "$t" in "$TAG"*) if [ "$(x "$i.draft")" != true ] && [ "$(x "$i.prerelease")" != true ]; then P="$i."; break; fi ;; esac
    i=$((i + 1))
  done
  [ "$P" != none ] || die "no $TAG* release found"
fi
VERTAG="$(x "${P}tag_name")"
DMG_URL=""; DMG_NAME=""; SLIM_URL=""; SLIM_NAME=""; FULL_URL=""; FULL_NAME=""
HEART_URL=""; HEART_NAME=""; SUMS_URL=""; SIG_URL=""; j=0
while n="$(x "${P}assets.$j.name")"; do
  u="$(x "${P}assets.$j.browser_download_url")"
  case "$n" in
    "$ASSET"-*-slim.dmg)
      SLIM_NAME="$n"; SLIM_URL="$u" ;;
    "$ASSET"-*.dmg)
      case "$n" in *-slim.dmg) ;; *) FULL_NAME="$n"; FULL_URL="$u" ;; esac ;;
    "$ASSET"-*-heart.gguf)
      HEART_NAME="$n"; HEART_URL="$u" ;;
    SHA256SUMS) SUMS_URL="$u" ;;
    SHA256SUMS.sig) SIG_URL="$u" ;;
  esac
  j=$((j + 1))
done
if [ -n "$SLIM_URL" ]; then
  DMG_NAME="$SLIM_NAME"; DMG_URL="$SLIM_URL"
elif [ -n "$FULL_URL" ]; then
  DMG_NAME="$FULL_NAME"; DMG_URL="$FULL_URL"
fi
[ -n "$DMG_URL" ] || die "release $VERTAG has no $ASSET-*.dmg"
[ -n "$SUMS_URL" ] || die "release $VERTAG has no SHA256SUMS — refusing to install unverified"
for u in "$DMG_URL" "$SUMS_URL" $SIG_URL $HEART_URL; do
  [ -n "$u" ] || continue
  case "$u" in https://*) ;; http://127.0.0.1*|http://localhost*) [ "$PROTO" != "=https" ] || die "non-HTTPS asset $u" ;; *) die "non-HTTPS asset $u" ;; esac
done

sum_for() {
  awk -v n="$1" '{ f=$2; sub(/^\*/, "", f); sub(/^.*\//, "", f) } f==n { print $1; exit }' "$W/SHA256SUMS"
}

# 2) download + verify DMG (+ optional heart asset later)
say "downloading $DMG_NAME ($VERTAG)…"
fetch "$DMG_URL" -o "$W/$DMG_NAME" || die "download failed"
fetch "$SUMS_URL" -o "$W/SHA256SUMS" || die "SHA256SUMS download failed"
WANT="$(sum_for "$DMG_NAME")"
GOT="$(shasum -a 256 "$W/$DMG_NAME" | awk '{print $1}')"
[ -n "$WANT" ] || die "$DMG_NAME is not listed in SHA256SUMS"
[ "$WANT" = "$GOT" ] || die "SHA-256 mismatch for $DMG_NAME (want $WANT, got $GOT) — NOT installed"
say "SHA-256 ok · $GOT"
HEART_WANT=""
if [ -n "$HEART_URL" ]; then
  HEART_WANT="$(sum_for "$HEART_NAME")"
  [ -n "$HEART_WANT" ] || die "$HEART_NAME is published but not listed in SHA256SUMS — refusing to install"
fi
SIGSTATE="not published"
if [ -n "$SIG_URL" ] && fetch "$SIG_URL" -o "$W/SHA256SUMS.sig" 2>/dev/null; then
  SIGSTATE="skipped (this Mac's openssl has no ed25519; HTTPS + SHA-256 only)"
  if command -v openssl >/dev/null 2>&1 && command -v xxd >/dev/null 2>&1; then
    { printf '%s' 302a300506032b6570032100; printf '%s' "$PUBKEY_B64" | base64 -D 2>/dev/null | xxd -p | tr -d '\n'; } | xxd -r -p > "$W/pub.der"
    if openssl pkey -pubin -inform DER -in "$W/pub.der" -noout 2>/dev/null; then
      base64 -D -i "$W/SHA256SUMS.sig" -o "$W/SHA256SUMS.sig.bin" 2>/dev/null || base64 -d < "$W/SHA256SUMS.sig" > "$W/SHA256SUMS.sig.bin"
      if openssl pkeyutl -verify -pubin -inkey "$W/pub.der" -keyform DER -rawin -in "$W/SHA256SUMS" -sigfile "$W/SHA256SUMS.sig.bin" >/dev/null 2>&1; then
        SIGSTATE="ed25519 ok (ЯLAB release signing)"
      else die "ed25519 signature on SHA256SUMS is INVALID — NOT installed"; fi
    fi
  fi
fi
say "signature · $SIGSTATE"

# 3) mount read-only, seat into ~/ЯLAB/APPS (replace in place, park the previous seat)
[ -n "${INSTALL_DIR##/Applications*}" ] || die "refusing /Applications (one app · one tile: ~/ЯLAB/APPS only)"
mkdir -p "$MNT"
hdiutil attach -nobrowse -readonly -noautoopen -mountpoint "$MNT" "$W/$DMG_NAME" >/dev/null || die "could not mount $DMG_NAME"
MOUNTED=1
SRC=""; for a in "$MNT"/*.app; do [ -d "$a" ] && { SRC="$a"; break; }; done
[ -n "$SRC" ] || die "no .app inside $DMG_NAME"
APPDIR="$(basename "$SRC")"; DEST="$INSTALL_DIR/$APPDIR"
mkdir -p "$INSTALL_DIR" || die "could not create $INSTALL_DIR"
[ -w "$INSTALL_DIR" ] || die "$INSTALL_DIR is not writable (no sudo is ever used)"
BID="$(plutil -extract CFBundleIdentifier raw -o - "$SRC/Contents/Info.plist" 2>/dev/null || true)"

# Other copies = other tiles: report only (this installer never touches /Applications or ~/Applications)
LEGACY=""
for L in "/Applications/$APPDIR" "$HOME/Applications/$APPDIR"; do
  [ -d "$L" ] && { LEGACY="${LEGACY:+$LEGACY }$L"; say "NOTE · another copy exists at $L — remove it (Trash) to keep ONE tile; the app opens its ~/ЯLAB/APPS seat instead"; }
done

# If replacing, optionally reuse a matching heart (seat first, then a legacy copy read-only) — avoids a 2 GiB re-download
SAVED_HEART=""
if [ -n "$HEART_URL" ] && [ -n "$HEART_WANT" ]; then
  for H in "$DEST/Contents/Resources/heart.gguf" "/Applications/$APPDIR/Contents/Resources/heart.gguf" "$HOME/Applications/$APPDIR/Contents/Resources/heart.gguf"; do
    [ -f "$H" ] || continue
    if [ "$(shasum -a 256 "$H" | awk '{print $1}')" = "$HEART_WANT" ]; then
      SAVED_HEART="$W/heart-reuse.gguf"; ditto "$H" "$SAVED_HEART" || SAVED_HEART=""
      [ -n "$SAVED_HEART" ] && { say "will reuse heart from $H (SHA-256 match)"; break; }
    fi
  done
fi

WAS_RUNNING=0
if [ -e "$DEST" ]; then
  pgrep -f "$DEST/Contents/MacOS/" >/dev/null 2>&1 && WAS_RUNNING=1
  OLDV="$(plutil -extract CFBundleShortVersionString raw -o - "$DEST/Contents/Info.plist" 2>/dev/null || echo old)"
  TS="$(date +%Y%m%d-%H%M%S)"; PARK_DIR="$LAB_ROOT/UPDATES/$APPNAME/old"; PARK="$PARK_DIR/$APPNAME-$OLDV-$TS.app.parked"
  ANS="r"
  if [ "${INSTALL_YES:-0}" != 1 ] && [ -r /dev/tty ] && [ -w /dev/tty ]; then
    printf 'ЯLAB install · replace %s (%s) IN PLACE? The old one is parked at %s. [r]eplace or [q]uit? [r] ' "$DEST" "$OLDV" "$PARK" > /dev/tty
    read -r ANS < /dev/tty || ANS="r"; [ -n "$ANS" ] || ANS="r"
  fi
  case "$ANS" in r|R|b|B|y|Y) ;; *) die "left $DEST untouched" ;; esac
  [ "$WAS_RUNNING" = 1 ] && say "$APPNAME is running — it keeps running from the parked copy until you quit it; relaunch opens the new seat"
  mkdir -p "$PARK_DIR" || die "could not create $PARK_DIR"
  [ -x "$LSREG" ] && "$LSREG" -u "$DEST" >/dev/null 2>&1 || true
  mv "$DEST" "$PARK" || die "could not park the old app"
  say "old seat parked at $PARK (nothing deleted · not a .app, so no second tile)"
fi
say "seating $APPDIR → $INSTALL_DIR (the one seat)"
ditto "$SRC" "$DEST" || die "copy failed"
xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true
hdiutil detach "$MNT" -quiet && MOUNTED=0 || true

# 4) optional heart.gguf (slim split) — reuse / download, verify, seat, re-ad-hoc-sign
HEART_STATE="none"
if [ -n "$HEART_URL" ]; then
  HEART_DEST="$DEST/Contents/Resources/heart.gguf"
  HEART_SRC=""
  if [ -n "$SAVED_HEART" ] && [ -f "$SAVED_HEART" ]; then
    HEART_SRC="$SAVED_HEART"
    say "reusing previous heart (no download)"
  else
    say "downloading $HEART_NAME (heart model)…"
    fetch "$HEART_URL" -o "$W/$HEART_NAME" || die "heart download failed"
    HEART_SRC="$W/$HEART_NAME"
  fi
  GOT_H="$(shasum -a 256 "$HEART_SRC" | awk '{print $1}')"
  [ "$HEART_WANT" = "$GOT_H" ] || die "SHA-256 mismatch for heart (want $HEART_WANT, got $GOT_H) — app copied but heart NOT seated"
  say "heart SHA-256 ok · $GOT_H"
  say "seating heart → $HEART_DEST"
  mkdir -p "$DEST/Contents/Resources" || die "could not create Resources"
  ditto "$HEART_SRC" "$HEART_DEST" || die "heart seat failed"
  xattr -dr com.apple.quarantine "$HEART_DEST" 2>/dev/null || true
  # Seating a new resource invalidates the slim DMG's seal — re-ad-hoc-sign (same flags as rlab-release.sh)
  say "re-signing after heart seat (ad-hoc, hardened runtime)…"
  codesign --force --deep --sign - --options runtime --timestamp=none --preserve-metadata=entitlements "$DEST" \
    || die "re-sign after heart seat failed — heart seated but signature INVALID"
  HEART_STATE="seated · $GOT_H"
fi

[ -x "$LSREG" ] && "$LSREG" -f "$DEST" >/dev/null 2>&1 || true
# HARD RULE · an update grows IN PLACE: exactly one copy of this app in the seat folder, no live .app in UPDATES
for O in "$INSTALL_DIR"/*.app; do
  [ -d "$O" ] && [ "$O" != "$DEST" ] || continue
  [ "$(plutil -extract CFBundleIdentifier raw -o - "$O/Contents/Info.plist" 2>/dev/null)" = "$BID" ] && die "one app · one tile: a second copy $O exists next to $DEST — move it to the Trash, then re-run"
done
for O in "$LAB_ROOT/UPDATES/$APPNAME"/old/*.app; do [ -d "$O" ] && die "one app · one tile: live app copy in the parking area ($O) — it must end in .app.parked"; done
if codesign --verify --deep --strict "$DEST" 2>/dev/null; then CS="valid (ad-hoc)"; else CS="INVALID"; fi
if xattr -p com.apple.quarantine "$DEST" >/dev/null 2>&1; then QS="present"; else QS="none"; fi
say "installed $APPNAME $VERTAG → $DEST · signature $CS · quarantine $QS · heart $HEART_STATE"
[ -n "$LEGACY" ] && say "one tile · still to remove by hand: $LEGACY"
say "open it:  open \"$DEST\"   ·   download kept in $W"
say "one-liner:  curl -fsSL https://rizal.info/install.sh | sh$( [ "$ASSET" = YBOT ] && printf ' -s -- ybot' )"
