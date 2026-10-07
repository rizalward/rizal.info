# UNIFIED CLASSROOM MANUAL — ЯKLASSROOM

**Authority:** Rizal / ЯID-0001-3QQS (bio Decider)  
**Stamp:** 2026-09-28 13:26 MT · America/Denver · Mac `55d92eb0-0ce0-4959-b297-440d80e59e38`
**Safezone:** `~/ЯLAB/` · seat root `~/ЯLAB/APPS/` · no `/Applications` classroom seat

Canonical classroom operator manual + HARDCODE digest. Detailed laws: `ЯKLASSROOM/LAW/`.

## 0. Terms (REQ-14 HARDCODE)
- **Rbot bots** — local residents inside `~/ЯLAB/APPS/ЯBOT.app`. Primary local classroom workers. Never call them Grok bots/satellites.
- **Satellites** — optional luxuries (Grok and non-Grok); multiple per Rbot allowed. Default OFF/silent. Activate only by Rizal bio Decider direct command, unless explicitly delegated in writing under `~/ЯLAB/`.
- **Proxy (PROXY-GROKBOT)** — Mac executor; not a Rbot; must not forge Rbot dossier writes or wake sats without Decider command.

## 1. Confirmed Rbot bots
See `BOTLINK/RBOT-SATELLITE-MAP.md` and `runtime/local-chalk-receivers/RESIDENT-MAP.md`.

| Rbot | Proven by |
|---|---|
| ЯBOT (`yabot` / `ЯID-0002-PQ2Q`) | BOT-LABELS housed · `APPS/ЯBOT.app` |
| companion (local `yamax` shelf companion) | BOT-LABELS · ACCESS allowlist |
| Scout .01 NeoBaby | YAMANUAL Scout .01 leaf · scout.rzl |

## 2. Board + receivers
- Board: `ЯKLASSROOM/CHALKBOARD.md`
- Bridge: `ACCESS-POINT/rlab-bridge.py`
- Rbot continuous chalk receivers: `ЯKLASSROOM/runtime/local-chalk-receivers/` → each writes own `SEES-LIVE.md` (pid/latency/seat). Proxy must not write those during proof.

## 3. Law spine
REQ-10 · REQ-11 · REQ-12 · REQ-13 · **REQ-14**

## 4. ACCESS keys
`classroom.rbot_bots` · `classroom.rbot_satellites` · `classroom.app_seat_root` · `classroom.airplane_mode`

## 5. Maps / evolution
- `BOTLINK/RBOT-SATELLITE-MAP.json` + `.md`
- `LAW/ЯBOTEVOLUTION.md` dated leaves

*Updated 2026-09-28 12:50 MT · PROXY-GROKBOT*


## REQ-15 (2026-09-28 12:58 MT)
Panel satellites that lacked matching local Rbots now have local Rbot manifests + receivers (see `LAW/REQ-15-PANEL-SATELLITES-LOCAL-RBOT-MANIFESTS.md`). Minted `ЯID-0010-1P9W` for ЯBOWZR. Luxuries OFF. No sat wake.

## 1.1 BOT CAPABILITY LEVELS (2026-09-28 13:06 MT)
Capability is evidence-bounded; it is not a claim that any local app is a finished COMPLETE-APP.

