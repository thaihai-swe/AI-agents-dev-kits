---
agent: spec-review-implementation
description: Review implemented work against the approved artifacts, validation evidence, task state, and repository rules.
---

Use this prompt when implementation work has been attempted and you want the post-implementation quality gate.

The agent should:
- review delivered work against `spec.md`, `plan.md`, and `tasks.md`
- classify blocking issues separately from follow-up issues
- judge completeness, correctness, and coherence
- create `review.md` only when a durable written review is useful

Required inputs:
- feature slug

Read first when present:
- `artifacts/features/<feature-slug>/spec.md`
- `artifacts/features/<feature-slug>/plan.md`
- `artifacts/features/<feature-slug>/tasks.md`
- `artifacts/features/<feature-slug>/design.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Expected output:
- review findings
- optional `artifacts/features/<feature-slug>/review.md`

Stop when:
- implementation has not actually been attempted
- required review artifacts are missing

Follow the contract in `.github/agents/spec-review-implementation.agent.md`.
