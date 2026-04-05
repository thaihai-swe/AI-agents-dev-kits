# AI Agents Dev Kit

Structured, artifact-driven AI workflow for real software repositories.

## Overview

This repository centers on a 10-agent delivery model organized into 5 categories. The workflow separates durable repository knowledge from feature-specific delivery artifacts so AI work stays reviewable, resumable, and traceable.

---

## Why This Kit

Modern AI-assisted development often produces work that's hard to review, impossible to resume, and drifts from intent.

This kit solves those problems by:

- **Making AI output reviewable** - All work is backed by explicit artifacts (specs, designs, plans) you can read and approve before implementation
- **Enabling resumable work** - Every feature has a documented history. Stop and come back weeks later without losing context
- **Enforcing scope control** - Quality gates prevent spec ambiguity from turning into unnecessary implementation
- **Preserving traceability** - Implementation stays tied to requirements. Changes are auditable end-to-end
- **Separating concerns** - Each agent has one job, enforced by explicit behavioral rules
- **Handling reality** - Brownfield discovery, risk reduction, and optional design clarification when complexity demands it

---

## Key Principles

1. **Artifacts First** - Decisions are decisions only when written down and reviewed. Chat history is not enough.
2. **Durable Memory** - Repository knowledge is compact and stable. Only genuinely durable context gets saved.
3. **Bounded Discovery** - Investigation is exploration, not planning. Cleanup happens later if findings warrant it.
4. **Quality Gates** - Specifications are reviewed before planning. Implementation is reviewed before acceptance.
5. **Explicit Boundaries** - Each agent knows what it does and does not do. No silent scope creep.
6. **Safe Defaults** - Agents stop at dependency points. Missing upstream work is surfaced, not worked around.

---

## Current Agent Set (5 Categories, 10 Agents)

### Foundation
| Command                   | Backing File                      | Purpose                                     |
| ------------------------- | --------------------------------- | ------------------------------------------- |
| `/constitution`           | `constitution.agent.md`           | Maintain durable repo-wide rules            |
| `/project-knowledge-base` | `project-knowledge-base.agent.md` | Maintain durable descriptive repo knowledge |

### Discovery & Analysis
| Command    | Backing File       | Purpose                                                  |
| ---------- | ------------------ | -------------------------------------------------------- |
| `/analyze` | `analyze.agent.md` | Investigate a feature area, bug, or brownfield subsystem |

### Specification & Design
| Command                     | Backing File                        | Purpose                                                  |
| --------------------------- | ----------------------------------- | -------------------------------------------------------- |
| `/spec-requirement`         | `spec-requirement.agent.md`         | Create or refine a user-focused `spec.md`                |
| `/spec-review-requirements` | `spec-review-requirements.agent.md` | Review `spec.md` readiness                               |
| `/spec-design`              | `spec-design.agent.md`              | Create `design.md` when planning needs technical clarity |

### Planning & Delivery
| Command       | Backing File          | Purpose           |
| ------------- | --------------------- | ----------------- |
| `/spec-plan`  | `spec-plan.agent.md`  | Create `plan.md`  |
| `/spec-tasks` | `spec-tasks.agent.md` | Create `tasks.md` |

### Implementation & Quality
| Command           | Backing File              | Purpose                                          |
| ----------------- | ------------------------- | ------------------------------------------------ |
| `/spec-implement` | `spec-implement.agent.md` | Execute planned implementation work              |
| `/spec-review`    | `spec-review.agent.md`    | Review implementation against approved artifacts |

