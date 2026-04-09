# Getting Started

This is the fastest way to onboard to the current 10-agent model organized into 5 categories.

## The 30-Second Version

| If You Want                 | Use This                                                                                              | Category                                             |
| --------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| Set up repo memory          | `/constitution` -> `/project-knowledge-base`                                                          | **Foundation**                                       |
| Investigate brownfield code | `/analyze`                                                                                            | **Discovery & Analysis**                             |
| Build a new feature         | `/spec-requirement` -> `/spec-review-requirements` -> `/spec-design` -> `/spec-plan` -> `/spec-tasks` | **Specification & Design** + **Planning & Delivery** |
| Implement & verify          | `/spec-implement` -> `/spec-review`                                                                   | **Implementation & Quality**                         |

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

Resolve any blocking clarification here before treating the spec as ready for review.

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

## How To Think About The 5 Agent Categories

**Foundation:**
- `constitution` establishes repo-wide rules and guardrails
- `project-knowledge-base` captures durable descriptive context

**Discovery & Analysis:**
- `analyze` learns what is true now before making changes

**Specification & Design:**
- `spec-requirement` defines what should change, why, and resolves blocking clarification
- `spec-review-requirements` checks whether the spec is ready downstream
- `spec-design` clarifies how the system should work when planning needs technical decisions

**Planning & Delivery:**
- `spec-plan` turns intent into execution strategy and pre-plan analysis
- `spec-tasks` creates bounded work units and confirms taskability/traceability

**Implementation & Quality:**
- `spec-implement` executes the planned tasks
- `spec-review` verifies the result against approved artifacts

## Safe Defaults

- If the system is unclear, run `/analyze`.
- If the spec still has blocking ambiguity, stay in `/spec-requirement`.
- If planning feels ambiguous, run `/spec-design`.
- If the spec is weak, do not continue past `/spec-review-requirements`.
- If implementation uncovers an upstream mistake, fix the right artifact first.
