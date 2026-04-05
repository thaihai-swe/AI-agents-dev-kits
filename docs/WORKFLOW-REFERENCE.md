# Workflow Reference

## Current Visual Flow By Category

```text
┌─ FOUNDATION ────────────────┐
│ /constitution               │
│         ↓                   │
│ /project-knowledge-base     │
└─────────────────────────────┘
                ↓
┌─ DISCOVERY & ANALYSIS ──────┐
│ /analyze                    │
└─────────────────────────────┘
                ↓
┌─ SPECIFICATION & DESIGN ────┐
│ /spec-requirement           │
│         ↓                   │
│ /spec-review-requirements   │
│         ↓                   │
│ /spec-design  (when needed) │
└─────────────────────────────┘
                ↓
┌─ PLANNING & DELIVERY ───────┐
│ /spec-plan                  │
│         ↓                   │
│ /spec-tasks                 │
└─────────────────────────────┘
                ↓
┌─ IMPLEMENTATION & QUALITY ──┐
│ /spec-implement             │
│         ↓                   │
│ /spec-review                │
└─────────────────────────────┘
```

## Artifact Flow

```text
memories/repo/constitution.md
memories/repo/project-knowledge-base.md
        ↓
artifacts/features/<slug>/analysis.md
        ↓
artifacts/features/<slug>/spec.md
        ↓
artifacts/features/<slug>/requirements-review.md
        ↓
artifacts/features/<slug>/design.md        (optional)
        ↓
artifacts/features/<slug>/plan.md
        ↓
artifacts/features/<slug>/tasks.md
        ↓
implementation + validation
        ↓
artifacts/features/<slug>/review.md        (optional)
```

## Quick Rules

- Start with repo memory only when durable repository context is missing or outdated.
- Use `analysis.md` for brownfield discovery and risk reduction.
- Do not plan from a vague spec.
- Use `design.md` only when it reduces planning ambiguity.
- Implement from `tasks.md`, not from vague chat intent.
- Review implementation against approved artifacts, not against memory alone.

## Minimal Localized Change

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

## Brownfield Or Risky Change

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
