# Design Minimal Skill

Creates a single standalone HTML page in a restrained minimal style: reading-first layout, strong spacing, thin borders, limited colors, and no decorative effects.

## What it does

Use it when you need a polished but quiet page for a dashboard, brief, handout, report, operating map, checklist, or internal view.

The output is one `.html` file using Tailwind CDN and system fonts. It avoids custom component CSS, JavaScript frameworks, icons, gradients, shadows, rounded corners, and responsive variants.

## When to use

- Agent dashboards
- Teacher or workshop handouts
- Internal briefs
- Process maps
- Dense operational screens
- Reading-first reports

Not for:

- Marketing landing pages
- Rich interactive apps
- Mobile-first pages
- Illustrated hero sections
- SVG-heavy diagrams

## Design contract

- One HTML file
- Tailwind CDN only
- CSS variables in `:root` only
- Tailwind classes directly on elements
- Fixed desktop-oriented layout
- No `sm:`, `md:`, `lg:`, `xl:`, `2xl:` classes
- No media queries
- No external fonts
- No icon libraries
- No shadows, gradients, rounded corners, or accent-heavy palettes

## Language rule

The visible interface should match the user's language. For Russian pages, headings, labels, status explanations, and footer copy should be in Russian. English stays only where it is technical and copyable: file paths, commands, code identifiers, schema fields, API names, model names, and literal values.

## Installation

```bash
cp -r skills/design-minimal ~/.claude/skills/
```

The skill is then available in Claude Code.

## How to invoke

Tell the agent:

> "Use design-minimal and make a standalone HTML dashboard for this workflow."

Or:

> "Make a minimal HTML handout for this lesson."

The agent will create one HTML file following the strict visual contract.

## See also

- [SKILL.md](SKILL.md) — full skill specification
- [README.ru.md](README.ru.md) — Russian version
