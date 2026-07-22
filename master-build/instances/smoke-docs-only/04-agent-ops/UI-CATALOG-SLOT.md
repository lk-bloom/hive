# UI / chrome catalog slot — Master Build Pattern v0.2

**Recommended.** Mark **Required** in the product adapter when the product has a UI-catalog rule.

## Rule (when opted in)

Do **not** design or ship new user-visible UI (components, routes, chrome, empty states that change interaction surfaces) without cataloging them in a doc **before or with** CP-0 / PR.

## Catalog location (product fills)

⟨e.g. `04-agent-ops/*-UI-CATALOG.md` or architecture `pages/<page>.md`⟩

## Exempt

Docs-only / ledger-only / server-only units with **no** user-visible UI change.

This smoke instance: N/A (no UI). Catalog doc names are product law when the slot is Required.
