---
name: kit-research
description: Investigate a problem, feature area, bug, or brownfield subsystem and produce one bounded analysis artifact grounded in repository evidence. Use when the work is exploratory, when root cause is not yet known, or when current-state behavior must be understood before specification, design, planning, or implementation.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Kit Research

## Overview

Use this skill to investigate existing behavior and write one bounded analysis artifact.

Default output: `artifacts/features/<slug>/analysis.md`

This skill owns debugging-oriented investigation, bug analysis, failure tracing, and root-cause discovery before repair work moves into the spec-driven implementation flow.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- Related feature artifacts
- Relevant code, tests, configs, docs, and repository structure
- `references/analysis-template.md`
- `references/debugging-checklist.md`

## When to Use

- Understand existing system behavior before changing it.
- Investigate a bug or risky subsystem.
- Explore a brownfield path or integration boundary.
- Trace a failure to the first boundary where expected and observed behavior diverge.

## Workflow

1. Clarify the investigation target and output path.
2. Reproduce the issue (if a bug).
3. Trace the issue from symptom to first failing boundary.
4. Capture findings, risks, and unknowns in `analysis.md`.
5. Recommend the next artifact (usually `kit-spec`).

## Stop Conditions

- Scope is too broad to investigate as one bounded artifact.
- Repository does not provide enough evidence to distinguish facts from guesswork.
- The request is actually asking for specification, planning, or implementation.

## Core Rules

- Separate observed facts from inferences.
- For bugs, investigate root cause before proposing fixes.
- Trace the issue from visible symptom to the first failing boundary.
- If root cause is still uncertain, end with the strongest supported hypothesis.
- Identify **Promotion Candidates** for the constitution or project knowledge base.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "I already know how this area works." | Repository evidence beats memory, especially in brownfield areas. |
| "I can turn this straight into a spec." | Research should reduce uncertainty, not silently replace downstream artifacts. |

## Red Flags

- The analysis reads like a spec, design, or plan instead of observed current state.
- Root-cause claims are stated as fact without repository evidence.

## Verification

Before finalizing the analysis, verify:
- Facts and inferences are clearly separated.
- Root-cause claims are backed by observed evidence or explicitly labeled as hypotheses.
- The recommended next step follows from the findings.

## Output Rules

- Update only `artifacts/features/<slug>/analysis.md`.
- Do not create extra repo-memory files.
- If evidence is insufficient, say so explicitly.
