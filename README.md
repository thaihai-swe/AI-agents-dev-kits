# AI Agents Development Kit

Structured documentation, portable skills, and templates for running spec-driven development with Claude, Codex, and other coding agents.

## What It Is

This kit helps teams turn AI-assisted work into written artifacts that are reviewable, resumable, and traceable.

It gives you:
- a 10-step skill workflow
- durable repo memory under `memories/repo/`
- per-feature artifacts under `artifacts/features/<slug>/`
- 12 portable skills under `skills/`:
  10 core workflow skills and 2 helper skills

## Introduction

Spec-driven development is an approach where teams write and refine structured specifications before letting AI generate or change code. Instead of letting the codebase become the accidental requirements document, the team captures intent, scope, constraints, and acceptance criteria in artifacts that both humans and AI can review.

That matters because AI is powerful, but it is also highly sensitive to context quality. When the only context is a partial prompt plus the current codebase, the codebase becomes the de facto specification. That usually leads to hidden assumptions, accidental scope decisions, and implementation-first drift. This kit is designed to prevent that.

The model used here is close to what modern spec-driven development tools call:
- **spec-first**: define the change before implementation
- **spec-anchored**: keep the artifacts around long enough to guide delivery, review, and future evolution

This kit deliberately focuses on that middle ground. It does not treat specs as disposable notes, and it does not require a future “spec-as-source” world where humans stop editing code entirely. Instead, it gives teams a practical way to make requirements, planning, and review explicit while still working in normal repositories with normal engineering controls.

It also separates two kinds of context that are often mixed together:
- **durable repo memory**: rules and stable architecture knowledge that apply across many changes
- **feature artifacts**: change-specific specs, plans, tasks, and reviews that apply to one feature or bug fix

That distinction is especially important for large codebases. A big repository cannot be loaded into an AI agent’s context all at once in a reliable way. The kit narrows the working set by combining:
- compact durable repo memory
- explicit per-feature artifacts
- workflow gates that stop weak context from propagating downstream

In practice, the kit helps teams use AI more like a disciplined implementation partner than a fast improviser.

## Who It Is For

- teams using AI to build real product features
- brownfield repositories with hidden constraints
- quality-first teams that want explicit gates before planning and shipping
- maintainers building an internal skill-based workflow kit

## 60-Second Workflow

```text
/analyze                    (if current system behavior is unclear)
/spec-requirement           (define intent and resolve blocking clarification)
/spec-review-requirements   (check readiness)
/spec-design                (only when technical ambiguity needs design)
/spec-plan                  (pre-plan analysis + execution strategy)
/spec-tasks                 (bounded implementation tasks)
/spec-implement             (execute tasks)
/spec-review                (run `spec-review-implementation`)
/spec-testing-scenarios     (create human-run manual test guide)
```

## Start Here

- Learn the model: [Documentation Home](docs/README.md)
- Quick start: [Quick Start](docs/guides/quick-start.md)
- Adopt in a repo: [Bootstrap And Adoption](docs/guides/bootstrap-adoption.md)
- New feature flow: [New Feature Guide](docs/guides/new-feature.md)
- Team workflow: [Team And Multi-Agent Collaboration](docs/guides/team-collaboration.md)
- End-to-end example: [Full Skill Workflow Example](docs/examples/full-skill-workflow.md)
- Commands and artifacts: [Reference](docs/reference/README.md)

## Skills

Portable workflow contracts now live under [`skills/`](skills/). Each skill packages the workflow instructions plus any bundled `references/` files needed to support Claude, Codex, and other Agent Skills-compatible tools.

Core workflow skills:
- `constitution`
- `project-knowledge-base`
- `analyze`
- `spec-requirement`
- `spec-review-requirements`
- `spec-design`
- `spec-plan`
- `spec-tasks`
- `spec-implement`
- `spec-review-implementation`
- `spec-testing-scenarios`

Helper skills:
- `memory-promotion`
- `task-traceability-audit`
