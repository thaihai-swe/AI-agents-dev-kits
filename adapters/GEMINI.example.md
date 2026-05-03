# GEMINI.md

Use the existing workflow in `skills/` instead of improvising from chat history.

- choose the matching skill before freeform work
- use `memories/repo/` for durable repository context
- use `artifacts/features/<slug>/` for feature-specific artifacts
- move backward to the missing upstream artifact when blocked
- require fresh verification evidence before claiming completion

Keep routing thin:

- `/spec-review` should wrap the existing implementation-review stage
- `/memory-promotion` should point to the existing memory-promotion stage
- `/task-traceability-audit` should point to the existing audit stage

Keep `GEMINI.md` focused on entrypoint routing and repo context, not on duplicating full skill bodies.
