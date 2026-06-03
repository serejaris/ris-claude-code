# Manager Skill

![Skill illustration](assets/illustration.png)

Bidirectional bridge between the current session and GitHub Issues. Part of the Personal Corp framework.

## What it does

One skill, two modes:

- **Write mode (sync)** — at end of session: reads what was done, finds matching issues, updates bodies / adds labels, creates new ones only when nothing matches.
- **Read mode (query)** — anytime: «what about track X?», «is there an issue for Y?» → cross-repo search, condensed table of matches with labels, status, last activity.

GitHub Issues become your single source of truth for tasks. The skill enforces three invariants per issue: parent epic (via Sub-issues API), W-label (if enabled), and a predictable title formula.

## Why you'd want it

Without this bridge:
- End of session — you forget to record progress → tasks slip through.
- Start of session — you don't know what's open for a track → manual digging in the issue list.
- You create duplicates because you don't remember what already exists.
- Orphan issues without parent epic — a month later you can't tell what belongs to which track.

The skill closes all four gaps: pre-flight read of your priorities index, cross-repo search, parent-epic verification, human-readable plan + report.

## When to use

**Write mode** — at the end of a working session:
- Say "sync session" / `/manager` / "update issues for what I did"
- Skill infers artifacts from session context, shows the plan, executes.

**Read mode** — at the start or middle of a session:
- "What about track X?"
- "Status of Y?"
- "Is there an issue for Z?"

## What you get

**Write mode:** compact plan before execution + report after. Each line — what was updated, where, with which parent epic, which labels. If a track has no epic — the skill flags it in the plan, never silently creates an orphan.

**Read mode:** table of open issues for the track, with human-readable titles (no bare numbers), parent epic, W-label, last activity, status. Plus separate sections:
- Not covered (gaps) — what's mentioned in the index but has no issue yet
- Track health check — any issues missing parent, any without W-label
- Drift in index / epic state — where the index references CLOSED issues, where an epic is "stale-open" (100% sub-issues done but state=open)
- False positives — what was filtered and why

## Installation

```bash
cp -r skills/manager ~/.claude/skills/
```

The skill is then available in Claude Code.

## Setup

Add a `## Manager Config` section to your project's `CLAUDE.md`. Minimal config:

| Config | Purpose |
|--------|---------|
| GitHub owner | Your username or org for cross-repo issue search |
| Repos to scan | List of repos to search for issues |
| Tasks index file (optional) | Path to your current-week priorities file (e.g. `tasks.md`) — read FIRST before any `gh search` |
| Domain → repo routing | Map task domains to repos (which type of issue lands where) |
| Issue title domains | Closed list used in the title formula (`product`, `partner`, `crm`, ...) |
| W-label convention (optional) | Whether to use weekly labels (`W18`, `W19`...) |
| Standing write authorization | `ask-each-time` (default) or `execute-after-plan` |
| CRM integration (optional) | Path to your CRM and pointer format used in issue bodies |

Full config template — in `SKILL.md`, `## Setup` section.

Without config the skill still works, but less targeted: it'll ask for owner / repos on first run.

## How to invoke

**Write mode (after a session):**

> "sync session"

or

> `/manager`

or

> "update issues for what I did today, and create new ones where needed"

The skill:
1. Silent pre-flight — reads priorities index, checks `git status` of relevant repos
2. Shows a compact plan (5-15 lines): what to update / create / attach to which epic
3. Per configured authorization — executes or asks for confirmation
4. Returns a short report — Done / Skipped

**Read mode (status query):**

> "what about track X?"

or

> "any issues for Y?"

or

> "status of track Z"

The skill:
1. Cross-repo search with multiple keys (track name, handle, slug)
2. Filters false positives, surfaces them in a separate section
3. Resolves the track's parent epic, checks sub_issues progress
4. Cross-references your priorities index
5. Returns the table + health check + drift signals

## Iron rules

The skill enforces three invariants for every issue it touches:

1. **W-label** (if convention enabled in config) — current or future week. Label missing in the repo? It creates it.
2. **Parent epic** — exactly one parent via GitHub Sub-issues API. If no epic exists for the track — surfaces this in the plan, never creates an orphan.
3. **Track differentiation via title + epic membership** — no track-labels (`<track-slug>`, `<client>-deal`). The track is recognized by title text and which epic the issue belongs to.

## See also

- [SKILL.md](SKILL.md) — full specification: write/read mode algorithms, parent epic rules, W-label rules, title convention, output templates
- [README.ru.md](README.ru.md) — Russian version
- `weekly-planning` — where the priorities index comes from after retro
- `weekly-retro` — `retro:W*` labels that manager respects
