---
name: autopilot
description: Autonomously work an entire epic. Loop pick next ticket, branch, implement, PR, checks green, merge, Done until the epic is exhausted or a human is needed. Use when the user asks to run an epic on autopilot.
---

# Autopilot

Work one epic end-to-end without pausing between tickets unless blocked.

## Preflight (all must pass)

1. Clean working tree on main, up to date with origin.
2. Forge CLI authenticated (`gh auth status` or equivalent).
3. Epic chosen; confirm with the user if not specified.
4. **Explicit go-ahead** to auto-merge to main for this run. Without it, stop.

## The loop

Repeat until no ready cards remain in the epic:

1. Pick the next unblocked ticket in the epic.
2. Read ticket and comments.
3. `git checkout main && git pull && git checkout -b feature/<ticket-id>`
4. Mark In Progress with an autopilot comment.
5. Implement; do not open a PR with failing tests.
6. Open PR with ticket id in title; link PR on the ticket.
7. Wait for checks; green → merge and delete branch; red → one fix attempt, then mark Blocked and continue or stop per team policy.
8. Mark Done with merge comment and PR link.

## Blocker protocol

When blocked, pause and ask: work the blocker, skip, wait, or end the run. Record the choice on the ticket.

## End of run

Report tickets shipped, blocked or skipped items, epic progress. Suggest **wrap-session**.
