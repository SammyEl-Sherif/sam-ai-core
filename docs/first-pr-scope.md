# First PR scope

## Inspiration source

Default skills were adapted from the **Projectflow** kit in [workpace-agents](https://github.com/SammyEl-Sherif/workpace-agents) (`packages/kits/projectflow/content/skills/`).

| Access path | Result |
| --- | --- |
| Local `~/Projects/workpace-agents` on the user's machine | Not present on the Cloud Agent VM |
| `git clone` of the private repo | Failed (token scope differs from GitHub MCP) |
| GitHub MCP `get_file_contents` | Succeeded; skill names, descriptions, and workflow structure were ported |

## Adaptations

- **WorkPace `wp` CLI** references were replaced with a **portable file-based knowledge base** under `.ai-core/kb/<slug>/` and **GitHub Issues** (or your tracker) for board work. Skills describe both so teams can swap in their own PM integration later.
- **WorkPace-specific** agents (`task-breakdown`, `architect`, `session-scribe`) are described as delegation steps without proprietary prompts.
- **Stack profiles** from `$WP_KIT_ROOT/stacks/` become optional `templates/stacks/` copies in the target repo.

## Skills in this PR

Ten workflow skills mirror the Projectflow defaults: `autopilot`, `board`, `capture`, `execute-plan`, `ingest-context`, `lgtm`, `new-project`, `plan-project`, `todo`, `wrap-session`.

## Out of scope (follow-ups)

- Wiring to a hosted board API
- Bundled MCP servers
- Automated tests beyond `scripts/validate-skills.sh`
