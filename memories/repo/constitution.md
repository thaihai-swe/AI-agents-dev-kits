# Project Constitution

Version: 1.0.0
Last updated: 2026-05-01

## Purpose

This document defines the durable repo-wide rules for maintaining and releasing the AI Agents Development Kit.

It governs how workflow contracts, docs, adapters, scripts, and repo memory must stay aligned across future changes.

## Scope

- Applies to the entire repository, including `skills/`, `docs/`, `adapters/`, `memories/`, `scripts/`, `README.md`, and `AGENTS.md`.
- Applies to maintainers and contributors changing workflow behavior, onboarding, release checks, or repository memory.
- Overrides ad hoc wording in downstream docs when a workflow or release rule conflicts with this file.

## Core Principles

- CC-001 Skills own the workflow contract.
  Why it matters: `skills/*/SKILL.md` and their bundled references are the authoritative source for workflow semantics, stage boundaries, and cross-skill routing.
- CC-002 The kit is artifact-first and adapter-thin.
  Why it matters: durable behavior belongs in skills, repo memory, and feature artifacts; adapters and user docs should point back to that contract instead of recreating it.
- CC-003 Release claims require fresh evidence.
  Why it matters: a coherent-looking diff is not enough for a workflow kit; maintainers must verify the shipped adoption path and consistency gates before publishing.

## Delivery Rules

- CC-101 Update the owning skill first when workflow behavior changes, then align references, docs, adapters, scripts, and memory in the same change.
- CC-102 Preserve current skill names, artifact names, verdict names, task-state names, and canonical memory paths unless the repository is intentionally making a coordinated contract change.
- CC-103 Keep maintenance diffs surgical. Do not mix unrelated cleanup, formatting churn, or speculative workflow expansion into release-hardening changes.

## Quality And Validation Gates

- CC-201 Any change affecting workflow, onboarding, adapters, bootstrap, or repo memory must pass `bash scripts/check-kit-consistency.sh`.
- CC-202 Any release-affecting change must be validated against at least one fresh dry run of the documented adoption path, not only against the current repo state.
- CC-203 Shipped repo memory for this repository must contain concrete repository-specific content. Starter placeholders may live in templates and bootstrap output, not in the canonical repo memory checked into this repository.

## Architectural Guardrails

- CC-301 `skills/*/SKILL.md` and `skills/*/references/*` are the canonical workflow contract; docs may explain them, but may not compete with them.
- CC-302 `docs/` explains the workflow for humans, `scripts/` scaffolds or verifies it, and `adapters/` provides thin client entrypoints. None of those layers may introduce an alternate workflow order or command surface.
- CC-303 `scripts/bootstrap-kit.sh` may scaffold folders, starter memory files, and a thin `AGENTS.md` stub. It must not present itself as installing the skill kit or replacing the packaging step.

## Brownfield Safety Rules

- CC-401 When this repository evolves, repair upstream contract drift before polishing downstream prose. If skills, scripts, and docs disagree, the skill contract wins.
- CC-402 Keep user-facing command guidance on the public slash-alias surface such as `/spec-review`; internal skill IDs belong only where maintainers need explicit mapping detail.
- CC-403 If canonical repo memory, onboarding docs, and bootstrap behavior diverge, stop and realign them before release. Do not ship contradictory setup paths.

## AI Agent Operating Rules

- CC-501 Agents must read the repository entrypoint when present, choose the matching existing skill before freeform work, and consult repo memory and feature artifacts when the task depends on them.
- CC-502 Agents must not treat chat history, examples, or adapters as more authoritative than the owning skill contract and canonical repo memory.
- CC-503 Agents performing meaningful workflow or repo-maintenance work must preserve the artifact-first model: operate one stage at a time, move backward when blocked, and require fresh verification evidence before claiming completion.

## Amendment Process

- Update this document when repo-wide workflow rules, release gates, canonical paths, or adapter obligations change.
- Maintainer approval is required for changes that alter public command guidance, packaging expectations, or validation gates.
- Amendments are required when a change would otherwise force docs, adapters, scripts, or repo memory to teach a different contract.
- After amendment, review the owning skills, bundled references, onboarding docs, adapter examples, release checks, and bootstrap messaging for drift.
