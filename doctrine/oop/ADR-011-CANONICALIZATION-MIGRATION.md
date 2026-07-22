# ADR-011 — Freeze legacy canonicalization and version one strict live implementation

**Status:** accepted · Admin signed off Option 1 and said "go" · 2026-07-18  
**Workstream:** WS-CANON-UNIFY Phase A  
**Extends:** ADR-006 (one live canonicalization) and ADR-010 (additive public-surface evolution)

## Context

Phase 0 established one shared conformance-vector file at
`uvrn-packages/SPEC/canonicalization-vectors.json` and characterized three implementations:

- `@uvrn/core` `canonicalSerialize` is lenient. It can emit malformed bytes for `undefined`
  and silently maps non-finite numbers to `null`.
- `@uvrn/receipt` `canonicalize` is strict for `undefined`, `NaN`, and infinities.
- `@uvrn/identity` contains a hand copy of receipt's implementation.
- A true sparse array hole is a **shared pin across core, receipt, and identity**: all three
  currently emit the invalid string `[1,,2]`. It is not a core-only divergence.

ADR-006 requires exactly one live implementation, with only explicitly frozen legacy
implementations retained for historical verification. ADR-010 prohibits silently changing a
signed byte surface in place.

## Options considered

### Option 1 — fix-and-version / freeze-and-version

Keep the existing core `canonicalSerialize` behavior byte-frozen as legacy v1, introduce a
strict `canonical-serialize-2` implementation, and migrate producers explicitly. Historical
artifacts continue to select the legacy path where their version requires it.

This option has a larger temporary API surface but preserves the ability to verify historical
canon receipts and makes the byte-surface change explicit.

### Option 2 — re-point and delete

Re-point core to receipt's strict implementation (or move that implementation into L0 core),
delete the lenient implementation, and let the existing export change behavior in place.

This reaches a cleaner-looking tree sooner, but an old artifact verified through the existing
core export could be interpreted with different bytes. The Phase 0 vectors prove that this is
not behavior-preserving for `undefined`, non-finite numbers, or sparse holes. Without a complete
inventory proving that no affected historical artifact exists, deletion violates ADR-010.

## Decision

Choose **Option 1: fix-and-version / freeze-and-version**.

Phase B will create one environment-pure strict implementation at the L0 `@uvrn/core` boundary,
published under an explicit `canonical-serialize-2` API/version. `@uvrn/receipt` will delegate
or re-export that implementation, and `@uvrn/identity` will import it. Both packages already
declare `@uvrn/core` as a peer dependency, so this direction does not introduce a receipt ↔
identity cycle. The strict module must remain browser-safe and must not pull Node crypto into
receipt consumers.

The current `canonicalSerialize`/canon `canonicalJson` v1 path remains byte-identical and
importable only for verification of artifacts whose version selects it. It is frozen: no fixes,
new producers, fallback selection, or silent aliasing to v2. Producer migration must use an
additive canonicalization discriminator or a new canon-artifact version; Phase B must name that
selector and provide an explicit migration table. Receipt schema versions and seal semantics
remain unchanged. A verifier must select by the artifact's declared version and reject an
unknown version rather than guessing.

Before Phase B changes any producer or verifier, the implementation owner must inventory stored
canon, receipt, and identity artifacts for affected historical cases. The inventory is a gate,
not an assumption. If affected legacy artifacts are found, their exact legacy verifier remains
frozen and covered by golden vectors. If none are found, the evidence is still recorded; it
does not authorize deleting core v1.

## Strict v2 input policy

The shared v2 implementation applies one policy everywhere:

- A true sparse array hole is **coerced to JSON `null`**, matching the Phase 0 strict expectation
  `[1,null,2]`. This deliberately resolves the shared core/receipt/identity pin.
- A dense `undefined` array element is coerced to `null`; an `undefined` object member is omitted.
- Top-level `undefined` is rejected.
- `NaN`, `Infinity`, and `-Infinity` are rejected at every depth with a typed error. They are
  never coerced to `null`.
- Functions, symbols, and other values outside the declared JSON input contract are rejected.

These normalization rules must be implemented by indexed array traversal, not
`Array.prototype.map`, because `map` does not visit holes. The shared Phase 0 vectors become
green for all v2 consumers; legacy pins remain attached only to frozen legacy implementations.

## Identity hand-copy policy

The identity hand copy is not permitted as a live implementation in Phase B. Identity already
has a core peer dependency and must import the shared environment-pure v2 module. A
"dependency-free" preference is not sufficient justification for copied signed-byte logic.

If a future packaging constraint genuinely prevents that import, identity may retain a copy
only as an explicitly frozen legacy verifier selected by an old artifact version. It may not
produce new signatures, and the shared conformance and golden suites must enforce it forever.
Any new live hand copy requires a superseding ADR.

## Consequences and Phase B gates

- Existing valid-JSON payloads must remain byte-identical under v1 and v2; golden-hash tests
  prove this before producer migration.
- The shared sparse-hole pin is removed from all three v2 consumers together, never package by
  package.
- Phase B owns code, re-exports, package/version changes, CHANGELOG entries, live-artifact
  sampling, and the migration table. This ADR changes no runtime behavior.
- No lenient-path deletion occurs in Phase B unless a later signed ADR proves historical
  verification no longer needs it.
- WS-CANON-STATE remains parked and serial behind WS-CANON-UNIFY Phase B.

## Rejected rationale

Option 2's smaller end state does not outweigh an unbounded historical-verification risk.
Versioning makes the transition observable, reversible for verification, and consistent with
the packages repo's existing additive protocol discipline.
