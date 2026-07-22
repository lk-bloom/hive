# 00 — House Style: Composition-First OOP

**Status:** v0.1 · 2026-07-16

## The shape rule

Match the paradigm to the problem's shape. Most Lyrikai systems are **data-transformation pipelines with I/O at the edges** (verification protocols, research pipelines, request→response services, build loops). For that shape:

- **Core = pure functions.** Protocol math, scoring, hashing, canonicalization, builders, derivations: deterministic, immutable inputs, no hidden clock/RNG — inject `nowFn`/`idFn`/`fetchImpl` when needed.
- **Edges = owned lifecycles.** Databases, signers, timers, sockets, event emitters, queues: an object (class or closure) may own the resource and expose a small method surface.
- **UI = function components + hooks.** React owns reactive state; no class components, no state-machine classes wrapping UI.

## When a `class` is allowed

Only when an instance enforces an invariant that a closure or module cannot already enforce — in practice: private resource ownership (`#db`, `#chain`, `#timer`) with lifecycle methods (`close`, `drain`, `backup`). Typed errors (`XApiError extends Error` with `code`/`status`) are always fine: they carry stable identity plus behavior.

**Closures are legitimate encapsulation.** A factory returning a method-shaped object over private closure state is equivalent to a class with `#` fields. Don't convert working closures to classes for syntax's sake.

## What is banned

1. **Inheritance hierarchies.** No `BaseProvider`, no repository class families, no `extends` chains for code reuse. Composition, ports, and adapters instead. (Standard-library extension like `extends Error`/`EventEmitter` is the narrow exception.)
2. **Active Record / entity classes for DTOs.** Rows, DTOs, and derived shapes are plain immutable data plus behavior services and pure builders. A class whose constructor computes everything so callers can `toJSON()` it should be a function.
3. **Module-global mutable state on correctness paths.** Caches with documented failure modes are tolerable at edges (label them); sequence numbers, tokens, registries, and anything feeding a signed/hashed/persisted artifact must live in injected, owned state.
4. **Query methods that mutate.** Reads read. If expiry/side effects are needed, name them (`expireStale()`), don't hide them in a filter.
5. **Duck-typed optional capability probes** (`typeof x.method === 'function'`) at call sites. If a capability is optional, name it in the port.

## Structure rules

- **One composition root per deployable.** All wiring (store, provider, runner, env, fetch) happens in one place with injectable options and production defaults. Nothing below the root reads env or constructs its own dependencies.
- **Transport ≠ application ≠ domain.** Route handlers keep schemas, auth hooks, status codes, wire mapping. Workflows are use-case functions taking ports, ignorant of the framework (`request`/`reply` never crosses in).
- **Split before 500 lines / ~15 methods.** A module past either budget needs a named plan (not necessarily an immediate split — but a tripwire entry, see 03).
- **Cross-zone imports go through a port.** One adapter file may import a foreign zone's implementation; everything else imports the port. Enforce with a boundary-check script in CI.

## Honesty rules

- An implementation that cannot honor a port's contract must not claim the port (no `type: 'r2'` on a mock; no `snapshot()` that ticks).
- Vocabulary is conservative: "integrity-checked" is not "verified"; a per-isolate limiter is "abuse damping," not a quota.
- Documented deviations beat silent ones, and enforced deviations (conformance tests) beat documented ones.

## Reference implementations (worked examples)

- Pure-core-plus-edges done right: `@uvrn/receipt` (non-mutating sign, strict canonicalization, frozen legacy shapes), `computeDrift` (injected clock).
- Composition root done right: `uvrn_home-1_v2/server/dash2/index.mjs`.
- Legitimate closure encapsulation: `server/dash2/runner.mjs`.
- The delegation pattern for evolving legacy handlers: uvrn-worker's v4 branch (`handlePostReceiptsV4` delegating from the legacy handler at the earliest branch point).
