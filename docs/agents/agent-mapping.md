# Agent Mapping

This page shows how the 10 agents depend on each other, what artifacts they produce, and how work flows through the system.

## Category-Based Flow

```text
┌─ FOUNDATION ─────────────────────────┐
│ /constitution                         │
│         ↓                             │
│ /project-knowledge-base               │
└───────────────────────────────────────┘
                ↓
┌─ DISCOVERY & ANALYSIS ────────────────┐
│ /analyze                              │
└───────────────────────────────────────┘
                ↓
┌─ SPECIFICATION & DESIGN ──────────────┐
│ /spec-requirement                     │
│         ↓                             │
│ /spec-review-requirements             │
│         ↓                             │
│ /spec-design (when needed)            │
└───────────────────────────────────────┘
                ↓
┌─ PLANNING & DELIVERY ─────────────────┐
│ /spec-plan                            │
│         ↓                             │
│ /spec-tasks                           │
└───────────────────────────────────────┘
                ↓
┌─ IMPLEMENTATION & QUALITY ────────────┐
│ /spec-implement                       │
│         ↓                             │
│ /spec-review                          │
└───────────────────────────────────────┘
```

- **Foundation:** Establishes durable context; run first for new repos
- **Discovery & Analysis:** Investigates unclear systems or risks
- **Specification & Design:** Defines what to build, resolves blocking clarification, and shapes technical approach
- **Planning & Delivery:** Creates execution strategy, pre-plan analysis, and bounded tasks
- **Implementation & Quality:** Builds code and verifies against artifacts

## Artifact Dependencies

```text
analysis.md
    ↓ informs
spec.md
    ↓ clarified by
clarification pass in spec-requirement
    ↓ reviewed by
requirements-review.md
    ↓ gates
design.md (optional)
    ↓ informs
plan.md
    ↓ expands into
tasks.md
    ↓ drives
implementation
    ↓ checked by
review.md (optional)
```

## Responsibility Split

- `/analyze` captures observed facts, risks, and next-step guidance
- `/spec-requirement` defines what should change and why, and resolves blocking clarification
- `/spec-review-requirements` checks whether the spec is safe to use downstream
- `/spec-design` resolves technical ambiguity before planning
- `/spec-plan` defines pre-plan analysis, sequencing, dependencies, validation, rollout, and rollback
- `/spec-tasks` creates bounded implementation units and enforces taskability/traceability expectations
- `/spec-implement` changes code and validation while staying traceable to tasks
- `/spec-review` evaluates whether the implementation matched the intended change

## Retired Responsibilities

In the older docs, these responsibilities were separate:

- discovery
- architecture capture
- patterns capture
- archive or memory promotion

In the current model:

- discovery is folded into `analysis.md`
- durable architecture and pattern knowledge belongs in `project-knowledge-base.md`
- durable rules belong in `constitution.md`

## Practical Mapping

| Situation                  | Start With                  | Likely Next                 |
| -------------------------- | --------------------------- | --------------------------- |
| New repo                   | `/constitution`             | `/project-knowledge-base`   |
| Brownfield feature         | `/analyze`                  | `/spec-requirement`         |
| Clear new feature          | `/spec-requirement`         | `/spec-review-requirements` |
| Cross-cutting change       | `/spec-review-requirements` | `/spec-design`              |
| Ready to execute           | `/spec-plan`                | `/spec-tasks`               |
| Coding against a task list | `/spec-implement`           | `/spec-review`              |
