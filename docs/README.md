# Documentation

Welcome to the AI Agents Development Kit documentation. This is your complete guide to the 10-agent, 5-category workflow for structured AI-assisted development.

---

## Start Here

**New to this framework?** Choose your path:

| If You Want               | Start With                                   |
| ------------------------- | -------------------------------------------- |
| 30-second overview        | [Getting Started](guides/getting-started.md) |
| See a workflow in action  | [Workflow Example](WORKFLOW-EXAMPLE.md)      |
| Understand the philosophy | [How It Works](how%20it%20work.md)           |
| Choose your workflow      | [Workflow Guide](workflows/README.md)        |
| Quick reference           | [Commands](reference/commands.md)            |

---

## Documentation Structure

### 📚 Guides

Quick-start guides for common scenarios.

- [getting-started.md](guides/getting-started.md) — 30-second overview and first-time setup
- [README.md](guides/README.md) — All available guides

### 🔄 Workflows

Decision trees and flow diagrams for different types of work.

- [README.md](workflows/README.md) — Workflow patterns, decision rules, and scenarios
- [WORKFLOW-EXAMPLE.md](WORKFLOW-EXAMPLE.md) — Complete walkthrough (magic-link-login example)
- [WORKFLOW-REFERENCE.md](WORKFLOW-REFERENCE.md) — Detailed workflow reference

### 🤖 Agents

Deep documentation on the 10 agents and how to use them.

- [README.md](agents/README.md) — Quick reference table
- [AGENTS-REFERENCE.md](agents/AGENTS-REFERENCE.md) — Full agent catalog
- [agent-mapping.md](agents/agent-mapping.md) — Template relationships and workflow patterns
- **Category Deep-Dives:**
  - [details/foundation-setup.md](agents/details/foundation-setup.md) — `/constitution` & `/project-knowledge-base`
  - [details/discovery-learning.md](agents/details/discovery-learning.md) — `/analyze`
  - [details/specification-planning.md](agents/details/specification-planning.md) — All spec/design/plan agents
  - [details/implementation-delivery.md](agents/details/implementation-delivery.md) — `/spec-implement`
  - [details/quality-knowledge.md](agents/details/quality-knowledge.md) — Quality gates and review

### 📖 Reference

Quick lookups and reference materials.

- [commands.md](reference/commands.md) — All 10 commands with usage examples
- [terminology.md](reference/terminology.md) — Glossary of key terms
- [faq.md](reference/faq.md) — Frequently asked questions
- [README.md](reference/README.md) — All reference materials

### 🧠 Memory System

Understanding the memory model.

- [README.md](memory-system/README.md) — How the memory system works

### 📋 System Overview

- [how it work.md](how%20it%20work.md) — Complete system architecture and principles

---

## The 10 Agents at a Glance

| Category                     | Agents                                                           | Purpose                                    |
| ---------------------------- | ---------------------------------------------------------------- | ------------------------------------------ |
| **Foundation**               | `/constitution`, `/project-knowledge-base`                       | Establish durable repo rules and knowledge |
| **Discovery & Analysis**     | `/analyze`                                                       | Investigate systems before making changes  |
| **Specification & Design**   | `/spec-requirement`, `/spec-review-requirements`, `/spec-design` | Define what to build and how               |
| **Planning & Delivery**      | `/spec-plan`, `/spec-tasks`                                      | Create execution strategy and tasks        |
| **Implementation & Quality** | `/spec-implement`, `/spec-review`                                | Build, test, and verify                    |

**Full reference:** [agents/AGENTS-REFERENCE.md](agents/AGENTS-REFERENCE.md)

---

## Standard Workflow

Most features follow this path:

```
/analyze (if needed)
  ↓
/spec-requirement
  ↓
/spec-review-requirements
  ↓
/spec-design (if needed)
  ↓
/spec-plan
  ↓
/spec-tasks
  ↓
/spec-implement
  ↓
/spec-review
```

