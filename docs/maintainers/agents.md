# Agents

## Purpose

This page explains which agent owns which part of the workflow.

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

## Key Contracts

- `spec-requirement` owns clarification during spec authoring
- `spec-review-requirements` is a pure readiness gate
- `spec-plan` owns pre-plan analysis and execution strategy
- `spec-tasks` owns taskability and traceability coverage
- `spec-review` owns completeness, correctness, and coherence review

## Source Of Truth

Use `.github/agents/` as the canonical contract.
