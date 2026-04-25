# Examples

Use this page as a practical scenario guide.

For a Mermaid view of the same choices, use [Use Case Workflows](use-case-workflows.md).

## Scenario Index

| Use case | Typical goal | Typical flow |
|---|---|---|
| New project | bootstrap the kit in a fresh repo | `constitution -> project-knowledge-base -> first feature` |
| Existing project adoption | introduce the kit into a brownfield repo | `analyze -> minimal memory -> first bounded feature` |
| New feature | deliver a real feature with full artifacts | `analyze -> spec -> review -> design -> plan -> tasks -> implement -> review` |
| Brownfield feature | change risky legacy code safely | `analyze -> spec -> design -> plan -> tasks -> implement -> review -> memory-promotion` |
| Bug fix | repair a narrow failure without bloating scope | `analyze -> spec -> plan -> tasks -> implement -> review` |
| Tiny change | make a low-risk wording or UI tweak | `spec -> plan -> tasks -> implement -> review` |

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

Test-first stance for this baseline:

- for behavior-changing work, prefer a failing automated test or another failing proof before the repair
- keep the proof narrow enough to match the current task boundary

Normal delivery loop after planning:

1. implement one bounded task
2. validate it with fresh evidence
3. run implementation review
4. fix findings or reopen the upstream artifact
5. re-review until the artifacts and evidence agree

Typical prompt sequence:

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

Skip conditions:

- skip `/constitution` and `/project-knowledge-base` only when durable repo memory already exists and is still trustworthy
- skip `/spec-design` only when planning does not depend on unresolved technical choices
- skip `/spec-testing-scenarios` only when the change is too small to justify a separate manual guide

## New Project Example

Scenario:

- a fresh repository is starting with agent-driven delivery
- no durable repo memory exists yet

Typical flow:

```text
/constitution
/project-knowledge-base
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Good enough to hand off:

- `constitution.md` sets durable rules without becoming a dumping ground
- `project-knowledge-base.md` captures stable architecture context only
- the first feature is real and bounded, not a fake demo
- the first task list is small enough to prove the workflow works

Typical prompt sequence:

```text
/constitution

Create a concise constitution for this new repository with quality gates, artifact discipline, and verification expectations.
```

```text
/project-knowledge-base

Create an initial project knowledge base for the current repository structure, subsystems, and important external boundaries.
```

```text
/spec-requirement
Feature slug: first-user-signup

Create a bounded feature specification for the repository's first real delivery slice.
```

When to keep it smaller:

- if the repository is still near-empty, skip `/analyze`
- if the first slice is technically obvious, skip `/spec-design`

## Existing Project Adoption Example

Scenario:

- a brownfield repository is adopting the kit
- durable memory is missing or incomplete
- the first change should be bounded and low-risk

Typical flow:

```text
/analyze
/constitution                (if durable operating rules are missing)
/project-knowledge-base      (capture only durable context)
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
/memory-promotion            (if analysis found durable repo knowledge)
```

Good enough to hand off:

- the first analysis finds the real subsystem boundaries
- repo memory stays compact instead of trying to document the whole repo
- the first feature proves the workflow on real code
- promotion is selective, not automatic

Typical prompt sequence:

```text
/analyze
Feature slug: adoption-first-slice

Investigate the subsystem we should use for the first bounded workflow trial and identify stable integration boundaries.
```

```text
Use memory-promotion to decide what from adoption-first-slice belongs in project-knowledge-base.md.
```

## New Feature Example

Use the release baseline above as the canonical new-feature example.

Additional guidance:

- choose a feature with user-visible behavior and bounded blast radius
- include `/spec-design` when technical choices are real, not decorative
- use `task-traceability-audit` before implementation if the task list feels too optimistic

## Brownfield Feature Example

Scenario:

- add an audit event when legacy account status changes
- service boundaries are unclear

Why the flow matters:

- analysis is required before specification
- design is needed because boundaries are risky
- plan and tasks must treat regression protection as first-class work
- durable brownfield findings may need promotion into repo memory

Typical flow:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/task-traceability-audit
/spec-implement
/spec-review
/memory-promotion
```

Good enough to hand off:

- legacy boundaries are understandable
- protected unchanged behavior is explicit
- the chosen integration seam is clear
- any durable boundary findings are either promoted or explicitly kept local
- the review loop checks that the chosen seam did not break protected behavior

Typical prompt sequence:

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
- review explicitly checks that the fix addresses the root cause rather than masking the failure

Recommended debugging pattern:

1. reproduce the broken link behavior
2. inspect the value boundary where the link is built
3. identify the configuration or code mismatch
4. write the narrow repair task
5. verify the repaired link and re-review

Typical prompt sequence:

```text
/analyze
Feature slug: password-reset-link-fix

Investigate how reset links are built, which environment values they depend on, and where the mismatch occurs.
```

```text
/spec-plan
Feature slug: password-reset-link-fix

Create a narrow repair plan that preserves existing reset behavior outside the broken link generation path.
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
- the review step still checks that task state and verification match

Even in tiny changes, `task-traceability-audit` can help if task coverage is unclear or the implementation review finds suspicious task-state drift.

Typical prompt sequence:

```text
/spec-requirement
Feature slug: settings-label-update

Define the wording change for the settings label and the expected visible result.
```

## Manual Test Guide Example

Use `/spec-testing-scenarios` when:

- the feature has meaningful user-facing behavior
- automated coverage alone is not enough for confidence
- you need a handoff artifact for QA, PM, or manual verification

Typical prompt:

```text
/spec-testing-scenarios
Feature slug: magic-link-login

Create a manual testing guide for the delivered magic link login flow, including happy path, invalid token handling, and session behavior.
```

Good enough to hand off:

- scenarios are written for a human tester
- steps are observable, not implementation-centric
- expected outcomes are explicit
- known limitations or deferred areas are visible
