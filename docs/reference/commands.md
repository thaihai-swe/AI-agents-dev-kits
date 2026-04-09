# Commands Reference

## `/constitution`

Use when:
- setting durable repo-wide rules

Required inputs:
- repository context
- any explicit repo-wide rules or guardrails to adopt

Output:
- `memories/repo/constitution.md`

Stop when:
- rules are still vague or not truly repo-wide
- the change is really descriptive context rather than a durable rule

## `/project-knowledge-base`

Use when:
- capturing durable descriptive repository context

Required inputs:
- repository context
- any durable findings worth promoting

Output:
- `memories/repo/project-knowledge-base.md`

Stop when:
- findings are feature-specific rather than durable
- the content is really a normative rule that belongs in the constitution

## `/analyze`

Use when:
- current system behavior is unclear
- brownfield constraints need investigation
- a bug or regression needs evidence first

Required inputs:
- feature slug or explicit investigation target

Output:
- `artifacts/features/<slug>/analysis.md`

Stop when:
- critical unknowns still block confident specification
- the request is really asking for a spec, design, or plan instead of discovery

## `/spec-requirement`

Use when:
- defining what should change and why
- resolving blocking clarification before requirements review

Required inputs:
- feature slug
- feature request, idea, bug definition, or existing `spec.md`

Output:
- `artifacts/features/<slug>/spec.md`

Stop when:
- users, scope, success outcomes, or acceptance criteria are still blocked

## `/spec-review-requirements`

Use when:
- judging whether `spec.md` is ready for design or planning

Required inputs:
- feature slug

Output:
- `artifacts/features/<slug>/requirements-review.md`

Stop when:
- the spec is not ready and must be revised upstream
- `spec.md` does not exist

## `/spec-design`

Use when:
- planning depends on technical clarification
- interfaces, migrations, or cross-boundary tradeoffs need explicit treatment

Required inputs:
- feature slug

Output:
- `artifacts/features/<slug>/design.md`

Stop when:
- `spec.md` is missing or not ready
- design is unnecessary because planning can proceed safely without it

## `/spec-plan`

Use when:
- the spec is approved and clarified
- you need pre-plan analysis plus execution strategy

Required inputs:
- feature slug

Output:
- `artifacts/features/<slug>/plan.md`

Stop when:
- blocking clarification remains
- design is required but missing
- safe sequencing is not yet possible

## `/spec-tasks`

Use when:
- the plan is ready to decompose

Required inputs:
- feature slug

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
- feature slug
- `spec.md`
- `plan.md`
- `tasks.md`

Output:
- code and test changes
- updated task status in `tasks.md`

Stop when:
- required artifacts are missing
- the selected task is blocked, ambiguous, or contradicted by upstream artifacts

## `/spec-review`

Use when:
- implementation work has been attempted and needs verification

Required inputs:
- feature slug
- implemented work to review

Output:
- review findings
- optional `artifacts/features/<slug>/review.md`

Core review lenses:
- completeness
- correctness
- coherence

Stop when:
- implementation has not actually been attempted
- required review artifacts are missing
