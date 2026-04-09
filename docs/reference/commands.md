# Commands Reference

## `/constitution`

Use when:
- setting durable repo-wide rules

Output:
- `memories/repo/constitution.md`

Stop when:
- rules are still vague or not truly repo-wide

## `/project-knowledge-base`

Use when:
- capturing durable descriptive repository context

Output:
- `memories/repo/project-knowledge-base.md`

Stop when:
- findings are feature-specific rather than durable

## `/analyze`

Use when:
- current system behavior is unclear
- brownfield constraints need investigation
- a bug or regression needs evidence first

Output:
- `artifacts/features/<slug>/analysis.md`

Stop when:
- critical unknowns still block confident specification

## `/spec-requirement`

Use when:
- defining what should change and why
- resolving blocking clarification before requirements review

Output:
- `artifacts/features/<slug>/spec.md`

Stop when:
- users, scope, success outcomes, or acceptance criteria are still blocked

## `/spec-review-requirements`

Use when:
- judging whether `spec.md` is ready for design or planning

Output:
- `artifacts/features/<slug>/requirements-review.md`

Stop when:
- the spec is not ready and must be revised upstream

## `/spec-design`

Use when:
- planning depends on technical clarification
- interfaces, migrations, or cross-boundary tradeoffs need explicit treatment

Output:
- `artifacts/features/<slug>/design.md`

## `/spec-plan`

Use when:
- the spec is approved and clarified
- you need pre-plan analysis plus execution strategy

Output:
- `artifacts/features/<slug>/plan.md`

Stop when:
- blocking clarification remains
- design is required but missing
- safe sequencing is not yet possible

## `/spec-tasks`

Use when:
- the plan is ready to decompose

Output:
- `artifacts/features/<slug>/tasks.md`

Stop when:
- the plan is not taskable
- validation direction is missing
- traceability would be incomplete

## `/spec-implement`

Use when:
- the next unblocked task is ready to execute

Inputs:
- `spec.md`
- `plan.md`
- `tasks.md`

Output:
- code and test changes
- updated task status in `tasks.md`

## `/spec-review`

Use when:
- implementation work has been attempted and needs verification

Output:
- review findings
- optional `artifacts/features/<slug>/review.md`

Core review lenses:
- completeness
- correctness
- coherence
