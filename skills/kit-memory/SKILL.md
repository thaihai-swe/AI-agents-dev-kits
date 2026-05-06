---
name: kit-memory
description: Maintain the repository's durable knowledge. This skill owns the Constitution (rules) and the Project Knowledge Base (facts), as well as the promotion of findings from feature work into durable memory.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/.
metadata:
  author: spec-driven-development-kit
---

# Kit Memory

## Overview

Use this skill to manage `memories/repo/constitution.md` and `memories/repo/project-knowledge-base.md`.

It handles:
1. **Constitution:** Normative rules and guardrails.
2. **Knowledge Base:** Descriptive architecture notes and patterns.
3. **Promotion:** Moving temporary findings from `analysis.md` or `review.md` into durable memory.

## Read First

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `references/constitution-template.md`
- `references/project-knowledge-base-template.md`

## When to Use

- Define or revise repo-wide principles (Constitution).
- Document recurring implementation patterns (Knowledge Base).
- Promote stable repository facts into durable memory.

## Workflow

1. **Identification:** Identify a finding in feature artifacts marked as a promotion candidate.
2. **Classification:** Determine if it's a **Rule** (Normative) or a **Fact** (Descriptive).
3. **Update:** Update the corresponding file (`constitution.md` or `project-knowledge-base.md`).
4. **Versioning:** If updating the Constitution, bump the semantic version.

## Stop Conditions

- The finding is still temporary or speculative.
- The request is feature-local and should stay in feature artifacts.

## Core Rules

- **Normative vs. Descriptive:** Rules go in the Constitution; Facts go in the Knowledge Base.
- **Durable only:** Do not save session residue or one-off feature notes.
- **Surgical Amendments:** Prefer refining existing rules over adding overlapping ones.
- **Versioning:** Use semantic versioning for the Constitution.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "Let's save every useful note here." | Repo memory should capture only durable knowledge. |
| "This one feature preference belongs here." | Feature-local guidance belongs in feature artifacts. |

## Red Flags

- Feature-local notes are being promoted into repo memory.
- Descriptive architecture notes are being written as rules.

## Verification

Before finalizing the update, verify:
- The content is durable and evidence-based.
- Normative rules were kept out of the Knowledge Base.
- Semantic version bump is appropriate for Constitution changes.

## Output Rules

- Update only `constitution.md` and `project-knowledge-base.md`.
- Do not create extra repo-memory files.
