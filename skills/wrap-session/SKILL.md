---
name: wrap-session
description: Close out a working session. Reconcile the board with what shipped, log the session, capture decisions, and sync the knowledge base. Use at the end of any working session.
---

# Wrap Session

Leave the board and knowledge base aligned with what actually happened.

## Steps

1. **Gather** evidence: recent commits, diff stat against main, open and merged PRs (`git log`, `gh pr list`, etc.).
2. **Reconcile the board**:
   - Merged PR but ticket not closed → mark Done with PR link
   - Shipped work without a ticket → create one, then mark Done
   - Started but unfinished → comment current state
3. **Log the session** by prepending to `.ai-core/kb/<slug>/sessions.md` (newest first):

   ```markdown
   ## YYYY-MM-DD: one-line summary

   **Done:** ...
   **Board:** cards moved
   **Decisions:** D-refs or none
   **Blockers:** ...
   **Next:** ...
   ```

4. **Capture decisions** from the session as new `D-NNN` entries; update architecture if the built system diverged. Refresh Mermaid diagrams when services or flows changed.
5. Report what was logged, cards moved, decisions captured, and suggested next focus.
