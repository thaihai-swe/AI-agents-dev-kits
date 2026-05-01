# Debugging

Use this page when the request is really a bug, failure, or unexpected behavior rather than a new feature.

The kit’s debugging stance is simple: understand the failure before proposing the repair.

## Recommended Path

For most bugs:

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Add `/spec-design` only when the fix needs a real technical design decision.

## What `/analyze` Should Prove

Before you move into repair work, the analysis should make these things visible:

- the reported symptom
- the expected behavior
- the first boundary where expected and observed behavior diverge
- the strongest supported root-cause hypothesis
- any protected behavior that the fix must preserve

If the bug still feels like guesswork, stay in `/analyze`.

## What The Repair Artifacts Should Do

`/spec-requirement`
- define the repair scope
- keep the fix narrow
- name the user-visible outcome and unchanged behavior

`/spec-plan`
- identify the technical repair path
- embed validation into the plan
- call out rollback or regression-sensitive behavior when needed

`/spec-tasks`
- turn the repair into bounded slices
- keep `REQ -> AC -> TASK -> validation` visible

`/spec-implement`
- prefer a failing proof first when practical
- update task state from observed evidence

`/spec-review`
- verify the fix addresses the root cause
- call out weak evidence, scope drift, or misleading task state

## Common Bug Classes

Use this path for:

- broken user-visible flows
- config mismatches
- integration failures
- performance regressions
- brownfield regressions where the failure location is not obvious

## When Not To Use This Page

If the task is really about understanding an unfamiliar subsystem before any change request exists, use [Understanding Existing Code](understanding-existing-code.md) instead.

If the task is a safe cleanup with no intended behavior change, use the `refactor-cleaner` skill instead of the feature workflow.
