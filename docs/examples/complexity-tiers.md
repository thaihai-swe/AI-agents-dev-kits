# Complexity Tier Examples

## Purpose

This page helps you choose the right workflow depth for the size and risk of the change.

## Tier 1: Tiny Change

Use when:

- the change is very small
- current behavior is already well understood
- the spec is obviously complete and low-risk

Typical flow:

```text
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Example:

- [Tiny Change Example](tiny-change-example.md)

## Tier 2: Standard Feature

Use when:

- the change is meaningful
- user-visible behavior changes
- normal planning and review gates are warranted

Typical flow:

```text
/analyze                    (if needed)
/spec-requirement
/spec-review-requirements
/spec-design                (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Example:

- [Canonical Feature Example](canonical-feature.md)

## Tier 3: Bug Fix Or Regression Repair

Use when:

- the goal is to restore correct behavior
- current behavior needs investigation
- scope should stay tight

Typical flow:

```text
/analyze
/spec-requirement
/spec-review-requirements   (only when needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Example:

- [Bug Fix Example](bug-fix-example.md)

## Tier 4: Brownfield Or High-Risk Change

Use when:

- current behavior is unclear
- hidden dependencies or legacy seams matter
- design or protection work is likely needed

Typical flow:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design                (often needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Example:

- [Brownfield Example](brownfield-example.md)

## Escalation Rule

Start with the lightest workflow that is still safe.

Escalate to the next tier immediately when:

- current behavior is less clear than expected
- scope is broader than first assumed
- requirements are not obviously complete
- interfaces, migrations, or cross-boundary concerns appear
- the plan cannot be sequenced safely
- tasks are not decomposable without inventing missing strategy

## Read Next

- [Decision Rules](../guides/decision-rules.md)
- [Full Skill Workflow Example](full-skill-workflow.md)
