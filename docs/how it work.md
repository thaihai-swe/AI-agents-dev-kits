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

## Current Workflow

The current codebase defines these steps:

```text
/constitution
/project-knowledge-base
/analyze
/spec-requirement
/spec-review-requirements
/spec-design
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

The normal feature path looks like this:

```text
repo memory
  ↓
analysis
  ↓
specification
  ↓
requirements review
  ↓
design (optional)
  ↓
plan
  ↓
tasks
  ↓
implementation
  ↓
review
```

## Why The Workflow Is Split

- `analyze` is for understanding what is true now
- `spec-requirement` is for deciding what should change and why
- `spec-design` is for settling technical decisions only when that extra clarity is needed
- `spec-plan` and `spec-tasks` keep implementation bounded and traceable
- `spec-review` checks the delivered work against the intended artifacts

That separation makes AI output easier to review, easier to resume, and less likely to drift.

## What Changed From The Older Model

Older docs in this repo described a 13-agent system with separate commands for discovery, architecture capture, patterns, and archive. The current codebase no longer contains those agents.

Their responsibilities now live here:

- discovery and brownfield investigation -> `analysis.md`
- durable architecture and implementation notes -> `project-knowledge-base.md`
- durable rules and guardrails -> `constitution.md`

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
