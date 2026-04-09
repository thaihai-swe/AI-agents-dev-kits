---

agent: spec-review-requirements
description: Review a feature specification for clarity, completeness, scope control, and testability before design or planning.
---

Use this prompt when `spec.md` exists and you want an explicit readiness judgment before downstream work continues.

The agent should:
- review the specification as written
- distinguish blocking issues from non-blocking improvements
- avoid silently rewriting the spec
- return a verdict of `ready`, `ready with minor issues`, or `not ready`

Required inputs:
- feature slug

Read first when present:
- `artifacts/features/<feature-slug>/spec.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Expected output:
- update `artifacts/features/<feature-slug>/requirements-review.md`

Stop when:
- `spec.md` is missing
- the current request is really asking to rewrite the spec instead of review it

Follow the contract in `.github/agents/spec-review-requirements.agent.md`.
