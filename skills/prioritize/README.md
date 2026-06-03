# Prioritize Skill

![Skill illustration](assets/illustration.png)

Rank a list of requirements using RICE / ICE / MoSCoW / Kano. The skill picks the right framework based on data and decision context. Part of the Personal Corp framework.

## What it does

You have a backlog of 10-50 ideas/tasks/features and limited capacity. You need to decide what to do **this** cycle, what to defer, what to drop entirely.

The skill takes the list, runs it through a chosen (or auto-recommended) framework, and produces three artifacts: a scored table, an Impact × Effort 2×2 quadrant, and a Sprint allocation proposal. Every score has a one-line rationale — argue with the numbers, not with "I feel like it."

## When to use

- **End-of-quarter / cycle planning** — backlog is too big, need to cut from Must Have
- **Team disagrees** — need transparent criteria so the debate is about numbers, not who's louder
- **Too many ideas** — brainstorm produced 30 items, only 2-3 Sprints to spend
- **Before writing PRDs** — pick top-5 worth detailed requirements

Not for: a single task (nothing to prioritize), crisis decisions with no time to score, strategic forks without data.

## Output

1. **Scored table** — each item with numbers per framework dimension (R/I/C/E for RICE, etc.) + total score + one-line rationale
2. **Impact × Effort 2×2** — Quick Wins / Strategic / Fill-ins / Avoid
3. **Sprint allocation** — what fits this cycle, what's next, what's Won't Have
4. **Decision log** — why A beat B, which scores are contested, what to validate

## Installation

```bash
cp -r skills/prioritize ~/.claude/skills/
```

The skill is then available in Claude Code.

## Setup (optional)

The skill works out-of-box — it asks for missing parameters on first run. For stable defaults across runs, add a `## Prioritize Config` section to your project's `CLAUDE.md`:

| Config | Purpose |
|--------|---------|
| Default framework | RICE / ICE / MoSCoW / Kano if you want the same one every time |
| Sprint capacity | Person-days or Story Points per Sprint for the allocation step |
| Backlog source | `gh-issues` / `github-project` / `tasks-file` / `paste` |
| `gh_owner` / `gh_repo` / `gh_label` | GitHub filter params if source is `gh-issues` |
| `tasks_file` | Path to a local markdown backlog |

See `SKILL.md` for the full config template.

## How to invoke

Tell the agent in natural language:

> "Prioritize my backlog. List is in `docs/backlog.md`, capacity is 20 person-days per Sprint, quarter focus is retention."

Or use the slash command: `/prioritize`

Or, if config is set:

> "Rank the open issues labeled `backlog` in my main repo."

What happens:
1. If no backlog source is provided — the skill asks (paste / file / GitHub filter)
2. If no framework is specified — it auto-recommends one with a rationale ("you have Reach in DAU → RICE"). You confirm or override
3. Run through the framework with calibration (e.g. ≤ 50% of items can score Impact = 3 — otherwise everything looks equally important)
4. Three artifacts + decision log

## Key Rules

- Every score has a one-line rationale
- Effort includes design + dev + QA + integration, not just dev
- Confidence < 80% → "validate via small experiment" tag, doesn't block Must
- Must Have cap: ≤ 60% — otherwise there's no prioritization, just a backlog
- The skill doesn't decide for the team — it produces a transparent recommendation

## Related skills

- **`weekly-planning`** — takes the ranked backlog from this skill and picks weekly OKRs / outcomes. Prioritization **feeds** OKR selection, doesn't replace it.
- **`weekly-retro`** — feeds the next backlog with retro findings and carry-over items.

## See also

- [SKILL.md](SKILL.md) — full skill definition with RICE/ICE/MoSCoW/Kano frameworks, score tables, and calibration steps
- [README.ru.md](README.ru.md) — Russian version
