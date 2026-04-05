# Implementation And Delivery

This group executes planned work and checks whether it matched the intended change.

## Commands In This Group

- `/spec-implement`
- `/spec-review`

## `/spec-implement`

Use this after `spec.md`, `plan.md`, and `tasks.md` exist.

Responsibilities:

- execute selected tasks
- choose the next unblocked task by default when a task is not explicitly specified
- keep implementation scoped
- add or update validation
- update task status when the workflow expects it
- follow task dependencies, phase sequencing, and resume notes
- stop when dependencies, prerequisites, or task clarity are insufficient
- stop if upstream artifacts are too weak or contradictory

## `/spec-review`

Use this after implementation work is done.

Responsibilities:

- check requirement coverage
- review validation quality
- identify scope drift or regressions
- distinguish blocking issues from follow-up improvements

## Working Pattern

```text
/spec-tasks
    ↓
/spec-implement
    ↓
/spec-review
```

Repeat `spec-implement` and `spec-review` until the feature is honestly ready.
