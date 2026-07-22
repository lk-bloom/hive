# 04 — Tripwires: Catching Drift (universal React)

**Status:** v0.1 · 2026-07-18 · parent rationale: `doctrine/oop/03-TRIPWIRES.md` (measured beats diagnosed)

## How the layers pin

This file defines the **universal set** — greps any Lyrikai React repo runs, warn-mode first. Repos pin their own baselines (in their repo doctrine or the oop register): web dash2 baselines live in oop `03-TRIPWIRES.md`; uvrn-app baselines live in `uvrn-app_build-master/doctrine/`. Baselines only move down, or up with an ADR-referenced plan note. (All commands exclude `node_modules/`.)

## Universal set (any React repo, both dialects)

| Tripwire | Command (from repo root) | Rule |
|----------|--------------------------|------|
| Class components | `grep -rn "extends React.Component\|extends Component\b" src/ app/ --include='*.js' --include='*.jsx'` | 0 — ADR-U001 |
| New TypeScript files | `find src app -name '*.ts' -o -name '*.tsx' 2>/dev/null \| grep -v node_modules` | ≤ pinned legacy count; new = fail — ADR-U006 |
| Fetch outside the seam | `grep -rn "fetch(\|axios\|XMLHttpRequest" src/ app/ --include='*.js*' \| grep -v "<seam path>"` | 0 outside the repo's named data-client path — ADR-U003 |
| Store creep | `grep -n "zustand\|redux\|jotai\|mobx" package.json` | 0 without an ADR documenting the failed ladder rung — ADR-U002 |
| Animation outside the motion module | `grep -rn "<motion primitives>" src/ app/ --include='*.js*' \| grep -v "motion.js"` | 0 — ADR-U005 (each dialect names its primitives: web keyframe/transition APIs; native Reanimated builders) |
| Unexplained memoization | `grep -rn "useMemo(\|useCallback(\|React.memo(" src/ app/ --include='*.js*'` | every hit carries a measurement note (list rows exempt per 03) — ADR-U007 |
| Effect audit (manual) | review each `useEffect` in the diff | each nameable as "syncs X with Y"; derive-or-fetch effects are findings — ADR-U008 |
| Banned honesty claims on fixture paths | `grep -rni "verified\|sealed\|emailed\|pushed" <fixture + fixture-rendering paths>` | 0 rendered claims — ADR-U009 |
| Helper extraction debt | pages whose inline derivations exceed triviality | helper-extraction note in the owning queue — ADR-U004 |
| Module budgets | house rule: split before 500 lines / ~15 methods | pinned per repo; flagged files may not grow |

## Dialect add-ons

- **Web:** color literals outside token stylesheets; cross-zone implementation imports outside the adapter (boundary script per house oop); route meta scattered outside the meta module.
- **Native:** the full uvrn-app set — hex outside `src/theme/`, LayoutAnimation, `Platform.OS` without inline ADR citation, `.env` files, missing HonestyBanner on fixture screens, `android_ripple` — commands and pins live in `uvrn-app_build-master/doctrine/03-TRIPWIRES.md`.

## Escalation

Same as the house: tripped warn-mode wire = one-line note in the owning workstream queue in the same session; tripped enforce-mode wire = the PR does not merge.
