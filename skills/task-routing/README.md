# Task Routing Skill

A Claude Code skill that routes issues to the correct repo using the routing config from CLAUDE.md. Part of the Personal Corp framework.

## Problem

In a multi-repo setup, issues get created in the wrong repo — bot tasks in the strategy repo, personal ops in public repos, duplicate issues across projects.

## Solution

Reads the `### Task Routing` config block from CLAUDE.md (created by `project-init`) and matches task keywords to the correct target repo before creating any issue.

## Installation

```bash
cp -r skills/task-routing ~/.claude/skills/
```

## How It Works

1. Reads routing patterns from CLAUDE.md
2. Matches task description keywords to target repo
3. Checks for duplicates in target repo and unified project
4. Checks if current W-label exists (never creates W-labels — that's `weekly-planning`'s job)
5. Creates issue in the correct repo

## Part of Personal Corp Framework

```
project-init → task-routing → weekly-planning / weekly-retro
     ↑               ↑              ↑
  (setup)      (daily ops)    (weekly cycle)
```

## Related Skills

- [project-init](../project-init/) — creates the routing config that this skill reads
- [weekly-planning](../weekly-planning/) — creates W-labels and prioritizes issues
- [weekly-retro](../weekly-retro/) — creates retro backlog issues
