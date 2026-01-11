# AI Context Template

Use this template for storing session context in GitHub issues.

## Full Template

```markdown
<!-- AI-CONTEXT:START -->
## AI Session Context
_Last updated: YYYY-MM-DD HH:MM_

### Status
**IN_PROGRESS** | **DONE** | **BLOCKED**

### Progress
- [x] Completed item
- [ ] Pending item

### Key Files
- `path/file.ts:45-78` — description
- `path/other.ts:120` — description

### Decisions
- **Decision**: Reasoning/WHY

### Blockers
_None_ or list blockers

### Next Steps
1. First action
2. Second action

### Resume Context
Brief summary for quick pickup by next session.
<!-- AI-CONTEXT:END -->
```

## Minimal Template

For quick context saves:

```markdown
<!-- AI-CONTEXT:START -->
## Context | IN_PROGRESS
**Files:** `file.py:45`, `other.py:120`
**Done:** task1, task2
**Next:** next task
**Resume:** One-line summary for cold start
<!-- AI-CONTEXT:END -->
```

## Example: Real Context

```markdown
<!-- AI-CONTEXT:START -->
## AI Session Context
_Last updated: 2026-01-07 15:30_

### Status
**IN_PROGRESS**

### Progress
- [x] Analyzed current bot flow
- [x] Reviewed reference implementation
- [ ] Create simplified flow diagram
- [ ] Implement changes

### Key Files
- `handlers/start.py:45-78` — current start handler
- `data/config.yaml` — configuration
- `handlers/payment.py:120` — payment flow

### Decisions
- **Remove intermediate steps**: Go directly to payment after selection (reduces friction)
- **Reference**: Competitor's 3-step flow is ideal

### Blockers
_None_

### Next Steps
1. Draw new flow diagram
2. Simplify handlers/start.py
3. Test with staging

### Resume Context
Task: simplify flow, restore conversions.
Reference: competitor's simple flow.
Done: analysis of current state.
Next: create new flow diagram.
<!-- AI-CONTEXT:END -->
```

## Tips

| Section | Purpose |
|---------|---------|
| Status | Quick visual scan — IN_PROGRESS/DONE/BLOCKED |
| Progress | Checklist of tasks |
| Key Files | `file:line` format for quick navigation |
| Decisions | WHY not WHAT — reasoning matters |
| Blockers | What's stopping progress |
| Next Steps | Concrete actions |
| Resume Context | Cold start summary — minimum to continue |
