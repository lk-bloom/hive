# SEED-GUIDANCE — ask vs draft — Master Build Pattern v0.5

**Required for Seed agents.** Do not improvise this policy.

Parent recipe: [`PROGRAM-SEED.md`](./PROGRAM-SEED.md).

---

## Default stance

Produce a usable MASTER-PLAN + WORKSTREAMS + BP-01 + COMPOSER + AGENTS (with **bee roster** + **assigned local paths**) from the Admin idea **without stalling**. Prefer shipping a draft with explicit Assumptions over endless questioning.

---

## When to ask (optional, ≤5 questions)

Ask clarifying questions **only when patterns or answers are readily available** — for example:

- Repo / primary checkout path already known or obvious in the workspace  
- Prior product build-master or walls to mirror  
- Admin already stated `workLogsRoot`, `historyRoot`, spend caps, or honesty vocabulary  
- Existing contracts / design-handoff in-tree  
- Ambiguity that would make BP-01 acceptance **unverifiable**

Cap: **≤5** focused questions. Batch them. Do not drip-ask.

Topics worth asking (pick only what is missing):

1. Primary checkout / repo  
2. Hard walls or off-limits zones  
3. `workLogsRoot` + `historyRoot` locations  
4. First ship target (what BP-01 must prove)  
5. CP-0 mode intent (`admin-gated` vs `automation-eligible`)  
6. Which bees this product needs (Executive-ops, Design, Brains/pools, etc.)  
7. Any known cross-hive shares (default: none — Admin must gate later)  

---

## When to draft hard (automatic)

If the above patterns are **not** readily available → **do not block**. Draft aggressively from the idea:

- Propose product slug, worktree prefix, and branch scheme  
- Propose `workLogsRoot` (e.g. instance `work-logs/` or a sensible admin path)  
- Propose `historyRoot` (default instance `05-history/`; another path when occupied)  
- Draft hard walls as best-effort; mark uncertain items under **Assumptions**  
- Default CP-0 mode to **`admin-gated`** unless the idea is clearly pure-automation  
- Write BP-01 as the **smallest honest** first unit  
- Fill **bee roster** in `AGENTS.md` (mark unused bees `n/a`); declare **assigned local paths**  
- Leave cross-hive shares empty unless Admin already approved a share  

List every material guess under **Assumptions** in MASTER-PLAN (and summarize in COMPOSER) for Admin program lock.

---

## Never during Seed

- CP-0 / worktree / feature implementation  
- Granting program lock to yourself  
- Inventing live API keys, spend, or secret materialization  
- Expanding into out-of-scope products  
- Opening PRs  
- Cross-hive file sync without Admin gate  
- Treating Executive-ops as program governor (human Admin only)  

---

## After draft

Stop with: **awaiting Admin program lock**.  
Orchestrator does not start units until MASTER-PLAN status is `admin-locked` or `active`.
