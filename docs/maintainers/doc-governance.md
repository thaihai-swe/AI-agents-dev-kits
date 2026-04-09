# Doc Governance

## Purpose

This page defines how to keep the docs coherent as the kit evolves.

## Documentation Layers

- user explanation
- user guides
- user examples
- user reference
- maintainer docs

Do not mix these jobs into one page unless there is a clear reason.

## Update Rules

- root `README.md` stays a landing page
- `docs/README.md` stays the main user docs entrypoint
- user docs should not duplicate full agent internals
- maintainer docs should point back to `.github` files as source of truth

## Consistency Rules

When agent contracts change, review:
- relevant prompt files
- user workflow docs
- examples
- reference pages
- templates

## Quality Checks

- no competing “main workflow” pages
- no outdated artifact story
- no stale links from `README.md` or `docs/README.md`
- no user-facing page teaching a workflow that differs from the agent contracts
