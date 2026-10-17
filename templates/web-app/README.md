# __APP_TITLE__

__APP_DESCRIPTION__

## Stack

- Next.js (App Router) + React
- Supabase (declarative `supabase/schemas/`, migrations via Supabase CLI only)
- Feature-sliced modules under `src/modules/`
- SQL at the controller layer (`src/controllers/**/sql/`)

## Local development

```bash
cp .env.example .env.local
npx supabase start
# Edit supabase/schemas/, then:
supabase db diff -f my-change
supabase migration up
npm run db:types
npm run dev
```

## Endpoints

- `GET /api/health` — liveness (plain text `ok`)
- `GET /api/version` — deployed git SHA (plain text)

## Tests

```bash
npm test
```
