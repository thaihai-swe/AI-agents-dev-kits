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

## Verification First

Do not treat a plausible diff as completion.

At implementation and review time:

- identify the concrete proof for the current task
- run the proof after the change, not just before it
- read the output before updating task state or review verdicts
- move backward when the evidence does not support the claimed outcome

Fresh verification evidence is part of the workflow contract, not an optional courtesy.

## Test-First Default

For behavior-changing work, prefer starting with a failing test or other failing proof when practical.

That default is strong, but not dogmatic:

- use a targeted failing automated test when the change is testable that way
- use the smallest bounded failing proof available when the work is manual, UI-heavy, or integration-heavy
- do not force heavyweight scaffolding onto tiny or non-behavioral changes

## Debugging Path

When the requested change is a bug fix or brownfield repair:

1. reproduce the symptom or gather the strongest available evidence
2. inspect the boundary where the wrong behavior becomes visible
3. trace backward until the root cause is clearer than the symptom
4. define the narrow repair in `spec.md`, `plan.md`, and `tasks.md`
5. verify the fix against the observed failure mode

Do not treat error suppression, retries, or defensive patches as a fix unless the artifacts explicitly justify that approach.

## When Steps Are Optional

`/constitution` and `/project-knowledge-base` are required only when durable repo memory does not already exist or needs amendment.

`/analyze` is optional when current behavior is already obvious.

`/spec-review-requirements` may be skipped only when the change is tiny, obvious, and low-risk.

`/spec-design` is optional when planning can proceed safely from the spec without reopening technical choices.

`/spec-testing-scenarios` is optional when a manual testing guide is unnecessary.

## Team And Multi-Agent Coordination

When multiple people or agents work in the same repository, artifact-first discipline becomes critical.

**Key principles:**

- stabilize upstream artifacts (`spec.md`, `plan.md`, `tasks.md`) before parallelizing implementation
- serialize edits to shared planning artifacts
- parallelize only bounded implementation tasks with clear file boundaries
- assign one owner per parallel task batch
- revalidate after parallel work lands

For detailed coordination rules, including how to avoid race conditions and task-state drift, see [Adoption → Team And Multi-Agent Rule](adoption.md#team-and-multi-agent-rule).

## Stop Conditions

Stop and move backward when:

- the request is still too unclear to specify safely
- requirements review says the spec is not ready
- design ambiguity still blocks planning
- the plan is not decomposable into safe tasks
- the selected task is broader or more ambiguous than the artifacts claim
- implementation evidence is too weak to support completion

## Implementation And Review Loop

After `tasks.md` exists, the normal delivery loop is:

1. select the next unblocked task
2. verify the task preconditions and upstream artifacts still match reality
3. implement only the bounded task
4. run the proving validation
5. update task state from evidence
6. run implementation review
7. fix findings or reopen the upstream artifact if the issue is not local
8. re-review until the evidence and artifacts agree

That loop is normal. Re-review is not a failure mode.

## Quality Bar

The workflow is working correctly when:

- artifacts become more specific as work moves downstream
- downstream stages do not invent missing upstream decisions
- review and validation are based on evidence, not plausibility
- `REQ -> AC -> TASK -> validation` stays intact
