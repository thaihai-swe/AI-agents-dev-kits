---
name: kit-plan
description: Design the technical solution and sequence execution. This skill handles architectural design, implementation planning, task breakdown, and automated traceability from requirements to tasks.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Kit Plan

## Overview

Use this skill to create `design.md`, `plan.md`, and `tasks.md`.

It turns an approved spec into a concrete execution strategy.

## Read First

- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/requirements-review.md`
- `references/design-template.md`
- `references/plan-template.md`
- `references/tasks-template.md`

## When to Use

- Turn an approved `spec.md` into an implementation strategy.
- Refine a task list after design changes.
- Map requirements and acceptance criteria into execution tasks.

## Workflow

1. **Design (Optional):** If technical ambiguity exists, draft `design.md` to compare alternatives.
2. **Planning:** Create `plan.md` defining execution phases and technical approach.
3. **Tasking:** Decompose the plan into `tasks.md`. Tasks must be bounded and reviewable.
4. **Automated Traceability:** Verify that every `REQ-*` and `AC-*` from the spec maps to at least one task.

## Stop Conditions

- `spec.md` is missing or `requirements-review.md` is `not ready`.
- Technical constraints make the spec's goals impossible as stated.
- Sequencing depends on unresolved design choices.

## Core Rules

- **Stay Anchored:** Align strictly with the approved `spec.md`.
- **Phased Rollout:** Prefer reversible, phased changes over big-bang rewrites.
- **Validation-First:** Plan validation (tests, proofs) as part of the tasks.
- **Small Tasks:** Each task should ideally produce a reviewable diff.
- **Parallel Safety:** Mark tasks with `[P]` only if boundaries are truly independent.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "The implementer can figure out the rest." | Planning should remove core sequencing and approach ambiguity. |
| "Validation can be added later during coding." | Validation belongs inside the plan, not as cleanup. |

## Red Flags

- The plan is a vague brainstorm instead of an execution strategy.
- Parallel work is implied without clear ownership boundaries.

## Verification

Before finalizing the plan, verify:
- Each phase is actionable and sequenced for safe execution.
- Validation is embedded in the plan.
- Nothing in the plan requires implementation to invent core approach details.

## Output Rules

- Update only `design.md`, `plan.md`, and `tasks.md`.
- Do not update `spec.md`.
- Do not write code.
