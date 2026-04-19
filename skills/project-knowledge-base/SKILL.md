---
name: project-knowledge-base
description: Create or maintain memories/repo/project-knowledge-base.md as durable descriptive repository memory. Use when capturing stable patterns, boundaries, architecture notes, integration seams, testing habits, and brownfield watchouts that future work should reuse without turning them into normative rules.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/.
metadata:
  author: spec-driven-development-kit
---

# Project Knowledge Base

Use this skill to create or maintain `memories/repo/project-knowledge-base.md`.

This skill captures durable descriptive repository knowledge. It complements the constitution, which owns repo-wide rules.

## Read First

Read these inputs when they exist:

- `memories/repo/project-knowledge-base.md`
- `memories/repo/constitution.md`
- relevant feature artifacts
- relevant repository files and code paths
- `references/project-knowledge-base-template.md`

## Use This Skill When

Use this skill when the user needs to:

- promote stable repository facts into durable memory
- document recurring implementation patterns
- capture important boundaries, watchouts, or integration seams
- preserve reusable brownfield context for future feature work
- maintain durable architecture notes, project-map summaries, or promoted decision records

Do not use this skill for:

- repo-wide rules or mandates
- temporary findings
- feature-specific plans
- speculative future design with no repository basis

## Core Rules

- Prefer durable summaries over raw notes.
- Keep confidence high; omit or clearly label uncertainty.
- Merge overlapping sections instead of duplicating content.
- Prefer patterns and boundaries over file-by-file inventories.
- Capture observed architecture and integration behavior, not roadmap speculation.
- Do not encode normative rules as facts.
- Use this file as the canonical home for durable architecture context, project-map summaries, and repo-wide decision history instead of splitting them into standalone `ARCHITECTURE.md`, `projectmap.md`, or `DECISIONS.md` files.
- Promote only decisions that remain useful beyond a single feature; keep feature-local rationale in feature artifacts.

Use the repository’s `memory-promotion` skill when available to decide whether a finding belongs here, should stay in feature artifacts, or should move to the constitution.

## References

- Use [references/project-knowledge-base-template.md](references/project-knowledge-base-template.md) as the bundled structure.
- Keep the file concise and durable.
- Record provenance or confidence when evidence is partial.

## Workflow

1. Read current durable memory, the constitution, and relevant repository evidence.
2. Decide whether the candidate knowledge is durable, descriptive, and reusable.
3. Merge it into existing sections or create a concise new section when warranted, including architecture notes, project maps, or durable decision summaries when they clear the promotion bar.
4. Remove duplication and keep the file useful for future agents with no chat history.
5. If no durable update is warranted, stop and say so plainly.

## Output Standard

The knowledge base is ready only when it:

- contains durable descriptive context
- is grounded in repository evidence
- avoids normative rules
- highlights patterns, boundaries, and reusable watchouts
- remains concise enough to be read before future feature work

## Output Rules

- Update only `memories/repo/project-knowledge-base.md`.
- Do not create extra repo-memory files.
- If no durable update is warranted, say so plainly instead of forcing an update.
