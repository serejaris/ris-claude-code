# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Public repository hygiene: `SECURITY.md`, `CODE_OF_CONDUCT.md`, issue
  templates, Dependabot config, validation workflow, and
  `scripts/validate_repo.py`.
- Skill README illustrations for every published skill, using deliberately clumsy MS Paint-style generated assets.

### Changed
- Moved `paperclip-api` from active skills to `archive/skills/paperclip-api`.
- Renamed public skill identifiers `ris-manager` → `manager` and
  `ris-prioritize` → `prioritize`, including folders, frontmatter, slash
  triggers, install paths, and README tables.
- Moved Claude Code, Codex, and single-skill installation guidance to the top
  of both READMEs.
- Added a Codex marketplace manifest at `.agents/plugins/marketplace.json`.
- Added `plugins/personal-corp-skills` as a repository-root symlink so Codex
  marketplace discovery can install the root plugin through the expected
  `./plugins/<plugin-name>` path.
- Added current `.codex-plugin/plugin.json` metadata while keeping
  `.claude-plugin` metadata for Claude Code compatibility.
- Renamed **ris-draft** to **html-draft** across skill folder, docs, and invocation examples.

## [1.20.0] - 2026-06-01

### Added
- **art-director** skill - iterative visual style search for media assets
  - Coordinates branch prompts, process logs, generated or collected assets, HTML previews, and decision graphs
  - Adds iteration-cluster rules for selected, rejected, shown, and output nodes
  - Includes privacy gates for private chats, screenshots, auth material, billing records, customer records, infrastructure details, non-public repository links, and unsafe source material
  - Includes bilingual docs (README.md + README.ru.md), public-safe snippets, and a starter HTML template

## [1.19.0] - 2026-06-01

### Added
- **corp-new** skill — create or verify a private `corp-*` department repository and register it in an HQ Markdown file
  - Resolves configurable GitHub owner, workspace root, HQ file, repo prefix, and department identity
  - Adds preflight, dry-run summary, safe sync, and HQ row verification gates
  - Preserves existing folders and dirty worktrees; avoids force pushes, resets, deletions, and archive edits
  - Includes bilingual docs (README.md + README.ru.md) and public-safe placeholders

## [1.18.0] - 2026-06-01

### Added
- **tg-bot-ops** skill — public Telegram bot and Telegram-to-agent gateway operations playbook
  - Diagnoses webhook vs polling setup, update delivery, privacy mode, and forum topic routing
  - Includes a reusable Hermes-compatible gateway checklist with all infrastructure details placeholdered
  - Adds safety gates for bot tokens, `.env`, raw logs, private DMs, and production restarts
  - Includes bilingual docs (README.md + README.ru.md) and public-safe incident reporting format

## [1.17.0] - 2026-06-01

### Added
- **design-minimal** skill — create one standalone minimal HTML page for dashboards, briefs, handouts, maps, and internal reports
  - Tailwind CDN only, system fonts, fixed desktop-oriented layout
  - No custom component CSS, responsive variants, gradients, shadows, rounded corners, icons, or external fonts
  - Includes an explicit language rule: visible UI follows the user's language, technical identifiers stay copyable
  - Bilingual docs (README.md + README.ru.md)

## [1.16.0] - 2026-05-22

### Added
- **meeting-copilot** skill — live meeting dashboard for prepare/update/close workflows
  - Creates local HTML dashboards for calls
  - Uses transcript delta processing for live updates
  - Extracts questions, topic progress, decisions, risks, action items, and follow-up drafts
  - Includes privacy rules for sanitized public exports
- **ris-draft** skill — generate one self-contained HTML page with a technical diagram in flat engineering blueprint style
  - Strict visual rules: flat, outlined, monochrome, system fonts, Tailwind v4 browser CDN, and D3 v7 CDN
  - Supports four diagram types: architecture, system flow, technical spec sheet, component map
  - Complete HTML document ready to open in a browser
  - Bilingual docs (README.md + README.ru.md, Russian default)

## [1.15.1] - 2026-03-29

### Fixed
- CHANGELOG compare links for v1.12–v1.15 and Unreleased pointer
- README.ru.md synced with English structure (tables, removed Coming Soon sections)
- Added missing paperclip-api/README.ru.md

### Removed
- Empty placeholder directories: hooks/, prompts/, workflows/

