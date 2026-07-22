# PROGRAM-SEED — Seed-from-idea — Master Build Pattern v0.5

**Required for greenfield.** Runs **before** any unit CP-0 / worktree / feature code.

**Admin gives an idea → Seed agent drafts program surfaces → Admin program lock → unit loop.**

Doctrine: `lk-bloom/hive/master-build/MASTER-BUILD-PATTERN.md` §5a.  
Ask-vs-draft: [`SEED-GUIDANCE.md`](./SEED-GUIDANCE.md).  
Paste prompt: [`SEED-AGENT-PROMPT.md`](./SEED-AGENT-PROMPT.md) (from template).  
Bee roster + local boundary: `lk-bloom/hive/ORCHESTRATION.md` §0a · §6.

---

## What Seed is not

- **Not** the unit build / audit / preview / PR path  
- **Not** CP-0 or worktree creation  
- **Not** program lock (Admin only)  
- **Not** automatic start of BP-01 after draft  

---

## Recipe (order)

### 1 · Intake

- [ ] Capture Admin **initial idea** (one paragraph is enough)  
- [ ] Note any known repo path, walls, or prior patterns  

### 2 · Clarify or draft (SEED-GUIDANCE)

- [ ] If patterns / answers are **readily available** → ask ≤5 focused questions, then draft  
- [ ] If not → **draft aggressively** from the idea; enumerate **Assumptions** for Admin  

### 3 · Write artifacts

- [ ] `00-MASTER-PLAN.md` — product definition, adapter, hard walls draft, `workLogsRoot` + `historyRoot` proposals, program status `seed-draft`, proposed CP-0 mode (default `admin-gated`)  
- [ ] `WORKSTREAMS.md` — first wave Open + later Gated  
- [ ] `01-blueprints/BP-01-….md` — smallest honest first unit + acceptance  
- [ ] `COMPOSER.md` — system guide filled for this product  
- [ ] `AGENTS.md` — **bee roster** + **assigned local project paths** + team orchestration (required; see `lk-bloom/hive/ORCHESTRATION.md` §0a · §6)  
- [ ] `04-agent-ops/COORDINATION.md` — confirm cross-hive shares table present (default empty)  

### 4 · Stop for Admin program lock

- [ ] Surface Assumptions + proposed CP-0 mode  
- [ ] Explicit status: **awaiting Admin program lock**  
- [ ] **No** ledger `started`, **no** worktree, **no** feature commits  

### 5 · After Admin lock

- [ ] MASTER-PLAN program status → `admin-locked` or `active`  
- [ ] Accept / edit Assumptions; confirm CP-0 mode  
- [ ] Hand off to Orchestrator (`MASTER-PREP-PROMPT.md`)  
- [ ] First unit CP-0 only per [`CP0-POLICY.md`](./CP0-POLICY.md)  

---

## Done means

Seed-done = artifacts written + awaiting (or completed) Admin program lock.  
Program-active = Admin locked + Orchestrator may run unit loop under CP0-POLICY.
