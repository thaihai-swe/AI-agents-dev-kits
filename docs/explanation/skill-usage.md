# Skill Usage

## How Skills Fit Into This Kit

This repository now uses portable skills as the main workflow contract:

- `skills/` for workflow entrypoints and contracts
- `memories/repo/` and `artifacts/features/<slug>/` for durable and feature-specific context

For users, the key idea is simple:
- skills are the main reusable workflow surface
- artifacts remain the source of truth for actual feature work

## What Agents Should Read First

For meaningful feature work, an agent should use:
- the relevant skill in `skills/`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- the current feature artifact folder under `artifacts/features/<slug>/`

If the client needs an entrypoint file, that file should point the agent to this order instead of duplicating the skill bodies.

## How Agents Discover Skills

The intended discovery pattern is:

1. read the repo entrypoint such as `AGENTS.md` when the client uses one
2. identify the workflow step that matches the current uncertainty
3. read the matching skill under `skills/`
4. read repo memory and the current feature artifacts
5. update one artifact or execute one bounded implementation step

## How Users Should Work With Skills

Use skills to produce or update artifacts one stage at a time.

Good pattern:
1. create or refine the next artifact
2. review the result
3. move to the next stage only when the current artifact is strong

Avoid:
- jumping straight into implementation without artifacts
- treating chat history as the source of truth
- letting an agent invent missing planning details

## Skills And Artifacts

From a user perspective:
- the skill tells you how to invoke a workflow step
- the artifact records the durable outcome of that step

From a maintainer perspective:
- `SKILL.md` carries the behavioral contract
- `references/` carries heavier structural material when that helps keep the main skill lean

## What Agents Should Not Do

- silently rewrite a weak spec during requirements review
- plan around unresolved blocking clarification
- create tasks from a plan that is not yet decomposable
- promote feature-specific notes directly into durable repo memory unless asked

## Read Next

- [Skill Adoption](../guides/skill-adoption.md)
- [Commands Reference](../reference/commands.md)
