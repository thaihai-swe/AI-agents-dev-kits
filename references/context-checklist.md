# Context Checklist

Shared checklist for loading the right context before using the existing skills.

Use this file only for cross-skill context loading. If a rule becomes workflow-defining, move it into the owning `SKILL.md` instead.

## Session Start

Load the durable repository context once per session:

- [ ] Read the repo entrypoint such as `AGENTS.md` when one exists.
- [ ] Read `memories/repo/constitution.md`.
- [ ] Read `memories/repo/project-knowledge-base.md`.
- [ ] Confirm which existing skill owns the current task.

## Feature Start

Before feature-spec, design, plan, tasks, or implementation work:

- [ ] Read the current feature artifact folder under `artifacts/features/<slug>/`.
- [ ] Identify which upstream artifact is the current source of truth.
- [ ] If the current system behavior is unclear, route to `/analyze` before guessing.
- [ ] If durable memory is missing or stale, route to `/constitution` or `/project-knowledge-base` instead of improvising around it.

## Before Implementation

Before using `spec-implement` or `refactor-cleaner`:

- [ ] Read the task, plan, and spec that define the scoped work.
- [ ] Read the files you will modify and the callers or dependents that make the change risky.
- [ ] Identify the concrete validation you will run before claiming completion.
- [ ] Surface any contradiction between artifacts and repository reality before editing.

## Before Review

Before using `spec-review-implementation` or `task-traceability-audit`:

- [ ] Confirm the relevant artifacts exist and are reviewable.
- [ ] Confirm task state matches actual validation evidence.
- [ ] Check that `REQ -> AC -> TASK -> validation` is still visible.
- [ ] Reopen the task or upstream artifact if the evidence no longer supports the claimed state.

## Promotion Check

Before moving a finding into durable memory:

- [ ] Is the finding durable across future changes?
- [ ] Is it grounded in repository evidence?
- [ ] Is it descriptive knowledge rather than a repository-wide rule?
- [ ] Should it stay in feature artifacts instead?

If the answer is unclear, use `memory-promotion` instead of guessing.

## Drift Signals

Treat these as signs to stop and realign:

- docs or adapters teach behavior the skills do not require
- bootstrap creates a different baseline than onboarding docs describe
- a shared reference introduces concepts that do not appear in the active skill contracts
- an implementation or cleanup task is broader than the upstream artifacts claim
