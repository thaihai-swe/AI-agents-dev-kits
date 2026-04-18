---
name: spec-requirement
description: Create or refine a feature specification in artifacts/features/<slug>/spec.md. Use when defining what should change and why, clarifying target users, problem, goals, user journeys, requirements, and acceptance criteria before design or planning. Prefer this skill for spec authoring and refinement, especially when ambiguity must be resolved without drifting into technical implementation.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
  legacy_contract_name: spec-requirement
---

# Spec Requirement

Use this skill to create or refine `artifacts/features/<slug>/spec.md`.

This skill owns specification authoring and the clarification pass that happens before requirements review. It defines what should change and why. It does not own architecture, task sequencing, or implementation planning.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `artifacts/features/<slug>/analysis.md`
- other existing feature artifacts for the same slug
- `references/spec-template.md` for the canonical bundled spec structure

## Use This Skill When

Use this skill when the user needs to:

- define a new feature or change request
- refine an existing `spec.md`
- resolve product ambiguity before `/spec-review-requirements`
- capture users, problem, goals, scenarios, requirements, and acceptance criteria

Do not use this skill for:

- design decisions or technical solutioning
- implementation planning or task breakdown
- code changes

## Preconditions

Before finalizing the spec, verify that the request is clear enough to define:

- who the users are
- the problem being solved
- the core user workflow or experience
- the intended success outcomes

If one of those is missing and cannot be safely inferred, stop and state exactly what must be clarified.

If context supports reasonable assumptions or safe defaults, proceed and document them in `Assumptions`.

## Writing Rules

- Focus on what and why, not how.
- Keep requirements testable and acceptance criteria observable.
- Preserve stable identifiers when the repo already uses them.
- Keep scope bounded; move future ideas to `Non-Goals` or `Open Questions`.
- Separate current-state observations from future-state requirements.
- Avoid prescribing frameworks, APIs, databases, file structures, or deployment details unless they are true business constraints.
- Write for business stakeholders and reviewers, not implementers.

## Clarification Rules

This skill owns clarification during specification authoring.

- Resolve ambiguity before handing the spec to downstream review when possible.
- Make reasonable assumptions when safe defaults exist.
- Surface only unresolved questions that materially affect scope, security/privacy, or core user experience.
- Do not push unstable product ambiguity downstream into planning.

Classify uncertainty as:

- `Blocking clarification`: cannot safely finalize the spec without an answer
- `Non-blocking assumption`: proceed, but record the assumption
- `Safe default`: apply a normal default without escalation

Use `[NEEDS CLARIFICATION: specific question]` only when multiple reasonable interpretations would materially change scope, security/privacy posture, or core UX.

Rules for unresolved markers:

- maximum 3 total
- mirror each one into `Open Questions`
- do not treat the spec as review-ready while blocking clarification remains

## Workflow

1. Validate that the request has enough product context to proceed.
2. Read repo memory and current feature artifacts for the slug.
3. Extract users, problem, scenarios, constraints, and desired outcomes.
4. Resolve what you can with safe defaults and documented assumptions.
5. Draft or refine `spec.md` with bounded, testable requirements.
6. Check that acceptance criteria trace back to requirements and are observable by a reviewer.
7. If blocking clarification remains, stop and say exactly what is missing.

## References

- Use [references/spec-template.md](references/spec-template.md) as the bundled section template.
- Remove sections that do not apply instead of leaving placeholders.
- Keep the skill body focused on workflow and rules; keep structural detail in the reference file.

## Output Standard

The spec is ready only when it:

- clearly defines the problem, users, and value
- captures the intended experience and highest-value scenarios
- has bounded scope
- includes testable requirements
- includes verifiable acceptance criteria
- separates requirements, quality expectations, and constraints cleanly
- avoids technical planning and implementation detail
- resolves all blocking clarification

## Output Rules

- Update only `artifacts/features/<slug>/spec.md`.
- Do not create `design.md`, `plan.md`, or `tasks.md`.
- Do not finalize the spec if requirements or acceptance criteria are not reviewable.
- If the spec is not ready, state exactly what is missing instead of guessing.
