# 00 — Shared Core: React Law on Any Renderer

**Status:** v0.1 · 2026-07-18 · dialect-independent; parents: `doctrine/oop/00-HOUSE-STYLE.md`

## What a component is allowed to be

A component is a **rendering function**: props in, elements out, hooks for the state it genuinely owns. Function components + hooks only — class components and `extends` chains are banned everywhere (house oop ADR-003/004; `extends Error` remains the narrow exception, outside components). A component that computes more than it renders is a helper module wearing a costume — extract the logic (ADR-U004).

## The state ladder (ADR-U002)

State lives at the **lowest layer that can own it**, climbing only when forced:

1. **Local** — `useState`/`useReducer` for what one component owns (open/closed, draft text).
2. **URL** — the shareable bus. Route params and query strings own "which page, which tab, which filter"; deep links must reproduce the view. Never mirror URL state into component state by hand.
3. **Lifted props** — data flows props-down, events/refetch-up. Prop drilling through two or three layers is honest plumbing, not a smell.
4. **Context** — only for session-shaped concerns (auth/invite session, theme *when a second theme exists*). Two or three providers is the ceiling; unrelated values never share one context.
5. **External store** — does not exist until an ADR admits one, with the failure of layers 1–4 documented. Server data never lives in a store; it belongs to the data seam.

## One data seam (ADR-U003)

Every app talks to the world through **one factory-built data client** (`createDataClient(...)` implementing a named port) — fixture and live are modes of the same port, DTO conversions happen at the seam, and transport objects never cross into pages or components. Components never call `fetch`. This is house oop ADR-005/ADR-R007 practice made universal: dash2 web (`dash2/lib/dataClient.js`) and uvrn-app native (`src/data/dataClient.js`) are the two worked examples of the same rule.

## Helpers beside pages (ADR-U004)

Pure page logic — ranking, grouping, formatting, derivations — lives in **sibling helper modules** (`boardHelpers.js` next to `BoardPage.jsx`), pure and importable, with `node --test` coverage in a `__tests__/` folder. The page composes; the helper computes; the test runs without a renderer. Chart/graphic geometry follows the same split: pure geometry `.js` beside a thin drawing `.jsx`.

## Effects are for synchronization (ADR-U008)

`useEffect` synchronizes React with a real external system (subscription, timer, imperative DOM/native API). It is **not** for deriving state (derive during render), not for data fetching (that's the data client + its hooks), and not for reacting to prop changes with `setState` chains. Every effect names what external thing it synchronizes; an effect nobody can name is a bug that hasn't fired yet.

## Naive components, measured memoization (ADR-U007)

Write components plainly. `useMemo` / `useCallback` / `React.memo` are permitted only with a **measurement attached** (profiler evidence in the PR or a comment naming the measured hotspot). The React Compiler increasingly does this work automatically — hand-tuning without evidence is churn that the toolchain will obsolete.

## Motion is a module (ADR-U005)

Every app exports its motion vocabulary from **one named preset module** (web: `lib/motion.js`; native: `src/theme/motion.js`). Components import presets by name; raw animation code outside the module is a tripwire hit. Every preset respects the platform's reduced-motion signal, and infinite loops never start under it. Motion is an experience variable, **not evidence**.

## Honesty on every surface (ADR-U009)

Fixture and simulated surfaces self-identify in rendered words; "verified", "sealed", "emailed", "pushed" never render for fixture state; empty fixture data gets an honest empty state, never a fake spinner. Vocabulary stays conservative per house oop honesty rules.

## Language

JS + JSDoc, no TypeScript in Lyrikai React repos (ADR-U006); `// @ts-check` in pure logic zones; typedefs are the contract artifacts (house oop ADR-005). Pre-existing `.ts` islands in legacy zones are frozen debt, not precedent.
