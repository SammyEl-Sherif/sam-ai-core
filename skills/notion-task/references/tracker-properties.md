# Notion task tracker properties

Workspaces differ. This skill assumes a **tasks database** with at least:

| Role | Default property name | Type | Example value |
| --- | --- | --- | --- |
| Title | `Name` or `Task` | title | (page title) |
| Status | `Status` | select | `In Progress` |
| Pull request | `Pull Request` | url | `https://github.com/org/repo/pull/42` |

## Overrides

In the **target application repo** (not sam-ai-core), optional file:

`.ai-core/notion-task.env`

```bash
# Exact Notion property names from your database schema
NOTION_TASK_STATUS_PROPERTY=Status
NOTION_TASK_STATUS_IN_PROGRESS="In Progress"
NOTION_TASK_PR_PROPERTY="Pull Request"
```

If the PR column is named `URL`, the Notion MCP may require `userDefined:URL` in `update_properties` — use names from `notion-fetch` output, not this table.

## Finding your database

1. Open any task in Notion → **•••** → **Copy link** for the page id.
2. In Cursor, run Notion fetch on that id and read the `<database>` block for property names and select options.
3. Update `.ai-core/notion-task.env` once per repo so future runs stay consistent.

## MCP tools (Cursor)

| Step | Tool |
| --- | --- |
| Read task | `notion-fetch`, `notion-get-comments` |
| Search tasks | `notion-search`, `notion-query-data-sources` |
| Update status / PR | `notion-update-page` (`update_properties`) |
| Comment | `notion-create-comment` |

Alternative: **notion-cli** (`ntn`) when MCP is unavailable — see the user’s `notion-cli` skill.
