# HANDOFF — Shell feeds + wallet/download-app site (1.1.1 / 0.3.4)

**From:** PROXY-GROKBOT (Mac executor)  
**To:** DECIDER (ЯID-0001-3QQS)  
**When:** 2026-09-28 16:21 MDT · America/Denver  
**Machine:** 55d92eb0-0ce0-4959-b297-440d80e59e38 · safezone ~/ЯLAB only  
**/Applications:** not touched · **Grok sat wake:** none

## One-liner
SHELL-first: ЯBOWZR 1.1.1 + ЯBOT 0.3.4 artifacts verified; download landing + appcasts + SUMS synced to rizal.info/rizal.pw clones; wallet open.html + ya shell_seats updated. Push blocked (RIZALEON 403 on rizalward) — local commits staged; need rizalward auth to publish Pages.

## Shell versions / paths
| Artifact | Version | Path |
|---|---|---|
| RBOWZR DMG | 1.1.1 | ~/ЯLAB/BUILDS/RELEASES/RBOWZR/1.1.1/RBOWZR-1.1.1.dmg |
| RBOWZR sha256 | e7d5904a7d924e337988995e827434787596b2a8ccfa24ee06f0fb1bcba5c1f1 | .dmg.sha256 + site/SHA256SUMS |
| YBOT DMG | 0.3.4 | ~/ЯLAB/BUILDS/RELEASES/YBOT/0.3.4/YBOT-0.3.4.dmg |
| YBOT sha256 | d6fcf9d5cae6fa1700043303da6eb77bafbd747579be98c7c38d3dd75a52ba14 | .dmg.sha256 + site/SHA256SUMS |
| Heart gguf | 0.3.4 | RELEASES/YBOT/0.3.4/YBOT-0.3.4-heart.gguf · 626b4a6678b86442240e33df819e00132d3ba7dddfe1cdc4fbb18e0a9615c62d |
| Site canonical | feeds | ~/ЯLAB/BUILDS/RELEASES/site/{rbowzr,ybot}/appcast.json · index.html |
| Seat apps | 1.1.1 / 0.3.4 | ~/ЯLAB/APPS/ЯBOWZR.app · ~/ЯLAB/APPS/ЯBOT.app |

## Site paths updated
- ~/ЯLAB/BUILDS/RELEASES/site/index.html (+ index-install.html) → 1.1.1 / 0.3.4 stamps
- ~/ЯLAB/BUILDS/github/rizal.info/{index.html,index-install.html,SHA256SUMS,.sig,ybot/*,rbowzr/appcast.json,open.html,ya/metadata.json}
- ~/ЯLAB/BUILDS/github/rizal.pw/{rbowzr/appcast.json,ybot/appcast.json,SHA256SUMS,.sig}
- GH Releases already present: ybot-v0.3.4 · rbowzr-v1.1.1 (assets live)

## Push status
- Active gh account: **RIZALEON** (keyring)
- rizalward/rizal.info · rizalward/rizal.pw → **403 Permission denied to RIZALEON** (pull-only; push:false)
- Local commits staged (ahead of origin):
  - rizal.info `40fab39` Publish shell feeds 1.1.1 / 0.3.4 + download + wallet open links (main ahead 2 incl. prior classroom)
  - rizal.pw `e495950` Mirror shell feeds 1.1.1 / 0.3.4 + SHA256SUMS (main ahead 2 incl. prior classroom)
- **Auth needed:** `gh auth login` (or switch) as **rizalward** with `repo` scope, then:
  ```
  git -C ~/ЯLAB/BUILDS/github/rizal.info push origin main
  git -C ~/ЯLAB/BUILDS/github/rizal.pw push origin main
  ```

## Do not
- Reseat /Applications without Approve
- Wake Grok sats
- Write Gate-2 metadata URI on-chain
