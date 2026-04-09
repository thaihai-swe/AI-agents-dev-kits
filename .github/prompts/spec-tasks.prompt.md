---

agent: spec-tasks
description: Break an approved plan into bounded, reviewable, traceable tasks with validation coverage and safe sequencing.
---

Use this prompt when `spec.md` and `plan.md` are ready and you need an actionable task list for implementation.

The agent should:
- validate that the plan is decomposable before creating tasks
- generate review-sized, resumable tasks with explicit dependencies
- preserve REQ -> AC -> TASK -> validation traceability
- include validation and regression protection work where relevant

Required inputs:
- feature slug

Read first when present:
- `artifacts/features/<feature-slug>/spec.md`
- `artifacts/features/<feature-slug>/plan.md`
- `artifacts/features/<feature-slug>/design.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `.github/specs/templates/tasks-template.md`

Expected output:
- update `artifacts/features/<feature-slug>/tasks.md`

Stop when:
- `spec.md` or `plan.md` is missing
- plan phases are too vague to decompose safely
- acceptance criteria lack validation direction
- dependencies are too unclear to build a safe execution sequence

Follow the contract in `.github/agents/spec-tasks.agent.md`.
