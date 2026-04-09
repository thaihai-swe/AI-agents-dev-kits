---
mode: agent
agent: spec-plan
description: Turn an approved and clarified specification into a traceable implementation plan with domain, risk, validation, rollout, and rollback guidance.
---

Use this prompt when `spec.md` is ready for planning and any required requirements review has passed.

The agent should:
- validate planning preconditions before writing
- stop on unresolved blocking clarification or `not ready` requirements review verdicts
- analyze affected domains, integration boundaries, regression-sensitive behavior, and rollout risk
- produce a plan that maps REQ and AC to phases and validation

Required inputs:
- feature slug

Read first when present:
- `artifacts/features/<feature-slug>/spec.md`
- `artifacts/features/<feature-slug>/requirements-review.md`
- `artifacts/features/<feature-slug>/design.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `.github/specs/templates/plan-template.md`

Expected output:
- update `artifacts/features/<feature-slug>/plan.md`

Stop when:
- `spec.md` is missing, contradictory, or still contains unresolved blocking clarification
- `requirements-review.md` verdict is `not ready`
- the feature needs design first and `design.md` does not exist
- domain boundaries or dependencies are too unclear to sequence safely

Follow the contract in `.github/agents/spec-plan.agent.md`.
