# Brownfield Change Guide

## When To Use This Guide

Use this guide when you are changing an existing system with unclear behavior, hidden dependencies, or legacy constraints.

## Prerequisites

- a feature slug exists
- current behavior is not fully trusted or understood

## Command Sequence

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design                (when needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

## Expected Artifacts

- `analysis.md` with bounded discovery
- `spec.md`
- `requirements-review.md`
- optional `design.md`
- `plan.md`
- `tasks.md`
- optional `review.md`

## Flow Guidance

### 1. Start with analysis

Use `/analyze` to capture:
- current behavior
- integration boundaries
- known risks
- recommended next steps

### 2. Write the spec from evidence

Use the findings from `analysis.md` to make the spec grounded instead of speculative.

### 3. Plan with explicit protection

The plan should call out:
- affected domains
- legacy integration seams
- protected behavior that must not regress

### 4. Task for safe execution

Tasks should include validation or safeguards for regression-sensitive behavior.

## Stop Conditions

- analysis still leaves critical unknowns unresolved
- the spec invents behavior not supported by the investigation
- the plan ignores legacy constraints

## If Blocked

- extend or rerun analysis with narrower questions
- add `spec-design` if the brownfield constraints create architectural ambiguity

## Example

See the [Brownfield Example](../examples/brownfield-example.md).
