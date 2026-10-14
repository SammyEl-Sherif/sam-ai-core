---
name: execute-plan
description: Execute a planned project. Mark it active and create the full task board from the prepped docs. Use when the user says execute plan after planning.
---

# Execute Plan

Turn the written plan into a live board the team can see (issues, project board, or equivalent).

## Preconditions

Overview, architecture, and decisions under `.ai-core/kb/<slug>/` are filled enough to derive work items. If planning looks incomplete, say what's missing and stop.

## Steps

1. **Break down** from the KB into work items (one PR each) with type, priority, epic, notes, and dependencies.
2. **Approve** the breakdown with the user; iterate until accepted.
3. **Create** tracker items in bulk (GitHub Issues with labels, import JSON, or your team's API).
4. **Report** counts created or updated and any dependency wiring warnings.

## Done when

The board reflects the plan and the project is marked active in your tracker. Suggest **board** to start execution.
