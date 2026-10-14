---
name: new-project
description: Create a project. Seed knowledge-base docs and register tracking metadata. Use when the user wants to start, create, or register a new project.
---

# New Project

Create a project's durable home: a slug, four seeded knowledge-base docs (Overview, Architecture, Decisions, Sessions), and optional links to a GitHub repo or issue tracker.

## Inputs

Gather only what is missing:

- **slug**: kebab-case identifier
- **description**: one line
- **stack** (optional): reference stack notes under `templates/stacks/` or a team profile path
- **repo** (optional): GitHub repository URL

## Steps

1. Create `.ai-core/kb/<slug>/` if it does not exist.
2. Copy templates from this skill store's `templates/project-kb/` into that folder when files are absent (do not overwrite existing docs).
3. Fill the Overview **Problem** section with the description when empty.
4. Optionally create a GitHub label or project column named for the slug, or add a row to the team's board doc — follow whatever issue tracker the repo uses.

## Then ask for context

Do not hand off to another command. After setup, ask in one short message: *"The project is set up. Share links, files, or a braindump and I'll fold it into the knowledge base — or say skip to go straight to planning."*

- If they share material, follow **ingest-context** in the same session.
- If they skip, suggest **plan-project**.

## Done when

The four KB files exist, tracking is registered if the team uses one, and the user was offered context ingestion.
