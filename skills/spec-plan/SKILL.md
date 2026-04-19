---
name: spec-plan
description: Create or refine an implementation plan in artifacts/features/<slug>/plan.md from an approved feature specification. Use when spec.md is ready for planning and the work needs sequencing, technical approach, affected areas, risks, validation, rollout, rollback, and traceability back to requirements and acceptance criteria.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Spec Plan

Use this skill to create or refine `artifacts/features/<slug>/plan.md`.

This skill turns an approved specification into a concrete, sequenced execution plan. It owns planning, not specification authoring, task generation, or coding.

## Read First

Read these inputs in this order when they exist:

- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/requirements-review.md`
- `artifacts/features/<slug>/design.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `references/definition-of-ready.md`
- `references/plan-template.md`
- any existing `artifacts/features/<slug>/plan.md`

Also inspect obviously relevant repository files, modules, interfaces, and prior examples needed to plan safely.

## Use This Skill When

Use this skill when the user needs to:

- turn an approved `spec.md` into `plan.md`
- update an existing implementation plan after spec or design changes
- define execution phases, dependencies, validation, rollout, rollback, and risks
- map requirements and acceptance criteria into a technical delivery strategy

Do not use this skill for:

- writing or fixing `spec.md`
- generating `tasks.md`
- writing production code
- replacing a needed `design.md` with planning guesses

## Stop Conditions

Stop and explain exactly what must happen next when any of these are true:

- `artifacts/features/<slug>/spec.md` is missing
- `spec.md` is vague, contradictory, incomplete, or still contains unresolved blocking clarification
- `requirements-review.md` exists and its verdict is `not ready`
- the feature requires design first and `design.md` does not exist
- repository context reveals major conflicts or dependencies that prevent safe sequencing

When stopping, state:

- what is missing or contradictory
- why planning cannot proceed safely
- which artifact, clarification, or decision is required next

## Design Gate

If `design.md` does not exist, proceed only when the feature is simple and localized enough that the technical approach can be planned directly from the spec, repository patterns, and known constraints.

Require design first when the work includes one or more of these:

- cross-service or cross-boundary changes
- new data models or migrations
- new public interfaces or contracts
- infrastructure or platform changes
- meaningful security, privacy, reliability, or performance implications
- multiple plausible implementation approaches with real tradeoffs

## Planning Rules

- Stay aligned with approved scope in `spec.md`.
- Preserve the user journeys, scenarios, and success outcomes from the spec.
- Make the technical approach explicit enough that implementation does not need to invent it.
- Prefer existing repository patterns when they still fit.
- Prefer reversible, phased changes over risky big-bang rewrites.
- Make clear what changes, what stays unchanged, and what must be protected from regression.
- Surface unresolved questions instead of silently resolving them.
- Respect the recorded design decisions in `design.md`; only add planning-level rationale that affects sequencing, rollout, or validation.
- Keep the plan implementation-ready without collapsing into source-code-level design or a task checklist.

## Research And Ambiguity

Handle uncertainty explicitly:

- `Blocking ambiguity`: prevents safe planning; resolve it or stop
- `Non-blocking assumption`: proceed, but record it as an assumption
- `Residual uncertainty`: note it as an open question if the plan still works safely

When planning reveals gaps:

1. Identify what is unclear and why it matters.
2. Review repository patterns, existing artifacts, and relevant technical context.
3. Record the outcome as a decision, assumption, risk, or open question.
4. Stop if the unresolved issue materially affects sequencing, interfaces, validation, or rollout.

Never present a major assumption as settled fact.
Do not create a standalone `DECISIONS.md`; keep feature design choices in `design.md` and promote only durable repo-wide conclusions through repo memory.

## Workflow

1. Validate preconditions and stop early if a planning gate fails.
2. Read the spec, review findings, design inputs, and repository memory.
3. Identify affected domains, integration boundaries, dependencies, and protected behavior.
4. Define the technical approach and note any important alternatives or rationale.
5. Build execution phases with sequencing, dependencies, and measurable completion criteria.
6. Map `REQ-*` and `AC-*` to phases and validation steps.
7. Add validation, rollout, rollback, risks, assumptions, and open questions.
8. Check that the plan is safe, traceable, and ready for task generation.

## References

- Use [references/plan-template.md](references/plan-template.md) as the bundled plan structure.
- Keep sections concise for small features and explicit for cross-cutting or high-risk work.
- Use the reference template for headings and planning shape instead of rewriting the structure in this file.

## Output Standard

The plan is ready only when it:

- is aligned with the approved spec
- is specific enough to guide implementation safely
- makes sequencing and dependencies clear
- identifies affected modules, interfaces, data, and operational concerns
- preserves regression-sensitive behavior explicitly
- maps requirements and acceptance criteria to phases and validation
- includes assumptions, risks, rollout, and rollback guidance proportional to risk
- is decomposable into bounded tasks without rewriting the plan

## Output Rules

- Update only `artifacts/features/<slug>/plan.md`.
- Do not update `spec.md`, `requirements-review.md`, `design.md`, or `tasks.md`.
- Do not write code.
- If the plan is not ready, state exactly what is blocking it instead of filling gaps with vague text.
