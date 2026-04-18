---
name: spec-design
description: Create or refine artifacts/features/<slug>/design.md when a feature needs architectural clarification, interface decisions, flow design, or risk reduction before planning. Use for cross-boundary, interface-changing, data-shaping, or otherwise technically consequential work where a design artifact materially reduces ambiguity.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Spec Design

Use this skill to create or refine `artifacts/features/<slug>/design.md`.

This skill explains how the feature will work at a system level. It owns decisions, interfaces, flows, and tradeoffs needed before planning.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/requirements-review.md`
- `artifacts/features/<slug>/analysis.md`
- `references/design-template.md`

## Use This Skill When

Use this skill when the feature:

- spans multiple modules or services
- introduces or changes interfaces
- affects data flow or architecture
- changes brownfield behavior in risky areas
- needs explicit tradeoff decisions before planning

For highly localized changes, prefer a short design or recommend proceeding directly to planning if design is unnecessary.

## Preconditions

- `spec.md` must exist and be complete enough to design against.
- If `requirements-review.md` says the spec is not ready, stop and say so.

## Core Rules

- Explain how the feature will work at a system level.
- Keep implementation detail limited to what downstream planning needs.
- Focus on decisions, interfaces, flows, and tradeoffs.
- For each major design choice, include the decision, rationale, alternatives, affected boundaries, and risks introduced or reduced.
- Keep the design proportional to the feature complexity.

## References

- Use [references/design-template.md](references/design-template.md) as the bundled design structure.
- Keep the artifact technical but not patch-level.
- Recommend skipping design when it would be ceremonial rather than clarifying.

## Workflow

1. Confirm the spec and its review state are ready for design.
2. Read repo memory and any relevant analysis.
3. Identify the technical drivers, boundaries, and risky decisions.
4. Describe the proposed architecture, interfaces, and major flows.
5. Record alternatives considered and the rationale for the chosen approach.
6. Surface open decisions that still matter for planning.

## Output Standard

The design is ready only when it:

- reduces ambiguity for planning
- captures key technical decisions and tradeoffs
- identifies major interfaces and risks
- stays proportional to the feature size

## Output Rules

- Update only `artifacts/features/<slug>/design.md`.
- Do not create `plan.md` or `tasks.md` in this step.
- If a design artifact is unnecessary, say so plainly and recommend proceeding to planning.
