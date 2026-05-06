# GitHub Copilot Instructions

Use the existing workflow in `skills/` instead of improvising from chat history.

- choose the matching skill before freeform work
- use `memories/repo/` for durable repository context
- use `artifacts/features/<slug>/` for feature-specific artifacts
- move backward to the missing upstream artifact when blocked

## Skill Mapping

- `/kit-memory`: manage memories/repo/constitution.md and memories/repo/project-knowledge-base.md
- `/kit-research`: investigate current behavior or bugs
- `/kit-spec`: define what and why (with Socratic Wave)
- `/kit-plan`: design technical approach and breakdown tasks
- `/kit-implement`: execute tasks surgically
- `/kit-verify`: verify implementation and drift
- `/kit-cleanup`: perform maintenance refactoring

Keep routing thin; keep detailed behavior in `skills/`.
