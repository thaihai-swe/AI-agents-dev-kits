# Reference

## Commands

`/constitution`
- creates `memories/repo/constitution.md`
- use when setting durable repo-wide rules
- stop when the requested content is really descriptive context rather than a durable rule

`/project-knowledge-base`
- creates or updates `memories/repo/project-knowledge-base.md`
- use when capturing durable descriptive repository context
- stop when the content is feature-specific or should be a rule in the constitution

`/analyze`
- creates `artifacts/features/<slug>/analysis.md`
- use when current behavior, bugs, or brownfield constraints need evidence first
- stop when the request is really asking for a spec, design, or plan instead of discovery

`/spec-requirement`
- creates or updates `artifacts/features/<slug>/spec.md`
- use when defining what should change and why
- stop when users, scope, success outcomes, or acceptance criteria are still blocked

`/spec-review-requirements`
- creates or updates `artifacts/features/<slug>/requirements-review.md`
- verdicts: `ready`, `ready with minor issues`, `not ready`
- use when judging whether `spec.md` is ready for design or planning
- stop when `spec.md` is missing or clearly not ready

`/spec-design`
- creates or updates `artifacts/features/<slug>/design.md`
- use when planning depends on technical clarification
- stop when `spec.md` is missing, not ready, or design is unnecessary

`/spec-plan`
- creates or updates `artifacts/features/<slug>/plan.md`
- use when the spec is approved and clarified
- stop when blocking clarification remains, design is required but missing, or sequencing is unsafe

`/spec-tasks`
- creates or updates `artifacts/features/<slug>/tasks.md`
- use when the plan is ready to decompose into bounded execution units
- stop when the plan is not taskable or traceability would be incomplete

`/spec-implement`
- updates code, tests, and `tasks.md`
- task states: `Not Started`, `In Progress`, `Blocked`, `Done`, `Deferred`
- use when the next unblocked task is ready to execute
- stop when required artifacts are missing or the selected task is blocked or ambiguous

`/spec-review`
- runs the `spec-review-implementation` skill
- may create `artifacts/features/<slug>/review.md`
- verdicts: `approved`, `approved with follow-ups`, `changes required`
- use when implementation work has been attempted and needs verification
- stop when implementation has not actually been attempted or review evidence is missing

`/spec-testing-scenarios`
- creates or updates `artifacts/features/<slug>/testing-scenarios.md`
- use when delivered behavior needs a human-run manual testing guide
- stop when implementation is too incomplete to describe meaningful manual scenarios

`memory-promotion`
- does not own a fixed artifact
- use when deciding whether a finding should go to `project-knowledge-base.md`, `constitution.md`, or remain in feature artifacts
- stop when the finding is still too uncertain or feature-local to promote

`task-traceability-audit`
- does not own a fixed artifact
- use when checking `REQ -> AC -> TASK -> validation` coverage during tasks, implementation, or review
- stop when the underlying artifacts are too incomplete to audit meaningfully

## Quick Operating Rules

Verification:

- completion claims require fresh evidence
- task states should reflect observed results, not optimistic intent
- review verdicts should match the current evidence, not the size of the diff

Debugging:

- reproduce first when practical
- inspect boundaries before proposing repairs
- fix the root cause, not only the visible symptom

Implementation loop:

- implement one bounded task
- validate it
- review it
- fix or reopen the upstream artifact
- re-review until the record is coherent

## Command Groups

Foundation:

- `/constitution`
- `/project-knowledge-base`

Feature workflow:

- `/analyze`
- `/spec-requirement`
- `/spec-review-requirements`
- `/spec-design`
- `/spec-plan`
- `/spec-tasks`
- `/spec-implement`
- `/spec-review`
- `/spec-testing-scenarios`

Helpers:

- `memory-promotion`
- `task-traceability-audit`

## Artifact Roles

`constitution.md`
- durable repo-wide rules

`project-knowledge-base.md`
- durable descriptive repository context

`analysis.md`
- bounded current-state investigation

`spec.md`
- feature intent, scope, requirements, and acceptance criteria

`requirements-review.md`
- readiness judgment for the spec

`design.md`
- technical decisions and tradeoffs when needed

`plan.md`
- execution strategy

`tasks.md`
- bounded implementation units with validation and task-state tracking

`review.md`
- durable implementation review findings when useful

`testing-scenarios.md`
- human-run test guide

## Helper Skill Roles

`memory-promotion`
- promotion decision support for durable repository memory

`task-traceability-audit`
- traceability verification across requirements, acceptance criteria, tasks, and validation

## Terminology

Skill
- a workflow contract stored in `skills/*/SKILL.md`

Reference
- a bundled support file stored in `skills/*/references/`

Constitution
- the normative repo-memory file

Project knowledge base
- the descriptive repo-memory file

Feature artifact
- a per-feature document under `artifacts/features/<slug>/`

Specification
- the statement of what should change and why, stored as `spec.md`

Requirements review
- the readiness judgment for the spec, stored as `requirements-review.md`

Design
- technical clarification used when planning depends on it, stored as `design.md`

Plan
- the execution strategy for a feature, stored as `plan.md`

Tasks
- bounded execution units derived from the plan, stored as `tasks.md`

Review
- the implementation verification step that checks delivered work against approved artifacts

Taskability
- the quality of a plan being decomposable into bounded, reviewable, validation-backed tasks without forcing the implementer to invent missing strategy

Artifact-first
- artifacts, not chat, are the durable source of truth

Repo memory
- durable repository-wide context under `memories/repo/`

Feature artifacts
- change-specific files under `artifacts/features/<slug>/`

Traceability
- keeping `REQ -> AC -> TASK -> validation` intact

Thin adapter
- a client entrypoint file that points to the workflow without duplicating it
