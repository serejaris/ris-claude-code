# Project Init Skill

A Claude Code skill that sets up GitHub as your business operating system through a guided interview. Part of the Personal Corp framework.

## Problem

Starting agent-driven project management requires GitHub Projects, labels, config blocks, and canonical files — all wired together correctly.

## Solution

Guided interview that creates infrastructure in one session:
- **GitHub Project** with custom fields (Status, Deadline, Week)
- **Labels** for retro/planning cycles in each repo
- **CLAUDE.md config block** so other skills read your setup automatically
- **Canonical files** for single-source-of-truth data (numbers, products, insights)

## Installation

```bash
cp -r skills/project-init ~/.claude/skills/
```

## How It Works

| Phase | What happens |
|-------|-------------|
| Interview | 5 questions, one at a time — business, repos, products, metrics, rhythm |
| Generate | Creates config block, shows for review |
| Create | GitHub Project, labels, canonical files, CLAUDE.md update |
| Verify | Checks everything was created correctly |

## Key Features

- One-time setup — other skills (weekly-retro, weekly-planning) read from its config
- Won't overwrite existing CLAUDE.md — appends config block
- Detects existing GitHub Projects and labels
- Task routing rules for multi-repo setups
- Interview topics config for weekly-retro

## See Also

- [weekly-planning](../weekly-planning/) — structured weekly planning with Eisenhower matrix
- [weekly-retro](../weekly-retro/) — structured retrospective using your config
