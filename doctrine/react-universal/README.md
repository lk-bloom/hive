# Lyrikai React Doctrine — react-universal

**Status:** v0.1 · locked 2026-07-18 (Admin)
**Scope:** every Lyrikai/Suttle Media React surface — web SPAs (dash, dash2, uvrn_home site zones) and React Native apps (uvrn-app family, future blooms)
**Parent:** lk-bloom `doctrine/oop/` — the house paradigm (composition-first, ports, ADR discipline). Where they overlap, oop wins and is cited, never restated.
**Children:** product/app doctrines instantiate this per repo — e.g. `uvrn-app_build-master/doctrine/` (the uvrn-app React Native spec master). Children cite this register; they never fork it.
**Derived from:** the dash2 web zone as the living web worked example (`uvrn_home-1_v2/src/dash2/`), the uvrn-app doctrine as the native worked example, and 2026-07 React platform research (05).

## What this is

The universal spec + guide for how Lyrikai writes React, on any renderer: what a component is allowed to be, where state may live, how data enters the tree, where motion and color live, when hand-optimization is permitted, and how drift gets caught. It is the layer between the paradigm (`doctrine/oop/` — language-agnostic shape law) and the platforms (web dialect, native dialect) — the rules here hold whether the pixels come from the DOM or from Fabric.

## What this is not

Not a component catalog, not a design system (token values live in each product's design source of truth), not repo law (repos pin their own baselines and repo-local ADRs), and not a program plan.

## Reading order

| Doc | Role |
|-----|------|
| [00-SHARED-CORE.md](00-SHARED-CORE.md) | Renderer-agnostic React law — components, state ladder, data seam, effects |
| [01-DECISIONS.md](01-DECISIONS.md) | ADR register — locked decisions, citable as ADR-U001… |
| [02-WEB-DIALECT.md](02-WEB-DIALECT.md) | Web SPA dialect — zones, CSS, routing, DOM testing |
| [03-NATIVE-DIALECT.md](03-NATIVE-DIALECT.md) | React Native dialect — Expo, theme modules, motion, parity |
| [04-TRIPWIRES.md](04-TRIPWIRES.md) | Drift detection — universal greps; dialect/repo baselines pinned downstream |
| [05-PRINCIPLES.md](05-PRINCIPLES.md) | Researched platform guide — React 19 era, state field consensus, sources |

## Numbering

House oop ADRs are `ADR-001…`; this register is **`ADR-U###`** (U = universal React); the uvrn-app repo doctrine keeps repo-local `ADR-00N`. A citation always carries its register: "per ADR-005" (oop) · "per ADR-U004" (here) · "per uvrn-app ADR-003" (repo).

## One-paragraph summary

Lyrikai React is function components and hooks over a pure logic core, on every renderer. State lives at the lowest layer that can own it — local first, the URL as the shareable bus, context only for session-shaped concerns, a store only by ADR — and server data enters through exactly one ported data-client seam per app, never through ad-hoc fetches in components. Page logic lives in sibling helper modules that `node --test` can execute without a renderer; motion lives in one named preset module per app and dies under reduced motion; components are written naively and hand-memoized only with a measurement attached. The web and native dialects say how each platform wears these rules; products bind them to pixels; and tripwires — not intentions — keep all of it true.
