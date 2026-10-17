#!/usr/bin/env bash
# Scaffold a Next.js + Supabase app from templates/web-app/
set -euo pipefail

usage() {
  echo "Usage: scaffold.sh <parent-directory> <app-slug> \"<app-title>\" [description]" >&2
  exit 1
}

[[ $# -ge 3 ]] || usage

PARENT="$1"
SLUG="$2"
TITLE="$3"
DESCRIPTION="${4:-$TITLE}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$SKILL_ROOT/../.." && pwd)"
TEMPLATE="${REPO_ROOT}/templates/web-app"
TARGET="$(cd "$PARENT" && pwd)/${SLUG}"

if [[ ! -d "$TEMPLATE" ]]; then
  echo "error: missing template at $TEMPLATE" >&2
  exit 1
fi

if [[ -e "$TARGET" ]]; then
  echo "error: target already exists: $TARGET" >&2
  exit 1
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "error: npx is required" >&2
  exit 1
fi

echo "Creating Next.js app at $TARGET ..."
npx create-next-app@latest "$TARGET" \
  --typescript \
  --eslint \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --use-npm \
  --yes

echo "Overlaying template ..."
if command -v rsync >/dev/null 2>&1; then
  rsync -a "${TEMPLATE}/" "${TARGET}/"
else
  cp -R "${TEMPLATE}/." "${TARGET}/"
fi

replace_placeholders() {
  local file="$1"
  if [[ -f "$file" ]]; then
    sed -i.bak \
      -e "s/__APP_SLUG__/${SLUG}/g" \
      -e "s/__APP_TITLE__/${TITLE}/g" \
      -e "s/__APP_DESCRIPTION__/${DESCRIPTION}/g" \
      "$file"
    rm -f "${file}.bak"
  fi
}

while IFS= read -r -d '' f; do
  replace_placeholders "$f"
done < <(find "$TARGET" -type f \( -name '*.ts' -o -name '*.tsx' -o -name '*.scss' -o -name '*.json' -o -name '*.md' -o -name '*.example' -o -name '*.toml' -o -name '*.sql' \) -print0)

cd "$TARGET"

echo "Installing dependencies ..."
npm uninstall tailwindcss @tailwindcss/postcss 2>/dev/null || true
rm -f postcss.config.mjs tailwind.config.ts 2>/dev/null || true
rm -f src/app/globals.css 2>/dev/null || true

npm install @supabase/supabase-js @supabase/ssr @vercel/analytics pg sass
npm install -D @types/pg jest jest-environment-jsdom @testing-library/react @testing-library/jest-dom @testing-library/user-event @types/jest ts-node

if [[ -f extra-package.json ]]; then
  node <<'NODE'
const fs = require("fs");
const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));
const extra = JSON.parse(fs.readFileSync("extra-package.json", "utf8"));
pkg.scripts = { ...(pkg.scripts ?? {}), ...(extra.scripts ?? {}) };
fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2) + "\n");
NODE
  rm -f extra-package.json
fi

if [[ ! -f supabase/config.toml ]]; then
  echo "Initializing Supabase ..."
  npx supabase init
fi

if [[ -f supabase/config.toml.template ]]; then
  cat supabase/config.toml.template >> supabase/config.toml
  rm supabase/config.toml.template
fi

mkdir -p supabase/schemas supabase/migrations

echo ""
echo "Scaffold complete: $TARGET"
echo "Next steps:"
echo "  cd $TARGET"
echo "  cp .env.example .env.local   # fill Supabase + DATABASE_URL"
echo "  npx supabase start"
echo "  supabase db diff -f initial-schema   # after editing supabase/schemas/"
echo "  supabase migration up && supabase gen types typescript --local > src/lib/database.types.ts"
echo "  npm run dev"
