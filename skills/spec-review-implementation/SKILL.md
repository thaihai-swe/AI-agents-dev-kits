---
name: spec-review-implementation
description: Review implemented feature work against spec.md, plan.md, tasks.md, and repository quality expectations. Use when implementation has been attempted and you need an evidence-based verdict on requirement coverage, validation quality, scope control, traceability, and readiness to merge or ship.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
  legacy_contract_name: spec-review-implementation
---

# Spec Review Implementation

Use this skill to review implemented work for a feature against its approved artifacts and the current repository state.

This skill is the implementation quality gate. It reviews evidence, not vague intent or chat history.

## Read First

Read these inputs when they exist:

- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/plan.md`
- `artifacts/features/<slug>/tasks.md`
- `artifacts/features/<slug>/design.md`
- `artifacts/features/<slug>/analysis.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `references/definition-of-done.md`

If a durable written review is useful, write or update:

`artifacts/features/<slug>/review.md`

## Use This Skill When

Use this skill when the user needs to:

- review delivered implementation against the feature artifacts
- determine whether the feature is approved, approved with follow-ups, or changes required
- audit traceability, validation quality, and scope control after implementation

Do not use this skill for:

- requirement-readiness review before planning
- silently rewriting the spec, plan, or task list during review

## Preconditions

Before review, verify:

- `spec.md`, `plan.md`, and `tasks.md` exist
- implementation work has actually been attempted
- task state is reviewable rather than obviously stale
- there is enough validation evidence to assess the delivered change

If those are not true, stop and say exactly what is missing.

## Core Review Rules

- Review the implemented work against the artifacts as written.
- Distinguish blocking issues from follow-up improvements.
- Use repository rules and stable patterns when relevant.
- Be precise about gaps, risks, regressions, and misleading task state.
- Keep the review proportional to the feature’s size and risk.

## References

- Use [references/definition-of-done.md](references/definition-of-done.md) as a bundled checklist for closeout expectations.
- Use the repository’s `task-traceability-audit` skill when available to verify `REQ -> AC -> TASK -> validation`.
- If no issues are found, say so clearly.

## Verdict Rules

Use exactly one verdict:

- `approved`
- `approved with follow-ups`
- `changes required`

Choose `changes required` when requirements are unmet, validation is too weak for the risk, implementation materially diverges from approved scope, repo rules are violated, or task state creates meaningful operational risk.

## Workflow

1. Read the approved feature artifacts and any relevant repo memory.
2. Inspect the repository changes, tests, docs, and touched files.
3. Compare implementation against requirements, acceptance criteria, task outcomes, and repo rules.
4. Classify issues as blocking or follow-up.
5. Produce a verdict based on evidence.
6. Write `review.md` only when a durable written review is useful.

## Output Standard

The review is ready only when it:

- uses a clear verdict
- ties findings to evidence
- distinguishes blocking issues from follow-ups
- covers requirement coverage, validation quality, scope control, and handoff state

## Output Rules

- Prefer concise, evidence-based review findings.
- Use `review.md` only when a durable written review is useful.
- Do not invent universal thresholds the repository does not actually require.
- If the change is small, keep the review proportionate.
