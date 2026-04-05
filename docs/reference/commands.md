# Commands Reference

This is the current command set implemented by the files in [`.github/agents/`](../../.github/agents/).

## Current Commands

### Foundation

```text
/constitution
/project-knowledge-base
```

### Analysis, Specification, and Planning

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
```

### Execution and Review

```text
/spec-implement
/spec-review
```

## Command Details

### `/analyze`

- Agent file: `analyze.agent.md`
- Primary output: `artifacts/features/<slug>/analysis.md`
- Use when: the current system, risk, or constraints are not yet clear

Example:

```text
/analyze
Feature slug: magic-link-login

Investigate the current authentication flow, session handling, token usage, and email integration boundaries.
```

### `/constitution`

- Agent file: `constitution.agent.md`
- Primary output: `memories/repo/constitution.md`
- Use when: we need durable repo-wide rules, guardrails, or quality expectations

### `/project-knowledge-base`

- Agent file: `project-knowledge-base.agent.md`
- Primary output: `memories/repo/project-knowledge-base.md`
- Use when: we need to capture durable descriptive repository knowledge

### `/spec-requirement`

- Agent file: `spec-requirement.agent.md`
- Primary output: `artifacts/features/<slug>/spec.md`
- Use when: we need to define what should change and why

Example:

```text
/spec-requirement
Feature slug: magic-link-login

Create a feature specification for passwordless email login via one-time magic links.
```

### `/spec-review-requirements`

- Agent file: `spec-review-requirements.agent.md`
- Primary output: `artifacts/features/<slug>/requirements-review.md`
- Use when: we want an explicit readiness check before design or planning

### `/spec-design`

- Agent file: `spec-design.agent.md`
- Primary output: `artifacts/features/<slug>/design.md`
- Use when: planning depends on architecture, interface, migration, or integration decisions

### `/spec-plan`

- Agent file: `spec-plan.agent.md`
- Primary output: `artifacts/features/<slug>/plan.md`
- Use when: the feature intent is approved and we need execution sequencing

### `/spec-tasks`

- Agent file: `spec-tasks.agent.md`
- Primary output: `artifacts/features/<slug>/tasks.md`
- Use when: the plan is ready and we need bounded implementation tasks

### `/spec-implement`

- Agent file: `spec-implement.agent.md`
- Primary inputs: `spec.md`, `plan.md`, and `tasks.md`
- Use when: we are ready to execute one or more planned tasks

Example:

```text
/spec-implement
Feature slug: magic-link-login

Implement TASK-001 and TASK-002. Update task status and run the validation appropriate to the change.
```

### `/spec-review`

- Agent file: `spec-review.agent.md`
- Optional durable output: `artifacts/features/<slug>/review.md`
- Use when: we want to verify implementation against the intended artifacts and repo rules

## Recommended Sequences

### New Feature

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design        (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

### Localized Change

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

### Repo Setup

```text
/constitution
/project-knowledge-base
```
