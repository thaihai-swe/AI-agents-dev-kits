# Getting Started

This is the fastest way to onboard to the current 10-agent model.

## The 30-Second Version

| If You Want | Use This |
| --- | --- |
| Set up repo memory | `/constitution` -> `/project-knowledge-base` |
| Build a new feature | `/spec-requirement` -> `/spec-review-requirements` -> `/spec-plan` -> `/spec-tasks` -> `/spec-implement` -> `/spec-review` |
| Investigate brownfield code | `/analyze` |
| Handle a cross-cutting feature | add `/spec-design` before planning |

## Your First Feature

For a feature slug `user-profile`:

### 1. Analyze only if needed

```text
/analyze
Feature slug: user-profile

Investigate the current profile-related flows, data sources, and constraints for this change.
```

### 2. Write the specification

```text
/spec-requirement
Feature slug: user-profile

Create a feature specification for the user profile feature.
```

### 3. Review the requirements

```text
/spec-review-requirements
Feature slug: user-profile
```

### 4. Add design if the feature is technically tricky

```text
/spec-design
Feature slug: user-profile
```

### 5. Plan the work

```text
/spec-plan
Feature slug: user-profile
```

### 6. Break it into tasks

```text
/spec-tasks
Feature slug: user-profile
```

### 7. Implement selected tasks

```text
/spec-implement
Feature slug: user-profile

Implement TASK-001 and TASK-002. Update task status and run the appropriate validation.
```

### 8. Review the result

```text
/spec-review
Feature slug: user-profile
```

## New Repository Setup

Run these first when the repo has no durable memory yet:

```text
/constitution
/project-knowledge-base
```

## How To Think About The Workflow

- `analyze` learns what is true now
- `spec-requirement` defines what should change
- `spec-design` clarifies how the system should work when planning needs technical decisions
- `spec-plan` turns intent into execution strategy
- `spec-tasks` creates bounded work units
- `spec-implement` executes the plan
- `spec-review` verifies the result

## Safe Defaults

- If the system is unclear, run `/analyze`.
- If planning feels ambiguous, run `/spec-design`.
- If the spec is weak, do not continue past `/spec-review-requirements`.
- If implementation uncovers an upstream mistake, fix the right artifact first.
