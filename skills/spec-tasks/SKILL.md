---
name: spec-tasks
description: Create or refine a task breakdown in artifacts/features/<slug>/tasks.md from an approved spec and plan. Use when spec.md and plan.md are ready and the work needs bounded, reviewable, independently testable tasks with explicit dependencies, validation coverage, preserved phase order, and traceability from requirements and acceptance criteria into execution.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Spec Tasks

Use this skill to create or refine `artifacts/features/<slug>/tasks.md`.

This skill turns an approved plan into a concrete execution task list. It owns bounded task decomposition, sequencing, dependency clarity, validation coverage, and resumable implementation tracking.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/plan.md`
- `artifacts/features/<slug>/design.md`
- `references/tasks-template.md`
- any `data-model.md`, `contracts/`, `research.md`, or `quickstart.md` relevant to the feature

## Use This Skill When

Use this skill when the user needs to:

- turn an approved plan into `tasks.md`
- refine a task list after plan or design changes
- create review-sized execution slices with explicit dependencies
- prepare implementation work that can resume safely across sessions

Do not use this skill for:

- fixing weak requirements or planning artifacts
- writing code
- replacing `plan.md` with a new phase model

## Preconditions

Do not generate tasks unless these are true:

- `spec.md` exists with user stories and acceptance criteria
- `plan.md` exists with phases, sequencing, and technical approach
- scope is bounded enough to decompose safely
- acceptance criteria have validation direction
- plan phases are actionable enough to break into tasks

## Stop Conditions

Stop and explain what must improve upstream when any of these are true:

- `spec.md` or `plan.md` is missing
- plan phases are too vague to decompose safely
- material requirements are not mapped to any phase
- unresolved questions or design gaps block sequencing
- acceptance criteria lack validation direction
- phases are not independently actionable
- dependencies are too unclear to build a safe execution sequence

When stopping, say which precondition failed and which artifact needs revision.

## Core Rules

- Preserve the `PHASE-###` execution sequence from `plan.md`.
- Decompose the plan; do not replace it with a different structure.
- Break work into the smallest reviewable outcomes practical.
- Keep tasks independently testable where practical.
- Include validation work as first-class tasks.
- Avoid bundling unrelated work into mega-tasks.
- Make regression-sensitive or protected behavior explicit in safeguard or validation tasks when relevant.
- Mark only truly parallel-safe tasks with `[P]`.
- Prefer explicit file or module targets when they are known.

## References

- Use [references/tasks-template.md](references/tasks-template.md) as the bundled task structure.
- Preserve its implementation-tracking fields exactly.
- Every task must include a checkbox line, `Status: Not Started`, and `Session note:`.

## Workflow

1. Validate that `spec.md` and `plan.md` are present and decomposition is safe.
2. Read the spec, plan, optional design, and supporting context.
3. Preserve the phase order from `plan.md`.
4. Decompose each phase into bounded tasks by story, dependency, or technical slice.
5. Add explicit dependencies and mark safe parallel work with `[P]`.
6. Include validation tasks and regression protection tasks where needed.
7. Check that every requirement and acceptance criterion is covered.
8. Run a final traceability pass for `REQ -> AC -> TASK -> validation`.

## Validation Checklist

Before finalizing `tasks.md`, verify:

- every phase from `plan.md` is represented
- task IDs are sequential
- every task includes specific file paths or module targets when known
- every task includes `Status: Not Started`
- every task includes `Session note:`
- parallel markers appear only on truly independent tasks
- every material `REQ-*` maps to one or more tasks
- every material `AC-*` maps to one or more tasks or validation steps
- validation tasks are explicit
- no major work is orphaned

## Traceability

Preserve the full chain:

`REQ -> AC -> TASK -> validation`

Use the repository’s `task-traceability-audit` skill as a finalization check when available. Do not treat `tasks.md` as complete until that chain is intact.

## Output Standard

The task list is ready only when it:

- covers the approved plan with no major gaps
- preserves the plan’s phase sequence
- breaks work into bounded, reviewable, independently testable tasks
- makes execution order and dependencies clear
- includes validation as first-class work
- is specific enough for implementation without inventing scope
- supports safe sequential or parallel execution
- is resumable across sessions

## Output Rules

- Update only `artifacts/features/<slug>/tasks.md`.
- Do not write code.
- Do not finalize if upstream planning is weak; say so clearly.
- Do not finalize if major acceptance criteria are uncovered.
- Keep the strict task block structure required for implementation tracking.
