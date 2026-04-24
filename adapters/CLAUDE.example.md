# CLAUDE.md

Use the existing workflow in `skills/` instead of improvising from chat history.

- choose the matching skill before freeform work
- use `memories/repo/` for durable repository context
- use `artifacts/features/<slug>/` for feature-specific artifacts
- move backward to the missing upstream artifact when blocked
- require fresh verification evidence before claiming completion

Keep `.claude/commands/*` wrappers thin and aligned with the canonical skill names.
