# How It Works

This dev kit is built around one simple idea: separate durable repository knowledge from feature-specific delivery artifacts.

## Repo Memory

Repo memory explains how the repository works over time.

```text
memories/repo/constitution.md
memories/repo/project-knowledge-base.md
```

- `constitution.md` stores durable rules, guardrails, and quality expectations
- `project-knowledge-base.md` stores durable descriptive context such as subsystem boundaries, integrations, and recurring implementation patterns

## Feature Artifacts

Feature artifacts explain one change from discovery through review.

```text
artifacts/features/<feature-slug>/
  analysis.md
  spec.md
  requirements-review.md
  design.md
  plan.md
  tasks.md
  review.md
```

Not every feature needs every file. `analysis.md` and `design.md` are mainly there to reduce ambiguity. `review.md` is useful when a durable written review helps future work.

## Current Workflow By Category

The 10 agents are organized into 5 categories:

```text
┌─ FOUNDATION ─────────────────────────┐
│ /constitution                         │
│         ↓                             │
│ /project-knowledge-base               │
└───────────────────────────────────────┘
                ↓
┌─ DISCOVERY & ANALYSIS ────────────────┐
│ /analyze                              │
└───────────────────────────────────────┘
                ↓
┌─ SPECIFICATION & DESIGN ──────────────┐
│ /spec-requirement                     │
│         ↓                             │
│ /spec-review-requirements             │
│         ↓                             │
│ /spec-design (optional)               │
└───────────────────────────────────────┘
                ↓
┌─ PLANNING & DELIVERY ─────────────────┐
│ /spec-plan                            │
│         ↓                             │
│ /spec-tasks                           │
└───────────────────────────────────────┘
                ↓
┌─ IMPLEMENTATION & QUALITY ────────────┐
│ /spec-implement                       │
│         ↓                             │
│ /spec-review                          │
└───────────────────────────────────────┘
```

## Why The Workflow Is Split

- `analyze` is for understanding what is true now
- `spec-requirement` is for deciding what should change and why
- `spec-design` is for settling technical decisions only when that extra clarity is needed
- `spec-plan` and `spec-tasks` keep implementation bounded and traceable
- `spec-review` checks the delivered work against the intended artifacts

That separation makes AI output easier to review, easier to resume, and less likely to drift.

## Practical Decision Rules

Use these rules to navigate the workflow safely:

- **Skip `/analyze`** only when current behavior is already clear
- **Skip `/spec-review-requirements`** only when the change is very small and spec is obviously complete
- **Skip `/spec-design`** only when planning can proceed safely without architectural clarification
- **Never skip `/spec-plan` or `/spec-tasks`** if you want bounded, traceable implementation work
- **Do not plan from a vague spec** - if spec review says "not ready", stop and fix it first
- **Implement from `tasks.md`, not from vague chat intent**

## Workflow Scenarios

### New Repository Setup

Run these once to establish baseline durable knowledge:

```text
/constitution
/project-knowledge-base
```

### Minimal Localized Change

For simple, well-understood changes:

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Skip `/analyze` and `/spec-design`.

### Brownfield Or Risky Change

When current system is unclear or integration is risky:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Investigation happens first so planning is grounded.

### Bug Fix Or Regression

When addressing unexpected behavior:

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

`/analyze` captures "what went wrong". Add `/spec-review-requirements` if scope boundaries are ambiguous.

## When Design Is Required

Include `/spec-design` before planning when any of these are true:

- the change crosses subsystem or service boundaries
- the feature adds or changes interfaces
- the work introduces data migration or compatibility risk
- there are multiple viable technical approaches with meaningful tradeoffs
- planning would otherwise depend on unstated architecture decisions

## What Changed From The Older Model

See [Important Shift From The Older Model](../agents/README.md#important-shift-from-the-older-model) in the Agents reference for what consolidated from the retired 13-agent model.

## Short Example

For a feature slug named `magic-link-login`, the flow is:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

And the artifacts land under:

```text
artifacts/features/magic-link-login/
```
