# AI Agents Dev Kit

Structured, artifact-driven AI workflow for real software repositories.

## Overview

This repository now centers on a 10-agent delivery model defined in [`.github/agents/`](./.github/agents/). The workflow separates durable repository knowledge from feature-specific delivery artifacts so AI work stays reviewable, resumable, and traceable.

## Current Agent Set

| Command | Backing File | Purpose |
| --- | --- | --- |
| `/analyze` | `analyze.agent.md` | Investigate a feature area, bug, or brownfield subsystem |
| `/constitution` | `constitution.agent.md` | Maintain durable repo-wide rules |
| `/project-knowledge-base` | `project-knowledge-base.agent.md` | Maintain durable descriptive repo knowledge |
| `/spec-requirement` | `spec-requirement.agent.md` | Create or refine `spec.md` |
| `/spec-review-requirements` | `spec-review-requirements.agent.md` | Review `spec.md` readiness |
| `/spec-design` | `spec-design.agent.md` | Create `design.md` when planning needs technical clarity |
| `/spec-plan` | `spec-plan.agent.md` | Create `plan.md` |
| `/spec-tasks` | `spec-tasks.agent.md` | Create `tasks.md` |
| `/spec-implement` | `spec-implement.agent.md` | Execute planned implementation work |
| `/spec-review` | `spec-review.agent.md` | Review implementation against approved artifacts |

Older docs in this repo referenced a 13-agent model with separate discovery, architecture, pattern, and archive commands. Those are no longer the source of truth.

## Repo Memory

The current repo-memory model is intentionally compact:

```text
memories/repo/constitution.md
memories/repo/project-knowledge-base.md
```

- `constitution.md` stores durable rules and guardrails
- `project-knowledge-base.md` stores durable descriptive context

## Feature Artifacts

Each feature lives under:

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

Not every feature needs every file. `analysis.md`, `design.md`, and `review.md` are used when they reduce ambiguity or create useful durable evidence.

## Standard Workflow

```text
/constitution
/project-knowledge-base

/analyze
/spec-requirement
/spec-review-requirements
/spec-design        (when needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Feature flow:

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

## Included Scaffolding

Under [`.github/specs/`](./.github/specs/) the repo includes:

- 11 templates for core artifacts and repo-memory docs
- definition-of-ready and definition-of-done checklists

## Quick Start

1. Read [Getting Started](docs/guides/getting-started.md).
2. Review the [Workflow Guide](docs/workflows/README.md).
3. Keep the [Commands Reference](docs/reference/commands.md) open while you work.

For a new repository:

```text
/constitution
/project-knowledge-base
```

For a new feature:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Add `/spec-design` before planning when the feature changes interfaces, crosses subsystem boundaries, introduces data or compatibility risk, or has multiple viable technical approaches.

## Documentation Map

- [docs/README.md](docs/README.md)
- [docs/workflows/README.md](docs/workflows/README.md)
- [docs/reference/commands.md](docs/reference/commands.md)
- [docs/agents/README.md](docs/agents/README.md)
- [docs/WORKFLOW-EXAMPLE.md](docs/WORKFLOW-EXAMPLE.md)
- [docs/how it work.md](docs/how%20it%20work.md)

## Mental Model

The kit works best when these boundaries stay intact:

- `analyze` explores what is true now
- `spec-requirement` defines what should change and why
- `spec-design` explains how the system should work when design is needed
- `spec-plan` and `spec-tasks` turn intent into executable work
- `spec-implement` changes code and validation
- `spec-review` checks whether the delivered work actually matches intent

That separation is the main value of the kit.
