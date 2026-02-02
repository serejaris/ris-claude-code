# Statusline

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)

Custom statusline for Claude Code showing OAuth rate limits, session cost, and context usage.

## Preview

```
project (main) • Opus 4.5 • 2h15m 67% W85% • $0.42 • 23%
```

- **project** — Current directory name
- **(main)** — Git branch (if in repo)
- **Opus 4.5** — Current model
- **2h15m 67%** — Time until 5-hour limit reset + remaining % (color-coded)
- **W85%** — Weekly limit remaining %
- **$0.42** — Session cost (green)
- **23%** — Context window usage (green/yellow/red based on %)

## Requirements

- `jq` — JSON processing
- `curl` — API requests
- `python3` — Time calculations
- macOS Keychain — For OAuth token access

### Install dependencies

```bash
# macOS
brew install jq
# python3 and curl are pre-installed on macOS
```

## Installation

1. Copy script to Claude config:

```bash
cp statusline.sh ~/.claude/
chmod +x ~/.claude/statusline.sh
```

2. Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "bash ~/.claude/statusline.sh"
  }
}
```

3. Restart Claude Code.

## Color Coding

**Usage limits (remaining %):**
- White: > 50%
- Yellow: 20-50%
- Red: < 20%

**Context usage:**
- Green: < 50%
- Yellow: 50-80%
- Red: > 80%

## How It Works

The script:
1. Receives JSON from Claude Code via stdin (workspace, model, context, cost)
2. Fetches OAuth rate limits from Anthropic API (cached for 2 minutes)
3. Calculates remaining % for 5-hour and weekly limits
4. Shows countdown timer to 5-hour limit reset
5. Formats everything with ANSI colors

OAuth token is retrieved from macOS Keychain (`Claude Code-credentials`).
