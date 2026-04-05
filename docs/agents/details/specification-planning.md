# Specification, Design, Planning, And Delivery

This documentation covers agents that turn a change request into execution-ready work.

## Command Groups

### Specification & Design (3 agents)

These agents define what should change and handle technical clarification:

- `/spec-requirement` - Define what/why
- `/spec-review-requirements` - Check readiness
- `/spec-design` - Clarify technical approach (when needed)

### Planning & Delivery (2 agents)

These agents create execution strategy and bounded work:

- `/spec-plan` - Create execution strategy
- `/spec-tasks` - Create bounded implementation units

## Flow

```text
spec.md (Specification & Design)
    ↓ reviewed by
requirements-review.md (Specification & Design)
    ↓ may gate
design.md (Specification & Design)
    ↓ informs
plan.md (Planning & Delivery)
    ↓ expands into
tasks.md (Planning & Delivery)
    ↓ drives
implementation (Implementation & Quality)
```

## Roles

### `/spec-requirement` (Specification & Design)

Defines what should change and why.

### `/spec-review-requirements` (Specification & Design)

Checks whether `spec.md` is clear, complete, bounded, and testable enough for downstream work.

### `/spec-design` (Specification & Design)

Adds technical clarity only when planning depends on architecture, interfaces, migrations, or tradeoffs.

### `/spec-plan` (Planning & Delivery)

Turns approved intent into execution sequencing, dependencies, validation, rollout, and rollback guidance.

### `/spec-tasks` (Planning & Delivery)

Creates bounded implementation units that are easier to track, review, and validate.

## Rule Of Thumb

If planning feels uncertain, the missing artifact is usually either:

- a better `spec.md` (Specification & Design)
- a needed `design.md` (Specification & Design)

If execution feels unclear, the missing artifact is usually:

- incomplete `plan.md` (Planning & Delivery)
- vague `tasks.md` (Planning & Delivery)
