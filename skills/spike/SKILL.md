---
name: spike
description: Research-driven prompt refinement. Finds high-signal companies, practitioners, papers, repos, and canonical docs for a rough question, lets the user curate sources, then rewrites a stronger prompt anchored on those references. Use when the user invokes /spike, is refining a prompt, choosing architecture, or asks what the best teams do before deciding.
---

# Spike

Turn a rough question into a research-backed prompt. Work interactively; do not skip the curation step.

## Phase 1 — Capture the rough prompt

Ask once if missing:

> What do you want to build, decide, or prompt about? Paste your rough question or goal.

Record the **original prompt** verbatim. Clarify scope only if ambiguous (stack, audience, timeline). Do not research yet.

## Phase 2 — Research

Search for **production-grade, high-signal** sources. Prefer:

| Category | Look for |
| --- | --- |
| Companies / products | Teams that shipped this at scale; official engineering blogs |
| People | Practitioners with credible track records (maintainers, staff+ eng, authors) |
| Papers / write-ups | Canonical specs, RFCs, peer-reviewed or widely cited technical posts |
| Repos | Well-maintained OSS with real adoption (stars alone is not enough) |
| Docs | Official documentation and reference implementations |

**Avoid:** SEO listicles, outdated tutorials, unattributed Medium posts, low-effort “ultimate guide” content.

Use web search and repo search as needed. Aim for **5–10** strong candidates total (not 30).

### Shortlist format

Present as a numbered list. Each item:

```markdown
1. **[Name](url)** — *type: company | person | paper | repo | docs*  
   One line: why this source is worth anchoring on.
```

Rank by relevance and signal. Note recency when it matters.

If evidence is thin, say so and propose narrower sub-questions instead of padding the list.

## Phase 3 — Context selection (required stop)

Present the shortlist, then **wait for the user**. Use this prompt:

> **Curate your spike context**  
> Reply with any of:
> - **Keep:** numbers to keep (e.g. `keep 1, 3, 5`)
> - **Remove:** numbers to drop
> - **Add:** links or names you want included (your own favorites)
> - **Reorder:** priority order (e.g. `order: 3, 1, 7`)
> - Or paste an edited list in your own words  
>
> I will not rewrite the prompt until you confirm selection.

Do **not** generate the improved prompt until the user confirms. If they say “keep all,” that counts as confirmation.

## Phase 4 — Improved prompt

Rewrite the original into a **single, copy-paste-ready prompt** that:

1. Restates the goal clearly.
2. Lists **Selected references** with names and URLs (the curated set).
3. Instructs the model to treat those references as **anchors for best practices** (patterns to emulate, trade-offs those teams documented).
4. States **constraints** (stack, non-goals, compliance, performance, team size) inferred from the conversation or marked as open questions.
5. Defines **desired output format** (e.g. decision matrix, step-by-step plan, ADR, implementation checklist, risks).
6. Asks for **explicit trade-offs** and what to avoid based on the selected sources.

Deliver:

```markdown
## Improved prompt

[The full prompt in a fenced block for easy copy]

## What changed

- Bullet summary vs. the original (2–5 bullets)
```

Templates and a before/after example: [references/prompt-templates.md](references/prompt-templates.md).

## Phase 5 — Persist (offer, do not assume)

After the improved prompt, offer:

> Want to save this for reuse?
> 1. **New skill** — I can draft `SKILL.md` frontmatter + instructions from this spike pattern.
> 2. **References file** — I can write `references/spike-<topic-slug>.md` with sources + improved prompt.
> 3. **Update existing skill** — point me at the skill to extend.

Only write files if the user accepts. For repo-local skills use `.cursor/skills/<name>/` or project convention; for global, `~/.cursor/skills/<name>/`.

When saving references next to a skill:

```markdown
# Spike: <topic>
Date: YYYY-MM-DD
Original: ...
Selected sources: ...
Improved prompt: ...
```

## Rules

- **Interactive:** Phase 3 is mandatory unless the user pre-supplied a curated list.
- **Concise research:** Quality over quantity; 5–10 items max unless the user asks for more.
- **Honest gaps:** If sources conflict or evidence is weak, surface that in the improved prompt as questions to resolve.
- **No fake citations:** Only link URLs you actually found; do not invent papers or repos.

## Quick invoke

User: `/spike Should we use React Server Components for our dashboard?`

→ Phase 1 (confirm) → Phase 2 (research) → Phase 3 (wait) → Phase 4 (improved prompt) → Phase 5 (offer save).
