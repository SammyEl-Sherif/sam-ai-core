# Skill frontmatter contract

Every skill lives at `skills/<name>/SKILL.md` and must begin with YAML frontmatter:

```yaml
---
name: <kebab-case; must match directory name>
description: <One line; when the agent should load this skill. Include trigger phrases.>
---
```

Optional keys (ignored by validation unless noted):

- `metadata`: free-form map for target-specific hints
- `environments`: list such as `cloud`, `local`

The Markdown body follows the frontmatter. Keep skills self-contained; link to sibling files with relative paths inside the skill directory when needed.
