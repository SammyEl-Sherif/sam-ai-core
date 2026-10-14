# Install targets

`bin/ai-core-skills install` copies or symlinks the repository `skills/` tree into tool-specific locations.

| Target | Default destination | Override |
| --- | --- | --- |
| `cursor` | `~/.cursor/skills-ai-core` | `--dest` |
| `cursor-project` | `<repo>/.cursor/skills/ai-core` | `--dest`, requires `--project-root` |
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

Install uses `rsync -a --delete` when available, otherwise `cp -R`. Re-running install refreshes the destination to match this repository.

## Project knowledge base

Skills assume per-project files at `.ai-core/kb/<slug>/` (overview, architecture, decisions, sessions). Seed from `templates/project-kb/` when creating a project.
