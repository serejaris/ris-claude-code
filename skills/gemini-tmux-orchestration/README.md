# Gemini tmux Orchestration Skill

A Claude Code skill for delegating tasks to Gemini CLI agent via tmux — enabling parallel AI execution with Gemini's 1M+ context window.

## Problem

Gemini CLI in headless mode (`gemini -p "..."`) cannot execute shell commands or write files. This is a design limitation — `--yolo` and `--allowed-tools` don't help in subprocess mode.

## Solution

Use **tmux send-keys** to run Gemini CLI interactively while controlling it programmatically from Claude Code.

## Structure

```
gemini-tmux-orchestration/
└── SKILL.md    # Main skill with commands and workflow
```

## Installation

```bash
cp -r skills/gemini-tmux-orchestration ~/.claude/skills/
```

## Requirements

- **tmux** — `brew install tmux` (macOS) or `apt install tmux` (Linux)
- **Gemini CLI** — `npm install -g @google/gemini-cli`
- Claude Code running inside tmux session

## Quick Start

```bash
# 1. Start Gemini in split pane
tmux split-window -h -d "cd ~/project && gemini --yolo"

# 2. Send task (TWO separate calls!)
tmux send-keys -t {right} 'Build the app per PLAN.md'
tmux send-keys -t {right} Enter

# 3. Check progress
tmux capture-pane -t {right} -p -S -100 | tail -50
```

## Key Features

- **Status markers** — detect Gemini state (idle, working, error)
- **Smart polling** — wait for completion instead of fixed sleep
- **Loop detection handling** — auto-respond to Gemini's loop prompts
- **Custom commands** — use `.gemini/commands/` for reusable tasks

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| `send-keys 'text' Enter` combined | Enter doesn't register — send separately |
| Chaining bash commands | Commands leak into Gemini input — use separate calls |
| Fixed `sleep 60` | Use polling with status markers |

## Use Cases

- Complex coding tasks benefiting from 1M+ context
- Parallel AI execution while Claude continues working
- Tasks requiring Google-specific integrations
- Large codebase analysis and refactoring

## See Also

- [Gemini CLI Documentation](https://geminicli.com/docs/)
- [tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)
