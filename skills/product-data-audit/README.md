# Product & Data Audit

Deep product/business audit with interactive HTML visualization.

## What it does

Reads all available project files (architecture, data, strategy, configs, issues), analyzes them through 12 structured sections, and generates an interactive HTML report you can open in a browser.

## 12 Sections

| # | Section | Purpose |
|---|---------|---------|
| 0 | Ecosystem diagram | SVG map of the business in 4 layers |
| 1 | Summary | 4-6 tagged findings with the main conclusion |
| 2 | What the company actually does | Revenue engine vs ambition gap |
| 3 | Decision map | What decisions are made, on what data, where to automate |
| 4 | Data & systems inventory | What exists, quality, limitations |
| 5 | Hidden maturity | Internal tools that are more sophisticated than they seem |
| 6 | Bottlenecks | Where money, time, or data is lost (with numbers) |
| 7 | Implementation contours | What to automate vs keep human + 18-artifact checklist |
| 8 | Priorities | Now / Next / Later + "If you had 1 hour" plan |
| 9 | Unknowns | Blind spots that matter more than facts |
| 10 | Questions | 15-18 actionable questions for the next conversation |
| 11 | Sources | Every claim traced to its source with confidence level |

## Key features

- **Structured facts**: claim + metric pills + source reference (no wall-of-text)
- **18-artifact checklist**: OKR, CLAUDE.md, metric definitions, decision log, escalation rules...
- **35+ terminology mappings**: English to Russian with rules for when anglicisms are acceptable
- **Swiss Precision HTML theme**: Cormorant Garamond + IBM Plex Mono + Instrument Sans

## Installation

Tell your agent:

> Install this skill: `https://github.com/serejaris/ris-claude-code/tree/main/skills/product-data-audit`

Or copy `SKILL.md` + `references/` to `~/.claude/skills/product-data-audit/`.

## Usage

Say "product audit" or "аудит продукта" to trigger. The agent will read your project files and generate an HTML report.
