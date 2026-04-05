# Quality Gates

The current workflow has two explicit quality checkpoints across different categories.

## `/spec-review-requirements` (Specification & Design Category)

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

## `/spec-review` (Implementation & Quality Category)

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
SPECIFICATION & DESIGN:
/spec-requirement
    ↓
/spec-review-requirements  ← First quality gate
    ↓
/spec-design
    ↓

PLANNING & DELIVERY:
/spec-plan
    ↓
/spec-tasks
    ↓

IMPLEMENTATION & QUALITY:
/spec-implement
    ↓
/spec-review  ← Second quality gate
```

Run `/spec-review-requirements` before committing to plan. Run `/spec-review` after implementation to verify the work matched intent.
