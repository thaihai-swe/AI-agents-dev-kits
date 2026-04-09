# Artifacts Reference

## `analysis.md`

Owner:
- `/analyze`

Purpose:
- capture bounded discovery about the current system

Required when:
- current behavior, constraints, or risks are unclear

Stop conditions:
- critical unknowns remain unresolved

## `spec.md`

Owner:
- `/spec-requirement`

Purpose:
- define what should change and why

Must include:
- users or scenarios
- requirements
- acceptance criteria
- clarification outcomes

Stop conditions:
- blocking clarification remains unresolved

## `requirements-review.md`

Owner:
- `/spec-review-requirements`

Purpose:
- record readiness judgment for the spec

Possible verdicts:
- `ready`
- `ready with minor issues`
- `not ready`

## `design.md`

Owner:
- `/spec-design`

Purpose:
- clarify technical approach when planning depends on it

Required when:
- boundaries, interfaces, migrations, or major tradeoffs need explicit treatment

## `plan.md`

Owner:
- `/spec-plan`

Purpose:
- define execution strategy

Must include:
- pre-plan analysis
- affected domains and boundaries
- protected behavior
- sequencing
- validation strategy

Stop conditions:
- spec is still blocked
- sequencing is unsafe

## `tasks.md`

Owner:
- `/spec-tasks`

Purpose:
- define bounded execution units

Must include:
- dependencies
- status fields
- validation notes
- complete `REQ -> AC -> TASK -> validation` coverage

Stop conditions:
- plan is not taskable
- validation direction is missing

## `review.md`

Owner:
- `/spec-review`

Purpose:
- preserve implementation review findings when useful

Core review lenses:
- completeness
- correctness
- coherence
