# Overview

## What This Kit Is

The AI Agents Development Kit is a documentation and workflow kit for structured AI-assisted software development.

It is not an application. It is a way to organize:
- durable repository knowledge
- feature-specific artifacts
- quality gates
- portable workflow skills

## Why It Exists

AI-assisted work often fails in the same ways:
- decisions stay in chat instead of artifacts
- work becomes hard to review or resume
- scope drifts quietly during implementation
- teams cannot trace intent to code

This kit solves that by making artifacts the source of truth.

## Core Principles

- Artifacts first: important decisions are written down
- Clarify before judging: `spec-requirement` resolves blocking ambiguity
- Review before committing downstream work
- Keep repo memory durable and compact
- Keep feature work local to one feature folder
- Preserve `REQ -> AC -> TASK -> validation` traceability

## Core Building Blocks

### Repo Memory

Shared, durable context lives in `memories/repo/`:
- `constitution.md` for rules
- `project-knowledge-base.md` for durable descriptive context

### Feature Artifacts

Per-feature work lives in `artifacts/features/<slug>/`:
- `analysis.md`
- `spec.md`
- `requirements-review.md`
- `design.md`
- `plan.md`
- `tasks.md`
- `review.md`
- `testing-scenarios.md`

### Skills

Skills define workflow behavior under `skills/`.
Each skill provides the reusable contract for one workflow step and may bundle `references/` files for heavier structural guidance.

## What This Kit Is Not

- not a replacement for engineering judgment
- not a no-process shortcut
- not a giant memory bank for every fact discovered
- not a reason to skip tests, review, or rollout thinking

## Read Next

- [Workflow Model](workflow-model.md)
- [Artifact Model](artifact-model.md)
- [Quick Start](../guides/quick-start.md)
