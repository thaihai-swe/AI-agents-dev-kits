# Release Baseline Example

## Purpose

This example is the release baseline for the kit.

It shows the minimum quality bar for:

- workflow sequencing
- artifact handoff
- stop conditions
- implementation verification

Use it when checking whether the kit is still coherent enough to release.

## Example Feature

Scenario: add passwordless email login via one-time magic links to an existing application.

Feature slug:

```text
magic-link-login
```

Why this is a good baseline:

- it is a real product feature, not a toy rename
- it is brownfield enough to require analysis
- it usually benefits from design
- it exercises spec, planning, tasks, implementation, review, and manual testing guidance

## Minimum Safe Setup

Repository shape:

```text
skills/
memories/repo/
artifacts/features/
```

Minimum durable memory:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Feature folder:

```text
artifacts/features/magic-link-login/
```

## Good Usage Pattern

Use prompts like these:

```text
/analyze
Feature slug: magic-link-login

Investigate the current authentication flow, session handling, token-related code paths, and email integration boundaries.
```

```text
/spec-requirement
Feature slug: magic-link-login

Create a feature specification for passwordless login via one-time email magic links.
```

```text
/spec-review-requirements
Feature slug: magic-link-login
```

```text
/spec-design
Feature slug: magic-link-login

Create a technical design for token issuance, verification, session creation, and email integration boundaries.
```

```text
/spec-plan
Feature slug: magic-link-login
```

```text
/spec-tasks
Feature slug: magic-link-login
```

```text
/spec-implement
Feature slug: magic-link-login

Implement the next unblocked task.
```

```text
/spec-review
Feature slug: magic-link-login
```

```text
/spec-testing-scenarios
Feature slug: magic-link-login
```

## Expected Artifact Flow

Expected outputs:

- `analysis.md` if current behavior needed investigation
- `spec.md`
- `requirements-review.md`
- optional `design.md`
- `plan.md`
- `tasks.md`
- optional `review.md`
- optional `testing-scenarios.md`

## What “Good Enough” Looks Like

### `analysis.md`

Good enough when:

- the current auth and email-related behavior is grounded in repository evidence
- observed facts and inferences are separated
- the next step is obvious

### `spec.md`

Good enough when:

- users, problem, scope, and outcomes are clear
- requirements are testable
- acceptance criteria are observable
- blocking clarification is resolved or explicitly called out

### `requirements-review.md`

Good enough when:

- the verdict is explicit
- blocking issues are separated from minor issues
- planning can safely proceed only when the verdict allows it

### `design.md`

Good enough when:

- major technical choices and tradeoffs are explicit
- interfaces and boundaries are understandable
- planning does not need to reopen core design questions

### `plan.md`

Good enough when:

- sequencing is explicit
- validation is embedded in the plan
- protected behavior, rollout, and rollback are proportional to risk

### `tasks.md`

Good enough when:

- tasks are bounded and reviewable
- validation work is explicit
- `[P]` appears only on truly independent work
- `REQ -> AC -> TASK -> validation` is intact

### Implementation

Good enough when:

- work follows the selected task scope
- behavior changes are verified with targeted tests first when practical
- task status reflects reality
- completion claims are backed by fresh verification evidence

### Review

Good enough when:

- the verdict is evidence-based
- weak or stale verification is treated as a real issue
- misleading task state is called out when present

## Stop Conditions In This Example

Stop and go backward when:

- analysis still leaves the current behavior too unclear to specify
- requirements review says `not ready`
- design is required but missing
- plan sequencing is still unsafe
- tasks are too vague to execute without guessing
- implementation reveals that the selected task is broader than the artifact says
- review finds missing evidence for claimed completion

## Release Use

Before shipping the kit, use this example to sanity-check:

- onboarding docs
- command mapping docs
- skill boundaries
- artifact expectations
- implementation and review discipline
