---
name: opencode-config
description: Use when configuring OpenCode CLI - changing default model, adding providers, setting baseURL, or troubleshooting model selection issues
---

# OpenCode Configuration

## Overview

OpenCode config is managed via `opencode.json`. Configs merge by priority: project > global > remote.

## Config Locations

| Location | Path | Priority |
|----------|------|----------|
| Project | `./opencode.json` | Highest |
| Global | `~/.config/opencode/opencode.json` | Medium |
| Auth | `~/.local/share/opencode/auth.json` | Credentials only |

## Quick Reference

```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "provider/model-name",
  "small_model": "provider/small-model",
  "provider": {
    "provider-id": {
      "options": {
        "baseURL": "https://api.example.com/v1"
      }
    }
  }
}
```

## Adding Custom Provider

For OpenAI-compatible APIs:

```json
{
  "provider": {
    "my-provider": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Display Name",
      "options": {
        "baseURL": "https://api.example.com/v1"
      },
      "models": {
        "model-id": {
          "name": "Model Display Name"
        }
      }
    }
  }
}
```

## Example: Z.AI Coding Plan

Different Z.AI products use different baseURLs:

| Provider | baseURL | Use Case |
|----------|---------|----------|
| `zai` | `https://api.z.ai/api/paas/v4` | Regular Z.AI API |
| `zai-coding-plan` | `https://api.z.ai/api/coding/paas/v4` | GLM Coding Plan subscription |

**Config for Coding Plan:**

```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "zai-coding-plan/glm-4.7",
  "small_model": "zai-coding-plan/glm-4-flash",
  "provider": {
    "zai-coding-plan": {
      "options": {
        "baseURL": "https://api.z.ai/api/coding/paas/v4"
      }
    }
  }
}
```

## Modes Configuration

```json
{
  "mode": {
    "build": {
      "model": "anthropic/claude-sonnet-4-5",
      "tools": { "write": true, "edit": true, "bash": true }
    },
    "plan": {
      "model": "anthropic/claude-haiku-4-5",
      "tools": { "write": false, "edit": false, "bash": false }
    }
  }
}
```

## CLI Commands

| Command | Description |
|---------|-------------|
| `/connect` | Add provider credentials |
| `/models` | Select model |
| `opencode auth login` | Add credentials via CLI |
| `opencode auth list` | List configured providers |

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Wrong provider for subscription | Check if your subscription uses different baseURL |
| Missing baseURL for custom provider | Add `options.baseURL` in provider config |
| Model not appearing in `/models` | Check auth.json has credentials for provider |
| Wrong model after config change | Restart OpenCode to reload config |

## Troubleshooting

1. **Check auth:** `cat ~/.local/share/opencode/auth.json`
2. **Check config:** `cat ~/.config/opencode/opencode.json`
3. **Verify model format:** `provider-id/model-name`
4. **Test provider:** Run `/models` and check if provider appears
