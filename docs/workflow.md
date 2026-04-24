# Workflow

## Workflow Model

This kit separates durable repository context from change-specific work.

Durable repo memory:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Per-feature artifacts:

- `artifacts/features/<slug>/analysis.md`
- `artifacts/features/<slug>/spec.md`
- `artifacts/features/<slug>/requirements-review.md`
- `artifacts/features/<slug>/design.md`
- `artifacts/features/<slug>/plan.md`
- `artifacts/features/<slug>/tasks.md`
- `artifacts/features/<slug>/review.md`
- `artifacts/features/<slug>/testing-scenarios.md`

## Why Artifacts Exist

Artifacts make the workflow reviewable and resumable.

Each artifact has one job. That is the main guard against scope drift and vague handoffs.

## Artifact Lifecycle

`analysis.md`
- bounded discovery about the current system
- reduces uncertainty before committing to a feature definition
- not a durable repo-memory file
- not a plan

`spec.md`
- the statement of what should change and why
- defines intent, scope, requirements, and acceptance criteria
- not a technical plan
- not a coding checklist

`requirements-review.md`
- the readiness judgment for the spec
- prevents downstream work from starting on weak requirements
- not a rewritten spec

`design.md`
- technical clarification for features that need it
- removes planning ambiguity
- not a task list

`plan.md`
- the execution strategy
- translates approved intent into sequencing, boundaries, validation, and rollout thinking
- not production code
- not a patch-level implementation diff

`tasks.md`
- bounded execution units derived from the plan
- lets implementation happen in reviewable slices
- not a loose brainstorm list

`review.md`
- durable implementation review findings when useful
- preserves what was checked and what issues remain
- not mandatory for every tiny change

`testing-scenarios.md`
- a human-run manual testing guide for delivered behavior
- turns implemented or reviewed scope into clear tester-facing scenarios
- not an automated test suite
- not a replacement for implementation review

## Repo Memory Vs Feature Artifacts

Use repo memory for:

- durable rules
- durable architecture and integration context
- recurring patterns

Use feature artifacts for:

- feature-specific decisions
- current feature constraints
- work-in-progress clarification, planning, tasks, and review

## Stage Responsibilities

### Foundation Skills

`/constitution`
- creates or maintains durable repo-wide rules and guardrails

`/project-knowledge-base`
- creates or maintains durable descriptive repository context

### Feature Workflow Skills

`/analyze`
- investigates current behavior, bugs, and brownfield constraints

`/spec-requirement`
- defines what should change and why

`/spec-review-requirements`
- judges whether the spec is ready for design or planning

`/spec-design`
- resolves technical ambiguity when planning needs design decisions

`/spec-plan`
- turns approved intent into execution strategy

`/spec-tasks`
- turns the plan into bounded implementation slices

`/spec-implement`
- executes one bounded task at a time with validation

`/spec-review`
- reviews delivered work against artifacts and evidence

`/spec-testing-scenarios`
- creates a human-run testing guide for delivered behavior

### Helper Skills

`memory-promotion`
- decides whether a finding should move into durable repo memory, escalate into the constitution, or remain in feature artifacts

`task-traceability-audit`
- checks whether `REQ -> AC -> TASK -> validation` coverage is complete and trustworthy

## How Helpers Fit

Use `memory-promotion` after analysis, design, implementation, or review when durable findings emerge.

Use `task-traceability-audit` after task generation, during implementation, or during implementation review when traceability confidence matters.

## When Steps Are Optional

`/constitution` and `/project-knowledge-base` are required only when durable repo memory does not already exist or needs amendment.

`/analyze` is optional when current behavior is already obvious.

`/spec-review-requirements` may be skipped only when the change is tiny, obvious, and low-risk.

`/spec-design` is optional when planning can proceed safely from the spec without reopening technical choices.

`/spec-testing-scenarios` is optional when a manual testing guide is unnecessary.

## Stop Conditions

Stop and move backward when:

- the request is still too unclear to specify safely
- requirements review says the spec is not ready
- design ambiguity still blocks planning
- the plan is not decomposable into safe tasks
- the selected task is broader or more ambiguous than the artifacts claim
- implementation evidence is too weak to support completion

## Quality Bar

The workflow is working correctly when:

- artifacts become more specific as work moves downstream
- downstream stages do not invent missing upstream decisions
- review and validation are based on evidence, not plausibility
- `REQ -> AC -> TASK -> validation` stays intact
