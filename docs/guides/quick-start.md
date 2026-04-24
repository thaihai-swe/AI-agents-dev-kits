# Quick Start

## When To Use This Guide

Use this guide when you want the shortest safe path through the kit.

## Prerequisites

- repository has the shared workflow skills under `skills/`
- repo memory exists or you are ready to create it
- you have chosen a feature slug
- an agent entrypoint file such as `AGENTS.md` is in place when your client needs one

## Minimum Setup

The shortest safe starting point is:

```text
skills/
memories/repo/
artifacts/features/
AGENTS.md                 # or another client adapter entrypoint, when needed
```

If durable memory does not exist yet, start with:

```text
/constitution
/project-knowledge-base
```

## Command Sequence

### New repository setup

```text
/constitution
/project-knowledge-base
```

Expected artifacts:
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

### Most feature work

```text
/analyze                    (if current behavior is unclear)
/spec-requirement
/spec-review-requirements
/spec-design                (only when needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
/spec-testing-scenarios     (optional manual test guide)
```

Expected artifacts:
- `analysis.md` when discovery is needed
- `spec.md`
- `requirements-review.md`
- optional `design.md`
- `plan.md`
- `tasks.md`
- optional `review.md`
- optional `testing-scenarios.md`

## Stop Conditions

- stop in `spec-requirement` if blocking clarification remains
- stop after requirements review if verdict is `not ready`
- stop in `spec-plan` if the spec is still blocked or sequencing is unsafe
- stop in `spec-tasks` if the plan is not taskable

## If Blocked

- weak spec: return to `spec-requirement`
- technical ambiguity: add `spec-design`
- unclear current system: run `analyze`
- weak task list: improve `plan.md` before regenerating tasks
- weak completion evidence: return to `spec-implement` or `spec-review`

## Good Usage Pattern

- start with the skill that matches the current uncertainty
- rely on the current feature artifacts, not chat-history summaries
- stop and move backward when the current phase is blocked
- do not treat a plausible diff as completion without fresh verification

## Read Next

- [New Feature Guide](new-feature.md)
- [Decision Rules](decision-rules.md)
- [Bootstrap And Adoption](bootstrap-adoption.md)
- [Release Baseline Example](../examples/release-baseline.md)
