# Weekly Planning Skill

A Claude Code skill for structured weekly planning. Turns retro findings + backlog into prioritized outcomes with clear delegation (founder vs agent).

## Problem

Weekly planning without structure leads to reactive work, missed priorities, and tasks landing in wrong repos.

## Solution

7-step process: collect tasks → map calendar → group by surface → Eisenhower split → choose outcomes → create issues → add to board.

- **Outcomes, not tasks** — "By Friday, X is true" format
- **Delegation matrix** — founder judgment vs agent execution
- **Correct routing** — issues land in the repo where work happens
- **Config-driven** — reads repos, routing, project ID from CLAUDE.md

## Installation

```bash
cp -r skills/weekly-planning ~/.claude/skills/
```

## Prerequisites

Run `project-init` first to generate the config block in CLAUDE.md, or add manually:

```markdown
## Agent Operations Config
repos:
  - owner/repo-1
  - owner/repo-2
project_id: N
owner: your-github-handle
routing:
  - pattern: "backend, bugs"
    repo: owner/backend-repo
```

## Process

| Step | What happens |
|------|-------------|
| 1. Collect | Scan retro backlog, open issues, calendar, user input |
| 2. Calendar | Map fixed events, deadlines, commitments |
| 3. Group | Organize by surface (product, sales, content, etc.) |
| 4. Eisenhower | Split by urgency/importance + founder vs agent |
| 5. Outcomes | Define measurable results for the week |
| 6. Issues | Create in correct repos with W{NN} label |
| 7. Board | Add all to unified GitHub Project |

## Part of Personal Corp Framework

```
project-init → weekly-planning → work week → weekly-retro → repeat
```

## See Also

- [project-init](../project-init/) — one-time project setup
- [weekly-retro](../weekly-retro/) — structured weekly retrospective
