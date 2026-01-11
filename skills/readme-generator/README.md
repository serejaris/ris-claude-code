# README Generator Skill

A Claude Code skill for creating human-focused README files with proper structure and current best practices.

## Problem

READMEs often become either too sparse (missing crucial info) or too bloated (API dumps, walls of text). They're written for the author, not the reader.

## Solution

- Research-first approach (check current best practices)
- Project type-specific sections
- Human-focused writing style
- Clear structure templates

## Installation

```bash
cp -r skills/readme-generator ~/.claude/skills/
```

## Quick Reference

### Process

1. **Research** — Search for current README best practices
2. **Analyze** — Read project files (package.json, CLAUDE.md, etc.)
3. **Identify** — Determine project type (CLI, library, web app, etc.)
4. **Write** — Use appropriate sections for project type

### Essential Sections

| Section | Purpose |
|---------|---------|
| Title + Value Prop | What is this and why should I care |
| Features | What it does (value, not implementation) |
| Quick Start | Get running in < 5 commands |
| Requirements | Runtime, system requirements |
| Usage | Common use cases with examples |

### Project Types

| Type | Key Sections |
|------|--------------|
| CLI Tool | Options table, Installation, Examples |
| Library | API overview, Quick start, Examples |
| Web App | Features, Architecture, Tech stack |
| Full-stack | Both frontend and backend setup |

## Key Features

- Research-first approach
- Project type detection
- Section recommendations
- Writing style guidelines
- Common mistakes checklist

## See Also

- [Make a README](https://www.makeareadme.com/)
- [Awesome README](https://github.com/matiassingers/awesome-readme)
