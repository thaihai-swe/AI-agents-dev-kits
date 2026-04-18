# AGENTS.md

Guidance for Codex and other coding agents working in this repository.

## Purpose

This repository is a spec-driven development kit. Most work here is documentation, workflow contracts, templates, and agent instructions rather than application runtime code.

Before making changes, align with the existing workflow instead of inventing parallel conventions.

## Read First

Start with these files:

1. `README.md`
2. `.github/skills/README.md`
3. `docs/reference/commands.md`
4. `docs/maintainers/skills.md`

Then read repository memory if present:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `memories/repo/domain-specs.md` for domain-spec guidance

Note: some docs describe the newer two-file memory model. If `constitution.md` or `project-knowledge-base.md` do not exist yet, do not invent alternate durable-memory locations beyond the documented canonical paths.

## Source Of Truth

When instructions conflict, prefer this order:

1. `.github/skills/*/SKILL.md`
2. `.claude/skills/*/SKILL.md`
3. `docs/reference/commands.md`
4. `docs/maintainers/*.md`
5. `README.md`

Treat `.github/skills/` as the canonical workflow contract.

## Repository Conventions

- Durable repository memory belongs under `memories/repo/`.
- Feature-specific artifacts belong under `artifacts/features/<feature-slug>/`.
- Portable workflow skills live under `.github/skills/`.
- Claude mirrors live under `.claude/skills/`.
- Keep repository-wide guidance out of feature artifacts.
- Keep feature-specific notes out of durable repository memory.
- Do not create new top-level workflow systems when updating this kit.

## Expected Workflow

For feature or change work, follow the repo's spec-driven sequence:

1. `/analyze` when current behavior or constraints are unclear
2. `/spec-requirement` to define the change
3. `/spec-review-requirements` as the readiness gate
4. `/spec-design` only when technical clarification is needed
5. `/spec-plan` for execution strategy
6. `/spec-tasks` for bounded implementation tasks
7. `/spec-implement` to execute
8. `/spec-review` to verify completeness, correctness, and coherence

If you update command behavior, agent ownership, artifact locations, or memory conventions, update the relevant docs in `docs/` and `README.md` in the same change.

## Editing Guidance

- Prefer small, reversible edits.
- Preserve the current terminology of "spec-driven development", "repo memory", and "feature artifacts".
- When changing guidance, keep cross-file consistency between `README.md`, `docs/`, and `.github/`.
- Avoid introducing assistant-specific instructions that contradict the shared skill contracts.
- For new docs, prefer linking to canonical references instead of duplicating long guidance blocks.

## Validation

Before finishing:

- check for broken internal links when you add or rename docs
- verify examples and paths match the actual repository layout
- make sure renamed concepts are updated consistently across references
