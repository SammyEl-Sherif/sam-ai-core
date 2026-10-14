---
name: lgtm
description: Ship the current ticket. Merge its PR, mark the card Done with a tested-by comment, then offer the next ticket. Use when the user says /lgtm, ship it, or looks good merge on an in-progress ticket branch.
---

# LGTM

Merge the ticket you are on and close its tracker item.

## Steps

1. Identify the ticket from the branch name or open PR title.
2. Preflight: PR mergeable, required checks green. If not, report and stop.
3. Record reviewer identity when the forge supports it (`gh api user`, etc.).
4. Merge with team policy (squash merge is common): `gh pr merge <n> --squash --delete-branch`
5. Return to main: `git checkout main && git pull`
6. Mark the ticket Done with PR link and a short tested-by comment.
7. Offer what is next from the board and ask if the user wants to start it (**board** loop).