**Choose your workflow:**
- Simple change? [Skip analysis and design](workflows/README.md#small-change-flow)
- Complex change? [Include all steps](workflows/README.md#default-feature-flow)
- Brownfield work? [Investigate first](workflows/README.md#brownfield-flow)
- Bug fix? [Special flow](workflows/README.md#bug-fix-flow)

---

## Artifact Types

Every feature creates one or more of these files under `artifacts/features/<feature-slug>/`:

| Artifact                 | Created By                  | Purpose                              |
| ------------------------ | --------------------------- | ------------------------------------ |
| `analysis.md`            | `/analyze`                  | Discovery findings (what's true now) |
| `spec.md`                | `/spec-requirement`         | User-focused specification           |
| `requirements-review.md` | `/spec-review-requirements` | Readiness verification               |
| `design.md`              | `/spec-design`              | Technical decisions and architecture |
| `plan.md`                | `/spec-plan`                | Execution strategy                   |
| `tasks.md`               | `/spec-tasks`               | Bounded work units                   |
| `review.md`              | `/spec-review`              | Implementation verification          |

---

## Key Concepts

### Durable Repo Memory

Stored at `memories/repo/`:

- `constitution.md` — Durable repo-wide rules and guardrails
- `project-knowledge-base.md` — Durable descriptive knowledge (subsystems, patterns, integrations)

Read these before planning, implementation, or review. See [Foundation setup guide](agents/details/foundation-setup.md).

### Feature Artifacts

All feature work lives under `artifacts/features/<feature-slug>/`. Each artifact serves one purpose and one purpose only. This keeps work:
- **Reviewable** — Clear decisions
- **Resumable** — Timestamped trail
- **Traceable** — Requirements ↔ tasks ↔ code

### Quality Gates

Work proceeds through explicit gates:

- **Definition of Ready** — Before implementation starts
- **Definition of Done** — Before shipping

See [.github/specs/checklists/](../. github/specs/checklists/) or the detailed guide in [quality-knowledge.md](agents/details/quality-knowledge.md).

### Traceability IDs

Every artifact uses consistent IDs:

- `REQ-###` — Requirements
- `AC-###` — Acceptance criteria
- `TASK-###` — Tasks
- `RISK-###` — Risks
- `FILE-###` — Files
- `DEP-###` — Dependencies

This creates end-to-end traceability from user stories through implementation.

---

## Common Tasks

### I'm starting a new feature

1. [Pick a slug](guides/getting-started.md) (e.g., `add-dark-mode`)
2. [Choose your workflow](workflows/README.md)
3. [Run `/spec-requirement`](reference/commands.md#spec-requirement)
4. [Follow the path](workflows/README.md#default-feature-flow)

### I'm investigating a bug

1. [Run `/analyze`](reference/commands.md#analyze) to understand current behavior
2. [Run `/spec-requirement`](reference/commands.md#spec-requirement) to define the fix
3. [Skip to `/spec-plan`](workflows/README.md#bug-fix-flow) and continue

### I'm setting up a new repository

1. [Run `/constitution`](reference/commands.md#constitution)
2. [Run `/project-knowledge-base`](reference/commands.md#project-knowledge-base)
3. Both write to `memories/repo/` for all future work to use

### I need to understand the workflow

1. [Read the 30-second summary](guides/getting-started.md)
2. [Review your specific workflow](workflows/README.md)
3. [See a complete example](WORKFLOW-EXAMPLE.md)

### The spec is weak when I reach planning

**Stop.** Don't plan around weakness. Go back to `/spec-requirement`, fix it, then rerun `/spec-review-requirements`.

### Implementation found an upstream issue

**Stop.** Don't work around it. Fix the upstream artifact (spec, design, or plan), then continue.

---

## Navigation Tips

- **Quick lookup?** Use [commands.md](reference/commands.md)
- **Need a definition?** Check [terminology.md](reference/terminology.md)
- **Have a question?** See [faq.md](reference/faq.md)
- **Want context?** Read [how it work.md](how%20it%20work.md)
- **See it in action?** Walk through [WORKFLOW-EXAMPLE.md](WORKFLOW-EXAMPLE.md)
- **Stuck?** Check [workflows/README.md](workflows/README.md) for decision trees

---

## Complete File Tree

```
docs/
├── README.md                            (you are here)
├── guides/
│   ├── README.md
│   └── getting-started.md
├── workflows/
│   └── README.md
├── agents/
│   ├── README.md
│   ├── AGENTS-REFERENCE.md
│   ├── agent-mapping.md
│   └── details/
│       ├── foundation-setup.md
│       ├── discovery-learning.md
│       ├── specification-planning.md
│       ├── implementation-delivery.md
│       └── quality-knowledge.md
├── reference/
│   ├── README.md
│   ├── commands.md
│   ├── terminology.md
│   └── faq.md
├── memory-system/
│   └── README.md
├── WORKFLOW-EXAMPLE.md
├── WORKFLOW-REFERENCE.md
└── how it work.md
```

---

## System Architecture

For a detailed explanation of the framework:

**Conceptual:**
- [Getting Started](guides/getting-started.md) — 30-second mental model
- [How It Works](how%20it%20work.md) — Complete architecture

**Operational:**
- [Workflows](workflows/README.md) — How to choose your path
- [Commands](reference/commands.md) — What each agent does
- [Agents](agents/AGENTS-REFERENCE.md) — Full agent specifications

**Reference:**
- [Terminology](reference/terminology.md) — Key terms explained
- [FAQ](reference/faq.md) — Common questions answered
- [Agent Mapping](agents/agent-mapping.md) — Template relationships

---

## Before You Start

**You should already know:**
- Your feature or change is worth documenting
- You'll have time to do proper discovery, planning, and review
- You're working within a team or system that benefits from clear handoffs

**You'll learn:**
- How to break work into reviewable, resumable pieces
- When to skip agents and when to include them
- How to keep AI output traceable and controllable

---

## Next Steps

1. ✅ You're reading documentation (good start!)
2. 📖 Pick your starting point above
3. 🚀 Use it on your first feature
4. 💡 Adjust the process based on what works for you

---

## Questions?

- **Technical question:** Check [terminology.md](reference/terminology.md) or [faq.md](reference/faq.md)
- **Workflow question:** See [workflows/README.md](workflows/README.md) or [WORKFLOW-EXAMPLE.md](WORKFLOW-EXAMPLE.md)
- **About an agent:** Read [agents/AGENTS-REFERENCE.md](agents/AGENTS-REFERENCE.md) or the relevant [details/](agents/details/) file
- **Missing something?** All agents are defined in [.github/agents/](.../.github/agents/)

