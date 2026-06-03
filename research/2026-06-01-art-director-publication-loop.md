# Art Director Skill Publication Loop

Date: 2026-06-01
Mode: full loop
Source routing: internal
Target repo: `personal-corp-skills`
Target artifact: `skills/art-director/`
Final status: complete-after-recheck

## Intake

Request: publish the `corp-media` `art-director` skill into the public `personal-corp-skills` repository, clean it from private data, and place it in a media-related section.

Quality standard:

- `personal-corp-skills` skill package contract: `SKILL.md`, `README.md`, `README.ru.md`.
- Root README EN/RU sync.
- New skill release uses minor version bump.
- Public artifact must use generic paths, generic examples, and privacy-safe wording.

## Explorer Cycle

| id | role | source lane | verdict | parent action |
|---|---|---|---|---|
| 019e845f-c248-7562-aaac-3bf6063704e7 | target repo placement | internal | use `skills/art-director/`, place under Design and Media Skills | applied |
| 019e845f-e7e8-7371-bcf0-4d224d996d23 | privacy cleanup | internal | remove `corp-media`, platform-specific pipeline, concrete internal paths | applied |
| 019e8460-09bd-79f1-987d-871175b37ca7 | public repo conventions | internal | add required README files, update changelog and plugin metadata | applied |
| 019e8460-2b0f-79e3-a8cd-0818f3afe670 | git boundary | internal | `personal-corp-skills` clean; `corp-media` dirty and left untouched | applied |

## Researcher Cycle

| id | role | verdict | parent action |
|---|---|---|---|
| 019e8463-5f00-7fb3-a016-93e587f54a93 | target user | add first-run path and package docs | applied |
| 019e8463-6da3-7c20-a9f7-e4490bed8461 | domain method | preserve iteration clusters and branch planning | applied |
| 019e8463-ae84-7f80-bd57-1cb769f7ef6f | language | shorten portable frontmatter and align labels | applied |
| 019e8463-bfe9-7071-add0-c8814498cc93 | privacy | scan for internal repo names, paths, and sensitive terms | applied |
| 019e8463-d764-7d52-b010-e4983392b2ef | format/readme | use workflow README shape and Design and Media placement | applied |
| 019e8463-ead8-7923-86c7-74c566be8268 | release process | bump to `1.20.0` and update manifests | applied |

## Synthesis

Rules applied:

- Public skill text must use generic media workspace language.
- First-run users need a bootstrap path.
- Decision graph terminology must be consistent.
- Feedback summaries must be redacted by default.
- Public template must avoid HTML injection from branch data.

## Implementation

Changed files:

- `skills/art-director/SKILL.md`
- `skills/art-director/README.md`
- `skills/art-director/README.ru.md`
- `skills/art-director/assets/style-search-map-template.html`
- `README.md`
- `README.ru.md`
- `CHANGELOG.md`
- `.codex-plugin/plugin.json`
- `research/2026-06-01-art-director-publication-loop.md`

## Critic Cycle

| id | role | score | verdict | parent action |
|---|---:|---:|---|---|
| 019e8467-a882-7213-ac63-f319ca0eb1a9 | target user | 7 | onboarding needed hardening | added first-run and template |
| 019e8467-bd56-7af3-a902-97c4f5136a49 | domain editor | 8 | add template, feedback schema, diversity gate | applied |
| 019e8467-cd80-7172-9bd7-0264fb91045d | language/title/meta | 8 | align terms and RU wording | applied |
| 019e8467-e15f-7e40-ab96-4156f948af79 | privacy | 9.5 | no private leakage found | no change |
| 019e8467-f830-7ed2-a4fc-46a63eb61c2b | format/release | 7 | stage untracked skill and fix README inventory | applied |
| 019e8468-08da-7ec3-b8fc-d69bf5d517e7 | process/git | 8 | commit/tag/push still needed | pending at log time |

## Narrow Recheck

| id | role | score | finding | parent action |
|---|---:|---:|---|---|
| 019e846f-25a5-74c0-aaa4-fdc573a23237 | release recheck | 7 | template used `innerHTML` and missed preview blocks | fixed |
| 019e846f-3a20-7100-86bf-9b5d954df720 | artifact recheck | 7 | confirmed template plausibly runnable; some path notes referenced the source repo | current target files rechecked locally |

## Validation

Commands run:

```bash
python3 -m json.tool .codex-plugin/plugin.json >/dev/null
ruby -e 'require "yaml"; ...'
for d in skills/*; do test -f "$d/SKILL.md"; test -f "$d/README.md"; test -f "$d/README.ru.md"; done
for d in skills/*; do rg -q "\[${name}\]\(\./skills/${name}/\)" README.md README.ru.md; done
find skills/art-director -type f -print0 | xargs -0 rg -n --pcre2 '<privacy scan>'
curl -I -L --max-time 10 https://cdn.jsdelivr.net/npm/@dagrejs/dagre@1.1.8/dist/dagre.min.js
perl -0ne 'while (m{<script>(.*?)</script>}sg) { print $1 }' skills/art-director/assets/style-search-map-template.html | node --check
git diff --check
```

Browser note: Codex in-app browser was unavailable with `no-iab-backends`. Local Chrome headless timed out in the parent run, while the narrow recheck reported Chrome headless rendering success. Static JS and CDN checks passed in the parent run.

## Final Fix Pass

Applied:

- Replaced `innerHTML` with DOM nodes and `textContent`.
- Added legend, current selection, next iteration, and image slot to the starter template.
- Added first-run bootstrap commands.
- Added feedback, parent, terminal status, diversity gate, and DOM validation requirements.
- Added `manager` and `prioritize` to README inventories.

Skipped:

- Historical changelog link drift before `1.20.0`, because it predates this release and does not affect the new skill package.

## Git

Commit, tag, and push are performed after final validation.
