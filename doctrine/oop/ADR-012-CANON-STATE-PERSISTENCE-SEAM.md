# ADR-012 — Persist Canon sequencing via store-derived `canon_seq` (Option 1)

**Status:** proposed · awaiting Admin lock · 2026-07-18  
**Workstream:** WS-CANON-STATE Phase 0  
**Extends:** ADR-007 (correctness state is never process-memory-only)  
**Context doctrine (leave intact):** ADR-011 (canonicalization migration) — orthogonal; no edit

## Context

`Canon` (`@uvrn/canon`) already receives `config.stores` (the `CanonStore` family) via DI and
fans writes through `MultiStore`. Correctness-relevant state still lives in process memory
while receipts persist durably (source audit §2 P2):

| In-memory field | Role | Restart effect |
|-----------------|------|----------------|
| `nextCanonSeq` (via `nextCanonSeq(claimId)`) | Assigns `canon_seq` inside the *signed, hashed* `CanonReceipt` | Resets; new process can re-issue `canon_seq = 1` for a claim that already has durable receipts |
| `suggestions` Map | Pending/confirmed suggestion lifecycle | Lost; `nextCanonSeq` today counts *confirmed suggestions in memory*, not stored receipts — wrong even before restart if the map is empty |
| `stableRuns` Map | Consecutive stable-run streak for auto-suggest qualification | Lost; streak restarts at 0 |

ADR-007 requires anything embedded in a signed/persisted artifact to survive restart via an
injected store, or be rebuilt deterministically from one. `canon_seq` is inside the hashed
receipt surface; the field/schema must not change (WS-CANON-STATE non-goal) — only the
*values* must become restart-correct.

### Read-only inventory (Phase 0 — packages tip `226ef83…`)

**`CanonStore` port** (`uvrn-canon/src/types/index.ts`):

```ts
interface CanonStore {
  type: StoreType;
  write(receipt: CanonReceipt): Promise<StorageProof>;
  read(canonId: string): Promise<CanonReceipt | null>;
  exists(canonId: string): Promise<boolean>;
}
```

No `list`, `listByClaim`, or `maxCanonSeq` on the port.

| Adapter | `read(canonId)` | List / max-seq today | Notes |
|---------|-----------------|----------------------|-------|
| `R2Store` | Yes (by_canon_id index) | None on port; keys are `{prefix}/{claim_id}/{canon_id}.json` | Listing would need bucket list + claim prefix — not on `CanonStore` |
| `SupabaseStore` | Yes | None on port; row has `claim_id` + `canon_seq` columns | SQL max/group is feasible *behind* an extended port |
| `SqliteCanonStore` | Yes | None on port; table has `claim_id` | Same — queryable once port gains list/max-seq |
| `MockStore` | Yes | `all()` **only on the class**, not on `CanonStore` | Test helper already holds every receipt in memory |
| `MultiStore` | First successful child `read` | None | Fan-out write; cannot derive max-seq without a list-capable child |
| `IpfsStore` | **Does not honor `read(canonId)`** — needs CID from `storage_proofs` (audit §2 P3) | None; content-addressed only | Cannot substitute for an indexable store for seq rebuild |

## Options considered

### Option 1 — Derive from store (recommended)

On construction / first use of sequence assignment, rebuild the next sequence for a claim from
the highest `canon_seq` among **stored** receipts for that claim (not from in-memory confirmed
suggestions). Suggestions and `stableRuns` streaks are either:

- rebuilt from durable evidence if Phase A finds a cheap, honest source; or
- accepted as **ephemeral host-session state** and documented as such (not embedded in the
  signed receipt).

**Capability gap (must be closed in Phase A, not deferred silently):** Option 1 cannot call
`MultiStore.read(canonId)` alone to discover max seq — the caller does not know every
`canon_id`. Phase A must add an **additive** port capability, for example:

- `listByClaim(claimId): Promise<CanonReceipt[]>` and/or
- `maxCanonSeq(claimId): Promise<number>` (0 if none),

