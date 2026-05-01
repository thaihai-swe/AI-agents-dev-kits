# Repository Memory

This directory holds durable, project-specific memory for the AI Dev Kit.

- `constitution.md` stores repository-wide rules and guardrails.
- `project-knowledge-base.md` stores durable patterns, architecture context, project-map summaries, and reusable decision history.
- `domain-specs.md` explains how to use subsystem or domain specs for large codebases.

In the current model, non-negotiable AI operating rules stay in `constitution.md`, while durable brownfield watchouts, architecture notes, project-map summaries, and promoted decision history are consolidated into `project-knowledge-base.md` instead of being split into separate repository-memory files.

Repositories using the kit should normally ship starter versions of:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Use `memories/repo/` as the canonical home for repository memory files.
