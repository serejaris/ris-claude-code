# Weekly Retro Skill

A Claude Code skill for structured weekly retrospectives. Part of the Personal Corp framework.

## Problem

Weekly reviews for solo founders are chaotic — no structure, facts get lost, action items stay in your head instead of the backlog.

## Solution

Agent-driven retrospective in 6 phases:
- **Gather data** — git commits, GitHub issues, previous retro carry-over
- **Interview** — structured conversation, one topic at a time, write immediately
- **Advisory analysis** — optional parallel analysis by 3 sub-agents
- **Compile summary** — done / in progress / not touched / lessons
- **Create backlog** — issues routed to correct repos with `retro:WNN` labels
- **Wrap-up** — save summary, show diffs, commit on request

## Installation

```bash
cp -r skills/weekly-retro ~/.claude/skills/
```

## Setup

Add a `## Weekly Retro Config` section to your project's `CLAUDE.md` with:

| Config | Purpose |
|--------|---------|
| Repos to scan | Which repos to check for commits |
| GitHub owner | Your username/org for issue search |
| GitHub Project ID | Board where retro issues land |
| Canonical files | Single source of truth for numbers |
| Retro log path | Where summaries are saved |
| Task routing | Map task types to repos |
| Interview topics | Ordered list of areas to cover |

See `SKILL.md` for the full config template.

## Key Features

- Iron rules: ask don't assume, verify before create, save immediately
- Numbers trust hierarchy (live query > canonical file > memory > verbal)
- Duplicate detection before creating issues
- Multi-topic response handling
- Retro/planning mode separation
- Red flags that stop the agent from bad habits

## See Also

- [SKILL.md](SKILL.md) — full skill definition with config template
