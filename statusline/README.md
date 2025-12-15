# Token Counter Statusline

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)

Custom statusline for Claude Code showing session costs, context usage, and git branch.

## Preview

```
project (main) • Opus 4.5 • $0.42 • $3.15 / $127.50 • 23%
```

- **project** — Current directory name
- **(main)** — Git branch (if in repo)
- **Opus 4.5** — Current model
- **$0.42** — Session cost (green)
- **$3.15** — Today's cost
- **$127.50** — Total cost (dimmed)
- **23%** — Context window usage (green/yellow/red based on %)

## Requirements

- `jq` — JSON processing
- `bc` — Calculations
- `bun` — For running ccusage
- [`ccusage`](https://github.com/ryoppippi/ccusage) — Claude Code usage tracker

### Install dependencies

```bash
# macOS
brew install jq bc

# bun (if not installed)
curl -fsSL https://bun.sh/install | bash

# ccusage runs via bunx, no install needed
```

## Installation

1. Copy script to Claude config:

```bash
cp token-counter.sh ~/.claude/
chmod +x ~/.claude/token-counter.sh
```

2. Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "bash ~/.claude/token-counter.sh"
  }
}
```

3. Restart Claude Code.

## Color Coding

**Context usage:**
- Green: < 30%
- Yellow: 30-60%
- Red: > 60%

**Costs:**
- Session cost is green
- Total is dimmed for less visual noise

## How It Works

The script receives JSON from Claude Code via stdin containing:
- Workspace info (current directory)
- Model name
- Context window stats (input/output tokens, window size)
- Session cost and duration

It combines this with `ccusage` data for today/total costs and formats everything with ANSI colors.
