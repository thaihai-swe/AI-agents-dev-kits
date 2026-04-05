# Quality Gates

The current workflow has two explicit quality checkpoints.

## `/spec-review-requirements`

Checks whether `spec.md` is good enough for downstream work.

Primary output:

```text
artifacts/features/<slug>/requirements-review.md
```

What it looks for:

- missing requirements
- vague acceptance criteria
- hidden assumptions
- scope leaks
- blocking ambiguity

## `/spec-review`

Checks whether the delivered implementation matches the approved artifacts and repo expectations.

Optional durable output:

```text
artifacts/features/<slug>/review.md
```

What it looks for:

- requirement coverage
- validation quality
- quality and safety issues
- scope drift
- regressions or follow-up work

## Working Pattern

```text
/spec-requirement
    ↓
/spec-review-requirements
    ↓
/spec-plan
    ↓
/spec-tasks
    ↓
/spec-implement
    ↓
/spec-review
```