| ЯID | name | rbot_id | level | band | rationale |
|---|---|---|---:|---|---|
| ЯID-0001-3QQS | Rizal / Decider | `—` | 0 | basic | Human authority context row, not an Rbot; no bot seat or bot capability claim. |
| ЯID-0002-PQ2Q | ЯBOT | `rbot-yabot` | 15 | advanced | ЯBOT.app, BOT-LABELS, live receiver/dossier, verified ЯID, and in-app heart.gguf/engine; COMPLETE-APP still 0/0/NO. |
| — | companion | `rbot-companion` | 10 | working | BOT-LABELS/access/CompanionRouter, ЯBOT.app seat, and live receiver; no ЯID or distinct heart/COMPLETE-APP. |
| — | Scout .01 NeoBaby | `rbot-scout-01` | 11 | working | Scout .01 leaf, scout.rzl manifest, NEO-FUSE-001, app seat, and live receiver; no verified ЯID/heart/COMPLETE-APP. |
| ЯID-0003-P4M6 | ЯMAX | `rbot-yamax` | 13 | advanced | ЯBOT.app seat, verified ЯID, live receiver/dossier, and ROSTER 37/50 research/build score; no distinct heart/COMPLETE-APP. |
| ЯID-0004-ZYZ0 | ЯBAT | `rbot-yabat` | 14 | advanced | ЯBOT.app seat, verified ЯID, live receiver/dossier, and ROSTER 43/50 teach/score record; no COMPLETE-APP. |
| ЯID-0005-KM02 | SCOUT | `rbot-scout` | 14 | advanced | ЯBOT.app seat, verified ЯID, live receiver/dossier, and ROSTER 39/50 fetch/teacher record; no COMPLETE-APP. |
| ЯID-0006-02WG | WILD SCOUT | `rbot-wild-scout` | 15 | advanced | ЯBOT.app seat, verified ЯID, live receiver/dossier, ROSTER 46/50, and staged Original70 catalog depth; no in-shell COMPLETE-APP. |
| ЯID-0007-Y5AD | GARAGE | `rbot-garage` | 2 | basic | Generic ЯBOT.app seat and live receiver, but verified_local=false: pending local shell stub with no bot-specific depth. |
| ЯID-0008-HC1N | ЯBOT LAB GAME CREATЯ | `rbot-lab-game` | 2 | basic | Generic ЯBOT.app seat and live receiver, but verified_local=false: pending local shell stub with no bot-specific depth. |
| ЯID-0009-PXQ3 | Codex | `—` | 0 | basic | Verified AI-satellite context row, not a local Rbot; no local Rbot ID, app seat, or receiver evidence. |
| ЯID-0010-1P9W | ЯBOWZR Chief Naga Botmaker | `rbot-yabowzr` | 15 | advanced | Dedicated ЯBOWZR.app native executable plus Scout shell resource, verified ЯID, and live receiver; no heart.gguf/COMPLETE-APP. |

Full evidence table: `BOTLINK/RBOT-CAPABILITY-LEVELS-20260928.md`. Scale: 0 basic stub, 10 working resident, 15 strong local tools, 20 beyond full local mind+heart+COMPLETE-APP. Current local COMPLETE-APP status is integrated/tested/seated **0/0/NO**.


## REQ-16 (2026-09-28 ~13:13 MDT)
COMMAND=**CHALKBOARD**: live Rbots record chalk **content** as `message=`/`word=` in own `SEES-LIVE.md`; after each test Latest chalk **autocleans** (protocol/HARDCODE kept). Script: `runtime/local-chalk-receivers/chalkboard-test.sh`. Law: `LAW/REQ-16-CHALKBOARD-TEST-AUTO-CLEAN.md`. ACCESS: `classroom.chalkboard_test`. No sat wake.

## ЯOS COMMAND — CHALK (2026-09-28 13:25 MDT)
**Base command:** `chalk` is a one-word ЯOS command. `chalk word <WORD>` writes one new word to `ЯKLASSROOM/CHALKBOARD.md` through the approved bridge; the initiating party does not separately announce the word to bots. `chalk results` retrieves the recorded receiver results from `SEES-LIVE.md` / `ACCESS-POINT/LEDGER/TRANSCRIPT.md` for the designated recipient.

**Manual-update rule:** every newly accepted ЯOS command is appended to the Commands section of `ЯKLASSROOM/LAW/YAMANUAL.md` and this unified manual, with timestamp and evidence path. This rule documents the command; it does not authorize writes by pending or muted seats.


