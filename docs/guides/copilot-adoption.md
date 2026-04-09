# Copilot Adoption

## When To Use This Guide

Use this guide when applying the kit in a repository with GitHub Copilot.

## Prerequisites

- `.github/copilot-instructions.md` exists
- `.github/agents/` and `.github/prompts/` are available
- `memories/repo/` and `artifacts/features/` are present

## Command Sequence

Use the same workflow as the regular feature guides:

```text
/analyze                    (if needed)
/spec-requirement
/spec-review-requirements
/spec-design                (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

## Flow Guidance

### What Copilot should treat as source of truth

- `.github/copilot-instructions.md`
- the relevant agent contract in `.github/agents/`
- repo memory in `memories/repo/`
- the current feature artifact folder

### What prompt files should do

Prompt files should be the user-facing entrypoints:
- when to use the workflow step
- required inputs
- expected outputs
- stop conditions

### What users should ask Copilot to do

- create or refine one artifact at a time
- stop on unresolved blocking clarification
- stop when a quality gate rejects the upstream artifact
- implement from `tasks.md`, not from vague intent

## Stop Conditions

- Copilot is planning around a weak or blocked spec
- Copilot is generating tasks from a plan that is not taskable
- Copilot is treating chat history as more authoritative than the artifacts

## If Blocked

- inspect the upstream artifact
- fix the artifact, not just the next step
- use the reference docs to clarify expected outputs

## Read Next

- [Copilot Usage](../explanation/copilot-usage.md)
- [Commands](../reference/commands.md)
