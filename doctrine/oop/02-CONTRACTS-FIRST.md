# 02 — Contracts First

**Status:** v0.1 · 2026-07-16 · operationalizes ADR-005/006/010

## The principle

Structure follows contracts, not the other way around. Before splitting a module, extracting an adapter, or accepting a new dependency across zones, **name the shape** that crosses the boundary. The audit's unifying finding: none of the three repos had a paradigm problem; all three had under-named seams.

## Port checklist (any high-change seam)

1. **Name it** — `XPort` typedef (JSDoc) or interface (TS), owned by the *consuming* zone.
2. **Characterize it** — tests pinning input, output, error, and ordering/lifecycle semantics as they are *today*, before any change.
3. **Validate at trust boundaries only** — runtime checks where data enters from HTTP, model/provider output, stored JSON, or third parties. Internal calls trust types; don't tax the hot path.
4. **Parity-test every implementation** — fixture and live/agent implementations run the *same* assertion suite (dash2 F4 lesson: contract tests that only ever run against fixtures don't test the contract).
5. **Guard it in CI** — a boundary script that fails on new cross-zone implementation imports outside the adapter file (warn-mode with a pinned baseline is an acceptable first step).

## Boundary inventory (keep current)

| Boundary | Contract artifact | Enforcement |
|----------|-------------------|-------------|
| dash2 ↔ dash1 engine | `Dash2EnginePort` (WS-DASH2-ENGINE) | server-side import guard |
| dash2 server ↔ providers | provider port + fixture/agent parity suite | contract tests |
| packages hash/sign surfaces | SPEC files + conformance vectors (ADR-006) | conformance suite ×3 packages |
| worker ↔ @uvrn/receipt | package validators + golden vectors | hash-equivalence script in CI |
| worker HTTP API | README table = code (drifted once already) | v4-verify smoke in CI |
| MCP tools ↔ packages | input schemas (`uvrn-mcp/src/tools/schemas.ts`) | schema tests |

## Versioning discipline (ADR-010, from the packages playbook)

- Pin version strings inside artifacts (`uvrn-receipt-4`, `uvrn-sig-1`); a shape without a version identifier is unversioned debt.
- Freeze legacy byte surfaces as named, tested artifacts ("byte-identical to the live worker" is a test, not a comment).
- Declare hash-field lists and unknown-field rules explicitly; additive-only evolution.
- Golden-hash / golden-vector regression tests accompany every change to a signed surface — and the one dangerous refactor gets an equivalence proof script (worker precedent).
- CHANGELOG entry per package per change; back-compat claims stated, not implied.

## Failure modes this section exists to prevent

Observed 2026-07: three canonicalizers "byte-identical by convention"; provider surface widened by `typeof` probes; six unguarded engine imports; README auth table contradicting code; delta rows persisted with format-checked-only hashes beside verified receipts. Every one is a missing name, a missing test, or a missing guard — never a missing class.