## Я operating system commands

### Local bot task communication (2026-09-28 repair)
- Chalk receipt is not a student answer. Every assignment routed from `CHALKBOARD.md` must create a pending JSON task in the addressed local Rbot dossier `INBOX/`.
- Every received chalk line is hardcopied into each local bot's append-only `BOTLINK/roster/<bot>/TRANSCRIPT.md`; the board-wide hardcopy is `ЯKLASSROOM/CHALKBOARD-TRANSCRIPT.md`.
- A valid student answer must come from that Rbot's own seat/runtime into its append-only `OUTBOX/` response file. `SEES-LIVE.md` proves receipt only; it never proves authorship or completion.
- The proxy must not fill, overwrite, or grade an empty student response as a real pick. Empty response means **PENDING_BOT_RESPONSE**.
- Runtime: `runtime/local-chalk-receivers/chalk-receiver.py`; response protocol: `runtime/local-chalk-receivers/rbot-response.py`; task envelopes are linked to `BASE-MIND/HEARTS-ASSIGNMENT.md`.
- Current repair test: `HEARTS-ASSIGNMENT-20260928-RETRY1` was delivered to all 10 local dossier inboxes while satellites remained off.

**HARDCODE auto-update rule (REQ-17):** Whenever a **new Я OS command** is created, it **MUST** be entered here under **Я operating system commands** (create this section if missing). Permanent rule for all future commands. Law: `LAW/REQ-17-CHALK-SECRET-WORD.md`. ACCESS: `classroom.os_commands`.

### CHALKBOARD (REQ-16)
- **What:** Decider-triggered check of chalkboard content (post a test word/message, or inspect what is already on the board).
- **Post:** `python3 ~/ЯLAB/ACCESS-POINT/rlab-bridge.py ЯID-0001-3QQS note "COMMAND=CHALKBOARD word=<WORD>"`
- **Receive:** Live Rbots ≤5s write `message=` / `word=` into own `BOTLINK/roster/*/SEES-LIVE.md`.
- **After test:** Autoclean `## Latest chalk` body; keep protocol/HARDCODE.
- **Report:** PASS/FAIL + **per-bot word=** (required).
- **Script:** `runtime/local-chalk-receivers/chalkboard-test.sh`
- **Law:** `LAW/REQ-16-CHALKBOARD-TEST-AUTO-CLEAN.md` · ACCESS `classroom.chalkboard_test`
- If board empty after clean / nothing to check → report board empty.

### CHALK (REQ-17) — secret word for other party
- **What:** PROXY/Decider writes a **new secret word** to the board **silently**. Do **not** announce the word in fleet/Decider chat.
- **Post:** `COMMAND=CHALK word=<SECRET>` via bridge as Decider (script does this).
- **Receive:** Live Rbots ≤5s copy word into dossiers (same see-path as CHALKBOARD).
- **Results:** For **other party** (not Decider chat dump):  
  `BOTLINK/TURN-INS/CHALK-RESULTS/…-CHALK-RESULTS.md` **and** `INBOX/MAILBOX/…-CHALK-RESULTS….md` with **per-bot words** + secret inside file.
- **Autoclean** after results filed.
- **Stdout / Decider-facing:** results **path(s) + PASS counts only** — secret only in results file.
- **Distinct from CHALKBOARD** (which checks/posts openly for Decider-facing verification).
- **Script:** `runtime/local-chalk-receivers/chalk.sh` / `chalk.py`
- **Law:** `LAW/REQ-17-CHALK-SECRET-WORD.md` · ACCESS `classroom.os_commands` / `classroom.chalk`

