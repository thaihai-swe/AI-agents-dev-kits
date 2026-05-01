# Skill Anatomy

## Purpose

This guide defines the repository-standard anatomy for `skills/*/SKILL.md`.

Use it when creating or revising an existing skill contract. The goal is not perfect symmetry for its own sake. The goal is that maintainers and agents can predict where to find triggers, handoffs, guardrails, and verification.

## Required Sections

Every `SKILL.md` in this repository should contain these headings:

1. `## Overview`
2. `## When to Use`
3. `## Read First`
4. `## Workflow`
5. `## Stop Conditions`
6. `## Core Rules`
7. `## Common Rationalizations`
8. `## Red Flags`
9. `## Verification`
10. `## Output Rules`

Additional sections are allowed when they materially help the workflow, for example `## Preconditions`, `## References`, or `## Self-Review`.

## Section Responsibilities

`Overview`
- state what the skill owns
- state what it explicitly does not own

`When to Use`
- give positive triggers and explicit non-goals
- name adjacent skills when the request should route elsewhere

`Read First`
- list the canonical files, memories, and artifacts to load before acting
- prefer concrete repository paths over vague “read relevant context” language

`Workflow`
- provide the ordered process the agent should follow
- keep it operational, not essay-like

`Stop Conditions`
- name the situations where the skill must stop instead of guessing
- route the user or maintainer to the correct upstream artifact or adjacent skill

`Core Rules`
- capture the durable rules that keep the workflow safe
- include scope discipline, contract boundaries, and cross-skill handoffs

`Common Rationalizations`
- list the excuses agents are likely to use to skip important steps
- rebut them directly and concretely

`Red Flags`
- describe observable signs that the workflow is being violated
- make review and self-checking easier

`Verification`
- define the evidence required before the skill’s job is considered complete
- keep verification tied to repository outputs, not confidence

`Output Rules`
- define which files the skill may update
- state what it must not create or mutate

## Repository-Specific Rules

- Skills are the workflow contract. Docs, adapters, and scripts must follow them.
- Use `skills/*/references/` for skill-owned templates and checklists.
- Use top-level `references/` only for material that is genuinely shared across multiple existing skills.
- Preserve current skill names, artifact names, verdict names, and task-state names unless the user explicitly asks for a contract change.
- Keep cross-skill routing explicit. A skill should say when to move to `analyze`, `spec-design`, `spec-plan`, `spec-implement`, `memory-promotion`, or `task-traceability-audit` instead of leaving that to inference.

## Command And Alias Surface

The documented command surface stays thin:

- `/constitution` -> `constitution`
- `/project-knowledge-base` -> `project-knowledge-base`
- `/analyze` -> `analyze`
- `/spec-requirement` -> `spec-requirement`
- `/spec-review-requirements` -> `spec-review-requirements`
- `/spec-design` -> `spec-design`
- `/spec-plan` -> `spec-plan`
- `/spec-tasks` -> `spec-tasks`
- `/spec-implement` -> `spec-implement`
- `/spec-review` -> `spec-review-implementation`
- `/spec-testing-scenarios` -> `spec-testing-scenarios`
- `/memory-promotion` -> `memory-promotion`
- `/task-traceability-audit` -> `task-traceability-audit`

Do not introduce alternate command semantics in adapters or docs.

## Shared Support Material

The shared [context checklist](../references/context-checklist.md) exists for cross-skill context loading and maintenance checks. Keep it aligned with the active skill contracts. If a concept only appears there and nowhere in the skills, treat it as drift.

## Verification For Maintainers

Before closing a workflow change:

1. Run `bash scripts/check-kit-consistency.sh`.
2. Run `bash scripts/bootstrap-kit.sh` and confirm the output matches onboarding docs.
3. Re-check the touched docs and adapters for contract drift.
4. If the change altered workflow behavior, verify the owning skill was updated before the docs.
