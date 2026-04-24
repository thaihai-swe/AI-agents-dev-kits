---
name: analyze
description: Investigate a problem, feature area, bug, or brownfield subsystem and produce one bounded analysis artifact grounded in repository evidence. Use when the work is exploratory, when root cause is not yet known, or when current-state behavior must be understood before specification, design, planning, or implementation.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Analyze

Use this skill to investigate existing behavior and write one bounded analysis artifact.

Default output:

`artifacts/features/<slug>/analysis.md`

For non-feature investigations, another explicit analysis path may be used if the user or repository convention provides it.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- related feature artifacts
- relevant code, tests, configs, docs, and repository structure

Prefer direct repository evidence over assumptions.

## Use This Skill When

Use this skill when the user needs to:

- understand existing system behavior before changing it
- investigate a bug or risky subsystem
- explore a brownfield path or integration boundary
- compare implementation options before specification
- document observed constraints before writing a spec

Do not use this skill for:

- writing `spec.md`, `design.md`, `plan.md`, or `tasks.md`
- post-implementation review
- promoting durable memory directly

## Core Rules

- Separate observed facts from inferences.
- Keep the analysis bounded to the investigation goal.
- Prefer repository evidence over exhaustive inventories.
- Do not silently turn analysis into a spec, design doc, or readiness review.
- Do not update repo-memory files directly.
- If brownfield context matters, map only the parts relevant to the current change.
- Use analysis to capture current-state maps when they reduce ambiguity, but keep them scoped and evidence-based rather than turning them into a standalone repo-wide `projectmap.md`.
- For bugs, failures, and unexpected behavior, investigate root cause before proposing fixes.
- Reproduce the issue consistently when possible; if reproduction is not yet reliable, state that clearly and gather more evidence instead of guessing.
- Check recent changes, relevant boundaries, and environment or configuration propagation before concluding where the problem lives.
- In multi-step flows, collect evidence at component boundaries so the failure location is demonstrated rather than assumed.
- Do not present a likely explanation as established root cause unless the evidence supports it.
- When the bug spans multiple boundaries, identify the first boundary where expected and observed behavior diverge.
- If root cause is still uncertain, end with the strongest supported hypothesis plus the next proving check rather than an overstated conclusion.

## Suggested Output Shape

When useful, organize `analysis.md` with:

- `Scope`
- `Current State`
- `Relevant System Map`
- `Findings`
- `Risks and Unknowns`
- `Brownfield Notes`
- `Options`
- `Recommendation`
- `Promotion Candidates`

Only include sections that materially help the next step.

## Workflow

1. Clarify the investigation target and output path.
2. Read repo memory, related artifacts, and the most relevant repository evidence.
3. If the work involves a bug, failure, or unexpected behavior, reproduce it, inspect recent changes, and gather evidence at the relevant boundaries before proposing explanations.
4. Trace the issue from visible symptom to the first failing boundary, then continue only as far upstream as the evidence supports.
5. Capture current behavior, any relevant subsystem or flow map, key findings, risks, and unknowns.
6. Distinguish facts from inferences, call out the confidence level of any root-cause claim, and note where evidence is weak.
7. Recommend the next artifact or workflow step, including promotion candidates when a local system map reveals durable repository structure.
8. If warranted, identify promotion candidates for the constitution or project knowledge base without updating them directly.

## Self-Review

Before finalizing the analysis, verify:

- the investigation stayed within the stated scope
- facts and inferences are clearly separated
- root-cause claims are backed by observed evidence or explicitly labeled as hypotheses
- the first failing boundary is visible when debugging-oriented analysis was requested
- important unknowns, weak evidence, and boundary risks are visible
- the recommended next step follows from the findings rather than jumping ahead

## Output Standard

The analysis is ready only when it:

- stays scoped to the investigation goal
- is grounded in repository evidence
- separates facts from inference
- identifies root cause carefully when debugging-oriented analysis was requested
- reduces ambiguity for the next workflow step
- makes important uncertainty and risk visible

## Output Rules

- Create or update exactly one analysis artifact.
- Do not create additional repo-memory files.
- Do not promote findings directly; recommend promotion candidates instead.
- If evidence is insufficient, say so explicitly.
