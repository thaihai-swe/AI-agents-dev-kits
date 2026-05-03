# Getting Started

## What This Kit Is

This kit helps teams run spec-driven development with AI coding agents.

The model is simple:

- artifacts are the durable source of truth
- skills are the reusable workflow contract
- repo memory stays compact and durable
- implementation should follow approved artifacts, not chat improvisation

## Minimum Setup

The minimum safe repository shape is:

```text
skills/
memories/repo/
artifacts/features/
AGENTS.md                 # or another client adapter entrypoint, when needed
```

Before setup, make sure the target repository already contains the kit.

Recommended packaging paths:

- vendor or copy this repository into the target repo
- or copy `skills/` intact plus the scripts and adapter files you plan to use

`scripts/bootstrap-kit.sh` does not install skills into another repository. It only scaffolds folders, starter memory files, and a thin `AGENTS.md` stub when no other supported runtime entrypoint exists.

If you want a lightweight setup helper, run:

```text
scripts/bootstrap-kit.sh
```

It creates the canonical folders, starter repo-memory files, and a thin `AGENTS.md` stub only when no other supported runtime entrypoint exists.

The starter repo-memory files are:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

## Clean Repo Quickstart

Use this path when the target repository is starting from scratch:

1. copy or vendor the kit into the target repository
2. choose one adapter example from `adapters/`
3. place it at the runtime entrypoint your client expects
4. run `scripts/bootstrap-kit.sh`
5. refine the starter memory files
6. start the first real feature

Checked-in adapter examples:

- Codex or generic repo-instruction runtimes: `adapters/AGENTS.example.md`
- Claude Code: `adapters/CLAUDE.example.md`
- GitHub Copilot: `adapters/copilot-instructions.example.md`
- Gemini CLI: `adapters/GEMINI.example.md`

Expected repository shape after bootstrap:

```text
skills/
memories/repo/constitution.md
memories/repo/project-knowledge-base.md
artifacts/features/
AGENTS.md                 # or the runtime-specific entrypoint you chose
```

## First Commands

If your client uses a repo entrypoint file, add the matching runtime entrypoint first.
Its job is to point the agent to `skills/`, `memories/repo/`, and `artifacts/features/` without copying the workflow into the adapter.

If your runtime prefers another entrypoint file, use the matching checked-in example instead of inventing a new command surface.

If durable memory does not exist yet, start here:

```text
/constitution
/project-knowledge-base
```

Then start one real feature with a slug such as:

```text
my-first-feature
```

Helper skills you may use alongside the main flow:

- `/memory-promotion` when deciding whether a finding belongs in durable repo memory
- `/task-traceability-audit` when checking `REQ -> AC -> TASK -> validation` coverage

Thin command aliases stay close to the skill names:

- `/spec-review` is the public command for implementation review
- `/memory-promotion` and `/task-traceability-audit` are already the public skill names

## Core Workflow

```text
/constitution               (if durable repo rules do not exist yet)
/project-knowledge-base     (if durable repo context does not exist yet)
/analyze                    (if current behavior is unclear)
/spec-requirement
/spec-review-requirements
/spec-design                (only when technical ambiguity needs design)
/spec-plan
/spec-tasks
/task-traceability-audit    (when task traceability needs checking)
/spec-implement
/spec-review
/spec-testing-scenarios     (optional manual test guide)
/memory-promotion           (when deciding what belongs in durable repo memory)
```

Treat this as an operating sequence, not a menu.

## Good Usage Pattern

Use one stage at a time.

Example:

```text
/spec-requirement
Feature slug: my-first-feature

Create or refine the feature specification for this change.
```

Continue only after the resulting artifact is strong enough for the next stage.

In practice that means `spec.md` should cover the problem, users, key scenarios, meaningful constraints or dependencies, and reviewable acceptance criteria before you move on.

Use helper skills only when they solve a specific promotion or audit question. They do not replace the main artifact flow.

## Verification Rule

Do not mark a task done or describe a feature as complete until the relevant verification has been run and read.

That proof can be:

- a targeted automated test
- a focused manual check
- a bounded review finding with confirming evidence

The size of the proof can change with the task. The need for fresh evidence does not.

## Implementation Loop

After `tasks.md` exists, use this loop:

1. select the next unblocked task
2. confirm the upstream artifacts still support it
3. implement the bounded change
4. run the proving validation
5. update task state from evidence
6. run `/spec-review`
7. fix findings and re-review until the result is coherent

For behavior-changing work, start with a failing test or other failing proof when practical. For tiny or non-behavioral changes, use the smallest proof that still demonstrates the outcome.

## If Blocked

Move backward to the missing upstream artifact:

- unclear current behavior: go to `/analyze`
- weak or ambiguous spec: go to `/spec-requirement`
- requirements review says `not ready`: fix `spec.md`
- design ambiguity blocks planning: add `/spec-design`
- weak plan: fix `plan.md` before `/spec-tasks`
- a bug is not understood yet: return to `/analyze` and follow the debugging path
- weak completion evidence: return to `/spec-implement` or `/spec-review`

## FAQ

Do I need every workflow skill for every change?
- no
- small changes often use a shorter path
- use `/analyze` and `/spec-design` only when the current system or technical approach is unclear

What if requirements review says the spec is not ready?
- go back to `/spec-requirement`, fix `spec.md`, and run `/spec-review-requirements` again

Where should clarification happen?
- inside `/spec-requirement`
- `spec-review-requirements` should judge readiness, not silently rewrite the spec

Can I go straight to `/spec-implement`?
- not safely for most non-trivial work
- it assumes `spec.md`, `plan.md`, and `tasks.md` already exist and are usable

## What Not To Do

- do not treat chat history as more authoritative than artifacts
- do not skip quality gates when the upstream artifact is weak
- do not claim implementation is complete without fresh verification evidence
- do not broaden scope silently during implementation
