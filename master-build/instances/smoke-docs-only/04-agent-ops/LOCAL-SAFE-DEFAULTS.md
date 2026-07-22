# Local safe defaults — Master Build Pattern v0.2

**Required slot.** Routine local builds, tests, and sandbox previews must not spend live paid APIs or load Admin production keys unless Admin **explicitly** authorizes a gated smoke.

## Rules

1. Use product **fixture / mock / offline** mode for local by default (names in instance MASTER-PLAN adapter).  
2. Never print secrets (keys, tokens, full Authorization headers).  
3. In-session research/lookup: use IDE search tools / readonly MCP — not the product’s live agent provider — unless Admin gates a live smoke.  
4. Live provider keys live in host / CI secrets only — never committed, never written to local dotenv in the repo.

## Product fill-in

Copy into MASTER-PLAN or keep a short table here after adopt:

| Concern | Local default | Gated live |
|---|---|---|
| ⟨PROVIDER⟩ | ⟨fixture⟩ | ⟨agent + key⟩ |
| DB path | ⟨tmpdir⟩ | ⟨prod path⟩ |

This smoke instance: no live providers; no secrets. Product-specific env/doc names live only in MASTER-PLAN when needed.
