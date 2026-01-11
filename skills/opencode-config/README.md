# OpenCode Configuration Skill

A Claude Code skill for configuring OpenCode CLI — adding providers, changing models, setting custom baseURLs.

## Problem

OpenCode CLI configuration is scattered across multiple files with different priorities. Custom providers (especially with subscription-specific baseURLs) require specific setup that's easy to get wrong.

## Solution

- Clear config file locations and priorities
- Custom provider setup with OpenAI-compatible APIs
- Mode-specific model configuration
- Troubleshooting guide for common issues

## Installation

```bash
cp -r skills/opencode-config ~/.claude/skills/
```

## Quick Reference

### Config Locations

| Location | Path | Priority |
|----------|------|----------|
| Project | `./opencode.json` | Highest |
| Global | `~/.config/opencode/opencode.json` | Medium |
| Auth | `~/.local/share/opencode/auth.json` | Credentials |

### Basic Config

```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "provider/model-name",
  "provider": {
    "my-provider": {
      "options": {
        "baseURL": "https://api.example.com/v1"
      }
    }
  }
}
```

### CLI Commands

| Command | Description |
|---------|-------------|
| `/connect` | Add provider credentials |
| `/models` | Select model |
| `opencode auth list` | List providers |

## Key Features

- Config priority explanation
- Custom provider setup
- Mode-specific models (build/plan)
- Troubleshooting checklist

## See Also

- [OpenCode Documentation](https://opencode.ai/docs)
