# 05 — React Principles (researched guide)

**Status:** v0.1 · 2026-07-18 · platform research backing 00–04; refresh when React or Expo moves materially. Sources at the bottom.

## 1 · The React 19 / compiler era

The React Compiler is stable and increasingly default in mainstream toolchains: it inserts memoization automatically at build time, at finer granularity than hand-written `useMemo`/`useCallback`/`React.memo`. Field guidance has flipped to "write components naively, let the compiler optimize" — which is why ADR-U007 makes hand-memoization a measured exception rather than a habit. React 19's additions worth adopting where they *delete* code: `useActionState` (form pending/error state), `useOptimistic` (optimistic UI without a store), `useFormStatus` (no prop-drilled pending flags), and `use()` with Suspense (replaces `useEffect`+`useState` fetch boilerplate at the leaf). Each is a per-repo adoption, not a mandate.

## 2 · Server Components — acknowledged, not adopted

RSC moved from experimental to standard practice in the framework world (async server components doing data fetching "without a hook in sight"). Our dialect stance (02) stays SPA-plus-API: Lyrikai products already own a composition-rooted server whose API is a *contract surface* — collapsing rendering into it would trade an explicit seam for framework coupling. The stance is a decision with a door: an RSC migration would arrive as an ADR-U supersession with a named reason, not as scaffold gravity.

## 3 · State management — the field agrees with the ladder

Current consensus across the ecosystem matches ADR-U002: local state for what one component owns; the URL for shareable view state; a server-state layer for remote data (the field reaches for TanStack Query — our data-client seam plays that role with less dependency surface); context for one or two session-shaped concerns (two-to-three providers is the recognized ceiling before "provider hell"); an external store (field default: zustand) only when all of that demonstrably fails. The widely-cited observation that ~80% of legacy Redux code was really server-state caching is the empirical backbone of "server data never lives in a store."

## 4 · Effects — the sync-only rule is the field rule

The long-standing "you might not need an effect" doctrine is now table stakes: derive during render, fetch through your data layer, use effects only to synchronize with genuinely external systems. It earns a locked ADR (U008) because effect misuse remains the top React bug generator and neither the compiler nor concurrency fixes a wrong effect — concurrency (transitions, Suspense) actually *raises* the cost of impure render paths.

## 5 · Native — the New Architecture consolidation

RN's New Architecture (Fabric renderer, TurboModules, JSI direct references, bridgeless) is default since 0.76 and assumed by the ecosystem's key libraries (Reanimated's UI-thread animation model; FlashList v2's recycling). Synchronous layout (`useLayoutEffect` + measure in one commit) and full concurrent-features support are the practical wins. Expo managed + config plugins is the maintained path for small teams; Expo Go's latest-SDK-only policy sets the upgrade cadence. Details and product bindings: 03 and the uvrn-app doctrine.

## 6 · Accessibility and honesty as architecture

Reduced-motion handling, semantic roles, and honest fixture labeling are architectural because they are *cross-cutting and unpatchable after the fact*: a motion system without a reduced-motion gate or a demo surface without honesty strings can't be fixed with a lint rule later — which is why both live in the ADR register (U005, U009) rather than in style guidance.

## Sources

- [React 19 in Mid-2026: What We Ship, What We Removed, What We Watch](https://techglock.com/blog/react-19-in-mid-2026-what-we-ship-what-we-removed-what-we-watch)
- [React State Management in 2025: What You Actually Need — Developer Way](https://www.developerway.com/posts/react-state-management-2025)
- [React 19 Hooks guides — ReactUse](https://reactuse.com/blog/react-19-hooks-guide/) · [UXPin 17-hooks guide](https://www.uxpin.com/studio/blog/react-hooks/)
- [React Native — About the New Architecture](https://reactnative.dev/architecture/landing-page)
- [Expo — React Native's New Architecture](https://docs.expo.dev/guides/new-architecture/) · [Expo Router](https://docs.expo.dev/router/introduction/)
- [expo-best-practices (current Expo conventions)](https://github.com/ofershap/expo-best-practices)
- [FlashList](https://shopify.github.io/flash-list/) · [React Native Accessibility](https://reactnative.dev/docs/accessibility)
