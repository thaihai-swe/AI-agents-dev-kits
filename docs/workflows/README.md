# Workflows

This page describes the current workflow built around the 10 agent files organized into 5 categories in [`.github/agents/`](../../.github/agents/).

## Agent Categories

1. **Foundation** - Establish durable repo-wide context
2. **Discovery & Analysis** - Investigate unclear systems or risks
3. **Specification & Design** - Define what and how to build
4. **Planning & Delivery** - Create execution strategy and tasks
5. **Implementation & Quality** - Build, test, and verify

## Default Feature Flow

Use this for most meaningful feature work:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design        (when needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Artifacts produced along the way:

- `/analyze` -> `analysis.md`
- `/spec-requirement` -> `spec.md`
- `/spec-review-requirements` -> `requirements-review.md`
- `/spec-design` -> `design.md`
- `/spec-plan` -> `plan.md`
- `/spec-tasks` -> `tasks.md`
- `/spec-review` -> `review.md` when a durable written review is useful

## Repo Setup Flow

Use this once per repository, then revisit only when the knowledge is genuinely durable:

```text
/constitution
/project-knowledge-base
```

- `constitution.md` is normative
- `project-knowledge-base.md` is descriptive

## Brownfield Flow

Use this when the current system is unclear or risky:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Brownfield discovery is no longer a separate command. It now happens through a bounded `analysis.md`, and durable findings can later be folded into repo memory.

## Small Change Flow

For a localized, low-risk change:

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

You can often skip `/analyze` and `/spec-design` when the change is already well understood and the architecture is not moving.

## Bug Fix Flow

For a bug or regression:

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Add `/spec-review-requirements` when the bug fix has tricky scope boundaries or user-facing implications.

## When Design Is Required

Run `/spec-design` before planning when one or more of these are true:

- the change crosses subsystem or service boundaries
- the feature adds or changes interfaces
- the work introduces data migration or compatibility risk
- there are multiple viable technical approaches with meaningful tradeoffs
- planning would otherwise depend on unstated architecture decisions

If those conditions are absent, go straight from requirements review to planning.

## Decision Rules

- Skip `/analyze` only when current behavior is already clear.
- Skip `/spec-review-requirements` only when the change is very small and the spec is obviously complete.
- Skip `/spec-design` only when planning can proceed safely without architectural clarification.
- Do not skip `/spec-plan` or `/spec-tasks` if you want bounded, traceable implementation work.

## Outputs By Phase

| Phase               | Artifact                 | Why it exists                                         |
| ------------------- | ------------------------ | ----------------------------------------------------- |
| Analysis            | `analysis.md`            | Capture observed facts, risks, and next-step guidance |
| Specification       | `spec.md`                | Define what should change and why                     |
| Requirements Review | `requirements-review.md` | Check whether downstream work is safe to start        |
| Design              | `design.md`              | Resolve technical ambiguity before planning           |
| Planning            | `plan.md`                | Define execution strategy, sequencing, and validation |
| Tasks               | `tasks.md`               | Break work into bounded outcomes                      |
| Review              | `review.md`              | Record verification findings when needed              |
