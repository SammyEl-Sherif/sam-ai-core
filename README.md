# AI Core — skill store

Provider-agnostic agent skills and install helpers for **Cursor**, **Claude Code**, **Codex**, and similar CLIs.

## Quickstart

```bash
chmod +x bin/ai-core-skills scripts/validate-skills.sh skills/web-app/scripts/scaffold.sh
./bin/ai-core-skills validate
./bin/ai-core-skills list

# Install to Cursor (user-level; one folder per skill under ~/.cursor/skills/)
./bin/ai-core-skills install --target cursor --link

# Preview destinations
./bin/ai-core-skills install --target all --dry-run
```

See [docs/install-targets.md](docs/install-targets.md) for paths and environment variables. For Cursor on a Mac, see [docs/cursor.md](docs/cursor.md).

## Web app skill

The **web-app** skill scaffolds Next.js + Supabase products with feature-sliced modules, SQL controllers, Jest, SEO, Vercel Analytics, and a SCSS design system.

```bash
skills/web-app/scripts/scaffold.sh ~/Projects my-product "My Product" "One-line description"
```

Then open the new repo, follow `README.md`, and use the **web-app** skill in Cursor when extending the product.

Skill definition: [skills/web-app/SKILL.md](skills/web-app/SKILL.md). Template overlay: [templates/web-app/](templates/web-app/).

## Layout

| Path | Purpose |
| --- | --- |
| `skills/<name>/SKILL.md` | Skill definition (YAML frontmatter + body) |
| `templates/web-app/` | Next.js + Supabase scaffold overlay |
| `schemas/` | Skill authoring contracts |
| `bin/ai-core-skills` | Install and validate entrypoint |
| `scripts/validate-skills.sh` | CI-friendly skill lint |

## Contributing

1. Add or edit `skills/<kebab-name>/SKILL.md` with `name` matching the directory and a trigger-rich `description`.
2. Run `./bin/ai-core-skills validate`.
3. Open a PR describing when agents should load the skill.

## License

Add a license file before public distribution if not already present in the repository.
