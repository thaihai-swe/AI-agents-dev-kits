# Workflow Reference

Quick reference for workflow patterns. For detailed explanations of why the workflow is organized this way, see [How It Works](how%20it%20work.md).

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

## Quick Decision Rules

- Start with repo memory only when durable repository context is missing or outdated
- Use `analysis.md` for brownfield discovery and risk reduction
- Do not plan from a vague spec
- Use `design.md` only when it reduces planning ambiguity
- Make `plan.md` explicit enough that `spec-tasks` can break work down without inventing technical strategy
- Make `tasks.md` explicit enough that `spec-implement` can execute selected tasks without inventing missing scope, ordering, or validation
- Use `spec-implement` to execute the next unblocked task by default, and stop instead of coding through unresolved blockers
- Implement from `tasks.md`, not from vague chat intent
- Review implementation against approved artifacts, not against memory alone

## Workflow Patterns

### New Repository

```text
/constitution
/project-knowledge-base
```

### Minimal Localized Change

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

**Skip:** `/analyze`, `/spec-design`

### Brownfield Or Risky Change

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

**Include everything.** Investigation happens first.

### Bug Fix Or Regression

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

**Skip:** `/spec-design` (unless scope is ambiguous, then optionally add review)

---

## Visual Flow By Category

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

## Related Documentation

- [Essential explanations](how%20it%20work.md) - Why the workflow works this way
- [Practical guides](guides/getting-started.md) - How to get started
- [Command reference](reference/commands.md) - Details on each command
- [Full workflow example](WORKFLOW-EXAMPLE.md) - End-to-end example
