#!/bin/sh
set -eu

INPUT=${1:?usage: $0 INPUT_DIR OUTPUT_DIR}
OUTPUT=${2:?usage: $0 INPUT_DIR OUTPUT_DIR}
ROOT=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
FACE_URL=https://raw.githubusercontent.com/rizalward/rizal.info/main/rbowzr/ubuntu-touch/releases/0.1.0-ut3-r2/face.tar.gz
FACE_SHA=768bd1640e0ddb0de6f4839c927041a59d3e34efa1731f94d572802ae291e6ce
FACE_SIZE=8820444
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT HUP INT TERM

for name in boot.img halium-boot.img system.img vendor.img ubuntu-touch-rootfs.img; do
  test -f "$INPUT/$name" || { echo "missing required input: $INPUT/$name" >&2; exit 2; }
done

mkdir -p "$OUTPUT" "$WORK/bundle"
if command -v curl >/dev/null 2>&1; then
  curl --fail --location --retry 3 --output "$WORK/face.tar.gz" "$FACE_URL"
else
  python3 -c 'import sys,urllib.request; urllib.request.urlretrieve(sys.argv[1],sys.argv[2])' "$FACE_URL" "$WORK/face.tar.gz"
fi

actual_size=$(wc -c < "$WORK/face.tar.gz" | tr -d ' ')
if command -v sha256sum >/dev/null 2>&1; then actual_sha=$(sha256sum "$WORK/face.tar.gz" | awk '{print $1}'); else actual_sha=$(shasum -a 256 "$WORK/face.tar.gz" | awk '{print $1}'); fi
test "$actual_size" = "$FACE_SIZE" || { echo "face size mismatch: $actual_size" >&2; exit 3; }
test "$actual_sha" = "$FACE_SHA" || { echo "face sha256 mismatch: $actual_sha" >&2; exit 3; }

cp "$INPUT"/*.img "$WORK/bundle/"
cp "$WORK/face.tar.gz" "$WORK/bundle/face-0.1.0-ut3.tar.gz"
cp "$ROOT/manifest.json" "$WORK/bundle/manifest.json"
tar -C "$WORK" -cf "$WORK/bundle.tar" bundle
if command -v zstd >/dev/null 2>&1; then
  zstd -q -f "$WORK/bundle.tar" -o "$OUTPUT/yabowzr-ubuntu-touch-sargo-24.04-ut3.img.tar.zst"
else
  gzip -c "$WORK/bundle.tar" > "$OUTPUT/yabowzr-ubuntu-touch-sargo-24.04-ut3.img.tar.gz"
fi
for artifact in "$OUTPUT"/yabowzr-ubuntu-touch-sargo-24.04-ut3.img.tar.*; do
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$artifact"; else shasum -a 256 "$artifact"; fi
done
echo "verified standalone flash bundle written to $OUTPUT"
