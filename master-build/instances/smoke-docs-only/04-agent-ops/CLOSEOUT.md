# CLOSEOUT — post-merge Reflect / Continue — Master Build Pattern v0.2

**Required.** Runs **after** the PR is merged. Admin or orchestrator under Admin direction.

**Publisher ends at merge.** This file owns SoR reflect, dual worklogs, housekeeping, and next pointer.

Doctrine: `lk-bloom/master-build/MASTER-BUILD-PATTERN.md` §7.

---

## What CLOSEOUT is not

- **Not** the build / audit / sandbox / PR-open path  
- **Not** merging the PR (Publisher / Admin already did that)  
- **Not** starting the next wave unless Admin says **`start …`**

---

## Five steps (order)

### 1 · Verify land

- [ ] `gh pr view <n> --json state,mergeCommit` (or equivalent) shows **MERGED**  
- [ ] Record **merge SHA**  
- [ ] `git fetch origin`

### 2 · Reflect SoR

- [ ] Update `WORKSTREAMS.md` (recently closed + next-action / parked)  
- [ ] Clear `COORDINATION.md` active build + worktree free  
- [ ] Ledger rows: `merged` (SHA) + `reflect` (one line) — one-line reflect does **not** replace worklogs  
- [ ] Close / supersede phase docs, READY, PREP, HANDOFF banners  
- [ ] Stamp audits + tip SHA in handoff trail  
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

### 4 · Housekeeping

- [ ] Prune feature worktree **only if clean / SHA-matched** (`git worktree remove …`)  
- [ ] Primary checkout: `git checkout main && git pull --ff-only origin main`  
- [ ] **Keep local dirt** on primary (do not wipe unrelated uncommitted work)

### 5 · Next pointer

- [ ] Park the next gated unit in WORKSTREAMS / COORDINATION  
- [ ] Explicit **do not start** (no CP-0) until Admin unlock phrase  
- [ ] Optional: pointer to next PREP doc only — still gated  

---

## Checklist (single pass)

- [ ] Confirm PR merged + merge SHA  
- [ ] Update WORKSTREAMS status / next-action  
- [ ] Clear COORDINATION active build + WT free  
- [ ] Ledger rows: merged + reflect  
- [ ] Close/supersede phase / READY / PREP / HANDOFF  
- [ ] Stamp audits + tip SHA in handoff trail  
- [ ] Architecture map / OOP page tip if the wave shipped chrome  
- [ ] Write overview + tech worklogs (+ index)  
- [ ] Prune feature worktree (safe only)  
- [ ] Pull main checkout ff-only (preserve local dirt)  
- [ ] Explicit “do not start” for next gated unit (+ optional prep pointer)  

---

## Done means

Closeout-done = land verified + SoR updated + dual worklogs at `workLogsRoot` (or waiver) + housekeeping + next pointer parked. Agents stop. Wait for Admin **`start …`**.
