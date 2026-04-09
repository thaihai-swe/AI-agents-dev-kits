# Canonical Feature Example

## Starting Context

Scenario: add passwordless email login via one-time magic links.

Feature slug:

```text
magic-link-login
```

Artifact folder:

```text
artifacts/features/magic-link-login/
```

## Flow

### 1. Analyze current behavior

Command:

```text
/analyze
Feature slug: magic-link-login

Investigate the current authentication flow, session handling, token-related code paths, and email integration boundaries.
```

Artifact created:
- `analysis.md`

Why:
- current auth behavior must be grounded before changing it

### 2. Write the spec and resolve clarification

Command:

```text
/spec-requirement
Feature slug: magic-link-login

Create a feature specification for passwordless login via one-time email magic links.
```

Artifact created:
- `spec.md`

What happens here:
- the user journey is defined
- requirements and acceptance criteria are written
- blocking clarification is resolved here, not during review
- only non-blocking open questions remain

### 3. Run the pure readiness gate

Command:

```text
/spec-review-requirements
Feature slug: magic-link-login
```

Artifact created:
- `requirements-review.md`

Typical outcome:
- verdict: `ready with minor issues`

Why:
- the review judges readiness
- it does not silently rewrite the spec

### 4. Add design when needed

Command:

```text
/spec-design
Feature slug: magic-link-login

Create a technical design for token issuance, verification, session creation, and email integration boundaries.
```

Artifact created:
- `design.md`

Why:
- the feature touches auth, tokens, and email integration

### 5. Build the plan

Command:

```text
/spec-plan
Feature slug: magic-link-login
```

Artifact created:
- `plan.md`

What the plan should make explicit:
- affected domains: auth, session, email delivery
- integration boundaries
- protected behavior: existing session semantics
- validation strategy
- rollout and rollback posture

### 6. Generate tasks

Command:

```text
/spec-tasks
Feature slug: magic-link-login
```

Artifact created:
- `tasks.md`

What must be true:
- tasks are review-sized
- validation is explicit
- `REQ -> AC -> TASK -> validation` is complete

### 7. Implement in bounded chunks

Command:

```text
/spec-implement
Feature slug: magic-link-login

Implement TASK-001 and TASK-002.
```

Artifacts updated:
- code and tests
- `tasks.md` status fields

### 8. Review delivered work

Command:

```text
/spec-review
Feature slug: magic-link-login
```

Optional durable artifact:
- `review.md`

What review checks:
- completeness
- correctness
- coherence

## Summary

This example shows the intended model:
- clarification in `spec-requirement`
- judgment in `spec-review-requirements`
- pre-plan analysis in `spec-plan`
- taskability and traceability in `spec-tasks`
- completeness/correctness/coherence in `spec-review`
