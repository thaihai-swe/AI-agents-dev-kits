---
name: analyze
description: Investigate a problem, feature area, bug, or brownfield subsystem and produce one bounded analysis artifact grounded in repository evidence. Use when the work is exploratory and the answer is not yet a specification, design, plan, or implementation task.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
  legacy_contract_name: analyze
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

## Suggested Output Shape

When useful, organize `analysis.md` with:

- `Scope`
- `Current State`
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
3. Capture current behavior, key findings, risks, and unknowns.
4. Distinguish facts from inferences and note where evidence is weak.
5. Recommend the next artifact or workflow step.
6. If warranted, identify promotion candidates for the constitution or project knowledge base without updating them directly.

## Output Standard

The analysis is ready only when it:

- stays scoped to the investigation goal
- is grounded in repository evidence
- separates facts from inference
- reduces ambiguity for the next workflow step
- makes important uncertainty and risk visible

## Output Rules

- Create or update exactly one analysis artifact.
- Do not create additional repo-memory files.
- Do not promote findings directly; recommend promotion candidates instead.
- If evidence is insufficient, say so explicitly.
