# 01 · Blueprints — ⟨PRODUCT_NAME⟩

**patternVersion:** `0.1`

One blueprint (or ordered unit BP-NNA/B) = one worktree = one branch = one audit = one future PR.

## Dependency graph

```
⟨BP-01⟩ → ⟨BP-02⟩ → …
```

## Status ledger (append-only)

| When (UTC) | Unit | Event | SHA / note |
|---|---|---|---|
| ⟨…⟩ | ⟨BP-NN⟩ | started (CP-0) | ⟨…⟩ |
| ⟨…⟩ | ⟨BP-NN⟩ | audit-passed | `03-audit/reports/…` |
| ⟨…⟩ | ⟨BP-NN⟩ | preview-approved | Admin ⟨name⟩ |
| ⟨…⟩ | ⟨BP-NN⟩ | pr-opened | ⟨PR URL⟩ |
| ⟨…⟩ | ⟨BP-NN⟩ | merged | ⟨sha⟩ |
| ⟨…⟩ | ⟨BP-NN⟩ | reflect | ⟨one line⟩ |

Events: `planned` · `started` · `checkpoint` · `audit-requested` · `audit-passed` · `audit-failed` · `handoff-ready` · `preview-approved` · `pr-opened` · `merged` · `reflect` · `parked`.

Never rewrite past rows; append corrections as new rows.

## Blueprint index

| File | Title | Depends on | Status |
|---|---|---|---|
| `BP-NN-….md` | ⟨…⟩ | ⟨…⟩ | ⟨…⟩ |
