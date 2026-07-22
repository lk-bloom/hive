# 01 — Decision Register (ADRs)

**Status:** v0.1 · 2026-07-16 · append-only; supersede by new ADR, never edit a locked one
**Format:** ADR-NNN · title · status · decision · why · consequences

These generalize the locked decisions from the dash2 07-audit decision matrix and the 2026-07-16 three-repo audit. Cite by number in PRs and plans ("per ADR-003").

---

### ADR-001 — Composition-first OOP is the house paradigm
**Locked 2026-07-16.** Functional core, owned-lifecycle edges, structural ports, DI from a composition root. **Why:** all three UVRN production repos converged on this independently and it fits the pipeline shape of Lyrikai systems. **Consequences:** class hierarchies rejected in review; paradigm deviations need an ADR.

### ADR-002 — DTOs stay data; no entity/Active Record classes
**Locked 2026-07-16.** Rows, wire shapes, and derived objects are immutable plain data; behavior lives in pure builders and services; conversions are explicit at boundaries. **Why:** entity classes couple database, API, and UI shapes (dash2 F1). **Consequences:** store-shape ≠ presentation-shape is intentional, not duplication.

### ADR-003 — No inheritance for reuse; ports + adapters instead
**Locked 2026-07-16.** Narrow exception: `extends Error` / `extends EventEmitter`. **Why:** LSP traps and combinatorial collapse; JavaScript contracts are naturally structural (TS/JSDoc model this directly). **Consequences:** "BaseX" in a diff is a review flag.

### ADR-004 — Classes only for resource/lifecycle ownership
**Locked 2026-07-16.** `#private` state + lifecycle methods, or a factory closure — author's choice; equivalence acknowledged. **Why:** dash2 F3/F5; `ConsensusEngine` precedent. **Consequences:** converting closures↔classes without functional need is churn, rejected.

### ADR-005 — Contracts are named, structural, and tested
**Locked 2026-07-16.** Every high-change seam gets a named port (JSDoc typedef or TS interface), characterization tests, and runtime validation at untrusted boundaries only (HTTP, provider/model output, stored JSON). **Why:** the recurring failure mode across all three repos is implicit contracts + accretion. **Consequences:** "works by convention" is a finding, not a defense. See 02-CONTRACTS-FIRST.

### ADR-006 — One canonicalization implementation per ecosystem
**Locked 2026-07-16.** Signed/hashed byte surfaces get exactly one live implementation plus, at most, explicitly frozen legacy versions; multiple implementations must share a conformance-vector file enforced in CI. **Why:** the audit's #1 correctness risk — three canonicalizers with divergent `undefined`/`NaN` behavior in a verification product. **Consequences:** WS-CANON-UNIFY; any new hash surface starts from the shared vectors.

### ADR-007 — Correctness state is never process-memory-only
**Locked 2026-07-16.** Anything embedded in a signed/persisted artifact (sequence numbers, streaks feeding qualification) must survive restart via an injected store, or be rebuilt deterministically from one. **Why:** in-memory `canon_seq` resets inside signed CanonReceipts. **Consequences:** WS-CANON-STATE; "in-memory, per-isolate" labels required on all tolerated edge caches.

### ADR-008 — Refactor and features never share a PR
**Locked 2026-07-16.** Remediation PRs are behavior-frozen (characterization tests prove it); feature PRs don't restructure. **Why:** dash2 feature waves outran the refactor and re-widened seams (#185 route shims). **Consequences:** wave-gap scheduling for structural work; tripwires (03) catch re-widening.

### ADR-009 — Frameworks stay at the edge
**Locked 2026-07-16.** Fastify/Express `request`/`reply`, Worker `fetch` event shapes, and React never appear in use-case or domain code. **Why:** dash2 F6, worker god-file. **Consequences:** use-case functions take ports and return typed results/errors.

### ADR-010 — Additive evolution for public surfaces
**Locked 2026-07-16.** Public protocol/API surfaces evolve additively: version discriminators, frozen legacy shapes kept byte-identical, unknown-field tolerance rules declared, golden-hash regression suites. **Why:** this discipline is the packages repo's greatest strength; make it mandatory everywhere. **Consequences:** breaking changes require a new version identifier + migration note, never an in-place mutation.

---

## Adding an ADR

Copy the format, take the next number, status `proposed` until Admin locks it. Superseding: new ADR references the old; old gets `superseded by ADR-NNN`.
