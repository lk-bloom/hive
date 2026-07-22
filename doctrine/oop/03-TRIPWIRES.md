# 03 — Tripwires: Catching Drift

**Status:** v0.1 · 2026-07-16 · baselines pinned at the 2026-07-16 audit

## Why tripwires

The dash2 lesson: a scored audit and a blueprint existed, yet in the following 48 hours the store grew 30→48 methods, BoardPage grew 587→746 lines, and routes gained inlined shims — because nothing *measured*. Diagnosis without instrumentation loses to feature velocity every time. Tripwires are cheap CI checks that turn doctrine into signal: warn-mode first (pinned baseline), enforce after remediation lands.

## Standard tripwire set (any repo)

| Tripwire | Rule | Rationale |
|----------|------|-----------|
| Module line budget | flagged files may not grow past pinned baseline | god-file accretion |
| Method-surface budget | flagged factory/store objects may not gain methods without a plan note | flat-API accretion |
| Boundary guard | no cross-zone implementation imports outside the adapter | ADR-005/009 |
| Probe guard | no `typeof x.y === 'function'` capability probes outside adapters | implicit contract widening |
| Lint budget | error count may not exceed pinned baseline | baseline rot |
| Conformance suites | shared-vector tests green in every implementing package | ADR-006 |
| Label gate | "DO NOT MERGE" / gated-phase labels block merge | process breaches (#184/#186) |

## Pinned baselines — 2026-07-16

### uvrn_home-1_v2 (dash2)
- `server/dash2/store.mjs`: **48 methods** (may not grow; target: repository split, blueprint WP2)
- `src/dash2/pages/BoardPage.jsx`: **746 lines** (may not grow; target: `useAskSession`, WP6)
- Server dash1-imports: **6 files** (pinned list in WS-DASH2-ENGINE Phase 0; new = fail)
- Route `typeof` probes: **2 sites** (routes.mjs:148-152, 176-181; new = fail)
- dash2-scoped lint: **7 errors** (may not grow)

### uvrn-packages LIVE
- Canonicalization implementations: **3** (target 1+frozen; conformance vectors = WS-CANON-UNIFY Phase 0)
- Module-global mutable state on hash/sign paths: **0 new** (existing edge caches labeled)
- Golden-hash suite: always green; any intentional hash change requires ADR reference in the PR

### uvrn-worker
- `src/index.ts`: **1,302 lines** (may not grow; target: split, WS-WORKER-SAFETY Phase C)
- CI gate: typecheck + hash-equivalence + v4 smoke (WS-WORKER-SAFETY Phase 0) — absence of CI is itself the tripped state today
- INSERT column-list duplication: **4 sites** (may not grow; target 1 helper)

## Escalation

A tripped warn-mode wire = one-line note in the owning workstream queue in the same session. A tripped enforce-mode wire = the PR does not merge. Baselines only move down, or up with an ADR-referenced plan note.
