# Supported Agents

This page explains how the kit maps onto common AI coding environments.

The kit is adapter-driven, not platform-specific. The workflow contract stays in `skills/`. Each environment gets a thin entrypoint that points back to the same repo memory and feature artifacts.

## Canonical Setup Model

Every supported environment should be taught the same core paths:

- `skills/`
- `memories/repo/`
- `artifacts/features/<slug>/`

Every supported environment should be taught the same habits:

- choose the matching existing skill before freeform work
- move backward when the current stage is blocked
- require fresh verification evidence before claiming completion

## Current Adapter Surface

| Environment | Primary entrypoint | What the adapter should do |
|---|---|---|
| Codex | `AGENTS.md` | Point to `skills/`, repo memory, artifacts, and slash aliases |
| Claude Code | `CLAUDE.md` and optional `.claude/commands/*` | Keep command wrappers thin and mapped to the existing skills |
| GitHub Copilot | `.github/copilot-instructions.md` and optional `.github/instructions/*` | Point back to the canonical workflow and avoid competing prompt systems |
| Other runtimes | repo-specific entrypoint | Reuse the same workflow contract and canonical paths |

## Public Command Surface

User-facing docs should stay on this slash-alias surface:

- `/constitution`
- `/project-knowledge-base`
- `/analyze`
- `/spec-requirement`
- `/spec-review-requirements`
- `/spec-design`
- `/spec-plan`
- `/spec-tasks`
- `/spec-implement`
- `/spec-review`
- `/spec-testing-scenarios`
- `/memory-promotion`
- `/task-traceability-audit`

Internal skill names such as `spec-review-implementation` are implementation details. They belong in maintainer docs, not in first-run user guidance.

## Thin Alias Rules

These aliases are wrappers around existing skills, not separate workflows:

- `/spec-review` -> `spec-review-implementation`
- `/memory-promotion` -> `memory-promotion`
- `/task-traceability-audit` -> `task-traceability-audit`

Do not introduce alternate command semantics per environment.

## What To Verify Before Release

- the adapter points to `skills/`, `memories/repo/`, and `artifacts/features/<slug>/`
- the public command names match the docs
- no environment is taught a competing workflow order
- bootstrap and onboarding docs describe the same baseline files the adapter expects
