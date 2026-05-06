---
name: kit-implement
description: Execute implementation work task-by-task. This skill uses the approved spec, plan, and task list to drive code changes with strict status tracking and validation.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Kit Implement

## Overview

Use this skill to perform the coding work. You must follow `tasks.md` and update its state as you progress.

## Read First

- `tasks.md`
- `plan.md`
- `spec.md`
- Files being touched + their callers/interfaces.

## When to Use

- Implement the next unblocked task from `tasks.md`.
- Update task status while work progresses.
- Make code and test changes that satisfy the approved spec and plan.

## Workflow

1. **Select:** Pick the next unblocked task from `tasks.md`.
2. **Status:** Mark task as `In Progress`.
3. **Code:** Implement the task. Match project patterns.
4. **Validate:** Run the tests or proof required by the task.
5. **Close:** Mark task as `Done` only after validation passes.

## Stop Conditions

- `spec.md`, `plan.md`, or `tasks.md` is missing.
- Task dependencies prevent execution.
- Implementation would contradict the approved spec or plan.

## Core Rules

- **No "Vibe Coding":** Only implement what is in the task.
- **Test-First:** For behavior changes, write/update a failing test first.
- **Traceability:** Every code change must trace back to a task ID.
- **Evidence-Based:** "Done" means validation evidence exists.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "The task is a little vague, but I can fill in the gap." | Silent gap-filling is how scope drift starts. |
| "I'll update task status after everything passes." | Task state must reflect reality as work progresses. |

## Red Flags

- Implementation is being driven from chat instead of `tasks.md`.
- Task state claims `Done` while validation still fails.

## Verification

Before marking a task done, verify:
- The code change stayed inside the selected task boundary.
- Test-first behavior was followed for behavioral changes.
- Verification was fresh and directly relevant to the task.

## Output Rules

- Produce code and test changes only for the selected task scope.
- Update task status in `tasks.md` as work progresses.
- Do not mark tasks done without validation.
