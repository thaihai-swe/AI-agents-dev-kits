# Workflow Ownership

## Purpose

This page explains which skill owns which part of the workflow.

## Workflow Ownership

- `/constitution` -> `constitution.md`
- `/project-knowledge-base` -> `project-knowledge-base.md`
- `/analyze` -> `analysis.md`
- `/spec-requirement` -> `spec.md`
- `/spec-review-requirements` -> `requirements-review.md`
- `/spec-design` -> `design.md`
- `/spec-plan` -> `plan.md`
- `/spec-tasks` -> `tasks.md`
- `/spec-implement` -> implementation and task status updates
- `/spec-review` -> implementation review findings
  Skill: `spec-review-implementation`

Helper skills used across the workflow:
- `memory-promotion` -> durable-memory promotion decisions
- `task-traceability-audit` -> `REQ -> AC -> TASK -> validation` coverage checks

## Key Contracts

- `spec-requirement` owns clarification during spec authoring
- `spec-review-requirements` is a pure readiness gate
- `spec-plan` owns pre-plan analysis and execution strategy
- `spec-tasks` owns taskability and traceability coverage
- `spec-review-implementation` owns completeness, correctness, and coherence review

## Source Of Truth

Use `skills/` as the canonical workflow contract.
