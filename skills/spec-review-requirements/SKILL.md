---
name: spec-review-requirements
description: Review artifacts/features/<slug>/spec.md for readiness before design or planning and write artifacts/features/<slug>/requirements-review.md. Use when checking clarity, completeness, scope control, and testability without rewriting the specification in place.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
  legacy_contract_name: spec-review-requirements
---

# Spec Review Requirements

Use this skill to review `artifacts/features/<slug>/spec.md` and create or update `artifacts/features/<slug>/requirements-review.md`.

This skill is the readiness gate between specification authoring and downstream design or planning.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `artifacts/features/<slug>/spec.md`
- `references/requirements-review-template.md`

## Use This Skill When

Use this skill when the user needs to:

- assess whether a spec is ready for design or planning
- identify blocking gaps in requirements or acceptance criteria
- capture non-blocking improvements without rewriting the spec

Do not use this skill for:

- rewriting `spec.md` directly
- producing design proposals except when pointing out a missing design decision
- implementation review

## Review Rules

- Review the spec as written.
- Be precise about defects and point to exact weak sections when possible.
- Distinguish blocking issues from non-blocking improvements.
- Focus on readiness for downstream design and planning.
- Do not silently repair the spec during review.

## References

- Use [references/requirements-review-template.md](references/requirements-review-template.md) as the bundled structure.
- Keep the verdict explicit: `ready`, `ready with minor issues`, or `not ready`.
- Make the output useful for the next authoring pass, not just judgmental.

## Workflow

1. Read the spec and any relevant repo memory.
2. Check clarity, completeness, scope boundaries, and testability.
3. Identify blocking issues that should stop design or planning.
4. Identify non-blocking improvements that would strengthen the spec.
5. Write a clear readiness verdict and concrete recommendations.

## Output Standard

The review is ready only when it:

- gives a clear readiness verdict
- identifies blocking gaps precisely
- identifies non-blocking improvements precisely
- helps the specification improve without rewriting it in place

## Output Rules

- Update only `artifacts/features/<slug>/requirements-review.md`.
- Do not rewrite `spec.md` in this step.
- If the spec is already strong, say so clearly and briefly.
