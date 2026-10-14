---
name: capture
description: Record a decision or piece of context into the project knowledge base from any repo. Routes it to the right doc under .ai-core/kb/. Use when something important happens mid-work and should be captured durably.
---

# Capture

One durable note in the project's knowledge base, even when invoked from a target application repo.

## Routing

| What happened | Where it goes |
| --- | --- |
| A decision was made | `decisions.md`, as the next `D-NNN` (append-only; supersede with a new entry, never rewrite) |
| Design or system insight | `architecture.md` |
| Scope change | `overview.md` |
| Event, blocker, or milestone | `sessions.md` |

Ask which project slug or doc only when it cannot be inferred from the conversation or path (`.ai-core/kb/<slug>/`).

## Steps

1. Read the current doc from `.ai-core/kb/<slug>/<doc>.md`.
2. Append the entry in the doc's existing format (`D-NNN` for decisions).
3. Save the file. If the team uses git for KB snapshots, commit with a clear message; otherwise keep edits local per team policy.

## Done when

The note is in the correct doc and you briefly confirm what was recorded.
