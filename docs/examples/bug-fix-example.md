# Bug Fix Example

## Starting Context

Scenario: password reset emails sometimes create invalid links after deployment.

Feature slug:

```text
password-reset-link-fix
```

## Flow

### 1. Investigate the regression

```text
/analyze
Feature slug: password-reset-link-fix

Investigate how reset links are built, which environment values they depend on, and where the mismatch occurs.
```

Artifact:
- `analysis.md`

### 2. Define the corrected behavior

```text
/spec-requirement
Feature slug: password-reset-link-fix

Define the expected behavior for password reset link generation and delivery.
```

Artifact:
- `spec.md`

### 3. Plan the fix

```text
/spec-plan
Feature slug: password-reset-link-fix
```

Artifact:
- `plan.md`

Focus:
- narrow repair scope
- regression protection

### 4. Create tasks

```text
/spec-tasks
Feature slug: password-reset-link-fix
```

Artifact:
- `tasks.md`

### 5. Implement and review

```text
/spec-implement
/spec-review
```

## Why This Flow Is Shorter

- the problem is not a net-new feature
- `/spec-design` is unnecessary unless the fix becomes architectural
- `/spec-review-requirements` is optional if scope is already very clear
