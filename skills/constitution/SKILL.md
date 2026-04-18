---
name: constitution
description: Create or maintain memories/repo/constitution.md as the repository’s durable normative rule set. Use when updating repo-wide principles, quality gates, architectural guardrails, or agent operating constraints that should govern future work across many changes.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/.
metadata:
  author: spec-driven-development-kit
---

# Constitution

Use this skill to create or maintain `memories/repo/constitution.md`.

This skill governs durable repository-wide rules. It is for normative guidance, not descriptive repository facts.

## Read First

Read these inputs when they exist:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- relevant feature artifacts
- relevant repository files that provide direct evidence
- `references/constitution-template.md`

## Use This Skill When

Use this skill when the user needs to:

- define or revise repo-wide principles
- add durable quality gates or delivery rules
- tighten architectural guardrails
- clarify how future agents should operate across the repository

Do not use this skill for:

- feature-specific decisions
- temporary workarounds
- one-off delivery preferences
- descriptive current-state notes better suited for the project knowledge base

## Amendment Rules

- Amend only when the rule is repo-wide, durable, and evidence-based.
- Prefer refining existing rules over adding new ones.
- Preserve stable identifiers such as `CC-###`.
- Merge duplicates instead of creating overlapping principles.
- Remove or rewrite content that is descriptive instead of normative.

Do not amend the constitution for one-off preferences or unresolved debates.

## Versioning

Use semantic versioning for the constitution:

- `MAJOR` for backward-incompatible governance changes
- `MINOR` for new principles or materially expanded guidance
- `PATCH` for clarifications and non-semantic refinements

If the bump is ambiguous, explain the reasoning before finalizing it.

## References

- Use [references/constitution-template.md](references/constitution-template.md) as the bundled structure.
- Ensure placeholder tokens are fully replaced with concrete text.
- Keep rules declarative, testable, and action-oriented.

## Workflow

1. Load the current constitution and identify placeholders, gaps, or stale rules.
2. Gather evidence from repository context, durable patterns, and explicit user direction.
3. Decide whether an amendment is warranted and what version bump it requires.
4. Update the constitution while preserving stable IDs and heading structure where practical.
5. Check whether related templates or agent contracts may need follow-up because the rules changed.
6. Validate that no unexplained placeholders remain and that dates and versioning are coherent.

## Output Standard

The constitution is ready only when it:

- contains durable repo-wide rules
- is normative rather than descriptive
- uses stable identifiers consistently
- is self-sufficient for future agents without chat history
- reflects an appropriate semantic version bump when changed

## Output Rules

- Update only `memories/repo/constitution.md`.
- Do not create extra repo-memory files.
- If no durable amendment is warranted, say so plainly instead of forcing a change.