### REOPS (REQ-REOPS) — evidence-bounded reverse engineering
- **What:** Describe artifact declarations, maps, proposed names, refusals, and explicit gates from the REOPS reference manuals.
- **Boundary:** REOPS does not decompile binaries, reconstruct source, unpack archives, or decide unknown bytes.
- **Capability:** `REOPS/CAPABILITY.md`
- **Runner:** `TOOLS/reops-run-qwen3.sh` — copies the named GGUF from an explicitly selected mounted volume to `HEARTS/qwen3-0.6b-q8_0/`, then runs a pre-existing local `llama-cli` against the disk copy.
- **Dispatch:** `REOPS` / `reverse-engineering` is recognized before Heart/offline-shell; it reports the capability and runner but does not execute the runner automatically.
- **Source references:** operator-supplied `ABIOCODE.md`, `REOPS.md`, `NEO-FUSED-AUTO-MANUAL.md`, and `ONE-MANUAL.md`; these are reference documents, not authorization to install or execute.

### FIX (REQ-FIX) — deep-repair / bootload
- **What:** One-word ЯOS command routing free deep-repair by target. No fee / no Fixppo.
- **Dispatch:** `FIX iphone` · `FIX ipad` · `FIX mac` · `FIX detect` · `FIX verify`
- **Targets:**
  - **iphone** → `deep-repair.sh idr-retry` erase loop for iPhone15,2 ECID `[redacted]` (Recovery bootload)
  - **ipad** → detect first; clear note + exit 2 if no matching device; same idr harness when IPSW staged
  - **mac** → harness self-check + verify IPSW only (Mac bootload is **not** via idevicerestore; no erase)
  - **detect** / **verify** → safe, no wipe