**Note:** Older docs in this repo referenced a 13-agent model. See [docs/how it work.md](docs/how%20it%20work.md#what-changed-from-the-older-model) for what changed.

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
│ /spec-design        (when needed)     │
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

Feature flow:

```text
repo memory (Foundation)
  ↓
analysis (Discovery & Analysis)
  ↓
specification (Specification & Design)
  ↓
requirements review (Specification & Design)
  ↓
design (optional, Specification & Design)
  ↓
plan (Planning & Delivery)
  ↓
tasks (Planning & Delivery)
  ↓
implementation (Implementation & Quality)
  ↓
review (Implementation & Quality)
```

## Quick Start

### For A New Repository

Start here to establish durable baseline knowledge:

```bash
1. /constitution
   └─→ Establish repo-wide rules, testing expectations, safety constraints

2. /project-knowledge-base
   └─→ Capture subsystem boundaries, integration patterns, durable watchouts
```

### For A New Feature

Follow this path for a typical new feature:

```bash
1. /spec-requirement
   Write what should change and why
   └─→ artifacts/features/<slug>/spec.md

2. /spec-review-requirements
   Check if spec is ready for planning
   └─→ artifacts/features/<slug>/requirements-review.md

3. /spec-plan  [or skip if simple change]
   Create execution strategy
   └─→ artifacts/features/<slug>/plan.md

4. /spec-tasks
   Break into bounded work units
   └─→ artifacts/features/<slug>/tasks.md

5. /spec-implement
   Build and validate
   └─→ code changes + task updates

6. /spec-review
   Verify against approved artifacts
   └─→ artifacts/features/<slug>/review.md (optional)
```

### For Brownfield or Risky Work

Add investigation first:

```bash
1. /analyze
   Investigate current behavior, risks, constraints
   └─→ artifacts/features/<slug>/analysis.md

2. [continue with standard feature path above]
```

### Quick Reference

| Situation               | Use                                                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------- |
| New repo                | `/constitution` → `/project-knowledge-base`                                                                           |
| Simple change           | `/spec-requirement` → `/spec-review-requirements` → `/spec-plan` → `/spec-tasks` → `/spec-implement` → `/spec-review` |
| Complex/risky change    | `/analyze` [then continue above]                                                                                      |
| Needs technical clarity | Add `/spec-design` before `/spec-plan`                                                                                |
| Bug investigation       | `/analyze` → `/spec-requirement` → `/spec-plan` → `/spec-tasks` → `/spec-implement` → `/spec-review`                  |

---

## Common Workflows

### Minimal Localized Change

Use when: small, well-understood change to existing code

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Skip `/analyze` and `/spec-design`. Do not skip planning or tasks.

### Brownfield Feature

Use when: current system is unclear or integration is risky

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

Full workflow. Investigation happens first so planning is grounded.

### Bug Fix

Use when: regression or unexpected behavior

```text
/analyze
/spec-requirement
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Analysis captures "what went wrong". Skip formal review unless scope is ambiguous.

### Cross-Cutting Feature

Use when: changes affect multiple modules or introduce new interfaces

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

Design is required when planning would otherwise depend on unresolved architecture.

---

## When to Skip Agents

- Skip `/analyze` **ONLY** when current behavior is already well understood
- Skip `/spec-review-requirements` **ONLY** when the change is very small and spec is obviously complete
- Skip `/spec-design` **ONLY** when planning proceeds safely without architectural clarification
- **NEVER** skip `/spec-plan` or `/spec-tasks` if you want bounded, traceable implementation

---

## Quick Navigation

1. **Read [Getting Started](docs/guides/getting-started.md)** - 30-second overview and first feature walkthrough
2. **Review [Workflow Guide](docs/workflows/README.md)** - Visual flows and detailed explanations
3. **Keep [Commands Reference](docs/reference/commands.md) open** - Lookup what each agent does
4. **Check [Agents Reference](docs/agents/README.md)** - Deep dive into each agent's responsibilities
5. **See [Terminology](docs/reference/terminology.md)** - Glossary of key terms

## Documentation Map

- **Getting Started:** [docs/guides/getting-started.md](docs/guides/getting-started.md)
- **Workflows:** [docs/workflows/README.md](docs/workflows/README.md)
- **Commands:** [docs/reference/commands.md](docs/reference/commands.md)
- **Agents:** [docs/agents/README.md](docs/agents/README.md)
- **Examples:** [docs/WORKFLOW-EXAMPLE.md](docs/WORKFLOW-EXAMPLE.md)
- **How It Works:** [docs/how it work.md](docs/how%20it%20work.md)
- **FAQ:** [docs/reference/faq.md](docs/reference/faq.md)
- **Terminology:** [docs/reference/terminology.md](docs/reference/terminology.md)

---

## Decision Guide: Choosing Your Workflow

**Start here and follow the path:**

```
Is this a NEW REPOSITORY?
  ├─ YES → /constitution + /project-knowledge-base
  └─ NO → Next question

Is the current system unclear or risky?
  ├─ YES → Start with /analyze
  └─ NO → Next question

Is this a simple, localized change?
  ├─ YES → Skip /spec-design, go straight to /spec-plan
  ├─ MAYBE → Include /spec-design
  └─ NO (complex) → Include both /analyze and /spec-design

Do you need a formal requirements review?
  ├─ YES (high-risk, cross-cutting) → Include /spec-review-requirements
  └─ NO (simple, clear) → Optional, but recommended

Standard progression:
  /analyze? → /spec-requirement → /spec-review-requirements
     → /spec-design? → /spec-plan → /spec-tasks
     → /spec-implement → /spec-review
```

---

## Comparison: This Kit vs Typical AI Workflow

| Concern               | Typical AI Work               | This Kit                         |
| --------------------- | ----------------------------- | -------------------------------- |
| **Traceability**      | Lost in chat history          | Every change traced to artifacts |
| **Review**            | Reviewing chat is hard        | Clear artifacts to review        |
| **Continuation**      | Losing context if interrupted | Resume from saved artifacts      |
| **Scope**             | Drifts during conversation    | Quality gates prevent drift      |
| **Reproducibility**   | Hard to recreate decisions    | All decisions documented         |
| **Quality Control**   | Inconsistent                  | Explicit gates for every phase   |
| **Brownfield Safety** | Risky assumptions             | Investigation phase de-risks     |
| **Rework**            | Throws away bad work silently | Stops and surfaces issues        |

---

## Included Scaffolding

Under [`.github/specs/`](./.github/specs/) the repo includes:

- **11 templates** for core artifacts and repo-memory docs
- **Definition of Ready** checklist - prerequisites before downstream work
- **Definition of Done** checklist - completion criteria for each artifact type

## Mental Model

The kit works best when these boundaries stay intact:

| Agent              | Does This                            | Does NOT Do                          |
| ------------------ | ------------------------------------ | ------------------------------------ |
| `analyze`          | Explores what is true now            | Does not create specs or plans       |
| `spec-requirement` | Defines what should change and why   | Does not explain how                 |
| `spec-design`      | Explains how the system should work  | Does not break into tasks            |
| `spec-plan`        | Turns intent into execution strategy | Does not implement code              |
| `spec-tasks`       | Creates bounded work units           | Does not implement code              |
| `spec-implement`   | Changes code and validation          | Does not rewrite upstream intent     |
| `spec-review`      | Checks result against intent         | Does not silently accept scope drift |

**The Boundary Stack:**
```
Find Facts (analyze) → Define Intent (spec) → Approve Intent (review-requirements)
  → Resolve HOW (design) → Plan Sequencing (plan) → Break Into Units (tasks)
  → Build (implement) → Verify (review)
```

Each agent passes one well-defined artifact to the next. No silent rewrites. No scope creep.

---

## Operational Guidance

### For Repository Maintainers

1. **First time setup:** Run `/constitution` and `/project-knowledge-base` to establish baseline
2. **Quarterly refresh:** Review and update repo memory - keep it durable, not stale
3. **Archive old features:** Move feature artifacts to archive after project closes
4. **Monitor patterns:** If you keep seeing the same design patterns, add them to project-knowledge-base

### For Feature Teams

1. **Know your context:** Read repo memory before starting your feature
2. **Respect quality gates:** If spec review says "not ready", don't proceed
3. **Surface blockers early:** If upstream artifacts are weak, stop and fix them
4. **Keep artifacts updated:** If implementation reveals an upstream mistake, go back and fix it
5. **Document assumptions:** Write them down in the appropriate artifact

### For Code Reviewers

- Check that changes correspond to approved tasks
- Verify tests match the scope of approved requirements
- Look for requirement coverage in implementation
- Flag scope drift or silent assumption changes

---

## FAQ - Quick Answers

**Q: Do I have to use all 10 agents for everything?**
A: No. Small changes use 6 agents. Complex changes use all 10. Use what fits.

**Q: What if the spec is weak when I reach the planning stage?**
A: Stop. Don't plan around weakness. Go back to `/spec-requirement`, fix it, then rerun `/spec-review-requirements`.

**Q: Can I skip planning and go straight to implementation?**
A: Not safely for non-trivial work. Planning creates the task list that implementation works from.

**Q: What if implementation reveals an upstream mistake?**
A: Stop. Don't work around it. Fix the upstream artifact (spec, design, or plan), then continue.

**Q: Do I need all the scaffolding files?**
A: No. Use templates when they help. Skip them when they don't. The agents guide you.

For more: [docs/reference/faq.md](docs/reference/faq.md)

---

## Next Steps

1. **Read the 30-second overview:** [Guides - Getting Started](docs/guides/getting-started.md)
2. **Walk through an example:** [Workflow Example](docs/WORKFLOW-EXAMPLE.md)
3. **Create your first feature:** Pick a simple change and follow the workflow
4. **Establish repo memory:** Run `/constitution` and `/project-knowledge-base` for your repository
5. **Read the philosophy:** [How It Works](docs/how%20it%20work.md)

---

## Support & Resources

- **Stuck on a workflow?** → [Workflow Guide](docs/workflows/README.md)
- **Need to know what an agent does?** → [Commands Reference](docs/reference/commands.md)
- **Looking for a term definition?** → [Terminology](docs/reference/terminology.md)
- **Want to see an example?** → [Workflow Example](docs/WORKFLOW-EXAMPLE.md)
- **Have a question?** → [FAQ](docs/reference/faq.md)

---

## Project Status

- **Version:** 1.0 (10-agent, 5-category model)
- **Status:** Production-ready
- **Last Updated:** April 5, 2026
- **Agents:** All agents have explicit behavioral rules and metadata
- **Documentation:** Complete with guides, workflows, reference, and examples
