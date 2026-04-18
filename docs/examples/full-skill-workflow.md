# Full Skill Workflow Example

## Purpose

This example shows how to use the full skill-based workflow in sequence, from repository setup through implementation review.

It uses one feature example all the way through so you can see:

- which skill to use first
- what artifact each skill creates or updates
- when helper skills fit into the flow
- where the workflow should stop instead of pushing bad context downstream

## Example Scenario

Repository context:

- the repo does not yet have durable memory
- the team wants to add passwordless email login with one-time magic links

Feature slug:

```text
magic-link-login
```

Feature artifact folder:

```text
artifacts/features/magic-link-login/
```

## Phase 0: Repository Memory Setup

Use these skills when the repository itself still needs durable memory.

### 1. `constitution`

Use:

```text
/constitution
Create the initial repository constitution for this spec-driven kit.
```

Output:

- `memories/repo/constitution.md`

What this skill does:

- defines durable repo-wide rules
- sets quality gates and architectural guardrails
- creates the normative source of truth for future work

### 2. `project-knowledge-base`

Use:

```text
/project-knowledge-base
Create the initial project knowledge base for this repository.
```

Output:

- `memories/repo/project-knowledge-base.md`

What this skill does:

- records durable descriptive repository context
- captures stable patterns, boundaries, and watchouts
- complements the constitution without turning facts into rules

### 3. `memory-promotion`

Use this helper skill whenever you are unsure whether something belongs in durable repo memory or should stay in feature artifacts.

Typical use:

- after analysis
- while updating `project-knowledge-base.md`
- when deciding whether a finding is really a repo-wide rule

Possible outcomes:

- promote to `project-knowledge-base.md`
- promote to `constitution.md`
- keep in feature artifacts

## Phase 1: Discovery And Specification

### 4. `analyze`

Use:

```text
/analyze
Feature slug: magic-link-login

Investigate the current authentication flow, session handling, token-related code paths, and email integration boundaries.
```

Output:

- `artifacts/features/magic-link-login/analysis.md`

Use this skill when:

- current behavior is unclear
- a brownfield path needs investigation
- the team needs evidence before writing the spec

Stop here if:

- evidence is still too weak to define the current state confidently

### 5. `spec-requirement`

Use:

```text
/spec-requirement
Feature slug: magic-link-login

Create a feature specification for passwordless login via one-time email magic links.
```

Output:

- `artifacts/features/magic-link-login/spec.md`

What this skill should resolve:

- who the users are
- the problem being solved
- the intended journey and experience
- requirements and acceptance criteria
- blocking clarification that would otherwise poison later steps

Stop here if:

- target users, problem, workflow, or success outcomes are still unclear

### 6. `spec-review-requirements`

Use:

```text
/spec-review-requirements
Feature slug: magic-link-login
```

Output:

- `artifacts/features/magic-link-login/requirements-review.md`

What this skill does:

- reviews the spec as written
- issues a readiness verdict
- distinguishes blocking issues from non-blocking improvements

Typical verdicts:

- `ready`
- `ready with minor issues`
- `not ready`

Stop here if:

- verdict is `not ready`

Then go back to `spec-requirement` and improve `spec.md`.

## Phase 2: Technical Clarification And Planning

### 7. `spec-design`

Use this only when design reduces planning ambiguity.

Use:

```text
/spec-design
Feature slug: magic-link-login

Create a technical design for token issuance, verification, session creation, and email integration boundaries.
```

Output:

- `artifacts/features/magic-link-login/design.md`

Use this skill when:

- the feature crosses boundaries
- new interfaces or flows need decisions
- there are real tradeoffs or risky brownfield changes

Skip this skill when:

- the change is simple and localized enough to plan directly from the spec

### 8. `spec-plan`

Use:

```text
/spec-plan
Feature slug: magic-link-login
```

Output:

- `artifacts/features/magic-link-login/plan.md`

What this skill should make explicit:

- affected domains and boundaries
- technical approach
- protected behavior
- sequencing and dependencies
- validation strategy
- rollout and rollback posture

Stop here if:

- the spec is still blocked
- design is required but missing
- dependencies or sequencing are still too unclear

## Phase 3: Task Decomposition

### 9. `spec-tasks`

Use:

```text
/spec-tasks
Feature slug: magic-link-login
```

Output:

- `artifacts/features/magic-link-login/tasks.md`

What this skill should produce:

- bounded, reviewable tasks
- explicit dependencies
- validation tasks
- resumable implementation tracking
- full `REQ -> AC -> TASK -> validation` coverage

### 10. `task-traceability-audit`

Use this helper skill as part of task finalization and later review.

Use it to verify:

- every material `REQ-*` maps to `AC-*`
- every material `AC-*` maps to `TASK-*`
- validation exists for behavior-changing work
- task state and reality do not diverge

Typical use after `spec-tasks`:

```text
Run task-traceability-audit on magic-link-login to confirm REQ -> AC -> TASK -> validation coverage before finalizing tasks.md.
```

Stop here if:

- major acceptance criteria lack task or validation coverage

## Phase 4: Implementation

### 11. `spec-implement`

Use:

```text
/spec-implement
Feature slug: magic-link-login

Implement the next unblocked task from tasks.md.
```

Or for explicit tasks:

```text
/spec-implement
Feature slug: magic-link-login

Implement TASK-001 and TASK-002.
```

Outputs:

- code and test changes
- updated `artifacts/features/magic-link-login/tasks.md`

What this skill must do:

- implement from `tasks.md`, not from vague intent
- respect dependencies and scope boundaries
- update task status immediately
- validate before marking work done

Use `task-traceability-audit` here when checking whether a selected task still traces cleanly to requirements, acceptance criteria, and validation.

Stop here if:

- the task is blocked
- prerequisites are missing
- scope drift appears
- the task is more ambiguous or cross-cutting than described

## Phase 5: Implementation Review

### 12. `spec-review-implementation`

Use:

```text
/spec-review
Feature slug: magic-link-login
```

Or, in skill terms:

```text
Use spec-review-implementation for magic-link-login.
```

Outputs:

- review findings
- optional `artifacts/features/magic-link-login/review.md`

What this skill reviews:

- requirement coverage
- validation quality
- scope control
- task and traceability accuracy
- repository rule compliance

Possible verdicts:

- `approved`
- `approved with follow-ups`
- `changes required`

Use `task-traceability-audit` here when you need to confirm that delivered implementation still preserves the `REQ -> AC -> TASK -> validation` chain.

Stop here if:

- implementation evidence is missing
- task state is stale or misleading
- requirements are unmet or unverifiable

## End-To-End Summary

The full sequence looks like this:

```text
constitution
project-knowledge-base
memory-promotion                   (helper, used when deciding what becomes durable memory)
analyze
spec-requirement
spec-review-requirements
spec-design                        (only when needed)
spec-plan
spec-tasks
task-traceability-audit            (helper, used during task finalization and review)
spec-implement
spec-review-implementation
```

## Practical Notes

- Not every feature needs `analyze`.
- Not every feature needs `spec-design`.
- The two helper skills are not always standalone steps, but they are part of the real workflow.
- The workflow is safest when each skill stops on weak upstream context instead of compensating for it.
- Artifacts, not chat history, remain the source of truth throughout the sequence.
