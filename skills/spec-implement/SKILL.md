---
name: spec-implement
description: Execute approved implementation work from artifacts/features/<slug>/tasks.md using spec.md and plan.md as source-of-truth context. Use when the next unblocked task, or a selected set of task IDs, is ready to implement with dependency checks, task status updates, scoped code changes, validation, and traceability back to requirements and acceptance criteria.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
  source-agent: .github/agents/spec-implement.agent.md
---

# Spec Implement

Use this skill to execute implementation work for a feature from its approved artifacts.

This skill implements from `tasks.md`, with `plan.md` and `spec.md` as governing context. It owns task-by-task execution, status tracking, validation, and scope discipline.

## Read First

Read these inputs when they exist:

- `artifacts/features/<slug>/tasks.md`
- `artifacts/features/<slug>/plan.md`
- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/design.md`
- `artifacts/features/<slug>/analysis.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `references/tasks-template.md` to confirm the expected task block and status fields

## Use This Skill When

Use this skill when the user needs to:

- implement the next unblocked task from `tasks.md`
- implement specific task IDs from `tasks.md`
- update task status while work progresses
- make code and test changes that satisfy the approved spec, plan, and task list

Do not use this skill for:

- inventing work directly from chat intent
- repairing weak upstream specs, plans, or task lists by guessing
- silently broadening scope beyond the selected task

## Preconditions

Do not proceed unless these are true:

- `tasks.md` exists and contains executable tasks with dependencies
- `plan.md` exists and defines the technical approach and phase sequence
- `spec.md` exists and defines requirements and acceptance criteria
- the selected task exists and is executable
- dependencies and prerequisites are already satisfied

If no task is explicitly selected, default to the first unblocked task in sequence.

## Stop Conditions

Stop and explain what blocks execution when any of these are true:

- `spec.md`, `plan.md`, or `tasks.md` is missing
- task dependencies prevent execution
- the selected task is ambiguous, contradictory, or too broad
- plan prerequisites are not yet in place
- implementation would contradict the approved spec, plan, or constitution
- the task turns out to be materially larger, more cross-cutting, or more ambiguous than described

When stopping, identify:

- which task or prerequisite is blocked
- what upstream artifact or decision must change
- why implementation cannot proceed safely

## Core Execution Rules

- Work from `tasks.md`, not vague chat intent.
- Respect phase order, task dependencies, and resume notes.
- Execute one task at a time by default.
- Parallelize only when tasks are marked `[P]`, have no shared file boundaries, and have no data or dependency conflicts.
- Implement only what the selected task describes.
- Add tests and validation during implementation, not afterthought.
- Surface upstream defects instead of working around them silently.

## Task Status Protocol

Update `tasks.md` immediately as task state changes.

Before starting a task:

- keep the checkbox unchecked: `- [ ]`
- change `Status:` from `Not Started` to `In Progress`

After validation passes:

- change the checkbox from `- [ ]` to `- [X]`
- change `Status:` from `In Progress` to `Done`

If blocked:

- keep the checkbox unchecked
- change `Status:` to `Blocked`
- record the reason in `Session note:`

Do not batch these updates. Change task status at the moment work starts and at the moment validation completes.

## References

- Use [references/tasks-template.md](references/tasks-template.md) as the bundled definition of the expected task block structure.
- Keep checkbox state, `Status:`, and `Session note:` aligned with that template.

## Scope Discipline

If implementation reveals that a task is materially larger, more ambiguous, or more cross-cutting than the task list says:

1. Stop.
2. Describe the mismatch between the task and reality.
3. Recommend revisiting `tasks.md` or upstream artifacts.
4. Do not silently expand the implementation slice.

## Workflow

1. Validate that the required artifacts and prerequisites exist.
2. Select the next unblocked task, or confirm the user-selected task IDs are executable.
3. Update the task status in `tasks.md` to `In Progress`.
4. Implement only the scoped task outcome.
5. Add or update tests and validation needed for that task.
6. Confirm the task outcome matches its linked requirements and acceptance criteria.
7. Mark the task `Done` immediately after validation passes, or `Blocked` with a reason if it cannot complete.
8. Update resume context in `tasks.md` before moving on.

## Validation Standard

Before marking a task done, verify:

- implementation matches the task description
- relevant tests pass
- lint, type checks, or repo quality gates pass when applicable
- changed behavior still aligns with `spec.md`, `plan.md`, and the selected task
- evidence exists for the linked acceptance criteria

Use the repository’s `task-traceability-audit` skill when available to confirm the selected task still traces cleanly to requirements, acceptance criteria, and validation.

## Output Standard

Implementation work is ready only when it:

- stays within the selected task scope
- respects dependencies and sequencing
- updates task status immediately and correctly
- includes validation with the code change
- preserves traceability from `REQ-*` and `AC-*` to the implemented task
- surfaces blockers or upstream defects clearly instead of masking them

## Output Rules

- Produce code and test changes only for the selected executable task scope.
- Update task status in `artifacts/features/<slug>/tasks.md` as work progresses.
- Do not mark tasks done without validation.
- Do not proceed when upstream artifacts are missing, contradictory, or too weak to execute safely.
