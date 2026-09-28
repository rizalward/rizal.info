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

*OS commands section updated 2026-09-28 13:26 MT · PROXY-GROKBOT · no sat wake*

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
