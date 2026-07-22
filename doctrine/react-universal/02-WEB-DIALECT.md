# 02 — Web Dialect (React SPAs)

**Status:** v0.1 · 2026-07-18 · applies ADR-U001…U010 to browser React
**Worked example (living):** `uvrn_home-1_v2/src/dash2/` — cite it, don't fork it

## Stack shape

Lyrikai web React is a **Vite SPA served by its own composition-rooted server** (Fastify in the UVRN case). React Router (or the site's router) owns the URL bus. **No Server Components / no RSC framework** in this dialect — the SPA-plus-API shape fits our verification products (the API is a contract surface, not a rendering detail). Moving any product to an RSC framework is a real architectural decision: it arrives by ADR-U supersession, not by scaffold default.

## Zone layout (per product zone)

A product zone (e.g. `src/dash2/`) is self-contained:

| Path | Role |
|------|------|
| `<zone>/pages/` | Route components + their sibling `*Helpers.js` + co-located `PageName.css` + `__tests__/` |
| `<zone>/components/` | Zone chrome: primitives, charts (geometry `.js` + drawing `.jsx`), shared pieces |
| `<zone>/lib/` | Data client, motion module, pure utilities, hooks — each with `__tests__/` |
| `<zone>/fixtures/` | Fixture data + README stating its honesty stance |
| `<zone>/flags.js` | Zone feature flags, one file |

Cross-zone imports go through a port with a boundary guard (house oop rule); one zone never reaches into another's implementation.

## Styling

Plain CSS, co-located: design tokens in the zone's root stylesheet (`dash2.css` custom properties are the law-copy of the design source), per-page and per-component CSS files beside their JSX. No CSS-in-JS runtime, no utility-class framework in product zones. Color/spacing literals belong in token definitions — components consume `var(--token)`.

## Testing

`node --test` is the harness for everything that doesn't need a browser: helpers, geometry, data-client fixture modes, and light DOM tests (`*.test.mjs` beside the code, jsdom-style where needed — see dash2's `boardLivingFeedDom.test.mjs`). Characterization tests pin seams before refactors (house oop ADR-005/008). A page with no testable helper module is usually a page hiding its logic.

## Web-specific rules

- **Accessibility floor:** semantic elements first; ARIA roles where semantics fall short (`progressbar` on meters); keyboard paths for every pointer path; `prefers-reduced-motion` honored by the motion module; contrast checked against the product palette.
- **Module budgets:** the house split-before-500-lines rule applies to pages hardest — dash2's BoardPage history (587→746 lines under feature pressure, baseline then pinned) is the cautionary worked example; oop `03-TRIPWIRES.md` owns those pins.
- **Meta/head discipline:** route meta lives in a named module (`routeMeta.js` / `pageMeta.js` pattern), not scattered in components.
- **React 19 features** (actions, `useActionState`, `useOptimistic`, `use`) are welcome where they *reduce* code, adopted per-repo — see 05 for the research stance; adopting the React Compiler is a repo-level toolchain ADR.
