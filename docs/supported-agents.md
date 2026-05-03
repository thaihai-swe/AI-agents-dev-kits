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

| Environment | Primary entrypoint | Checked-in example | What the adapter should do |
|---|---|---|---|
| Codex | `AGENTS.md` | `adapters/AGENTS.example.md` | Point to `skills/`, repo memory, artifacts, and slash aliases |
| Claude Code | `CLAUDE.md` and optional `.claude/commands/*` | `adapters/CLAUDE.example.md` | Keep command wrappers thin and mapped to the existing skills |
| GitHub Copilot | `.github/copilot-instructions.md` and optional `.github/instructions/*` | `adapters/copilot-instructions.example.md` | Point back to the canonical workflow and avoid competing prompt systems |
| Gemini CLI | `GEMINI.md` | `adapters/GEMINI.example.md` | Keep the root context file thin and point back to the same workflow |
| Other runtimes | repo-specific entrypoint | start from `adapters/AGENTS.example.md` | Reuse the same workflow contract and canonical paths |

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

Internal skill IDs are implementation details. They belong in maintainer docs or thin adapter wrappers only when explicit mapping is necessary.

## Thin Alias Rules

These aliases are wrappers around existing skills, not separate workflows:

- `/spec-review` is the public command for implementation review
- `/memory-promotion` and `/task-traceability-audit` are already the public skill names

Do not introduce alternate command semantics per environment.

## Support Claim Rule

Do not claim a runtime is supported unless this repository ships:

- one checked-in starter adapter for that runtime
- docs that explain its entrypoint shape
- release verification that checks the adapter still points to the canonical workflow

## What To Verify Before Release

- the adapter points to `skills/`, `memories/repo/`, and `artifacts/features/<slug>/`
- the public command names match the docs
- no environment is taught a competing workflow order
- bootstrap and onboarding docs describe the same baseline files the adapter expects
- every claimed runtime still has a checked-in example adapter
