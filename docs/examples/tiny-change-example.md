# Tiny Change Example

## Starting Context

Scenario: update a settings page label so it matches the approved product wording.

Feature slug:

```text
settings-label-update
```

## Why This Is A Tiny Change

- current behavior is already clear
- no boundary or architecture work is involved
- the change is low-risk and tightly scoped
- the intended behavior is obvious and easily reviewable

## Flow

### 1. Define The Change

```text
/spec-requirement
Feature slug: settings-label-update

Define the wording change for the settings label and the expected visible result.
```

Artifact:

- `spec.md`

### 2. Plan Briefly

```text
/spec-plan
Feature slug: settings-label-update
```

Artifact:

- `plan.md`

Focus:

- affected UI surface
- unchanged behavior
- simple validation approach

### 3. Create Tasks

```text
/spec-tasks
Feature slug: settings-label-update
```

Artifact:

- `tasks.md`

Focus:

- one or two bounded tasks
- explicit validation

### 4. Implement And Review

```text
/spec-implement
/spec-review
```

Outputs:

- code and test or manual validation updates
- updated `tasks.md`
- optional `review.md`

## Why This Flow Is Shorter

- `/analyze` is unnecessary because current behavior is already known
- `/spec-review-requirements` is unnecessary because the spec is obvious and low-risk
- `/spec-design` is unnecessary because no architectural ambiguity exists

## Escalate If

Move to the fuller workflow if:

- more screens are affected than expected
- the wording change reveals hidden rules or branching behavior
- the change is no longer obviously low-risk
