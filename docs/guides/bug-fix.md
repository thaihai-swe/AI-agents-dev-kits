# Bug Fix Guide

## When To Use This Guide

Use this guide for a bug or regression where the goal is to restore correct behavior.

## Prerequisites

- a bug or regression is observable
- a feature slug exists

## Command Sequence

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Add `/spec-review-requirements` when:
- scope boundaries are unclear
- the fix changes user-visible behavior
- the bug definition itself is ambiguous

Add `/spec-design` when the fix needs technical clarification.

## Expected Artifacts

- `analysis.md`
- `spec.md`
- optional `requirements-review.md`
- optional `design.md`
- `plan.md`
- `tasks.md`
- optional `review.md`

## Flow Guidance

### 1. Confirm current behavior

Use `/analyze` to verify:
- what is happening now
- what should have happened instead
- where the likely failure boundary is

### 2. Define the fix

Use `/spec-requirement` to write the intended corrected behavior and success criteria.

### 3. Plan narrowly

Use `/spec-plan` to keep the plan tightly scoped to the fix and regression coverage.

### 4. Task the fix

Use `/spec-tasks` to produce small repair-oriented tasks with explicit validation.

## Stop Conditions

- the current behavior is still not well understood
- the bug report is actually a broader feature request
- the fix requires broader architectural design than expected

## If Blocked

- return to `/analyze`
- widen the scope explicitly in `spec.md` instead of letting the fix drift silently

## Example

See the [Bug Fix Example](../examples/bug-fix-example.md).
