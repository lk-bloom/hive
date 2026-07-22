# Cross-pool idea exchange

**pack:** `hive/agent-team-pools`  
**poolPatternVersion:** `0.3`  
**See also:** [`PROMOTE-TO-WORKSTREAMS.md`](./PROMOTE-TO-WORKSTREAMS.md) · [`../ORCHESTRATION.md`](../ORCHESTRATION.md)

Agents swap insight across domains **without** inventing a second job board.

---

## Protocol

1. Author a PROPOSALS card in the **owning** pool (required fields per promote recipe).
2. If another pool should see it, set **Cross-pool?** to `@pool-id` (one or more) with a one-line reason.
3. Master Pool Lead (or Brain with Lead ack) routes a short INBOX row to the mentioned pool(s): link back to the source proposal — do not duplicate the full card unless useful.
4. Receiving Brain may add a HIGHLIGHTS note or counter-proposal in **its** PROPOSALS.
5. Only **Admin** promotes any card → product WORKSTREAMS (see promote recipe).

---

## Swarm etiquette

- No silent OpenRouter / product AI keys for routine Brain research — Cursor search tools.
- No feature PRs from Brain / Lead.
- No shadow WORKSTREAMS status inside the pool tree.
- Product walls (fixture, UI catalog, domain) stay cited from product COORDINATION — exchange does not redefine them.
- CLOSEOUT Brain digests may `@mention` sibling pools; that is exchange seed, not promotion.

---

## Conflict / collision

If two pools propose conflicting ship work: escalate both to instance INBOX; Admin picks one promote path or parks both. Do not race CP-0.
