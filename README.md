# AI Agents Development Kit

Structured documentation, portable skills, and templates for running spec-driven development with Claude, Codex, and other coding agents.

## What It Is

This kit helps teams turn AI-assisted work into written artifacts that are reviewable, resumable, and traceable.

Its core stance is:

- artifacts are the durable source of truth
- skills are the reusable workflow contract
- adapter files such as `AGENTS.md` should stay thin

It gives you:
- an end-to-end skill workflow from repo memory through delivery review
- durable repo memory under `memories/repo/`
- per-feature artifacts under `artifacts/features/<slug>/`
- thin adapter examples under [`adapters/`](adapters/)
- 14 portable skills under `skills/`:
  11 core workflow skills, 2 helper skills, and 1 utility skill

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
/constitution               (if durable repo rules do not exist yet)
/project-knowledge-base     (if durable repo context does not exist yet)
/analyze                    (if current system behavior is unclear)
/spec-requirement           (define intent, scope, constraints, and acceptance clarity)
/spec-review-requirements   (check readiness)
/spec-design                (only when technical ambiguity needs design)
/spec-plan                  (pre-plan analysis + execution strategy)
/spec-tasks                 (bounded implementation tasks)
/task-traceability-audit    (when traceability confidence needs checking)
/spec-implement             (execute tasks)
/spec-review                (implementation review)
/spec-testing-scenarios     (create human-run manual test guide)
/memory-promotion           (when deciding what belongs in durable repo memory)
```

Treat this as an operating sequence, not a menu of loosely related prompts.

- start with the skill that matches the current uncertainty instead of improvising from chat history
- do not skip forward when the upstream artifact is still weak
- use the current feature artifacts under `artifacts/features/<slug>/` as the working source of truth
- do not claim implementation is complete until the relevant verification has been run and read
- when debugging, investigate root cause before proposing fixes
- after implementation, expect a normal `implement -> validate -> review -> fix -> re-review` loop
- for behavior-changing work, prefer a failing test or other failing proof before the fix when practical

## Start Here

- Docs home: [Docs](docs/README.md)
- Quick start: [Getting Started](docs/getting-started.md)
- Memory: [Memory](docs/memory.md)
- Workflow: [Workflow](docs/workflow.md)
- Visual workflow: [Visual Workflow](docs/visual-workflow.md)
- Use cases: [Use Case Workflows](docs/use-case-workflows.md)
- Adoption: [Adoption](docs/adoption.md)
- Integrations: [Integrations](docs/integrations.md)
- Examples: [Examples](docs/examples.md)
- Reference: [Reference](docs/reference.md)
- Maintainers: [Maintainers](docs/maintainers.md)

## Install The Kit

Before bootstrap means anything, the target repository needs the kit itself.

Use one of these packaging paths:

- copy or vendor this repository into the target repo
- copy `skills/` intact, plus the scripts and entrypoint examples you want to keep

At minimum, a working adoption needs:

- `skills/`
- `scripts/bootstrap-kit.sh`
- a repo entrypoint such as `AGENTS.md` when the client needs one

`scripts/bootstrap-kit.sh` does not install skills into another repository. It only scaffolds folders, starter memory files, and a thin `AGENTS.md` stub.

## Minimum Adoption

For a new repository, the minimum safe setup is:

```text
skills/
memories/repo/
artifacts/features/
AGENTS.md                 # or another client adapter entrypoint, when needed
```

After the kit is copied or vendored into the target repository, initialize:

```text
scripts/bootstrap-kit.sh
```

Then review the starter memory files and continue with:

```text
/constitution
/project-knowledge-base
```

After that, start with one real feature and follow the normal workflow.

If you want a lightweight setup helper, use:

```text
scripts/bootstrap-kit.sh
```

It creates the canonical folders when missing, creates starter `memories/repo/constitution.md` and `memories/repo/project-knowledge-base.md` files when missing, creates a thin `AGENTS.md` stub when missing, and prints the next workflow steps.

It does not copy `skills/` into the target repository for you.

## Product Stance

This kit is designed to be:

- artifact-first, not chat-history-first
- portable across agents, not tied to one client
- disciplined about verification and review
- small enough to maintain without turning every concern into a separate skill

This kit is not trying to be:

- a general orchestration platform
- a CLI-heavy generator
- a plugin marketplace
- a large autonomous multi-agent framework

## Skills

Portable workflow contracts now live under [`skills/`](skills/). Each skill packages the workflow instructions plus any bundled `references/` files needed to support Claude, Codex, and other Agent Skills-compatible tools.

The intended agent behavior is:

- check whether an existing skill matches the task before improvising
- prefer the matching artifact-driven workflow over freeform execution
- escalate backward to the missing upstream artifact when the current phase is blocked
- keep activation and adapter files thin; keep detailed behavior in `skills/`

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
- `/spec-review` as the public implementation-review stage
- `spec-testing-scenarios`

Helper skills:
- `memory-promotion`
- `task-traceability-audit`

Utility skills:
- `refactor-cleaner`

Maintainer checks:
- `bash scripts/check-kit-consistency.sh`
