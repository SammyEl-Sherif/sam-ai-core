---
name: todo
description: Capture the user's current request as a tracked task on the board. Use when the user says /todo or wants what they just asked turned into a task.
---

# Todo

One card from the user's current request. Fast: minimal ceremony.

## Steps

1. Resolve the project from context; ask only if unknown.
2. Title from the request (imperative, concise). Default type Task, status Backlog; set priority or epic only when clearly implied.
3. Create the tracker item (GitHub Issue, Linear issue, etc.) with notes summarizing conversation context.
4. Report the ticket id back to the user.
