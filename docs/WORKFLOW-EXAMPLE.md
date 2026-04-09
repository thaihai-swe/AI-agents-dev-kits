# Workflow Example

This is an end-to-end example using the current 10-agent workflow.

## Scenario

Feature: add email login with a one-time magic link.

Feature slug:

```text
magic-link-login
```

Artifact folder:

```text
artifacts/features/magic-link-login/
```

In this repository, `artifacts/features/` is the canonical workflow path for feature artifacts even though the kit itself also keeps separate support materials under directories such as `artifacts/analysis/` and `artifacts/enhancements/`.

## 0. Initialize Repo Memory

Use these only when repo memory is missing or needs durable updates.

### `/constitution`

```text
/constitution

Review the repository and maintain durable delivery rules, testing expectations, compatibility rules, and safety guardrails.
```

Output:

```text
memories/repo/constitution.md
```

### `/project-knowledge-base`

```text
/project-knowledge-base

Review the repository and maintain durable descriptive knowledge about subsystem boundaries, integrations, testing patterns, and stable watchouts.
```

Output:

```text
memories/repo/project-knowledge-base.md
```

## 1. Analyze The Existing System

```text
/analyze
Feature slug: magic-link-login

Investigate the current authentication flow, session handling, token-related code paths, and email integration boundaries. Produce a bounded analysis artifact for this feature.
```

Output:

```text
artifacts/features/magic-link-login/analysis.md
```

Likely findings:

- current login is email and password based
- reset-token logic may inform one-time token handling
- successful login still needs to produce the existing session behavior
- email delivery already has a stable integration seam

## 2. Write The Specification

```text
/spec-requirement
Feature slug: magic-link-login

Create a feature specification for passwordless login via one-time email magic links.
```

Output:

```text
artifacts/features/magic-link-login/spec.md
```

Typical contents:

- summary
- problem
- goals
- non-goals
- current context
- requirements
- acceptance criteria
- constraints
- risks and open questions

## 3. Review Requirements Before Planning

```text
/spec-review-requirements
Feature slug: magic-link-login

Review the specification for clarity, completeness, scope control, and testability before planning starts.
```

Output:

```text
artifacts/features/magic-link-login/requirements-review.md
```

Typical result:

- verdict: `ready with minor issues`
- unresolved detail: how unknown emails should be handled in the UX
- unresolved detail: exact token expiry duration

## 4. Add Design If The Change Is Cross-Cutting

```text
/spec-design
Feature slug: magic-link-login

Create a technical design for token issuance, token validation, session creation, and email integration boundaries.
```

Output:

```text
artifacts/features/magic-link-login/design.md
```

## 5. Plan The Delivery

```text
/spec-plan
Feature slug: magic-link-login

Create an implementation plan from the approved feature artifacts.
```

Output:

```text
artifacts/features/magic-link-login/plan.md
```

Typical phases:

- add token persistence and expiry rules
- add request endpoint and rate-limit considerations
- send magic-link email
- verify token and create session
- add validation coverage and rollout checks

## 6. Break The Plan Into Tasks

```text
/spec-tasks
Feature slug: magic-link-login

Break the plan into bounded, reviewable tasks with dependencies and validation notes.
```

Output:

```text
artifacts/features/magic-link-login/tasks.md
```

Example tasks:

- `TASK-001` add magic-link token model and storage
- `TASK-002` implement request endpoint
- `TASK-003` implement email delivery integration
- `TASK-004` implement verification endpoint and session creation
- `TASK-005` add automated validation for success, expiry, and replay

## 7. Implement In Bounded Chunks

```text
/spec-implement
Feature slug: magic-link-login

Implement TASK-001 and TASK-002. Keep the work scoped to the selected tasks, update task status, and run the appropriate validation.
```

Then continue with later tasks in follow-up runs of `/spec-implement`.

## 8. Review The Delivered Work

```text
/spec-review
Feature slug: magic-link-login

Review the implementation against the specification, plan, tasks, and repository quality expectations.
```

Optional durable output:

```text
artifacts/features/magic-link-login/review.md
```

## Summary Flow

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```
