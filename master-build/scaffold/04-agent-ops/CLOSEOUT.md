# CLOSEOUT — post-merge Reflect / Continue — Master Build Pattern v0.5

**Required.** Runs **after** the PR is merged. Admin or orchestrator under Admin direction.

**Publisher ends at merge.** This file owns SoR reflect, dual worklogs, linked history, Brain digest, verified housekeeping, and next pointer.

Doctrine: `lk-bloom/hive/master-build/MASTER-BUILD-PATTERN.md` §7.

---

## What CLOSEOUT is not

- **Not** the build / audit / sandbox / PR-open path  
- **Not** merging the PR (Publisher / Admin already did that)  
- **Not** starting the next wave unless Admin says **`start …`**

---

## Six steps (order)

### 0 · Claim shared finalization

Unit-specific worklog drafts may run in parallel. Everything below that mutates shared SoR/history/main state is serialized per build-master.

- [ ] Check `COORDINATION.md` CLOSEOUT ownership; if another unit/agent owns it, **wait/stop**  
- [ ] Atomically acquire `<build-master>/04-agent-ops/.closeout.lock` (for example, `mkdir`; existing path means not acquired), then immediately write `.closeout.lock/CLAIM.md` with unit/agent/merge-SHA/time  
- [ ] Write/confirm the durable COORDINATION ownership row: unit, agent/session, merge SHA, claimed-at, status `active`  
- [ ] Re-read WORKSTREAMS, ledger, COORDINATION, `historyRoot` index, shared maps, and current remote state **after** acquisition  
- [ ] Never clear another agent’s lease; stale/ambiguous ownership requires owner or Admin resolution
- [ ] On any stop/failure, the owner records the outcome, releases only its own lease, and does not leave a stale active row
- [ ] If concurrent writers are on different filesystems, stop unless an Admin-designated external lock/queue serializes them; the local lease cannot coordinate remote machines

### 1 · Verify land

- [ ] `gh pr view <n> --json state,mergeCommit,baseRefOid,headRefOid,commits,files` (or equivalent) shows **MERGED**  
- [ ] Record unit start/base SHA, PR base SHA, PR head SHA, and **merge SHA**; do not substitute branch name for these anchors  
- [ ] Confirm the product adapter declares `workLogsRoot`, `historyRoot`, and primary checkout  
- [ ] `git fetch origin`; no remote or unverifiable land = **`invalid-precondition`** (stop; do not invent state)
- [ ] `git merge-base --is-ancestor <merge-sha> origin/main` succeeds; current main may include newer merges. Failure = **`invalid-precondition`**: record it, release only your own lease, and stop

### 1a · Reconcile the complete branch interval

- [ ] Compare PR metadata/diff (`git diff <pr-base>...<pr-head>`), the unit contribution interval (`git log` + `git diff <unit-start>..<pr-head>`), and landed first-parent delta (`git diff <merge>^ <merge>`)  
- [ ] Build an ordered commit ledger for `<unit-start>..<pr-head>`; every commit must have exactly one named owner, and overlapping path claims need explicit sequence/handoff evidence  
- [ ] Inspect current feature-branch HEAD and `git status`; separate post-PR commits and uncommitted dirt from the landed unit  
- [ ] Reconcile every commit/path to **both** unit scope and a named agent contribution handoff/claim; on multi-agent branches, scope alone is never ownership evidence  
- [ ] For squash merges, remap contributor commits through PR paths/patch content; do not expect original commit OIDs to appear on `main`  
- [ ] Explain merge-resolution differences, intentional omissions, superseded changes, generated output, and known later branch advances with a commit/path/diff evidence link for each explanation  
- [ ] Record dropped, piggybacked, duplicated, unowned, or otherwise unmatched changes as **branch gaps**—never infer ownership from a shared branch name  
- [ ] Any unresolved branch gap = **`partial-blocked`**: preserve branch/worktree, link exact commit/path/diff evidence, and route ownership/remediation to Admin

### 2 · Reflect SoR + doctrine impact

- [ ] Update `WORKSTREAMS.md` (recently closed + next-action / parked)  
- [ ] Clear the landed unit’s active-build/worktree row; **do not clear the separate CLOSEOUT ownership row until step 6**  
- [ ] Ledger rows: `merged` (SHA) + `reflect` (one line) — one-line reflect does **not** replace worklogs  
- [ ] Close / supersede phase docs, READY, PREP, HANDOFF banners  
- [ ] Stamp audits + tip SHA in handoff trail  
- [ ] Compare the approved plan/blueprint with the landed diff; record divergences, deferrals, and anomalies  
- [ ] Record branch-interval reconciliation: anchors, contribution owners, matched paths, explained differences, and unresolved gaps  
- [ ] Review **product-local** durable docs (instance MASTER-PLAN, local ADR, architecture/OOP page, admin guide): update only when the landed codeframe changed a durable rule; otherwise record **`no doctrine change`**  
- [ ] Shared lk-bloom doctrine: record a residual/Admin note; edit it only when lk-bloom itself is the authorized active unit  
- [ ] If chrome shipped and product maintains maps: architecture / OOP page tip stamp

### 3 · Worklogs (Required)

Durable SoR = product adapter **`workLogsRoot`** (+ README index).  
Unit-local drafts under `04-agent-ops/*-work-log*` are optional during the unit; **finalize to SoR here**.

- [ ] Write / finalize **overview** (narrative) worklog  
- [ ] Write / finalize **tech** worklog (or Admin waiver for docs-only on HANDOFF)  
- [ ] Index both in `workLogsRoot` README  

