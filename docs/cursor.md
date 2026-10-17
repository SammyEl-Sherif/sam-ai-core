# Cursor setup

Cursor loads agent skills from:

| Scope | Path |
| --- | --- |
| User (all projects) | `~/.cursor/skills/<skill-name>/SKILL.md` |
| Project (this repo only) | `<repo>/.cursor/skills/<skill-name>/SKILL.md` |

This repository ships skills under `skills/`. Use `bin/ai-core-skills install` to copy or symlink them into Cursor’s layout.

## Install on this machine

From a clone of [sam-ai-core](https://github.com/SammyEl-Sherif/sam-ai-core):

```bash
cd ~/Projects/sam-ai-core
chmod +x bin/ai-core-skills scripts/validate-skills.sh
./bin/ai-core-skills validate
./bin/ai-core-skills install --target cursor
```

**Developer loop (live edits):** symlink from the clone instead of copying:

```bash
./bin/ai-core-skills install --target cursor --link
```

Re-run `install` after pulling new skills from `main`. Copy mode refreshes each skill directory; link mode updates automatically when you edit files in the clone.

## Project-scoped install

To pin skills in one application repo (for teammates or Cloud Agents):

```bash
./bin/ai-core-skills install --target cursor-project --project-root /path/to/app
```

Commit `.cursor/skills/` only if your team wants skills vendored in git; otherwise add `.cursor/skills/` to that repo’s `.gitignore` and document the install command in the app README.

## Notion MCP

Skills such as **notion-task** expect the Notion MCP server connected in Cursor (Settings → MCP). Authenticate once per machine. If property names on your tasks database differ from the defaults, set overrides in `.ai-core/notion-task.env` in the target repo (see `skills/notion-task/references/tracker-properties.md`).

## Verify

1. `./bin/ai-core-skills list` — should print skill names (including `notion-task` after install).
2. Open Cursor Agent in any project; start a chat and ask to use a skill by name (e.g. “follow the board skill”).
3. Optional: `ls ~/.cursor/skills` — one directory per installed skill.
