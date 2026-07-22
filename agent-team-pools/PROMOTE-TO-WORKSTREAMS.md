# Admin promote — Brain proposal → WORKSTREAMS

**Audience:** Admin (required) · Master Pool Lead (may draft packet) · Research Brains (may author proposals only)  
**Pack:** `hive/agent-team-pools`  
**Companion:** [`../ORCHESTRATION.md`](../ORCHESTRATION.md) · product `_build-master` unit loop

Research Brains and Pool Leads **never** create or mutate WORKSTREAMS / BP rows. Promotion is **Admin-only**.

---

## Required proposal fields

Every card in `pools/<id>/PROPOSALS.md` that seeks ship work must include:

| Field | Required |
|---|---|
| **Problem** | What is wrong or missing (evidence-linked) |
| **Evidence** | Paths, audits, digests, highlights, dates |
| **Idea** | Proposed fix / enhancement (outcome, not implementation dump) |
| **Suggested slice** | Candidate WS/BP title + one-unit scope guess |
| **Walls** | Product walls that apply (fixture, UI catalog, domain, honesty) |
| **Effort** | S · M · L |
| **Risk** | What could go wrong / what must not expand |
| **Related highlight / digest** | Link if any |
| **Status** | `open` · `acked` · `parked` · `promoted-to-WS` |
| **Cross-pool?** | If yes: `@pool-id` siblings + why (see [`IDEA-EXCHANGE.md`](./IDEA-EXCHANGE.md)) |

Incomplete cards stay `open` or get `parked` — they do not enter the job board.

---

## Promote recipe (Admin)

1. Read proposal + linked HIGHLIGHTS / DIGESTS / INBOX row.
2. Decide: **promote** · **park** · **reject** (ack INBOX either way).
3. If promote: open or extend the product `_build-master` unit loop:
   - Existing program: add / unlock a WS or BP row via Orchestrator PREP (still subject to `CP0-POLICY`).
   - New program / greenfield idea: run Seed (`PROGRAM-SEED` / `SEED-GUIDANCE`) → Admin program lock → then CP-0.
4. Stamp proposal: `Status: promoted-to-WS` + **Promoted as:** `WS-…` / `BP-…`.
5. Never leave a shadow status SoR inside the pool instance.

---

## Red lines

- No auto-promote from Brain or Lead.
- No second WORKSTREAMS inside the pool tree.
- No feature PRs from Brain / Lead “to help.”
- No silent OpenRouter for routine proposal research — Cursor search tools.
- Product walls stay in product COORDINATION / MASTER-PLAN — proposals cite them; they do not redefine them.