Default names: `YYYY-MM-DD-<product>-<unit>-overview.md` + `…-tech.md`.  
Templates: `UNIT-work-log.md.template`, `UNIT-work-log-tech.md.template`.  
Skills (cite, do not fork): Cursor/Claude `work-log`, `work-log-tech`.

### 4 · History map (Required)

Durable map = product adapter **`historyRoot`**. It indexes and summarizes; it does not replace WORKSTREAMS, ledger, worklogs, audits, findings, reports, or architecture docs.

- [ ] Write `YYYY-MM-DD-<product>-<unit>.md` from `05-history/UNIT-ENTRY.md.template` (or the instance equivalent)  
- [ ] Capture unit/PR/base/head/merge anchors, landed codeframe, branch reconciliation/gaps, plan-vs-landed, anomalies, doctrine impact, evidence links, sync outcome, synchronized main tip, and next pointer  
- [ ] Link overview + tech worklogs, audit, handoff/CLOSEOUT, findings/reports, and architecture/OOP evidence where present  
- [ ] Use `gap` / `unknown` for missing historical evidence; never invent it  
- [ ] Add a newest-first row to the `historyRoot` README

### 4a · Brain digest (Required when a pool instance exists)

Insight handoff into the product agent-team-pool — **not** a job board.

- [ ] Fill `04-agent-ops/BRAIN-DIGEST.md.template` → `YYYY-MM-DD-<product>-<unit>-digest.md`  
- [ ] Land under owning pool `DIGESTS/` and/or pointer in `HIGHLIGHTS.md`  
- [ ] `@mention` sibling pools when cross-domain; escalate only interesting/important seeds to `INBOX.md`  
- [ ] If no pool instance: record `digest: deferred — no pool instance` in history + CLOSEOUT notes  
- [ ] Optional: open a card under `lk-bloom/hive/proposals/` when shared hive doctrine should change (Admin / Bloom Steward accepts)

### 5 · Housekeeping + primary-main sync

- [ ] Prune feature worktree **only if clean / SHA-matched** (`git worktree remove …`)  
- [ ] Remove only the claimed unit’s worktree; never prune another agent’s branch/worktree  
- [ ] Do not prune when the branch advanced beyond PR head, has unresolved ownership gaps, or contains another agent’s uncommitted work  
- [ ] In the declared primary checkout: inspect branch + dirt; **never wipe unrelated work**  
- [ ] `git checkout main && git pull --ff-only origin main` when safe  
- [ ] Verify local `HEAD == origin/main` after fetch/pull  
- [ ] Record exactly one **primary-main synchronization outcome** in the history entry:
  - **`complete`** — local main equals `origin/main`
  - **`partial-blocked`** — dirt or divergence prevents safe synchronization; preserve it and record exact paths/reason
  - **`invalid-precondition`** — no remote, merged land cannot be verified, or merge SHA is not an ancestor of current `origin/main`; CLOSEOUT must stop
- [ ] Record overall **CLOSEOUT status separately**: unresolved branch gaps keep CLOSEOUT `partial-blocked` even when primary-main synchronization is `complete`
- [ ] `partial-blocked` is not full closeout-done unless Admin records an explicit waiver; `invalid-precondition` is never closeout-done

### 6 · Next pointer

- [ ] Park the next gated unit in WORKSTREAMS / COORDINATION  
- [ ] CP-0 for next unit only per **`CP0-POLICY.md`**:  
  - **admin-gated (default):** explicit **do not start** until Admin unlock phrase  
  - **automation-eligible:** Orchestrator may auto-CP-0 only when all circumstance checks PASS  
- [ ] Optional: pointer to next PREP doc only — still subject to CP0-POLICY  
- [ ] Release the COORDINATION ownership row and atomic `.closeout.lock` **last**, after all writes/sync checks finish  

---

## Checklist (single pass)

- [ ] Confirm PR merged + merge SHA  
- [ ] Acquire/confirm exclusive CLOSEOUT ownership; re-read shared surfaces  
- [ ] Confirm merge SHA is an ancestor of current `origin/main`  
- [ ] Reconcile PR, branch interval, landed delta, current branch/worktree, and all agent contribution handoffs  
- [ ] Update WORKSTREAMS status / next-action  
- [ ] Clear COORDINATION active build + WT free  
- [ ] Ledger rows: merged + reflect  
- [ ] Close/supersede phase / READY / PREP / HANDOFF  
- [ ] Stamp audits + tip SHA in handoff trail  
- [ ] Architecture map / OOP page tip if the wave shipped chrome  
- [ ] Write overview + tech worklogs (+ index)  
- [ ] Resolve branch gaps or record exact `partial-blocked` evidence and preserve branch/worktree  
- [ ] Write history entry + newest-first index row (`historyRoot`)  
- [ ] Write Brain digest to owning pool(s) **or** record deferred (no pool instance)  
- [ ] Prune feature worktree (safe only)  
- [ ] Pull primary main ff-only + verify `HEAD == origin/main`; record outcome  
- [ ] Next pointer parked per CP0-POLICY (do-not-start **or** automation checks noted)  
- [ ] Release CLOSEOUT ownership + atomic lease last  

---

## Done means

Closeout-done = land + same-branch contribution attribution verified + SoR/doctrine-impact updated + dual worklogs at `workLogsRoot` (or waiver) + linked history at `historyRoot` + Brain digest recorded (or deferred honestly) + primary-main sync **`complete`** (or explicit Admin waiver for `partial-blocked`) + next pointer parked per CP0-POLICY.  
Default: agents stop and wait for Admin **`start …`**. Automation-eligible: next CP-0 only if circumstance checks PASS.
