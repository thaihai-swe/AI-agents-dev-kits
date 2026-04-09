# Brownfield Example

## Starting Context

Scenario: add an audit event when legacy account status changes, but the repository has unclear service boundaries.

Feature slug:

```text
legacy-account-status-audit
```

## Flow

### 1. Start with bounded investigation

```text
/analyze
Feature slug: legacy-account-status-audit

Investigate where account status changes occur, which subsystems own audit logging today, and what integrations must remain stable.
```

Artifact:
- `analysis.md`

### 2. Write the feature spec from evidence

```text
/spec-requirement
Feature slug: legacy-account-status-audit
```

Artifact:
- `spec.md`

### 3. Review readiness

```text
/spec-review-requirements
Feature slug: legacy-account-status-audit
```

Artifact:
- `requirements-review.md`

### 4. Add design because boundaries are unclear

```text
/spec-design
Feature slug: legacy-account-status-audit
```

Artifact:
- `design.md`

### 5. Plan with protected behavior

```text
/spec-plan
Feature slug: legacy-account-status-audit
```

Artifact:
- `plan.md`

The plan should call out:
- affected legacy boundaries
- unchanged status-change behavior
- audit integration seams

### 6. Create tasks with regression protection

```text
/spec-tasks
Feature slug: legacy-account-status-audit
```

Artifact:
- `tasks.md`

## Why This Flow Matters

This is the kind of change where skipping analysis would make the downstream artifacts speculative.
