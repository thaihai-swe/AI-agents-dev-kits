# AI Dev Kit Copilot Instructions

This file is the repository-wide GitHub Copilot instructions file for this repository.

## Canonical Paths

- Treat `memories/repo/` as the only durable repository-memory location.
- Treat `artifacts/features/<feature-slug>/` as the source of truth for feature work.
- Do not invent alternate memory paths such as `memories/*.md` for repository-wide memory.

## Canonical Models

- Use the current two-file repository memory model only:
  - `memories/repo/constitution.md`
  - `memories/repo/project-knowledge-base.md`
- Do not create or rely on split durable-memory files such as `legacy-system-watchouts.md`, `architecture-decisions.md`, or `integration-points.md`.
- Put temporary or feature-specific findings in `artifacts/features/<feature-slug>/analysis.md` or other feature artifacts until they are proven durable.
- Promote durable brownfield watchouts, architecture notes, and integration guidance into `memories/repo/project-knowledge-base.md`.

## Required Context Before Work

- Read `memories/repo/constitution.md` if it exists before planning, implementation, or review.
- Read `memories/repo/project-knowledge-base.md` if it exists before planning, implementation, or review.
- Before continuing existing feature work, read the current artifact set in `artifacts/features/<feature-slug>/`.
- For brownfield work, read `analysis.md` for the current feature when it exists, then promote only durable findings into `project-knowledge-base.md`.

## Artifact Discipline

- New feature requests should become `artifacts/features/<feature-slug>/spec.md` before implementation.
- Plans belong in `artifacts/features/<feature-slug>/plan.md`.
- Task breakdowns belong in `artifacts/features/<feature-slug>/tasks.md`.
- Keep traceability explicit with identifiers such as `REQ-*`, `AC-*`, `TASK-*`, `RISK-*`, and `FILE-*`.
- Update the relevant artifact when work changes scope, sequencing, or completion state.

## Repo Memory Discipline

- Put durable rules in `memories/repo/constitution.md`.
- Put durable descriptive context and reusable patterns in `memories/repo/project-knowledge-base.md`.
- Keep durable brownfield gotchas, integration guidance, and architectural context inside `memories/repo/project-knowledge-base.md`.
- Do not split durable repository memory across extra files unless the repository documentation is explicitly changed to support a new canonical model.

## Source Of Truth

- Treat `.github/agents/` as the canonical agent contract.
- Treat `.github/copilot-instructions.md` as the canonical repository-wide Copilot instructions file.
- If path-specific instructions are later added, store them under `.github/instructions/` using the `NAME.instructions.md` naming pattern.

## Working Style

- Prefer small, reversible changes.
- Do not skip tests or validation steps when the repository already implies them.
- Avoid feature-specific details in repository memory.
- Avoid speculative architecture in durable memory unless uncertainty is clearly marked.
- Update `README.md` or documentation in `docs/` when workflow entrypoints or file locations change.
