# 03 — Native Dialect (React Native / Expo)

**Status:** v0.1 · 2026-07-18 · applies ADR-U001…U010 to native React
**Worked example (living):** the uvrn-app spec master — `uvrn-apps/uvrn-app-1/uvrn-app_build-master/doctrine/` — the full RN law for the UVRN app family. This file is the universal summary; the app-family doctrine binds it to a product and pins baselines.

## Stack shape

Expo **managed workflow on the latest SDK** (Expo Go runs latest-only, so bootstrap always adopts latest), expo-router file-based routes as the URL bus, config plugins over hand-edited native directories. The New Architecture (Fabric / TurboModules / JSI, bridgeless) is the only architecture — no bridge-era patterns, no libraries that require them.

## Zone layout (per app)

| Path | Role |
|------|------|
| `app/` | Framework edge — thin route files; navigation wiring; font/splash gate. No business logic |
| `src/components/` | Props-only presentational primitives |
| `src/theme/` | `tokens.js` · `type.js` · `motion.js` — plain JS modules owning every color, font recipe, and motion preset; no theme context until a second theme actually ships |
| `src/data/` | Fixtures + the data-client factory (ADR-U003's seam); the only zone that may ever touch network |
| `src/lib/` | Pure logic, `// @ts-check`, `node --test` |

## Native-specific rules

- **Motion:** Reanimated only (runs off the JS thread); LayoutAnimation banned; `useReducedMotion()` gates every preset; infinite loops never start under reduced motion; no blur on native.
- **Platform parity:** iOS + Android co-equal — features ship on both or on neither; `Platform.OS` branches and `.ios.js`/`.android.js` splits carry an inline ADR citation; "platforms rhyme, not pixel-identical" is the acceptance language.
- **Pressed feedback:** brand tint wash on both platforms; Material ripple stays off (`android_ripple` unset) unless a product ADR says otherwise.
- **Storage/secrets:** `expo-secure-store` for tokens — never AsyncStorage, never `.env` files in fixture-only programs. Current-conventions set: `expo-image` over core `<Image>`, `expo-video`/`expo-audio` over `expo-av`.
- **Lists:** `FlatList` at fixture scale; FlashList adopted by ADR the moment a real unbounded feed exists — the dependency follows the problem, not the hype. Stable `keyExtractor`, memoized rows (a measured hotspot — ADR-U007's standing exception for list rows is the measurement lists come with).
- **Accessibility floor:** `accessibilityRole`/`accessibilityLabel` on interactive elements, `progressbar` on meters, ≥44pt touch targets, reduced-motion exercised in acceptance on both platforms.

## Relationship to the app-family doctrine

The uvrn-app doctrine predates this file and remains authoritative for its repos (its `ADR-R###` register locks the same rules product-tight, plus UVRN specifics: dash2 design language, fixture-only hard walls, honesty strings, repo tripwire baselines). Future non-UVRN native apps instantiate **this** dialect directly and pin their own baselines; where wording differs, this file is the universal floor and the app doctrine is the stricter product binding — stricter wins locally.
