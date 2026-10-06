# potlatch.json format (v1)

Storefront: **Я OS Я POTLATCH APP MARKET** (short: **Я POTLATCH** · App Market)

## Pricing policy (Decider)

**Donation / SEND IT only.** Lab apps are free to Get. Optional tip opens the **SEND IT** sheet. No one-time unlocks in the current policy. No server, no payment-processor keys in the catalog or apps.

| Field | Required | Notes |
|---|---|---|
| `schema` | yes | `potlatch.v1` |
| `name` | yes | Catalog name (e.g. ЯLAB) |
| `storefront` | yes | Display name |
| `updated` | no | ISO-8601 |
| `pricingPolicy.model` | no | `donation` (current Decider choice) |
| `pricingPolicy.label` | no | `SEND IT` |
| `treasury.payTo` | no | Reserved; prefer `sendIt` rails — leave `null` |
| `sendIt` | yes (for tips) | Donate sheet — see below |
| `apps[]` | yes | Real installable lab apps |
| `apps[].pricing.model` | yes | `donation` (Get + SEND IT) under current policy |
| `apps[].pricing.cta` | no | Default `Get` |
| `apps[].pricing.tipCta` | no | Default `SEND IT` |
| `tools[]` / `arcade[]` | no | TOOLS / ARCADE tabs; arcade may set `example: true` |

Compatible with UpdateBadge on `apps[].version`. Exact bundle IDs · one tile · `group.info.rizal.rlab`.

---

## `sendIt` — SEND IT donate sheet

All rail values start **empty**. UI **hides any rail whose required field is empty**. Agents must **never invent or prefill** addresses or handles (including from memory or other lab files). Rizal fills these when ready.

### Crypto

| Field | Fill with | Shown when |
|---|---|---|
| `sendIt.crypto.solana.address` | Solana wallet address | non-empty |
| `sendIt.crypto.solana.usdcMint` | USDC mint (optional; default mint can be documented later by Rizal) | address set |
| `sendIt.crypto.solana.solUri` | Full `solana:` URI (optional override; else built from address) | address or solUri set |
| `sendIt.crypto.solana.qrPayload` | Exact string to encode in QR (optional; else solUri/address) | address or qrPayload set |
| `sendIt.crypto.bitcoin.onChainAddress` | Bitcoin on-chain address | non-empty |
| `sendIt.crypto.bitcoin.lightning` | Lightning invoice or LNURL / lightning: URI | non-empty |
| `sendIt.crypto.ethereum.address` | ETH address (`0x…`) | non-empty |

### Cash apps

| Field | Fill with | Shown when |
|---|---|---|
| `sendIt.cashApps.cashAppCashtag` | Cashtag **without** requiring `$` prefix in storage (UI may show `$`) | non-empty |
| `sendIt.cashApps.venmoHandle` | Venmo username / profile handle | non-empty |
| `sendIt.cashApps.paypalMe` | PayPal.me path or full `https://paypal.me/…` URL | non-empty |

### Cards / sponsorship links

| Field | Fill with | Shown when |
|---|---|---|
| `sendIt.cards.kofiUrl` | Full Ko-fi URL | non-empty |
| `sendIt.cards.liberapayUrl` | Full Liberapay URL | non-empty |
| `sendIt.cards.githubSponsorsUrl` | Full GitHub Sponsors URL | non-empty |

### UI rules

- Primary app CTA: **Get** (free install/update path).
- Secondary: **SEND IT** → opens donate sheet.
- If every rail is empty, sheet shows a short “Rizal has not seated donation rails yet” message — no fake QR, no placeholder addresses.
- No processor API keys, webhooks, or server endpoints in this catalog.

### Tabs

**APPS** · **ARCADE** · **BOTS** · **TOOLS** — phone bottom bar; desktop/macOS left sidebar + multi-column grid.

### Tab / sidebar order (Decider mockup)

**APPS → BOTS → TOOLS → ARCADE** (phone bottom bar and desktop/macOS sidebar). Desktop also: top-left wordmark, top-right search + ⋮, bottom-left profile chip `RI · Rizal Institute`, hero + editorial row + compact tile row. No third-party App Store mock apps — only lab listings or clearly marked examples.

## SEND IT ↔ ЯWALLET (design)

Crypto rails with a seated address may open **ЯWALLET** (existing ЯBOT wallet: `WalletSendSheet` / `YaDeviceWallets` Keychain keys). Prefill recipient from catalog only; user enters amount; **Confirm & sign** required; no auto-send. See `docs/YAWALLET-SENDIT.md`. Cash-app and card links open externally. Empty rails stay hidden.

## Hub sections (order)

**APPS → BOTS → TOOLS → ARCADE → ЯWALLET**

Deep links: `rzl://potlatch` · `rzl://wallet` (and `yabot://…`). `.rzl` **files** stay ЯBOWZR.

## Я TOKEN primary rail

`yaToken.mint` = `BB9uA5BuacDnWyDf5Npc9nMb9yFbyThsNrQPBYJ5Q1Lv` · decimals 9. SEND IT / payment intents / trades denominate in Я. No Potlatch minting.

## Payment forms → GhostChain

Forms: donation · trade · barter · crypto · card · cash · nft. Op `potlatch-payment-intent`. Cash/card user-attested. Crypto spend still ЯWALLET Confirm & sign only.

## Create Pool

`docs/CREATE-POOL.md`. On-chain AMM preview (unsigned). GhostChain `potlatch-pool`. Freeze-authority risk disclosed. No pool/tx in stage builds.

## Linked accounts + give QR

See `docs/LINKED-ACCOUNTS.md`. Public rails only, user-entered. One QR -> `/potlatch/give#<id>` or `rzl://wallet/give/<id>`. Solana QR uses `spl-token` = YA mint.
