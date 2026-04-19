# Artifact Model

## Why Artifacts Exist

Artifacts make the workflow reviewable and resumable.

Each artifact has one job. That is the main guard against scope drift and vague handoffs.

## Artifact Lifecycle

Artifacts live under `artifacts/features/<slug>/`.

### `analysis.md`

What it is:
- bounded discovery about the current system

Why it exists:
- reduce uncertainty before committing to a feature definition

What it is not:
- a durable repo-memory file
- a plan

### `spec.md`

What it is:
- the user-facing statement of what should change and why

Why it exists:
- define intent, requirements, acceptance criteria, and scope

What it is not:
- a technical plan
- a coding checklist

### `requirements-review.md`

What it is:
- the readiness judgment for the spec

Why it exists:
- prevent downstream work from starting on weak requirements

What it is not:
- a rewritten spec

### `design.md`

What it is:
- technical clarification for features that need it

Why it exists:
- remove planning ambiguity

What it is not:
- a task list

### `plan.md`

What it is:
- the execution strategy

Why it exists:
- translate approved intent into sequencing, boundaries, validation, and rollout thinking

What it is not:
- production code
- a detailed implementation patch

### `tasks.md`

What it is:
- bounded execution units derived from the plan

Why it exists:
- let implementation happen in reviewable slices

What it is not:
- a loose brainstorm list

### `review.md`

What it is:
- durable implementation review findings when useful

Why it exists:
- preserve what was checked and what issues remain

What it is not:
- mandatory for every tiny change

### `testing-scenarios.md`

What it is:
- a human-run manual testing guide for delivered behavior

Why it exists:
- turn implemented or reviewed scope into clear tester-facing scenarios

What it is not:
- an automated test suite
- a replacement for implementation review

## Repo Memory vs Feature Artifacts

Repo memory lives in `memories/repo/`.

Use repo memory for:
- durable rules
- durable architecture and integration context
- recurring patterns

Use feature artifacts for:
- feature-specific decisions
- current feature constraints
- work-in-progress clarification, planning, tasks, and review

## Read Next

- [Artifacts Reference](../reference/artifacts.md)
- [Canonical Feature Example](../examples/canonical-feature.md)
