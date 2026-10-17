---
name: notion-task
description: Pick up a Notion task, implement it in the target repo, open a PR, then set Notion status to In Progress and fill the Pull Request field. Use when the user pastes a Notion task URL, asks to implement a Notion ticket, or says work this Notion task.
---

# Notion Task

End-to-end loop: **Notion task → code → PR → Notion updates**. Runs in the **application repository** (not sam-ai-core unless that is the task target).

Requires **Notion MCP** in Cursor. For property-name overrides, read `references/tracker-properties.md`.

## Resolve the task

1. **Page id or URL** from the user (`https://notion.so/...`, UUID, or `notion.so` share link). Extract the page id if needed.
2. If no task was given, use Notion search (`notion-search` or equivalent) with the project name and filter to open tasks; confirm with the user when ambiguous.
3. **Fetch** the page (`notion-fetch` / `API-retrieve-a-page`). Read title, body, properties (status, PR link, repo hints, blockers), and comments.

Do not start work on a task marked Blocked or Done unless the user explicitly overrides.

## Implementation loop

Follow the same engineering discipline as **board**:

1. Identify the git repo (from task properties, linked pages, or cwd). `cd` there if needed.
2. `git checkout main && git pull && git checkout -b feature/<short-slug>` (include a task id in the branch when the tracker exposes one).
3. Implement from the task description; run the project’s tests/lint before opening a PR.
4. Open a **draft or ready PR** via the repo’s forge (prefer `ManagePullRequest` in Cloud Agent runs; `gh pr create` locally). Title: task title or `[<id>] <title>`. Body: link to the Notion task at the top, then summary and test notes.

## Notion updates (after PR exists)

Only after the PR URL is known:

1. **Status** → set to the workspace’s active-work value (default **`In Progress`**). Use `notion-update-page` with `command: update_properties`. Fetch first; use exact property names from the data source schema.
2. **Pull Request** → set the URL property (default property name **`Pull Request`**; may be `userDefined:URL` if the column is literally named URL). Value is the full PR URL string.
3. Add a short **comment** on the task (Notion comment API or MCP) noting PR opened and branch name.

If either property is missing on the database, report which name failed and ask the user to add the column or set overrides in `.ai-core/notion-task.env` (see references).

## Property discovery

Never guess Notion schema. On first fetch, note the status select options and URL property id/name. If **`In Progress`** is not a valid option, pick the closest active state (e.g. `Doing`, `Active`) and tell the user what you used.

## Conventions

- One task → one PR. New scope → new Notion task.
- Keep Notion in sync: status/PR updates happen in the same turn as PR creation when possible.
- After merge, use **lgtm** or manually set Done and link the merged PR.

## Related skills

- **board** — generic kanban loop when the tracker is not Notion-specific.
- **todo** — capture a new task from chat into the board.
- **wrap-session** — end-of-session notes after shipping work.
