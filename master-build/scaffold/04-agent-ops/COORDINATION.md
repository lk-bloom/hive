# 04 · Coordination — Master Build Pattern v0.5

Bloom governance applies; companion AGENT-COORDINATION rules apply in FULL mode when 2+ writing agents are active. Cite sections when invoking.

**Doctrine:** `lk-bloom/hive/master-build/MASTER-BUILD-PATTERN.md`  
**Product fills:** worktree prefix / branch slug / `workLogsRoot` / `historyRoot` / CP-0 mode in `00-MASTER-PLAN.md`.  
**Also see:** `COMPOSER.md` · `AGENTS.md` (bee roster + local boundary) · `CP0-POLICY.md` · `PROGRAM-SEED.md` · `lk-bloom/hive/ORCHESTRATION.md`

## Seed (pre-worktree)

Seed-from-idea drafts program surfaces only. **Active worktree stays empty** until Admin program lock **and** a unit CP-0 per `CP0-POLICY.md`.

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

- The **main project folder** (primary checkout) should **always** stay on `main` (or the repo’s default integration branch) and stay **synced** to `origin/main` when practical.
- Do **not** park long-lived feature work by checking out feature branches *in* the primary folder — that blocks `main` occupancy for other worktrees. New work uses **dedicated worktrees** (own folders), scoped only as large as needed.
- After a unit ships: never leave a disposable WT holding `main` — prune it (clean + SHA-matched) or move it off `main` so primary can check out `main`. Example: packages LIVE `…/uvrn-packages_main-total-updates_LIVE` owns `main`; prune shipped WTs that still have `main` checked out.
- Session start / CLOSEOUT: fetch, safely `git checkout main && git pull --ff-only origin main`, then verify `HEAD == origin/main` (**keep local dirt**; record blocked sync honestly)
- Always `git worktree add … origin/main` after `git fetch` — never base a unit on a stale primary tip.
- “Match live/main” sandboxes: fresh tip — never an old feature worktree as “what’s online.”

### Multi-slot (automation-eligible only)

If MASTER-PLAN allows multi-slot concurrent worktrees, keep one row per active unit below. Never share one worktree across units.

## PR policy

### Hard gate — sandbox preview before PR

**No PR until Admin has approved the unit in a local sandbox preview** (or waived docs-only in writing).

Order:

1. Build + local commits in the worktree  
2. Independent audit → PASS / PASS-WITH-NOTES  
3. **Sandbox preview** under local safe defaults  
4. Admin says **preview approved**  
5. Only then: Publisher push + open PR  
6. After merge: **CLOSEOUT.md** (SoR, worklogs, history map, verified sync, next pointer)

Audit PASS alone is **not** enough. Agent hand-QA is evidence for Admin, not a substitute.

### PR mechanics (Publisher)

- Title: `⟨product⟩ ⟨UNIT⟩ · ⟨title⟩`
- Description must include: unit/plan link, acceptance (checked + how), Bloom self-assessment, audit report path, **preview-approved** line (date + who).
- Merge only after audit PASS/PASS-WITH-NOTES **and** preview approval. Prefer squash-merge; do **not** delete the branch before CLOSEOUT reconciles branch/head/worktree gaps and authorizes cleanup.
- Then hand off to `CLOSEOUT.md`.

## Handoff mode

Build session stops after implementation, verification, and independent audit. It does **not** open PRs until preview approval. **Handoff-ready ≠ PR-ready ≠ closeout-done.**

Optional draft worklogs under `04-agent-ops/` during the unit; durable SoR finalized at CLOSEOUT under product `workLogsRoot`, with the linked archive entry under `historyRoot`.

See `PUBLISHER.md` through merge; see `CLOSEOUT.md` after land.

## After CLOSEOUT

Clear this file’s active-build / worktree ownership rows. Next unit CP-0 follows **`CP0-POLICY.md`**:

- **admin-gated (default):** park with explicit **do not start** until Admin unlock  
- **automation-eligible:** Orchestrator may auto-CP-0 only when all circumstance checks PASS  

## CLOSEOUT ownership (shared finalization)

Only one active CLOSEOUT writer per build-master. Unit-specific worklog drafts may run concurrently; WORKSTREAMS, ledger, this file, `historyRoot`, shared doctrine/maps, cleanup, and primary-main synchronization may not.

1. Check the row below. If occupied, wait/stop.  
2. Atomically create `04-agent-ops/.closeout.lock`; failure means another local writer owns the slot. Immediately write `.closeout.lock/CLAIM.md` with unit, agent/session, merge SHA, and claimed-at.  
3. Fill the durable row with the same fields; re-read it and shared surfaces before writing.  
4. Never remove another agent’s lock or worktree. Stale/ambiguous ownership requires owner or Admin resolution.  
5. Release the row and atomic lease last. On failure, record the outcome and release only your own lease.

The filesystem lease coordinates agents sharing this build-master checkout. Agents on different machines/filesystems require an Admin-designated external lock/queue; the markdown row alone is not atomic.

### Admin orphan-lease recovery

Never clear a lease merely because it is old. Admin:

1. Read `.closeout.lock/CLAIM.md` (or note that it is missing) and compare it with the durable row.  
2. Check the named session/process and contact the owner when possible.  
3. Confirm no shared CLOSEOUT write or sync operation is still running.  
4. Record an `orphan-lease-cleared` note in COORDINATION/ledger with evidence and time.  
5. Remove the orphan lock and reset the row. Agents may not perform this recovery without Admin direction.

`.closeout.lock/` is runtime-only and ignored by `04-agent-ops/.gitignore`; never commit it.

### Same-branch multi-agent ownership

When several agents contribute to one branch, each handoff must record immutable unit-start/tip anchors plus agent → commit/path evidence. A branch name or in-scope path is only a transport/scope signal, not ownership proof; every change needs a named contribution row (including generated output and its generator evidence). CLOSEOUT reconciles PR interval, landed delta, current branch/worktree, and all contribution handoffs; unresolved changes are branch gaps and keep overall CLOSEOUT/cleanup `partial-blocked`.

| Slot | Unit | Agent / session | Merge SHA | Claimed at | Status |
|---|---|---|---|---|---|
| closeout | — | — | — | — | free |

## Active ownership (live)

| Unit | Role | Worktree | Branch | Notes |
|---|---|---|---|---|
| — | — | free | — | Seed / idle |

## Shared touchpoints

Declare in the ledger before touching files owned by more than one unit. Last-writer rebases.

## Cross-hive shares (Admin-gated)

**Master rule:** bees stay in assigned local project paths. Sharing files or coordinating with agents in **other** hive-network products requires **human Admin approval**.

Doctrine: `lk-bloom/hive/ORCHESTRATION.md` §0a.

| Approved | Paths / artifacts | Recipients (product / bee) | Purpose | Expiry | Admin |
|---|---|---|---|---|---|
| — | — | — | — | — | none |

Default: **no cross-hive shares**. Cite-by-path reads of `lk-bloom/hive/` doctrine do not need a row.
