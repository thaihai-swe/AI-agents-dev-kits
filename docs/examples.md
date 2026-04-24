# Examples

## Release Baseline

Use this scenario as the release baseline:

- Feature: passwordless email login via one-time magic links
- Slug: `magic-link-login`

Why this is the baseline:

- it is a real product feature
- it is brownfield enough to require analysis
- it usually benefits from design
- it exercises the full workflow

Expected flow:

```text
/constitution               (if durable repo rules do not exist yet)
/project-knowledge-base     (if durable repo context does not exist yet)
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/task-traceability-audit
/spec-implement
/spec-review
/spec-testing-scenarios
/memory-promotion           (if durable findings emerge)
```

Good enough to hand off means:

- `analysis.md` separates evidence from inference
- `spec.md` has clear scope, users, requirements, and observable acceptance criteria
- `design.md` closes real technical ambiguity
- `plan.md` makes sequencing, validation, and protected behavior explicit
- `tasks.md` is bounded and traceable
- implementation has fresh verification evidence
- review is evidence-based

Typical prompt shape:

```text
/analyze
Feature slug: magic-link-login

Investigate the current authentication flow, session handling, token-related code paths, and email integration boundaries.
```

```text
/spec-requirement
Feature slug: magic-link-login

Create a feature specification for passwordless login via one-time email magic links.
```

```text
/spec-design
Feature slug: magic-link-login

Create a technical design for token issuance, verification, session creation, and email integration boundaries.
```

```text
Run task-traceability-audit on magic-link-login to confirm REQ -> AC -> TASK -> validation coverage before finalizing tasks.md.
```

## New Feature Example

Use the release baseline above as the canonical new-feature example.

## Brownfield Example

Scenario:

- add an audit event when legacy account status changes
- service boundaries are unclear

Why the flow matters:

- analysis is required before specification
- design is needed because boundaries are risky
- plan and tasks must treat regression protection as first-class work
- durable brownfield findings may need promotion into repo memory

Good enough to hand off:

- legacy boundaries are understandable
- protected unchanged behavior is explicit
- the chosen integration seam is clear
- any durable boundary findings are either promoted or explicitly kept local

Typical prompt shape:

```text
/analyze
Feature slug: legacy-account-status-audit

Investigate where account status changes occur, which subsystems own audit logging today, and what integrations must remain stable.
```

```text
/spec-design
Feature slug: legacy-account-status-audit

Create a technical design for the audit integration seam and protected legacy boundaries.
```

```text
Use memory-promotion to decide whether the discovered legacy boundary rules belong in project-knowledge-base.md or should stay in feature artifacts.
```

## Bug Fix Example

Scenario:

- password reset emails sometimes create invalid links after deployment

Typical shorter flow:

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Good enough to hand off:

- analysis identifies the actual mismatch, not just the symptom
- the plan keeps the repair scope narrow
- verification proves the link is generated correctly
- any traceability or completion claim is supported by task state and validation evidence

Typical prompt shape:

```text
/analyze
Feature slug: password-reset-link-fix

Investigate how reset links are built, which environment values they depend on, and where the mismatch occurs.
```

## Tiny Change Example

Scenario:

- update a settings page label to match approved wording

Typical shorter flow:

```text
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Good enough to hand off:

- the visible change is explicit
- unchanged behavior is called out briefly
- implementation evidence is proportional to the tiny scope

Even in tiny changes, `task-traceability-audit` can help if task coverage is unclear or the implementation review finds suspicious task-state drift.

Typical prompt shape:

```text
/spec-requirement
Feature slug: settings-label-update

Define the wording change for the settings label and the expected visible result.
```
