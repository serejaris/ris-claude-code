---
name: gemini-tmux-orchestration
description: Use when delegating coding tasks to Gemini CLI agent, when you need parallel AI execution, or when tasks benefit from Gemini's 1M+ context window - orchestrates Gemini via tmux since headless mode cannot write files
---

# Gemini CLI Orchestration via tmux

## Overview

Gemini CLI in headless mode (`-p`) cannot execute shell commands or write files. Use **tmux send-keys** to control Gemini interactively while monitoring via **capture-pane**.

## Quick Reference

| Action | Command |
|--------|---------|
| Start (split pane) | `tmux split-window -h -d "cd PROJECT && gemini --yolo"` |
| Start (session) | `tmux new-session -d -s gemini -x 200 -y 50` |
| Send text | `tmux send-keys -t {right} 'task text'` |
| Send Enter | `tmux send-keys -t {right} Enter` |
| Check output | `tmux capture-pane -t {right} -p -S -100` |
| Clear input | `tmux send-keys -t {right} Escape Escape` |
| Kill pane | `tmux kill-pane -t {right}` |
| Kill session | `tmux kill-session -t gemini` |

Target: `{right}` for split pane, `gemini` for named session.

## Status Markers

Detect Gemini state by grepping capture-pane output:

| Marker | State |
|--------|-------|
| `Type your message` | Idle, ready for input |
| `esc to cancel` | Working on task |
| `✓ built` / `✓ Shell` | Action completed |
| `Found \d+ errors` | Build failed |
| `error TS` | TypeScript error |
| `potential loop` | Needs intervention (send `2` + Enter) |
| `Waiting for auth` | OAuth expired |

## Workflow

```bash
# 1. Start Gemini
tmux split-window -h -d "cd ~/project && gemini --yolo"
sleep 5

# 2. Send task (TWO separate calls - critical!)
tmux send-keys -t {right} 'Build the app per PLAN.md'
tmux send-keys -t {right} Enter

# 3. Poll for completion
while true; do
  output=$(tmux capture-pane -t {right} -p -S -50)

  # Check if idle (task done)
  if echo "$output" | grep -q "Type your message"; then
    break
  fi

  # Handle loop detection
  if echo "$output" | grep -q "potential loop"; then
    tmux send-keys -t {right} '2'
    tmux send-keys -t {right} Enter
  fi

  sleep 10
done

# 4. Check result
tmux capture-pane -t {right} -p -S -200 | tail -100
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| `send-keys 'text' Enter` in one call | Enter не регистрируется — отправлять отдельно |
| Chaining: `send-keys && sleep && capture` | Команды утекают в ввод Gemini — separate bash calls |
| Fixed `sleep 60` | Используй polling с маркерами |
| Ignoring loop detection | Gemini зависает — детектить и отправлять `2` |
| Long prompts | Создай `.gemini/commands/task.toml` |

## Custom Commands

Для повторяющихся задач создай `.gemini/commands/`:

```toml
# .gemini/commands/improve-design.toml
[command]
description = "Improve app design"

[[steps]]
prompt = "Improve design: gradients, shadows, animations. Run build when done."
```

Вызов: `tmux send-keys -t {right} '/improve-design'` + Enter

## When NOT to Use

- Read-only analysis → `gemini -p "analyze" --output-format json`
- Simple questions → direct API call
- Need deterministic output → headless with JSON schema
