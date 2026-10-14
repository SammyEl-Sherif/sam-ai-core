---
name: board
description: Work the project kanban. Pick up tickets by ID, branch off main, move cards through statuses with comments, attach PRs. Use when the user asks to do a task, check the board, or update task status.
---

# Board

The ticket work loop. Runs in the target application repository.

## Reading the board

Use **one** consolidated query when possible (GitHub project view, `gh issue list`, or your tracker CLI). Filter by project label or milestone.

For detail on a single item, read its description, comments, blockers, and linked PRs in one batch of tool calls to avoid slow round trips.

Never start work on a blocked item; resolve or work the blocker first.

## The loop (per ticket)

1. Read the ticket and comment history.
2. Branch from fresh main: `git checkout main && git pull && git checkout -b feature/<ticket-id>-<short-slug>`
3. Mark started in the tracker with a comment describing intent.
4. Implement and run the project's tests.
5. Open a PR titled with the ticket id and summary. Put the ticket link or id at the top of the body.
6. Attach the PR URL to the ticket. When merged, mark Done with merge comment and link.

## Knowledge tickets

Non-code work (docs-only, research) updates `.ai-core/kb/<slug>/` via read/edit/save — no branch required unless the team policy says otherwise. Mark Done with a comment listing doc changes.

## Conventions

- Every status change gets a comment; the thread is history.
- Blocked mid-ticket → mark blocked with reason and pick another ready item.
- New scope discovered → new ticket; do not scope-creep the current branch.
