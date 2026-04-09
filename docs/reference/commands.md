# Commands Reference

This is the current command set implemented by the files in [`.github/agents/`](../../.github/agents/), organized into 5 categories.

## Current Commands

### Foundation

```text
/constitution
/project-knowledge-base
```

### Discovery & Analysis

```text
/analyze
```

### Specification & Design

```text
/spec-requirement
/spec-review-requirements
/spec-design
```

### Planning & Delivery

```text
/spec-plan
/spec-tasks
```

### Implementation & Quality

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
- Use when: we need durable repo-wide rules, guardrails, quality gates, or AI operating constraints that should govern future work by default

### `/project-knowledge-base`

- Agent file: `project-knowledge-base.agent.md`
- Primary output: `memories/repo/project-knowledge-base.md`
- Use when: we need to capture durable descriptive repository knowledge

### `/spec-requirement`

- Agent file: `spec-requirement.agent.md`
- Primary output: `artifacts/features/<slug>/spec.md`
- Use when: we need to define what should change, why it matters, and resolve blocking ambiguity before requirements review

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
- Use when: the feature intent is approved and clarified, and we need pre-plan analysis, technical approach, sequencing, dependencies, validation, and rollout strategy defined clearly enough for task generation

### `/spec-tasks`

- Agent file: `spec-tasks.agent.md`
- Primary output: `artifacts/features/<slug>/tasks.md`
- Use when: the plan is ready and we need phased, traceable, implementation-ready task slices with explicit dependencies, validation notes, and a final taskability/traceability check

### `/spec-implement`

- Agent file: `spec-implement.agent.md`
- Primary inputs: `spec.md`, `plan.md`, and `tasks.md`
- Use when: we are ready to execute the next unblocked planned task or a specifically selected set of tasks, with status updates and validation evidence

Example:

```text
/spec-implement
Feature slug: magic-link-login

Implement TASK-001 and TASK-002. Update task status and run the validation appropriate to the change.
```

### `/spec-review`

- Agent file: `spec-review.agent.md`
- Optional durable output: `artifacts/features/<slug>/review.md`
- Use when: we want the implementation quality gate to verify delivered work against approved artifacts, validation evidence, task state, and repository rules
- Core review lenses: completeness, correctness, and coherence

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