implemented on indexable adapters (`MockStore`, `SqliteCanonStore`, and preferably
R2/Supabase). `MultiStore` should prefer a list/max-capable child or document which child is
authoritative for sequence rebuild.

**IpfsStore (P3):** IpfsStore already breaks `CanonStore.read(canonId)` substitution. It must
**not** be treated as a sole backing store for Option 1 sequence rebuild. Production and tests
that need restart-correct `canon_seq` must include at least one indexable store. Full IpfsStore
substitution honesty remains a separate follow-up (Phase B honesty cleanups / own note) — not a
blocker to choosing Option 1, but a hard constraint on Phase A design.

### Option 2 — New `CanonStateStore` port

Introduce an explicit persistence port for `nextCanonSeq` / suggestions / streaks, with a
SQLite impl in `@uvrn/store-sqlite` and a mock in `@uvrn/test` (or canon test doubles).

Pros: clear lifecycle ownership; suggestions/streaks can be durable without inventing list APIs
on receipt stores.

Cons: duplicates the sequence source of truth already present on durable `CanonReceipt`s;
risks drift between state-store seq and receipt `canon_seq`; larger surface for a problem whose
correctness core is “read what you already wrote.”

## Decision

Choose **Option 1 — derive `nextCanonSeq` from stored receipts**, with an additive
list/max-seq capability on the `CanonStore` family in Phase A.

Classify state as:

| State | Durability under Option 1 |
|-------|---------------------------|
| `canon_seq` / next sequence | **Durable** — rebuilt from max stored `canon_seq` per claim |
| `suggestions` | **Ephemeral** (documented) unless Phase A later proves a cheap rebuild; not inside the hashed receipt |
| `stableRuns` streaks | **Ephemeral** (documented) — qualification may restart after process death; hosts that need durable streaks may inject their own streak store later without changing receipt schema |

Do **not** choose Option 2 for Phase A. A future ADR may revisit a dedicated state store if
product requirements demand durable suggestions/streaks independent of receipt listing.

## Consequences

### Positive

- Satisfies ADR-007 for the signed field without changing CanonReceipt schema/hash field lists.
- Single source of truth: sequence lives on receipts already persisted by `config.stores`.
- Fits existing DI (`CanonConfig.stores` / `MultiStore`); no second parallel persistence story
  for seq.
- Forces honest documentation of ephemeral suggestion/streak semantics.

### Negative / work required

- Phase A must extend `CanonStore` (additive) with list or max-seq; adapters that cannot
  implement it must fail closed or be excluded from seq-authoritative roles.
- IpfsStore-only deployments cannot claim restart-correct sequencing until an index exists.
- Ephemeral streaks mean auto-suggest qualification does not survive restart (acceptable and
  documented; not a signed-surface bug).

### Neutral

- Query-time mutation (`pendingSuggestions` / `getPendingSuggestion` flipping `expired`) and
  clock/ID injectability remain Phase A/B scope per `WS-CANON-STATE-PHASES.md` — not decided
  here beyond noting they are out of Phase 0.
- MockStore/`MultiStore` `type: 'r2'` honesty and `DriftMonitor.snapshot` remain Phase B.

## Phase A gate

Phase A may start only when:

1. This ADR is **accepted** (Admin lock on Option 1), **and**
2. Admin issues an explicit Phase A go.

Phase A scope (preview, not started): implement store-derived sequencing + restart-simulation
test; injectable `nowFn` / `idFn`; additive list/max-seq port with IpfsStore constraint honored.
No CanonReceipt schema/hash changes. No push/PR/merge until local-build + audit + Shawn
publisher order.

## Non-goals (this ADR)

- No packages runtime edits in Phase 0.
- No edits to ADR-011 or locked ADR-001…010 bodies.
- No IpfsStore full substitution fix in Phase A unless trivially reachable (else own note).
- No WS-CANON-STATE Closed claim; Phase A not started by this document alone.
