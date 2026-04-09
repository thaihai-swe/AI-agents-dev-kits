# Copilot Usage

## How Copilot Fits Into This Kit

GitHub Copilot uses two main layers in this repository:

- `.github/copilot-instructions.md` for repository-wide operating rules
- `.github/prompts/` and `.github/agents/` for workflow entrypoints and contracts

For users, the key idea is simple:
- prompt files are the easiest way to invoke the workflow
- agent files are the deeper source of truth

## What Copilot Should Read First

For meaningful feature work, Copilot should use:
- `.github/copilot-instructions.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- the current feature artifact folder under `artifacts/features/<slug>/`

## How Users Should Work With Copilot

Use Copilot to produce or update artifacts one stage at a time.

Good pattern:
1. create or refine the next artifact
2. review the result
3. move to the next stage only when the current artifact is strong

Avoid:
- jumping straight into implementation without artifacts
- treating chat history as the source of truth
- letting Copilot invent missing planning details

## Prompt Files vs Agent Files

From a user perspective:
- prompt files tell you how to invoke a workflow step
- agent files define what that step must do

From a maintainer perspective:
- prompt files are a thin entry layer
- agent files carry the real contract

## What Copilot Should Not Do

- silently rewrite a weak spec during requirements review
- plan around unresolved blocking clarification
- create tasks from a plan that is not yet decomposable
- promote feature-specific notes directly into durable repo memory unless asked

## Read Next

- [Copilot Adoption Guide](../guides/copilot-adoption.md)
- [Commands Reference](../reference/commands.md)
