---
name: web-app
description: Scaffold and extend Next.js web apps with Supabase, FSD modules, SQL controllers, Jest, SEO, Vercel Analytics, and a SCSS design system. Use when creating a new web app, greenfield product, or Next.js + Supabase project from a product description.
---

# Web App

Create a production-shaped Next.js app from a product description. Follow this skill end-to-end; do not substitute ad-hoc stacks or skip required patterns.

## Inputs

Gather before scaffolding:

| Input | Notes |
| --- | --- |
| **slug** | kebab-case directory and package name |
| **title** | Human-readable product name (SEO, metadata) |
| **description** | One paragraph for metadata and landing copy seed |
| **features** | List of main features → one `src/modules/<feature>/` each |
| **parent path** | Where to create the repo (default: user-chosen projects folder) |

## Scaffold

From this skill store root (`AI_CORE_SKILLS_ROOT` or the clone containing `skills/web-app/`):

```bash
chmod +x skills/web-app/scripts/scaffold.sh
skills/web-app/scripts/scaffold.sh <parent-path> <slug> "<title>"
```

The script:

1. Runs `create-next-app` (App Router, TypeScript, ESLint, `src/`, `@/*` alias).
2. Overlays `templates/web-app/` from this repository.
3. Runs `supabase init` if missing and seeds declarative schema stubs.
4. Substitutes `__APP_SLUG__`, `__APP_TITLE__`, `__APP_DESCRIPTION__`.

After scaffold, customize for the product:

1. Edit `supabase/schemas/*.sql` for the domain model (declarative source of truth).
2. Generate migrations **only** via Supabase CLI (see [Database](#database)).
3. Add modules, controllers, API routes, and UI for each feature.
4. Wire Supabase Auth flows if the product needs accounts.
5. Run `npm test` and `npm run build` before handoff.

Detailed layout and layer rules: [references/architecture.md](references/architecture.md).

## Architecture (required)

### Feature-sliced modules

```
src/
  modules/<feature>/
    index.ts          # re-exports widgets, entries, hooks, contexts, utils
    widgets/          # largest UI groupings (compose entries)
    entries/          # small reusable UI pieces
    hooks/
    contexts/
    utils/
    index.ts per subfolder (barrel)
  components/         # shared across modules (same subfolder types as modules)
  hooks/
  contexts/
  utils/
  controllers/        # database boundary only
  lib/
  design-system/
```

- **API route handlers** (`src/app/api/.../route.ts`) = **service layer**: auth, validation, HTTP, call controllers.
- **Controllers** (`src/controllers/<domain>/`) = **only** place that runs SQL files.
- **SQL** lives beside controllers: `src/controllers/<domain>/sql/*.sql`.

Never run raw SQL from route handlers or React components.

### Database

- **Declarative schema** in `supabase/schemas/` (full desired state per file).
- **Migrations** in `supabase/migrations/` — created **only** with Supabase CLI:
  - After editing schemas: `supabase db diff -f <change-name>` (local stack running), or `supabase migration new <name>` when hand-writing is required (RLS edge cases, DML seeds in migrations).
- **Never** edit production schema in the Dashboard without capturing a migration.
- **Never** invent migration filenames; always use CLI-generated names.
- Apply locally: `supabase db reset` or `supabase migration up`.
- Deploy: `supabase db push`.
- Regenerate types: `supabase gen types typescript --local > src/lib/database.types.ts`.

Server-side query execution uses `DATABASE_URL` (pooler/direct Postgres) via `src/lib/db/execute-sql.ts`, not the anon key.

### Auth

Standard Supabase Auth with `@supabase/ssr`: `src/lib/supabase/client.ts`, `server.ts`, `middleware.ts` session refresh. Protect routes in middleware or service layer as needed.

### Observability & ops

- `GET /api/health` — plain text `ok` (liveness).
- `GET /api/version` — plain text git SHA (`VERCEL_GIT_COMMIT_SHA` or `GIT_SHA` at build).
- `@vercel/analytics` in root layout.

### SEO

- `src/app/sitemap.ts`, `src/app/robots.ts`, metadata in root layout.
- Per-route `metadata` / `generateMetadata` for public pages.

### Design system

- Tokens in `src/design-system/tokens/*.scss` (CSS variables).
- Components in `src/design-system/components/` using **SCSS modules** by default.
- Import tokens in `src/app/globals.scss`.

### Testing

- **Every** component under `src/components`, `src/design-system/components`, `src/modules/**/entries`, and `src/modules/**/widgets` gets a colocated `*.test.tsx` (Jest + Testing Library).
- Run `npm test` after adding UI.

## Feature implementation checklist

For each feature in the product description:

```
- [ ] supabase/schemas updated + migration generated via CLI
- [ ] src/controllers/<feature>/ + sql/
- [ ] src/app/api/<feature>/... route(s)
- [ ] src/modules/<feature>/ (widgets, entries, hooks as needed)
- [ ] Jest tests for new components
- [ ] Public pages + metadata if applicable
```

## Environment

Document in `.env.example`:

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `DATABASE_URL` (server-only, for controllers)
- `GIT_SHA` (optional local override for `/api/version`)

## Done when

- App builds and tests pass.
- Health and version endpoints respond.
- Supabase schema is declarative + migrated via CLI only.
- Modules match the described product features.
- User has `.env.example` and README with local dev steps (`supabase start`, `npm run dev`).

## References

- [references/architecture.md](references/architecture.md) — layer diagram, naming, examples.