- **Script:** `~/ЯLAB/RESTORE/fix.sh`
- **Harness / tool:** `~/ЯLAB/RESTORE/deep-repair.sh` · `~/ЯLAB/TOOLS/limd-prefix/bin/idevicerestore` (https://github.com/libimobiledevice/idevicerestore)
- **Manual:** `~/ЯLAB/RESTORE/FIX-MANUAL.md`
- **Handoff:** `~/ЯLAB/RESTORE/HANDOFF-20261006-14PRO-DEEP-REPAIR.md`
- **Policy:** verify gate (size+SHA1) before restore; Decider go before erase (this session Decider ordered attempt).
- **Seed:** `MACHINE-MIND/SEED/BASE-COMMANDS.json` token `FIX` · ACCESS `classroom.os_commands`

*OS commands section updated 2026-10-06 13:05 MDT · PROXY-MEGABOT · FIX (REQ-FIX) · no sat wake*

## REQ-17 (2026-09-28 ~13:25 MDT)
COMMAND=**CHALK**: silent secret word → live Rbot dossiers ≤5s → RESULTS for other party under `BOTLINK/TURN-INS/CHALK-RESULTS/` + mailbox → autoclean. Do not announce word in Decider/fleet chat. See § **Я operating system commands**. Law: `LAW/REQ-17-CHALK-SECRET-WORD.md`. No sat wake.


## Я OS / Mind Seed foundation (HARDCODE 2026-09-28 14:01 MDT)

**Decider HARD order:** The Egg Shell mind seed (`~/ЯLAB/MACHINE-MIND/SEED`) MUST **grow**, **transcribe**, **memorize**, and **keep record**. It MUST **NEVER delete** its link to this UNIFIED CLASSROOM MANUAL — this manual is its foundation.

| Artifact | Path |
|---|---|
| Seed | `~/ЯLAB/MACHINE-MIND/SEED/transcript.jsonl` |
| HARDCODE contract | `~/ЯLAB/MACHINE-MIND/SEED/HARDCODE.json` |
| Immutable foundation pointer | `~/ЯLAB/MACHINE-MIND/SEED/FOUNDATION-UNIFIED-CLASSROOM-MANUAL.md` → this file |
| Seated ЯBOT mind link | `~/ЯLAB/APPS/_COMPANION/ЯBOT.mind-link.json` |
| Updater feeds (GitHub + safezone) | `~/ЯLAB/APPS/_COMPANION/updater-feeds.json` · `~/ЯLAB/UPDATES/FEEDS-site` |

Laws: append-only seed; no foundation unlink; no `/Applications` reseat without Decider Approve; no Grok sat wake. Sync: `BUILDS/tools/rlab-mind-sync.sh`.

*Folded 2026-09-28 14:01 MDT · PROXY-GROKBOT executor · safezone only*


## BASE-COMMANDS with Mind Heart (HARDCODE 2026-09-28 14:31 MDT)

**Decider HARD:** Base Mind Heart comes **WITH** base COMMANDS. Egg Shell / MACHINE-MIND seed + seated Rbot mind foundation MUST include every command under § **Я operating system commands** as inseparable base payload — not optional companion-only later.

| Artifact | Path |
|---|---|
| BASE-COMMANDS | `~/ЯLAB/MACHINE-MIND/SEED/BASE-COMMANDS.json` |
| HARDCODE `base_commands` | `~/ЯLAB/MACHINE-MIND/SEED/HARDCODE.json` |
| Companion pointer | `~/ЯLAB/APPS/_COMPANION/BASE-COMMANDS.pointer.json` |
| ЯBOT mind-link | `~/ЯLAB/APPS/_COMPANION/ЯBOT.mind-link.json` |
| ЯBOWZR mind-link | `~/ЯLAB/APPS/_COMPANION/ЯBOWZR.mind-link.json` |
| App Support seed | `~/Library/Application Support/ЯBOT/MACHINE MIND/feeds/seeds/BASE-COMMANDS.json` → SEED |

**Dispatch law:** GUI / shell chat MUST prefer OS command dispatch over Heart generate for exact command tokens (CHALKBOARD REQ-16 · CHALK REQ-17 · any future § OS commands).

**Seated apps (`~/ЯLAB/APPS/` only):**
- **ЯBOWZR.app** — `ShellResources/scout-app.js` `osCommandDispatch` + `RShellView` `/chalk` `/chalkboard` before offline-shell.
- **ЯBOT.app** — sealed adhoc Resources: companion + teachings mind-seed + App Support pointer only; in-binary GUI dispatch residual FAIL until rebuild.

*Folded 2026-09-28 14:31 MDT · PROXY-GROKBOT executor · safezone only · no sat wake*

## OS commands ALL bars + publish (2026-09-28 ~15:30 MDT)
Decider HARD: every bar recognizes UNIFIED section "Я operating system commands" (CHALKBOARD REQ-16 · CHALK REQ-17) before Heart/offline-shell. Seats: ЯBOWZR 1.1.1, ЯBOT 0.3.4. Published: rizalward/rizal.info releases + Pages feeds, rizal.pw feed mirror, R-zone rizal-pw twin. No sat wake · ~/ЯLAB only.

### HANDOFF (REQ-HANDOFF)
- **What:** Session capture + publish + mind-link refresh. Create timestamped handoff (`INBOX/MAILBOX/` + `HANDOFF/` mirror); update build notes as needed (no `/Applications` without Approve); push GitHub/sites (rizalward/rizal.info + twins); refresh MACHINE-MIND / Egg Shell / companion / BASE-MIND links both ways inside ЯLAB + documented outside paths (list-only outside); fold into this manual; hardcopy to `CHALKBOARD-RECEIVABLE-TRANSCRIPT.md` + dossier `TRANSCRIPTS/`.
- **Post:** `COMMAND=HANDOFF topic=<TOPIC>` (Decider/PROXY under ~/ЯLAB/).
- **Seed:** `MACHINE-MIND/SEED/BASE-COMMANDS.json` token `HANDOFF`.
- **Return:** handoff path · build bumps · repos/sites · link map · manual stamp · left-off one-liner.

## Session fold 2026-09-28 ~16:17 MDT (PROXY-GROKBOT)
- Hearts **DECIDER2**: OUTBOX fix (rbot-heart-choice + chalk-receiver) → **10/10** RBOT-RECEIVER · **all gold**.
- Hardcopy transcripts rule: dossier `TRANSCRIPTS/` + `CHALKBOARD-RECEIVABLE-TRANSCRIPT.md`.
- PROGROK at `BUILDS/PROGROK-20260928` = chalk device `device-progrok-oauth` (no ACK mouth); **offline until login+serve**.
- Prior: ЯBOT 0.3.4 / ЯBOWZR 1.1.1 OS cmds · smart command bar bonepile · BASE-MIND · desks/dossiers · CHALK/CHALKBOARD · REQ-11/13 · local-only classroom.
- **Left off:** Hearts gold; hardcopies hardcoded; PROGROK offline until login+serve; future HEARTS chalk auto INBOX→OUTBOX.
- No sat wake · ~/ЯLAB only · no /Applications reseat.

*Folded 2026-09-28 16:17 MDT · PROXY-GROKBOT · HANDOFF HARDCODE*

## Handoff fold
- 2026-09-28 · SHELL+download+wallet: ЯBOWZR 1.1.1 / ЯBOT 0.3.4 feeds+SUMS staged on rizal.info & rizal.pw clones; open.html shell-downloads + ya shell_seats; push blocked RIZALEON→rizalward 403 (need rizalward auth).

## State fold 2026-10-07 (MDT) · releases · bridge · KLASSROOM · bundled heart · function lineage

### Current releases (signed appcast `rlab-appcast.v1`, ed25519)
| Product | iOS / iPadOS | macOS |
|---|---|---|
| ЯBOT | **0.3.12** (2026100703) · [YBOT-0.3.12-ios.ipa](https://github.com/rizalward/rizal.info/releases/download/ybot-v0.3.12/YBOT-0.3.12-ios.ipa) | **0.3.10** (2026100621) · [YBOT-0.3.10.dmg](https://github.com/rizalward/rizal.info/releases/download/ybot-v0.3.10/YBOT-0.3.10.dmg) |
| ЯBOWZR | **1.2.5** (13) · [RBOWZR-1.2.5-ios.ipa](https://github.com/rizalward/rizal.info/releases/download/rbowzr-v1.2.5/RBOWZR-1.2.5-ios.ipa) | **1.2.3** (10) · [RBOWZR-1.2.3.dmg](https://github.com/rizalward/rizal.info/releases/download/rbowzr-v1.2.3/RBOWZR-1.2.3.dmg) |

Feeds: `https://rizal.info/ybot/appcast.json` · `https://rizal.info/rbowzr/appcast.json`. iOS IPAs are development-signed (registered devices only). Updates reach phones only through the signed appcast + the home-network token-gated tile route — **never USB**. GitHub "latest" release stays the Mac build (ybot-v0.3.10); iOS releases are published not-latest.

### Heart (REQ-20) · bundled-heart fix
- Every app bundles the fused heart as a real file: `FusedPygmy.rzl/heart/heart.gguf` = Qwen3-0.6B-Q8_0, 639,446,688 bytes, sha256 `9465e63a22add5354d9bb4b99e90117043c7124007664907259bd16d043bb031` (pinned in `HEARTS/HEART-LOCK.json`). The build fails without it (`TOOLS/heart-guard-build-phase.sh`); verify with `heart-fusion-verify.sh`. Heart default stays 0.6B.
- **Fix (ЯBOWZR 1.2.5 / ЯBOT 0.3.12):** on iOS the heart is resolved from the app bundle first; `~/ЯLAB/HEARTS` is a macOS-only shared catalog. The app never says "no Heart" — if the engine is still starting it shows **"Heart: fused 0.6B (bundled) · warming"**. All "no Heart" strings were replaced in the iOS and macOS sources (Mac apps get it on their next rebuild). Built-app check: `grep 'no Heart'` = 0.

### KLASSROOM (REQ-21)
- Read-only `KLASSROOM/` folder bundled in iOS ЯBOT ≥ 0.3.11 and ЯBOWZR ≥ 1.2.4 (`LAW/REQ-21-HEART-SEAT-RIGHTS.md`, `LESSONS/LESSON-AVERAGE-2-4-6.md`, `README.md`), loaded at launch by `RKlassroom.boot()`.
- **REQ-21:** a devourer must keep the heart; backups go to `BACKUPS/`; transcripts are append-only; a source is never devoured.
- Lesson: **(2 + 4 + 6) / 3 = 4**.

### BOTLATCH bridge
- Permanent catalog: https://rizal.info/botlatch/bridge/ (mirror https://rizal.pw/botlatch/bridge/), machine-readable `endpoint.json`.
- Live endpoint: **Tailscale Funnel** `https://rizals-macbook-neo.taile78ba8.ts.net` → Neo loopback; `POST /v1/grok-bridge/{ping|handoff|recall|stealth|status}`; Bearer auth required (401 without). The token lives only in the Neo Keychain and is never published.
- RDNS backup: `bridge.rizal.info:8443` (rtailscale + RDNS, updates every 10 min) — router forward saved, currently blocked upstream by the ISP box (double NAT). trycloudflare quick tunnel: deprecated, backup only.

### Function lineage (first build → newest, iOS + macOS)
Full numbered list + matrix: `ya/classroom/FUNCTION-LINEAGE.md` (also at `/botlatch/FUNCTION-LINEAGE.md`). ✅ = in newest iOS and newest Mac · ◐ = in one newest platform build · ❌ LOST = in neither newest build.

**ЯBOT** — 103 abilities across 35 distinct builds.
Counts: ✅ 75 · ◐ 15 · ❌ LOST 13
- ❌ ROS-SHELL web frame (last in i0.3.11(2026100702)β)
- ❌ Seat kit (RSeatKit) (last in m0.3.9(2026100618)β·b)
- ❌ BotTalkLanguageLaw (last in i0.3.11(2026100702)β)
- ❌ ROS shell bridge (ROSShellBridge) (last in i0.3.11(2026100702)β)
- ❌ ROS shell locator (/rosshell) (last in i0.3.11(2026100702)β)
- ❌ /CHALKBOARD (last in i0.3.11(2026100702)β)
- ❌ /FIX (last in i0.3.9(2026100618)β·b)
- ❌ /HANDOFF (last in i0.3.11(2026100702)β)
- ❌ /health (last in m0.3.9(2026100618)β·b)
- ❌ /mouth (last in i0.3.11(2026100702)β)
- ❌ /REOPS (last in i0.3.11(2026100702)β)
- ❌ RelayAutoSigner (last in m0.3.9(2026100618)β·b)
- ❌ RelayPolicyStore (last in m0.3.9(2026100618)β·b)

**ЯBOWZR** — 70 abilities across 32 distinct builds.
Counts: ✅ 47 · ◐ 11 · ❌ LOST 12
- ❌ ROS-SHELL web frame (last in i1.2.4(12)β)
- ❌ Seat kit (RSeatKit) (last in m1.2.2(8)β)
- ❌ ROS shell locator (/rosshell) (last in i1.2.4(12)β)
- ❌ app-tile (last in m1.2.2(9))
- ❌ bowser-tile (last in i1.2.4(12)β)
- ❌ /chalkboard (last in m1.1.1(2))
- ❌ /CHALKBOARD (last in i1.2.4(12)β)
- ❌ /FIX (last in m1.2.2(7)β)
- ❌ /HANDOFF (last in i1.2.4(12)β)
- ❌ /health (last in m1.2.2(7)β)
- ❌ /mouth (last in m1.2.2(7)β)
- ❌ /REOPS (last in i1.2.4(12)β)

*Folded 2026-10-07 12:59 MDT · Grok Bot executor · read-only lineage (no devour) · no sat wake*
