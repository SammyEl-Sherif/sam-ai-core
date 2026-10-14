# AI Core — skill store

Provider-agnostic agent skills and install helpers for **Cursor**, **Claude Code**, **Codex**, and similar CLIs. Skills describe durable project workflows (planning, board work, session wrap-up) without tying you to one vendor.

## Quickstart

```bash
# From a clone of this repository
chmod +x bin/ai-core-skills scripts/validate-skills.sh
./bin/ai-core-skills validate
./bin/ai-core-skills list

# Install to Cursor (user-level)
./bin/ai-core-skills install --target cursor

# Install into the current repo for Cursor
./bin/ai-core-skills install --target cursor-project --project-root .

# Preview destinations
./bin/ai-core-skills install --target all --dry-run
```

See [docs/install-targets.md](docs/install-targets.md) for paths and environment variables.

## Layout

| Path | Purpose |
| --- | --- |
| `skills/<name>/SKILL.md` | Skill definition (YAML frontmatter + body) |
| `templates/project-kb/` | Seed docs for new projects (`.ai-core/kb/<slug>/`) |
| `schemas/` | Skill authoring contracts |
| `bin/ai-core-skills` | Install and validate entrypoint |
| `scripts/validate-skills.sh` | CI-friendly skill lint |

## Initial skill set

Workflow skills adapted from the Projectflow kit (see [docs/first-pr-scope.md](docs/first-pr-scope.md)):

`autopilot`, `board`, `capture`, `execute-plan`, `ingest-context`, `lgtm`, `new-project`, `plan-project`, `todo`, `wrap-session`

## Contributing

1. Add `skills/<kebab-name>/SKILL.md` with `name` matching the directory and a trigger-rich `description`.
2. Run `./bin/ai-core-skills validate`.
3. Open a PR describing when agents should load the skill.

## License

Add a license file before public distribution if not already present in the repository.
