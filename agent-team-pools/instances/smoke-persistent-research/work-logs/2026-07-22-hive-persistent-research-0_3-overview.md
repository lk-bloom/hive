# Session overview — Persistent Research Kit 0.3 (public tip)

**Project:** [lk-bloom/hive](https://github.com/lk-bloom/hive)  
**Date:** 2026-07-22  
**Goal:** Ship an opt-in Persistent Research Kit (pool pack 0.3) that makes recurring insight safer without a swarm daemon.

## Conversation arc and context

Hive already had Research Brains, DIGESTS, and promote rules. The gap was **recurrence discipline** (charter, pause, budgets, validate). An earlier “Persistent Research Swarm” idea was reshaped to reject CP-0 blending and embedded model runners. Karpathy’s LLM Wiki pattern was cited lightly (compound markdown insight) without vendoring a wiki product.

## Decisions made

- Opt-in kit under `agent-team-pools/persistent-research/`; bump pool tip to **0.3**.
- Validate-only `check-research-loop.sh` (dry-run / fail-closed); no LLM calls.
- Admin research-charter lock — **not** CP-0.
- Public tip dual-publish scrubbed via `scripts/publish-public-tip.sh`.
- CLOSEOUT for this unit uses docs-only smoke home (no hive product build-master yet).

## Ideas and revelations

- Compile-once insight (DIGESTS/HIGHLIGHTS) already overlaps LLM Wiki spirit; kit adds gates.
- External cron/GHA may open agent sessions; Hive must not embed schedulers/runners.

## Issues encountered

- Full MBP CLOSEOUT blocked earlier: no build-master lease + private parent PR still open.
- Admin re-scoped CLOSEOUT to public tip; smoke instance becomes evidence home.

## Tasks

**Completed:** kit, doctrine 0.3, smoke, public PR merge (`2e79c38`), public-tip CLOSEOUT artifacts.  
**Pending:** private parent merge ([lyrikai-os/lk-bloom#1](https://github.com/lyrikai-os/lk-bloom/pull/1)); UVRN re-pin.

## Next steps / open questions

- Merge private parent when ready.
- Seed hive build-master only if Admin wants full MBP leases for future hive units.
