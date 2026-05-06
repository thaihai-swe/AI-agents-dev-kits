---
name: kit-spec
description: Define the "What & Why" of a feature. This skill handles specification authoring, Socratic refinement to resolve ambiguity, and a built-in readiness review to ensure requirements are testable and complete before planning.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Kit Spec

## Overview

Use this skill to create or refine `artifacts/features/<slug>/spec.md` and `requirements-review.md`.

It owns:
1. **Socratic Refinement:** Asking clarifying questions to eliminate ambiguity.
2. **Specification Authoring:** Defining users, problems, scenarios, and acceptance criteria.
3. **Readiness Review:** Judging if the spec is ready for design or planning.

## Read First

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `artifacts/features/<slug>/analysis.md`
- `references/spec-template.md`
- `references/requirements-review-template.md`

## When to Use

- Define a new feature or change request.
- Refine an existing `spec.md`.
- Resolve product ambiguity before design or planning.

## Workflow

1. **Clarification (Socratic Wave):** Before drafting, if the request is vague, you **must** ask 3-5 targeted clarifying questions.
2. **Authoring:** Draft `spec.md` focusing on *what* and *why*, not how.
3. **Self-Review:** Create `requirements-review.md`. If the verdict is `not ready`, iterate on the spec before stopping.
4. **Locking:** Once `ready`, state that the spec is locked for planning.

## Stop Conditions

- Product ambiguity is too high to define outcomes.
- User answers to Socratic questions are still contradictory.
- Multiple materially different product directions remain unresolved.

## Core Rules

- **What, not How:** Avoid prescribing technical solutions in the spec.
- **Testable AC:** Every acceptance criterion must be observable by a reviewer.
- **Scope Control:** Decompose oversized requests into smaller feature specs.
- **Spec-Anchored:** The `spec.md` is the source of truth. If requirements change during implementation, you must return to this skill first.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "We can lock requirements and fill in the product gaps later." | Unresolved product ambiguity leaks downstream into design and planning. |
| "A big umbrella spec is faster." | Oversized specs hide scope decisions and make review weaker. |

## Red Flags

- The spec reads like a design or task list.
- Acceptance criteria are not observable by a reviewer.

## Verification

Before finalizing the spec, verify:
- No placeholder text remains.
- Requirements do not contradict each other or the stated outcomes.
- Acceptance criteria are concrete enough for a reviewer to verify.

## Output Rules

- Update only `spec.md` and `requirements-review.md`.
- Do not create `design.md`, `plan.md`, or `tasks.md`.
