---
name: plan-project
description: Plan a project and create its tickets. Hash out scope, features, stack, and architecture through Q&A, write the knowledge-base docs, then break the plan into trackable work items. Use when the user wants to plan a project or break work down.
---

# Plan Project

A guided interview that turns a project idea into written docs, then into tickets on the team's board (GitHub Issues, Linear, or equivalent).

**When docs are already written** (fresh repo import or prior ingestion): skip the full interview. Read the KB, ask only about gaps that change what gets built, then create tickets.

## Preconditions

Project slug exists under `.ai-core/kb/<slug>/`. Read overview, architecture, decisions, and sessions before starting.

## Interview loop

One topic at a time: ask, propose a synthesis, get confirmation, write, move on.

1. **Problem and users** → overview (Problem); sketch **How it works** when the journey is clear
2. **Scope** → overview (In MVP / Out)
3. **Stack** → overview frontmatter plus a `D-NNN` in decisions; reference stack templates when useful
4. **Features and epics** → overview under `### Epic N – Name` headings; mark MVP items
5. **Architecture** → draft or delegate a system design, review with the user, write `architecture.md` including **System diagram**
6. **Decisions** → every non-trivial call as `D-NNN` in `decisions.md`

## Create tickets

1. **Break down** work into items sized for one PR each. Prefer a short actionable list over an exhaustive backlog for a first plan.
2. **Approve** with the user: show groupings by epic, parallel vs blocked work.
3. **Create** issues or cards on the tracker with title, type, priority, epic label, notes, and dependency references.
4. Close any meta "planning" ticket if this session started from one.

## Wrap-up

Confirm interview topics landed in docs. Report tickets created and suggest picking up the first ready item via **board**.
