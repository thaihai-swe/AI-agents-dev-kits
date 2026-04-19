# New Feature Guide

## When To Use This Guide

Use this guide for a normal feature that introduces or changes user-visible behavior.

## Prerequisites

- a feature slug exists
- repo memory is available or can be created
- you know whether the current system needs investigation first

## Command Sequence

```text
/analyze                    (if needed)
/spec-requirement
/spec-review-requirements
/spec-design                (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
/spec-testing-scenarios     (optional manual test guide)
```

## Expected Artifacts

- `analysis.md` when the current system is unclear
- `spec.md` with clarified intent
- `requirements-review.md` with the readiness verdict
- optional `design.md`
- `plan.md` with pre-plan analysis and execution strategy
- `tasks.md` with bounded, traceable tasks
- optional `review.md`
- optional `testing-scenarios.md`

## Flow Guidance

### 1. Investigate only when needed

Use `/analyze` when the current behavior or boundaries are unclear.

### 2. Define the spec and resolve blocking clarification

Use `/spec-requirement` to:
- define users, problem, requirements, and acceptance criteria
- resolve blocking ambiguity before review

### 3. Run the readiness gate

Use `/spec-review-requirements` to judge whether planning is safe.

### 4. Add design only when planning needs it

Use `/spec-design` for cross-boundary changes, migrations, interface changes, or multiple viable approaches.

### 5. Build the plan

Use `/spec-plan` to make explicit:
- affected domains
- integration boundaries
- protected behavior
- validation strategy
- rollout and rollback thinking

### 6. Generate tasks

Use `/spec-tasks` to produce:
- review-sized implementation slices
- explicit dependencies
- validation notes
- full `REQ -> AC -> TASK -> validation` coverage

### 7. Implement and review

Implement from `tasks.md`, then verify against the approved artifacts.

### 8. Package manual testing when useful

Use `/spec-testing-scenarios` when testers, QA, or reviewers need a human-run guide grounded in delivered behavior.

## Stop Conditions

- unresolved blocking clarification in `spec.md`
- requirements review verdict is `not ready`
- design is required but missing
- plan is too vague to decompose safely

## If Blocked

- fix the spec, not the review
- fix the plan, not the task generator
- return to analysis if current-system facts are missing

## Example

See the [Canonical Feature Example](../examples/canonical-feature.md).
