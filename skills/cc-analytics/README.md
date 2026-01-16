# Claude Code Analytics Skill

A Claude Code skill for generating HTML reports of Claude Code usage statistics.

## Problem

Tracking Claude Code activity across projects is manual — no built-in way to see prompts, commits, and project activity over time.

## Solution

- Parse `~/.claude/history.jsonl` for usage data
- Collect git remote URLs and commit counts per project
- Generate terminal-style HTML report with ASCII aesthetics
- Open in browser for easy viewing

## Installation

```bash
cp -r skills/cc-analytics ~/.claude/skills/
```

## Quick Reference

### Triggers

| Phrase | Language |
|--------|----------|
| "аналитика", "статистика claude" | RU |
| "cc stats", "weekly report" | EN |
| "что делал за неделю" | RU |

### Output Metrics

| Metric | Source |
|--------|--------|
| Projects | Unique paths in history.jsonl |
| Prompts | Total entries per project |
| Commits | `git rev-list --count --since` |
| Days | Unique dates with activity |

## Report Contents

- ASCII art header with date range
- Summary stats (projects, prompts, commits, days)
- Project table with remote links
- ASCII bar chart of activity

## Key Features

- Terminal aesthetic (monospace, dark theme, ASCII art)
- Git integration for commit counts and remotes
- Configurable time period (default: 7 days)
- Single HTML file output

## See Also

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
