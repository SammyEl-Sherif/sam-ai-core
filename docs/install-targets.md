# Install targets

`bin/ai-core-skills install` copies or symlinks the repository `skills/` tree into tool-specific locations.

| Target | Default destination | Override |
| --- | --- | --- |
| `cursor` | `~/.cursor/skills/<skill-name>/` (one dir per skill) | `--dest` (base directory; default `~/.cursor/skills`) |
| `cursor-project` | `<repo>/.cursor/skills/<skill-name>/` | `--dest`, requires `--project-root` |
| `claude` | `~/.claude/skills/ai-core` | `--dest` |
| `claude-project` | `<repo>/.claude/skills/ai-core` | `--dest`, requires `--project-root` |
| `codex` | `~/.codex/skills/ai-core` | `--dest` |
| `all` | All user-level targets above | `--dest` ignored |

## Environment variables

| Variable | Purpose |
| --- | --- |
| `AI_CORE_SKILLS_ROOT` | Override auto-detected repo root (directory containing `skills/`) |
| `CLAUDE_CODE Skills` | Claude Code also discovers `.claude/skills/` relative to the project; see [Claude Code skills](https://docs.anthropic.com/en/docs/claude-code/skills) |

## Idempotency

For **cursor** and **cursor-project**, each skill syncs into its own subdirectory under the destination base. Re-running install refreshes only ai-core skill folders; other entries under `~/.cursor/skills/` are left untouched.

For **claude** and **codex**, the whole `skills/` tree is mirrored to a single destination directory (`rsync -a --delete` when available, otherwise `cp -R`).

See [cursor.md](cursor.md) for Cursor-specific setup on a Mac or Cloud Agent machine.

## Project knowledge base

Skills assume per-project files at `.ai-core/kb/<slug>/` (overview, architecture, decisions, sessions). Seed from `templates/project-kb/` when creating a project.
