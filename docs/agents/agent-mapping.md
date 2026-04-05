# Agent Mapping

This is the current dependency map for the 10-agent system.

## Repo-Level Flow

```text
/constitution
        ↓
/project-knowledge-base
```

- `constitution.md` is normative
- `project-knowledge-base.md` is descriptive

## Feature-Level Flow

```text
/analyze
    ↓
/spec-requirement
    ↓
/spec-review-requirements
    ↓
/spec-design        (when needed)
    ↓
/spec-plan
    ↓
/spec-tasks
    ↓
/spec-implement
    ↓
/spec-review
```

## Artifact Dependencies

```text
analysis.md
    ↓ informs
spec.md
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
- `/spec-requirement` defines what should change and why
- `/spec-review-requirements` checks whether the spec is safe to use downstream
- `/spec-design` resolves technical ambiguity before planning
- `/spec-plan` defines sequencing, dependencies, validation, rollout, and rollback
- `/spec-tasks` creates bounded implementation units
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

| Situation | Start With | Likely Next |
| --- | --- | --- |
| New repo | `/constitution` | `/project-knowledge-base` |
| Brownfield feature | `/analyze` | `/spec-requirement` |
| Clear new feature | `/spec-requirement` | `/spec-review-requirements` |
| Cross-cutting change | `/spec-review-requirements` | `/spec-design` |
| Ready to execute | `/spec-plan` | `/spec-tasks` |
| Coding against a task list | `/spec-implement` | `/spec-review` |
