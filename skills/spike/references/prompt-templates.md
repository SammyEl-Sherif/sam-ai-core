# Spike prompt templates

## Improved prompt skeleton

Use this structure in Phase 4:

```markdown
You are helping me [DECISION / BUILD / DESIGN]: [one-sentence goal].

## Context
[1–3 sentences of background from the user's original ask]

## Anchor references (use these as best-practice north stars)
Study and align with patterns documented by:
1. [Name](url) — [what to take from them]
2. ...

Do not treat these as the only valid approach; synthesize trade-offs across them.

## Constraints
- Must: ...
- Must not: ...
- Stack / environment: ...
- Open questions: ...

## Output I need
Format your response as:
1. ...
2. ...

Include: trade-offs, recommended approach, alternatives rejected and why, risks, and a minimal next-step checklist.

## Original question (for traceability)
"[paste original rough prompt]"
```

## Example shortlist (research phase)

```markdown
1. **[Vercel — React Server Components](https://nextjs.org/docs/app/building-your-application/rendering/server-components)** — *docs*  
   Canonical framework guidance for RSC boundaries and data fetching.

2. **[Shopify Engineering — Hydrogen / RSC adoption](https://shopify.engineering/)** — *company*  
   Large commerce workload perspective (search for their RSC posts if linked).

3. **[React RFC — Server Components](https://github.com/reactjs/rfcs)** — *paper/spec*  
   Original design intent and constraints.

4. **[next.js repo — `examples/`](https://github.com/vercel/next.js/tree/canary/examples)** — *repo*  
   Reference implementations maintained by the framework team.

5. **[Dan Abramov — related essays](https://overreacted.io/)** — *person*  
   Mental models for React rendering and migration paths.
```

(Replace URLs with ones verified during an actual spike; this is illustrative structure only.)

## Example improved prompt (excerpt)

```markdown
You are helping me decide whether to adopt React Server Components (RSC) for our customer analytics dashboard (Next.js App Router, team of 4, strict TTFB SLA).

## Anchor references
- Next.js Server Components docs — default server/client split and caching semantics
- [selected company blog] — how they structured dashboards with RSC
- [selected repo] — production-style folder and data-loading patterns

Use these as anchors; call out where our constraints differ.

## Constraints
- Must: keep client interactivity for chart brushing; SEO on public report pages
- Must not: increase bundle size for authenticated app shell
- Open: partial prerender vs. full RSC tree

## Output
ADR-style: recommendation, trade-off table (RSC vs. client-heavy), migration phases, and test plan.
```

## Saved reference file template

`references/spike-<slug>.md`:

```markdown
# Spike: <title>
Date: YYYY-MM-DD

## Original prompt
...

## Selected sources
1. ...

## Improved prompt
...
```
