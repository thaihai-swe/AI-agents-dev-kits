# Team And Multi-Agent Collaboration

## When To Use This Guide

Use this guide when multiple people or multiple coding agents will work in the same repository at the same time.

## Goals

- avoid artifact conflicts
- preserve task isolation
- keep ownership clear
- reduce merge churn and duplicated work

## Collaboration Model

The safest default is:

1. align on one feature slug
2. stabilize upstream artifacts first
3. split execution by bounded task ownership
4. review against the same approved artifacts

Artifacts stay shared.
Implementation tasks can be parallelized when the plan and tasks make that safe.

## Ownership By Phase

### Shared Ownership

These artifacts should usually be edited by one active owner at a time:

- `spec.md`
- `requirements-review.md`
- `design.md`
- `plan.md`
- `tasks.md`

Why:

- these files define shared truth
- concurrent edits here create planning drift quickly

### Parallel Ownership

These are safer to parallelize once task boundaries are explicit:

- code changes
- tests
- documentation tied to specific tasks

Only parallelize when tasks are independent and file boundaries are clear.

## Recommended Team Workflow

### 1. Align On The Feature Folder

Everyone should work against the same:

- feature slug
- `spec.md`
- `plan.md`
- `tasks.md`

### 2. Lock The Upstream Artifacts First

Do not split implementation until:

- requirements are ready
- planning is safe
- tasks are bounded and traceable

### 3. Assign Task Ownership Explicitly

For each active task, make ownership clear:

- owner
- linked task ID
- expected files or modules
- dependency status

### 4. Parallelize Only On Safe Boundaries

Good candidates:

- independent backend and UI tasks
- documentation tasks that do not rewrite shared planning artifacts
- validation tasks against already landed code

Bad candidates:

- tasks editing the same files
- tasks sharing contract changes
- tasks whose outputs depend on each other

## Worktree Or Branch Strategy

If your team uses parallel implementation heavily, prefer:

- one branch or worktree per feature contributor
- one bounded task set per branch
- merge only after the shared artifacts still match reality

Simple rule:

- shared artifact editing should be serialized
- task execution can be parallelized

## Using Helper Skills In Team Mode

### `memory-promotion`

Use when:

- one contributor finds durable knowledge during analysis or implementation
- the team needs to decide whether it belongs in repo memory

### `task-traceability-audit`

Use when:

- tasks are split across people or agents
- review needs confidence that `REQ -> AC -> TASK -> validation` coverage is still intact

## Conflict Prevention Rules

- do not let two contributors rewrite `tasks.md` structure at the same time
- do not let implementation silently change approved scope
- do not mark tasks done without validation evidence
- do not update repo memory from feature-specific observations without a promotion decision

## Team Readiness Checklist

- one feature slug is agreed
- upstream artifacts are approved enough to execute
- task ownership is explicit
- parallel tasks have clear file boundaries
- review expectations are shared

## Read Next

- [Decision Rules](decision-rules.md)
- [Skill Adoption](skill-adoption.md)
- [Full Skill Workflow Example](../examples/full-skill-workflow.md)
