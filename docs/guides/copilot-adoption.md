# Copilot And Agent Adoption

## When To Use This Guide

Use this guide when applying the kit in a repository with GitHub Copilot or another agent that can consume the shared `skills/` folder.

## Prerequisites

- `skills/` exists
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

### What an agent should treat as source of truth

- the relevant skill in `skills/`
- repo memory in `memories/repo/`
- the current feature artifact folder

### What skills should do

Skills should be the reusable workflow entrypoints:
- when to use the workflow step
- required inputs
- expected outputs
- stop conditions

### What users should ask Copilot to do

- create or refine one artifact at a time
- stop on unresolved blocking clarification
- stop when a quality gate rejects the upstream artifact
- implement from `tasks.md`, not from vague intent
- treat `/spec-review` as the review command that maps to the `spec-review-implementation` skill

## Stop Conditions

- the agent is planning around a weak or blocked spec
- the agent is generating tasks from a plan that is not taskable
- the agent is treating chat history as more authoritative than the artifacts

## If Blocked

- inspect the upstream artifact
- fix the artifact, not just the next step
- use the reference docs to clarify expected outputs

## Read Next

- [Skill Usage](../explanation/copilot-usage.md)
- [Commands](../reference/commands.md)
