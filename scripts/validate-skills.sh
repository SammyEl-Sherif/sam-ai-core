#!/usr/bin/env bash
# Validates SKILL.md frontmatter and directory naming under skills/.
set -euo pipefail

ROOT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
SKILLS_DIR="${ROOT}/skills"
errors=0

if [[ ! -d "$SKILLS_DIR" ]]; then
  echo "error: missing $SKILLS_DIR" >&2
  exit 1
fi

check_skill() {
  local dir="$1"
  local name
  name="$(basename "$dir")"
  local skill_file="${dir}/SKILL.md"

  if [[ ! -f "$skill_file" ]]; then
    echo "error: $name: missing SKILL.md" >&2
    errors=$((errors + 1))
    return
  fi

  if ! head -n 1 "$skill_file" | grep -q '^---$'; then
    echo "error: $name: SKILL.md must start with YAML frontmatter (---)" >&2
    errors=$((errors + 1))
    return
  fi

  local fm_name fm_desc
  fm_name="$(awk '/^---$/{if(++n==1)next; if(n==2)exit} /^name:/{sub(/^name:[[:space:]]*/,""); gsub(/^["'\'']|["'\'']$/,""); print; exit}' "$skill_file")"
  fm_desc="$(awk '/^---$/{if(++n==1)next; if(n==2)exit} /^description:/{sub(/^description:[[:space:]]*/,""); gsub(/^["'\'']|["'\'']$/,""); print; exit}' "$skill_file")"

  if [[ -z "$fm_name" ]]; then
    echo "error: $name: frontmatter missing 'name'" >&2
    errors=$((errors + 1))
  elif [[ "$fm_name" != "$name" ]]; then
    echo "error: $name: frontmatter name '$fm_name' != directory '$name'" >&2
    errors=$((errors + 1))
  fi

  if [[ -z "$fm_desc" ]]; then
    echo "error: $name: frontmatter missing 'description'" >&2
    errors=$((errors + 1))
  elif [[ ${#fm_desc} -lt 20 ]]; then
    echo "error: $name: description too short (min 20 chars)" >&2
    errors=$((errors + 1))
  fi
}

while IFS= read -r -d '' d; do
  check_skill "$d"
done < <(find "$SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

if [[ "$errors" -gt 0 ]]; then
  echo "validate-skills: $errors error(s)" >&2
  exit 1
fi

count="$(find "$SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
echo "validate-skills: OK ($count skills)"
