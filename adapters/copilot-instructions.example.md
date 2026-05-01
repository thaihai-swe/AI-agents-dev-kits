# Copilot Instructions

This repository uses an artifact-first workflow.

- the canonical workflow contract lives in `skills/`
- durable repository memory lives in `memories/repo/`
- feature artifacts live in `artifacts/features/<slug>/`
- choose the matching existing skill before freeform implementation
- do not skip forward when the upstream artifact is weak
- do not claim completion without fresh verification evidence

Use only thin aliases to the existing skills:

- `/spec-review` -> `spec-review-implementation`
- `/memory-promotion` -> `memory-promotion`
- `/task-traceability-audit` -> `task-traceability-audit`

Use a thin `.github/instructions/*` layer only to point back to the canonical workflow.
