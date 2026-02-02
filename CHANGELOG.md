# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.9.0] - 2026-02-02

### Changed
- **statusline** rewritten with OAuth API rate limits
  - Shows 5-hour and weekly usage percentage (remaining)
  - Countdown timer to 5-hour limit reset
  - Cached API calls (2 min TTL)
  - Removed ccusage/bun dependency
  - Renamed from `token-counter.sh` to `statusline.sh`

## [1.8.0] - 2026-01-16

### Added
- **cc-analytics** skill for Claude Code usage statistics
  - Parse `~/.claude/history.jsonl` for prompts and projects
  - Git integration for commit counts and remote URLs
  - Terminal-style HTML report with ASCII aesthetics

## [1.7.0] - 2026-01-11

### Added
- **gh-issues** skill for GitHub Issues management via CLI
  - Full `gh issue` command reference with JSON/jq patterns
  - AI session context storage in issue comments
  - Task workflow with labels (backlog → in-progress → done)
  - Context template for seamless handoff
- **opencode-config** skill for OpenCode CLI configuration
  - Config locations and priorities
  - Custom provider setup with OpenAI-compatible APIs
  - Mode-specific model configuration
- **readme-generator** skill for human-focused README creation
  - Research-first approach with best practices
  - Project type-specific sections
  - Writing style guidelines

## [1.6.0] - 2026-01-02

### Added
- **project-release** skill for consistent release workflow
  - Pre-release validation checklist
  - Version determination rules (MINOR/PATCH)
  - Files decision matrix
  - Step-by-step release workflow
  - Post-release verification

## [1.5.1] - 2026-01-01

### Changed
- **claude-md-writer** skill updated with 2026 best practices:
  - 3-Tier Documentation System
  - Updated size limits (CLAUDE.md < 200, rules < 500)
  - Glob patterns for conditional rules
  - Memory hierarchy table
- Added README.md and README.ru.md for claude-md-writer skill

### Added
- Skill Structure requirements in CLAUDE.md
- Versioning rules in CLAUDE.md

## [1.5.0] - 2025-12-27

### Added
- **claude-md-writer** skill for creating CLAUDE.md files following Anthropic best practices
- **macos-fixer** skill for macOS diagnostics and memory optimization

## [1.4.0] - 2025-12-17

### Added
- **git-workflow-manager** skill for consistent commits, versioning, and releases
- `CHANGELOG.md` with full version history
- `CONTRIBUTING.md` with conventions and guidelines
- `.github/release.yml` for auto-generated release notes
- `.github/PULL_REQUEST_TEMPLATE.md` for PR consistency

## [1.3.0] - 2025-12-17

### Added
- **gemini-tmux-orchestration** skill for delegating tasks to Gemini CLI agent via tmux
  - Status markers for detecting Gemini state
  - Smart polling instead of fixed sleep
  - Loop detection handling
  - Custom commands support

## [1.2.1] - 2025-12-16

### Changed
- Refactored api-digest skill into multiple files (progressive disclosure)
  - `SKILL.md` — instructions with file references
  - `fetch.sh` — isolated credentials script
  - `output-template.md` — customizable output format

## [1.2.0] - 2025-12-16

### Added
- **api-digest** skill template for fetching raw API data and generating digests
  - Support for any REST API with configurable auth
  - Customizable output template
  - Zero backend LLM costs

## [1.1.0] - 2025-12-16

### Changed
- Improved context usage calculation in statusline
  - Now uses `current_usage` object for accurate tracking
  - Includes cache_creation and cache_read tokens

## [1.0.0] - 2025-12-15

### Added
- Initial release
- Custom statusline with cost tracking, context usage, git branch
- Basic repository structure

[Unreleased]: https://github.com/serejaris/ris-claude-code/compare/v1.9.0...HEAD
[1.9.0]: https://github.com/serejaris/ris-claude-code/compare/v1.8.0...v1.9.0
[1.8.0]: https://github.com/serejaris/ris-claude-code/compare/v1.7.0...v1.8.0
[1.7.0]: https://github.com/serejaris/ris-claude-code/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/serejaris/ris-claude-code/compare/v1.5.1...v1.6.0
[1.5.1]: https://github.com/serejaris/ris-claude-code/compare/v1.5.0...v1.5.1
[1.5.0]: https://github.com/serejaris/ris-claude-code/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/serejaris/ris-claude-code/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/serejaris/ris-claude-code/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/serejaris/ris-claude-code/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/serejaris/ris-claude-code/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/serejaris/ris-claude-code/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/serejaris/ris-claude-code/releases/tag/v1.0.0
