# 01 — Decision Register (ADR-U)

**Status:** v0.1 · 2026-07-18 · append-only; supersede by new ADR, never edit a locked one
**Format:** ADR-U### · title · status · decision · why · consequences
**Numbering:** `U` = universal React. House oop keeps `ADR-NNN`; app repos keep repo-local numbers and cite both.

---

### ADR-U001 — Function components + hooks, on every renderer
**Locked 2026-07-18.** No class components, no `extends` chains, no HOC towers where a hook does the job. **Why:** house oop ADR-003/004 applied to React; both dialects already comply. **Consequences:** `extends Component` in a diff fails review on web and native alike.

### ADR-U002 — The state ladder; stores only by ADR
**Locked 2026-07-18.** State climbs local → URL → lifted props → session-shaped context → external store, each step only when the lower one demonstrably fails. Server data never lives in a store — it belongs to the data seam (U003). **Why:** field consensus and our own history agree: most "state management problems" are mislocated state; dash2 runs a full product on layers 1–4. **Consequences:** adding zustand/redux/etc. requires an ADR documenting which ladder rung failed and how; "we might need it" is not a rung.

### ADR-U003 — One ported data seam per app
**Locked 2026-07-18.** All remote/persisted data flows through one factory-built client implementing a named port; fixture and live are modes of the same port; DTO→view conversions are named functions at the seam; components never fetch. **Why:** the recurring house failure mode is implicit seams (oop ADR-005); one seam makes fixture-first development and honest demos structurally cheap. **Consequences:** `fetch`/transport imports outside the seam are tripwire hits; a second data path is a finding, not a convenience.

### ADR-U004 — Helpers beside pages; logic runs without a renderer
**Locked 2026-07-18.** Pure page logic lives in sibling `*Helpers.js` modules (and pure geometry beside thin chart components), covered by `node --test` in co-located `__tests__/`. **Why:** this is dash2's proven practice (boardHelpers, deskHelpers, RadarPentagonGeometry…) — it keeps pages readable, logic testable at zero framework cost, and it is renderer-portable by construction. **Consequences:** a page whose derivations are inlined past triviality gets a helper-extraction note; helper modules importing React fail review.

### ADR-U005 — Motion is one named preset module per app
**Locked 2026-07-18.** Web `lib/motion.js`, native `src/theme/motion.js`: presets in, raw animation code out; reduced-motion respected by every preset; infinite loops never start under it; motion never implies verification. **Why:** motion drift is style drift at its most visible; the reduced-motion contract is an accessibility floor on both platforms. **Consequences:** animation primitives imported outside the module are tripwire hits; new presets land in the module with a name, or not at all.

### ADR-U006 — JS + JSDoc; no TypeScript
**Locked 2026-07-18.** Lyrikai React repos are JavaScript with JSDoc typedefs; `// @ts-check` in pure zones. Existing `.ts` islands in legacy zones are frozen, not precedent. **Why:** house continuity (uvrn-app D4; JSDoc-modeled structural contracts per oop ADR-005). **Consequences:** new `.ts`/`.tsx` files are tripwire hits; type rigor lives in typedefs + characterization tests.

### ADR-U007 — Naive components; memoization requires a measurement
**Locked 2026-07-18.** `useMemo`/`useCallback`/`React.memo` only with profiler evidence or a comment naming the measured hotspot; adopt the React Compiler per-repo when the toolchain supports it, superseding hand memoization further. **Why:** the compiler era made speculative memoization churn; measured hotspots remain legitimate. **Consequences:** unexplained memoization in a diff is a review question; "habit" is not an answer.

### ADR-U008 — Effects synchronize; they do not derive or fetch
**Locked 2026-07-18.** `useEffect` is for real external systems only. Derive during render; fetch through the data client; model events as events. **Why:** effect misuse is the largest single source of React bugs (waterfalls, loops, stale closures) and the compiler cannot save a wrong effect. **Consequences:** an effect that only calls `setState` from props/state is a finding; each nontrivial effect should be nameable in one sentence ("syncs X with Y").

### ADR-U009 — Honesty vocabulary is law on every React surface
**Locked 2026-07-18.** Fixture/simulated surfaces self-identify in rendered text; verification-adjacent words never render for fixture state; honest empty states, no fake loading. **Why:** UVRN sells verification; a React surface that fakes it — even in a demo — poisons the brand (uvrn-app hard wall 3 generalized). **Consequences:** honesty strings are contract artifacts; audits grep for banned claims on fixture paths.

### ADR-U010 — Dialects own platform law; products bind pixels
**Locked 2026-07-18.** This register stops where platforms diverge: 02-WEB-DIALECT and 03-NATIVE-DIALECT own routing, styling, testing, and platform conventions; product doctrines (e.g. `uvrn-app_build-master/doctrine/`) bind tokens, surfaces, and repo baselines. Nothing downstream may contradict upstream — only add. **Why:** one register that tried to hold web CSS law and native parity law would bloat and fork. **Consequences:** a child rule contradicting a parent is drift by definition; supersession happens at the layer that owns the rule.

---

## Adding an ADR

Copy the format, take the next U-number, status `proposed` until Admin locks it. Superseding: new ADR references the old; old gets `superseded by ADR-U###`.
