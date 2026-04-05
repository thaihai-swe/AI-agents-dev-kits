# Terminology

## Agent

A specialized workflow definition stored in `.github/agents/*.agent.md`.

Example: `spec-requirement.agent.md` creates or refines `spec.md`.

## Command

The slash command used to invoke an agent.

Examples:

- `/spec-requirement`
- `/spec-plan`
- `/spec-implement`

## Repo Memory

Durable repository context stored under `memories/repo/`.

Current files:

- `constitution.md`
- `project-knowledge-base.md`

## Constitution

The normative repo-memory document. It stores durable rules, guardrails, and quality expectations.

## Project Knowledge Base

The descriptive repo-memory document. It stores durable system knowledge, subsystem boundaries, integration notes, and recurring implementation patterns.

## Feature Artifact

A document stored under `artifacts/features/<slug>/` that captures part of one feature workflow.

Current artifact types:

- `analysis.md`
- `spec.md`
- `requirements-review.md`
- `design.md`
- `plan.md`
- `tasks.md`
- `review.md`

## Analysis

A bounded investigation artifact used to capture observed facts, risks, unknowns, and recommended next steps before committing to specification or implementation.

## Specification

The statement of what should change and why. Stored as `spec.md`.

## Requirements Review

The explicit readiness check for `spec.md`. Stored as `requirements-review.md`.

## Design

The technical explanation of how a feature should work when planning depends on architectural clarification. Stored as `design.md`.

## Plan

The execution strategy for a feature. It covers sequencing, dependencies, validation, and risk handling. Stored as `plan.md`.

## Tasks

The bounded execution units derived from the plan. Stored as `tasks.md`.

## Review

The implementation verification step that checks delivered work against approved artifacts. A durable written review may be stored as `review.md`.

## Brownfield

Work in an existing system where current behavior, integration boundaries, or risks are not fully understood yet. In the current model, brownfield discovery is handled through `analysis.md`.

## Retired Terms

These terms appeared in older docs but are not part of the current agent set:

- `/discover`
- `/architecture`
- `/patterns`
- `/archive`

Their responsibilities are now covered by `analysis.md`, `constitution.md`, and `project-knowledge-base.md`.
