---
name: ingest-context
description: Ingest context for a project from pasted links, files, or braindumps. Distill it into the durable knowledge base under .ai-core/kb/. Use when the user shares background material to store for a project.
---

# Ingest Context

Turn raw sources into durable knowledge-base content. Distill; never dump verbatim unless the user asks to preserve a source artifact.

## Steps

1. Resolve the project slug from the conversation or ask. Read `.ai-core/kb/<slug>/overview.md` first.
2. Fetch each source: URLs via fetch tools, files via Read, braindumps from the message.
3. Distill into the right docs:
   - Problem, scope, features → `overview.md`
   - Design and system material → `architecture.md`
   - Decisions already made → `decisions.md` as `D-NNN` entries
4. Refresh Mermaid diagrams when material changes them: Overview **How it works** and Architecture **System diagram**.
5. **Never silently overwrite conflicting content.** Surface conflicts and ask.
6. Cite sources in each doc's **Sources** section: `- [Title](url). Ingested YYYY-MM-DD`
7. Optionally store large raw inputs under `.ai-core/kb/<slug>/sources/` with a pointer in Overview sources.

## Done when

Sources are distilled with citations, diagrams are updated if needed, and you report what went where.
