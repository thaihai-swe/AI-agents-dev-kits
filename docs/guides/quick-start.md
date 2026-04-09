# Quick Start

## When To Use This Guide

Use this guide when you want the shortest safe path through the kit.

## Prerequisites

- repository has `.github/copilot-instructions.md`
- repo memory exists or you are ready to create it
- you have chosen a feature slug

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
```

Expected artifacts:
- `analysis.md` when discovery is needed
- `spec.md`
- `requirements-review.md`
- optional `design.md`
- `plan.md`
- `tasks.md`
- optional `review.md`

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

## Read Next

- [New Feature Guide](new-feature.md)
- [Decision Rules](decision-rules.md)
