# Agent Command Reference

Complete reference for all 10 agents organized by category. Each agent has a specific role in the workflow.

## Foundation

### `/constitution`

- Agent file: `constitution.agent.md`
- Output: `memories/repo/constitution.md`
- Use for: durable repo-wide rules

### `/project-knowledge-base`

- Agent file: `project-knowledge-base.agent.md`
- Output: `memories/repo/project-knowledge-base.md`
- Use for: durable descriptive repository context

## Discovery & Analysis

### `/analyze`

- Agent file: `analyze.agent.md`
- Output: `artifacts/features/<slug>/analysis.md`
- Use for: brownfield discovery, bug investigation, risk clarification

## Specification & Design

### `/spec-requirement`

- Agent file: `spec-requirement.agent.md`
- Output: `artifacts/features/<slug>/spec.md`
- Use for: defining what should change and why, and resolving blocking clarification before review

### `/spec-review-requirements`

- Agent file: `spec-review-requirements.agent.md`
- Output: `artifacts/features/<slug>/requirements-review.md`
- Use for: checking whether `spec.md` is ready for downstream work

### `/spec-design`

- Agent file: `spec-design.agent.md`
- Output: `artifacts/features/<slug>/design.md`
- Use for: technical clarification before planning

## Planning & Delivery

### `/spec-plan`

- Agent file: `spec-plan.agent.md`
- Output: `artifacts/features/<slug>/plan.md`
- Use for: pre-plan analysis, execution sequencing, validation strategy, and risk handling

### `/spec-tasks`

- Agent file: `spec-tasks.agent.md`
- Output: `artifacts/features/<slug>/tasks.md`
- Use for: bounded, reviewable implementation units with final taskability and traceability checks

## Implementation & Quality

### `/spec-implement`

- Agent file: `spec-implement.agent.md`
- Uses: `spec.md`, `plan.md`, and `tasks.md`
- Use for: executing one or more selected tasks

### `/spec-review`

- Agent file: `spec-review.agent.md`
- Optional durable output: `artifacts/features/<slug>/review.md`
- Use for: implementation verification against approved artifacts

## Canonical Feature Sequence

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
