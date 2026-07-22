# 04 · Coordination — Master Build Pattern v0.2

Bloom governance applies; companion AGENT-COORDINATION rules apply in FULL mode when 2+ writing agents are active. Cite sections when invoking.

**Doctrine:** `lk-bloom/master-build/MASTER-BUILD-PATTERN.md`  
**Product fills:** worktree prefix / branch slug / `workLogsRoot` in `00-MASTER-PLAN.md` product adapter.

## Worktree + branch (every unit)

```bash
cd <primary-checkout>    # stays on main
git fetch origin
git worktree add ../wt-<product-slug>-<unit> -b <product-slug>/<unit-slug> origin/main
```

- One unit = one worktree = one branch = one future PR = one audit = one CLOSEOUT.
- Worktrees live **outside** the primary checkout. Remove after land via **CLOSEOUT** (safe prune only).
- Rebase on `origin/main` before PR; never rebase past a published checkpoint SHA another agent acknowledged.
- Commits: conventional, scoped — `feat(<slug>): <unit> — <summary>`.

### Primary checkout stays on main

- Session start / CLOSEOUT: `git checkout main && git pull --ff-only origin main` (**keep local dirt**)
- Always `git worktree add … origin/main` after `git fetch` — never base a unit on a stale primary tip.
- “Match live/main” sandboxes: fresh tip — never an old feature worktree as “what’s online.”

## PR policy

### Hard gate — sandbox preview before PR

**No PR until Admin has approved the unit in a local sandbox preview** (or waived docs-only in writing).

Order:

1. Build + local commits in the worktree  
2. Independent audit → PASS / PASS-WITH-NOTES  
3. **Sandbox preview** under local safe defaults  
4. Admin says **preview approved**  
5. Only then: Publisher push + open PR  
6. After merge: **CLOSEOUT.md** (SoR, worklogs, prune, next pointer)

Audit PASS alone is **not** enough. Agent hand-QA is evidence for Admin, not a substitute.

### PR mechanics (Publisher)

- Title: `⟨product⟩ ⟨UNIT⟩ · ⟨title⟩`
- Description must include: unit/plan link, acceptance (checked + how), Bloom self-assessment, audit report path, **preview-approved** line (date + who).
- Merge only after audit PASS/PASS-WITH-NOTES **and** preview approval. Prefer squash-merge; delete branch.
- Then hand off to `CLOSEOUT.md`.

## Handoff mode

Build session stops after implementation, verification, and independent audit. It does **not** open PRs until preview approval. **Handoff-ready ≠ PR-ready ≠ closeout-done.**

Optional draft worklogs under `04-agent-ops/` during the unit; durable SoR finalized at CLOSEOUT under product `workLogsRoot`.

See `PUBLISHER.md` through merge; see `CLOSEOUT.md` after land.

## After CLOSEOUT

Clear this file’s active-build / worktree ownership rows. Park next gated unit with explicit **do not start** until Admin unlock. No CP-0 on the next unit without that unlock.

## Shared touchpoints

Declare in the ledger before touching files owned by more than one unit. Last-writer rebases.
