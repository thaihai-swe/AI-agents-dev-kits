# Specification And Planning

This group turns a change request into execution-ready artifacts.

## Commands In This Group

- `/spec-requirement`
- `/spec-review-requirements`
- `/spec-design`
- `/spec-plan`
- `/spec-tasks`

## Flow

```text
spec.md
    ↓ reviewed by
requirements-review.md
    ↓ may gate
design.md
    ↓ informs
plan.md
    ↓ expands into
tasks.md
```

## Roles

### `/spec-requirement`

Defines what should change and why.

### `/spec-review-requirements`

Checks whether `spec.md` is clear, complete, bounded, and testable enough for downstream work.

### `/spec-design`

Adds technical clarity only when planning depends on architecture, interfaces, migrations, or tradeoffs.

### `/spec-plan`

Turns approved intent into execution sequencing, dependencies, validation, rollout, and rollback guidance.

### `/spec-tasks`

Creates bounded implementation units that are easier to track, review, and validate.

## Rule Of Thumb

If planning feels uncertain, the missing artifact is usually either:

- a better `spec.md`
- a needed `design.md`
