# AI Dev Kit Copilot Instructions

## Canonical Paths

- Treat `memories/repo/` as the only durable repository-memory location.
- Treat `artifacts/features/<feature-slug>/` as the source of truth for feature work.
- Do not invent alternate memory paths such as `memories/*.md` for repository-wide memory.

## Required Context Before Work

- Read `memories/repo/constitution.md` if it exists before planning, implementation, or review.
- Read `memories/repo/project-knowledge-base.md` if it exists before planning, implementation, or review.
- For brownfield work, also read relevant files in `memories/repo/legacy-system-watchouts.md`, `memories/repo/architecture-decisions.md`, and `memories/repo/integration-points.md` when they exist.
- Before continuing existing feature work, read the current artifact set in `artifacts/features/<feature-slug>/`.

## Artifact Discipline

- New feature requests should become `artifacts/features/<feature-slug>/spec.md` before implementation.
- Plans belong in `artifacts/features/<feature-slug>/plan.md`.
- Task breakdowns belong in `artifacts/features/<feature-slug>/tasks.md`.
- Keep traceability explicit with identifiers such as `REQ-*`, `AC-*`, `TASK-*`, `RISK-*`, and `FILE-*`.
- Update the relevant artifact when work changes scope, sequencing, or completion state.

## Repo Memory Discipline

- Put durable rules in `memories/repo/constitution.md`.
- Put durable descriptive context and reusable patterns in `memories/repo/project-knowledge-base.md`.
- Put stable brownfield gotchas in `memories/repo/legacy-system-watchouts.md`.
- Put reusable integration guidance in `memories/repo/integration-points.md`.
- Put inferred architectural reasoning and trade-offs in `memories/repo/architecture-decisions.md`.

## Working Style

- Prefer small, reversible changes.
- Do not skip tests or validation steps when the repository already implies them.
- Avoid feature-specific details in repository memory.
- Avoid speculative architecture in durable memory unless uncertainty is clearly marked.
- Update `README.md` or documentation in `docs/` when workflow entrypoints or file locations change.
