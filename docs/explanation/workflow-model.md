# Workflow Model

## The Workflow Shape

Most meaningful work follows this flow:

```text
/analyze                    (if current system behavior is unclear)
/spec-requirement           (define intent and resolve blocking clarification)
/spec-review-requirements   (judge readiness)
/spec-design                (optional technical clarification)
/spec-plan                  (pre-plan analysis + execution strategy)
/spec-tasks                 (bounded implementation tasks)
/spec-implement             (execute tasks)
/spec-review                (run `spec-review-implementation`)
```

## What Each Stage Does

### Discovery

`/analyze` investigates the current system before the team commits to a feature definition.

### Specification

`/spec-requirement` defines what should change and why.

It also owns clarification:
- blocking ambiguity should be resolved here
- only non-blocking open questions should remain in the spec

### Requirements Review

`/spec-review-requirements` is the first quality gate.

Its job is to judge whether the current spec is ready for design or planning.
It should not silently rewrite the spec.

### Design

`/spec-design` is optional.

Use it when planning depends on technical choices such as:
- cross-boundary changes
- interface changes
- migrations
- multiple viable approaches

### Planning

`/spec-plan` turns approved intent into an execution strategy.

It should make explicit:
- affected domains
- integration boundaries
- protected behavior
- validation strategy
- sequencing and rollout risk

### Tasks

`/spec-tasks` turns the plan into bounded work units.

It should only finalize tasks when:
- the plan is decomposable
- tasks are review-sized
- validation is clear
- `REQ -> AC -> TASK -> validation` coverage is complete

### Implementation and Review

`/spec-implement` executes tasks.
`/spec-review` runs the `spec-review-implementation` skill to check completeness, correctness, and coherence against the approved artifacts.

## What Changes the Flow

- Skip `/analyze` when current behavior is already clear
- Skip `/spec-design` when planning can proceed safely without extra technical clarification
- Do not skip `/spec-plan` or `/spec-tasks` for meaningful work

## Read Next

- [Artifact Model](artifact-model.md)
- [Decision Rules](../guides/decision-rules.md)
