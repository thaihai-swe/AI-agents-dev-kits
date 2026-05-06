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
AGENTS.md                 # or another client adapter entrypoint
```

- vendor or copy this repository into the target repo
- or copy `skills/` intact plus any scripts and adapter files you plan to use

`scripts/bootstrap-kit.sh` scaffolds folders and starter memory files. It does not install skills.

To initialize, run:
```text
scripts/bootstrap-kit.sh
```

The starter repo-memory files are:
- memories/repo/constitution.md
- memories/repo/project-knowledge-base.md

## Clean Repo Quickstart

1. Copy or vendor the kit into the target repository.
2. Choose one adapter example from `adapters/` and place it at the runtime entrypoint.
3. Run `scripts/bootstrap-kit.sh`.
4. Refine the starter memory files.
5. Start the first real feature with `/kit-spec`.

## First Commands

If durable memory does not exist yet, start here:
```text
/kit-memory
```

Then start a new feature with a slug:
```text
/kit-spec
Feature slug: my-first-feature
```

## Core Workflow (The 7-Skill Model)

```text
/kit-memory         (manage durable repo rules and context)
/kit-research       (investigate current behavior or bugs)
/kit-spec           (define what and why with Socratic refinement)
/kit-plan           (design technical approach and breakdown tasks)
/kit-implement      (execute tasks surgically)
/kit-verify         (verify implementation and drift)
/kit-cleanup        (perform maintenance refactoring)
```

## Good Usage Pattern

Use one stage at a time. Continue only after the resulting artifact is strong enough for the next stage.

In practice, that means `spec.md` should cover the problem, users, key scenarios, and acceptance criteria before you move on to `/kit-plan`.

## Implementation Loop

After `tasks.md` exists, use this loop:
1. Select the next unblocked task.
2. Mark it `In Progress`.
3. Implement the bounded change.
4. Run the proving validation.
5. Mark it `Done`.
6. Run `/kit-verify` after the task batch is ready.

## If Blocked

Move backward to the missing upstream artifact:
- Unclear behavior -> `/kit-research`
- Weak spec -> `/kit-spec`
- Design ambiguity -> `/kit-plan` (add `design.md`)
- Weak plan -> `/kit-plan` (refine `plan.md`)
- Bug not understood -> `/kit-research`
- Weak evidence -> `/kit-implement` or `/kit-verify`

## What Not To Do

- Do not treat chat history as more authoritative than artifacts.
- Do not skip quality gates when the upstream artifact is weak.
- Do not claim implementation is complete without fresh evidence.
- Do not broaden scope silently during implementation.
