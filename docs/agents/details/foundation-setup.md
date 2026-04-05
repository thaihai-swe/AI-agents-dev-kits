# Foundation And Setup

The foundation layer now has two durable repo-memory documents.

## Commands In This Group

- `/constitution`
- `/project-knowledge-base`

## `/constitution`

Maintains `memories/repo/constitution.md`.

Use it for durable repo-wide rules such as:

- testing expectations
- compatibility rules
- safety requirements
- architecture guardrails
- review and rollout expectations

## `/project-knowledge-base`

Maintains `memories/repo/project-knowledge-base.md`.

Use it for durable descriptive context such as:

- subsystem boundaries
- integration seams
- stable testing patterns
- durable brownfield watchouts
- recurring implementation patterns

## Important Shift

Older docs treated patterns and architecture capture as separate durable memory commands. The current codebase consolidates those responsibilities into the project knowledge base.