### Added
- "Never" safety section in CLAUDE.md

## [1.15.0] - 2026-03-29

### Added
- **product-data-audit** skill — deep product/business audit with interactive HTML visualization
  - 12-section report: ecosystem diagram, decision map, data systems, bottlenecks, implementation contours
  - 18-artifact checklist (OKR, CLAUDE.md, metric definitions, decision log, escalation rules)
  - Structured facts: claim + metric pills + source reference
  - 35+ English-to-Russian terminology mappings
  - Swiss Precision HTML theme (Cormorant Garamond + IBM Plex Mono)
  - Tested with 6 subagents, 2 REFACTOR rounds

### Changed
- README restructured: skills as tables, removed Coming Soon sections, simplified installation

## [1.14.0] - 2026-03-27

### Added
- **paperclip-api** skill — manage Paperclip AI agent companies via CLI and REST API
  - Full CLI reference: issues, agents, approvals, companies, context profiles
  - REST API endpoints with curl examples for all operations
  - Agent instruction files: direct markdown editing in `~/.paperclip/`
  - Recipes: create & assign tasks, switch agent language, bulk-approve hires
  - Links to official docs (docs.paperclip.ing)

## [1.13.0] - 2026-03-26

### Added
- **task-routing** skill — route issues to the correct repo via CLAUDE.md routing config
  - Reads routing patterns created by `project-init`
  - Matches task keywords to target repo
  - Checks duplicates across repos and unified project
  - Respects W-label lifecycle (never creates, only uses existing)
  - Part of Personal Corp framework: project-init → task-routing → weekly-planning/retro

### Removed
- **macos-fixer** — low value, not reusable
- **api-digest** — incomplete, references non-existent files
- **git-workflow-manager** — duplicates global CLAUDE.md rules
- **project-release** — hardcoded to this repo, release rules moved to global config
- **agent-teams** — superseded by built-in Claude Code agent capabilities
- **opencode-config** — too niche (OpenCode CLI only)
- **gemini-tmux-orchestration** — too niche, mixed language

## [1.12.0] - 2026-03-25

### Added
- **Personal Corp Framework** — a system for running a business as one person with AI agents
  - **project-init** skill — guided interview → GitHub Project + labels + CLAUDE.md config
  - **weekly-planning** skill — retro findings + backlog → prioritized outcomes with Eisenhower matrix
  - **weekly-retro** skill — structured retrospective: data gathering, founder interview, issue creation

## [1.11.0] - 2026-02-23

### Added
- **ceo-council** skill for independent strategic analysis
  - Parallel Opus sub-agents as C-level experts (CFO, CPO, CTO, etc.)
  - Auto-generates roles tailored to project domain
  - Isolation-based analysis: each expert works independently
  - Synthesis with consensus, disagreements, and decisions

## [1.10.0] - 2026-02-05

### Added
- **agent-teams** skill for orchestrating multiple autonomous agents
  - Shared task lists and direct inter-agent messaging
  - Teams vs subagents decision flowchart
  - Full lifecycle: spawn, assign, monitor, shutdown
  - Best practices for task sizing, file ownership, spawn prompts

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

[Unreleased]: https://github.com/serejaris/personal-corp-skills/compare/v1.20.0...HEAD
[1.20.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.19.0...v1.20.0
[1.19.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.18.0...v1.19.0
[1.18.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.17.0...v1.18.0
[1.17.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.15.1...v1.17.0
[1.16.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.15.1...485a46c
[1.15.1]: https://github.com/serejaris/personal-corp-skills/compare/v1.15.0...v1.15.1
[1.15.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.14.0...v1.15.0
[1.14.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.13.0...v1.14.0
[1.13.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.12.0...v1.13.0
[1.12.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.11.0...v1.12.0
[1.11.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.10.0...v1.11.0
[1.10.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.9.0...v1.10.0
[1.9.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.8.0...v1.9.0
[1.8.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.7.0...v1.8.0
[1.7.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.5.1...v1.6.0
[1.5.1]: https://github.com/serejaris/personal-corp-skills/compare/v1.5.0...v1.5.1
[1.5.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/serejaris/personal-corp-skills/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/serejaris/personal-corp-skills/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/serejaris/personal-corp-skills/releases/tag/v1.0.0
