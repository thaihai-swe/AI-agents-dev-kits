# Memory System

The current workflow keeps durable memory intentionally small.

## Repo Memory

Repo memory lives in:

```text
memories/repo/constitution.md
memories/repo/project-knowledge-base.md
```

### `constitution.md`

Stores durable repo-wide rules:

- testing expectations
- compatibility rules
- migration safety requirements
- architecture guardrails
- review or release constraints
- AI agent operating constraints

This artifact is normative:

- it defines what future work should follow by default
- it should use durable rule identifiers when the repo adopts them
- it should not be used for descriptive repository notes or one-off feature policy

### `project-knowledge-base.md`

Stores durable descriptive context:

- subsystem boundaries
- integration seams
- recurring implementation patterns
- stable testing patterns
- durable brownfield watchouts

## What Changed

Older docs described a broader memory model that depended on separate discovery, architecture, pattern, and archive commands. The current codebase consolidates that approach.

Now:

- bounded discovery belongs in `analysis.md`
- durable rules belong in `constitution.md`
- durable descriptive knowledge belongs in `project-knowledge-base.md`

## When To Update Repo Memory

Update repo memory only when the information is:

- durable across future work
- grounded in repository evidence
- useful beyond a single feature

Do not promote temporary findings or feature-specific decisions into repo memory.
Do not let `project-knowledge-base.md` override constitutional rules; descriptive memory must remain subordinate to normative policy.

## Relationship To Feature Artifacts

Repo memory helps every feature.

Feature artifacts help one feature:

- `analysis.md`
- `spec.md`
- `requirements-review.md`
- `design.md`
- `plan.md`
- `tasks.md`
- `review.md`

That separation keeps durable knowledge compact and feature work bounded.
