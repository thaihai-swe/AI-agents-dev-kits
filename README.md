# AI Agents Development Kit

A structured framework for AI-assisted software development that separates durable repository knowledge from feature-specific delivery artifacts, ensuring work is reviewable, resumable, and traceable.

---

## What

The **AI Agents Development Kit** is a blueprint system—not a finished application, but a structured framework for managing AI-assisted development at scale. It provides:

- **10 specialized agents** organized into 5 functional categories
- **Artifact templates** for every phase of feature development (spec → design → plan → tasks → implementation)
- **Quality gates** that enforce decision review before work proceeds
- **Durable memory architecture** separating permanent repository knowledge from feature-specific delivery artifacts
- **Traceability scheme** that links user intent through requirements, design decisions, tasks, and implementation
- **Reusable prompts and behavioral guardrails** so AI tools operate consistently and safely

It's designed for teams building software with AI assistance who need their work to be **reviewable, resumable, and traceable**.

---

## Who Is It For?

This framework is for:

- **Development Teams** using AI to accelerate delivery who need structured workflows and quality gates
- **Enterprise Environments** requiring traceability, compliance, and repeatable processes
- **Teams Managing Uncertainty** (brownfield systems, complex integrations, architectural decisions)
- **Projects that Demand Pausability** - where work must be resumable by different people or sessions
- **Organizations Building In-House AI Tools** that need consistent agent behavior and memory management
- **Quality-First Teams** that want explicit gates between discovery, design, planning, and implementation

If you're working with AI on real projects and need more structure than chat history provides, this kit is for you.

---

## The Problem

Modern AI-assisted development has structural weaknesses:

| Problem                   | Impact                                                            |
| ------------------------- | ----------------------------------------------------------------- |
| **Work Disappears**       | All decisions live in chat history—impossible to trace or review  |
| **Can't Resume**          | Conversational context is lost; must restart from chat scrollback |
| **Scope Drifts Silently** | AI makes assumptions; team doesn't notice until implementation    |
| **No Quality Control**    | Chat-based work has no formal gates; anything ships               |
| **Traceability Broken**   | Can't link requirements → design decisions → tasks → code         |
| **Rework Hidden**         | When implementation fails, no record of why decisions were made   |
| **Team Inefficiency**     | Each person rebuilds context; no durable memory layer             |

These problems multiply in enterprise settings where compliance, hand-off efficiency, and risk management matter.

---

## How AI DevKit Helps

This framework solves structural problems through **discipline**, not tools:

| Problem                   | AI DevKit Solution                                                                        |
| ------------------------- | ----------------------------------------------------------------------------------------- |
| **Work Disappears**       | Every decision captured in written artifacts; artifacts are the source of truth, not chat |
| **Can't Resume**          | Feature history preserved in timestamped artifacts; pick up work anywhere in the pipeline |
| **Scope Drifts Silently** | Quality gates review spec completeness before planning; design before implementation      |
| **No Quality Control**    | Explicit gates (Definition of Ready, Definition of Done) block unsafe progression         |
| **Traceability Broken**   | ID scheme (REQ-, AC-, TASK-, etc.) links entire chain from intent through code            |
| **Rework Hidden**         | Architecture decisions written down; all tradeoffs explicit; rationales preserved         |
| **Team Inefficiency**     | Durable memory layer captures repo patterns, subsystem boundaries, integration gotchas    |

The key insight: **AI works better when forced to produce written artifacts that humans review before proceeding.**

---

## Platform Direction

The AI DevKit is evolving toward:

1. **Tighter AI Integration** — Agents with sharper preconditioning and postcondition checks
2. **Vault Modes** — Read-only reviews where agents can't modify artifacts (for compliance)
3. **Multi-Session Continuity** — Memory graph connecting repo knowledge, session notes, and feature artifacts
4. **Enforcement Layers** — Preventing unsafe progression (e.g., can't implement without approved tasks)
5. **Brownfield Specialization** — Deeper analysis and risk reduction for legacy system changes
6. **Enterprise Scaffolding** — Expanded templates for compliance artifacts, security reviews, and audit trails

Current version (1.0) is production-ready for core workflows. Extended features coming in 1.1+.

---

## What This Is

This is **not an application**, but a **blueprint system** for managing AI-assisted development through disciplined workflows. It defines:

- **10 agents** organized into **5 categories**
- **Standardized artifact templates** for specs, designs, plans, and tasks
- **Reusable prompts** and execution rules for AI tools
- **Quality gates** (Definition of Ready, Definition of Done)
- **Memory system** for durable repository knowledge
- **Traceability scheme** connecting requirements → tasks → implementation

---

## Why Use This Framework

Modern AI-assisted development often produces work that is:
- **Hard to review** - Missing explicit decisions and tradeoffs
- **Impossible to resume** - No documented state or dependencies
- **Drifting from intent** - Missing scope control and validation

This framework solves these problems by:

| Problem              | Solution                                                                              |
| -------------------- | ------------------------------------------------------------------------------------- |
| Hard to review       | All decisions captured in written artifacts before implementation                     |
| Impossible to resume | Feature history preserved in timestamped artifacts under `artifacts/features/<slug>/` |
| Drifting scope       | Quality gates and review agents enforce spec/plan consistency                         |
| No traceability      | Explicit IDs link requirements → tasks → code                                         |
| Task ambiguity       | `/spec-tasks` generates bounded, reviewable implementation units                      |
| Uncertain priorities | Brownfield analysis via `/analyze` reduces risk before planning                       |

---

## Core Architecture

### Durable Repository Memory

Stored at `memories/repo/`:

```
constitution.md              # Durable repo-wide rules & quality expectations
project-knowledge-base.md    # Durable descriptive context (subsystems, patterns, integrations)
```

- **Constitutional** (normative): Guards against scope creep and quality degradation
- **Descriptive** (durable): Captures subsystem boundaries, architectural patterns, integration gotchas

### Feature Artifacts

Each feature lives at `artifacts/features/<feature-slug>/`:

```
analysis.md                  # Discovery findings (optional, for unclear systems)
spec.md                      # What should change, for whom, and why
requirements-review.md       # Gate: Is spec ready for planning?
design.md                    # Technical decisions (optional, only if needed)
plan.md                      # Execution strategy, phases, dependencies, rollout
tasks.md                     # Bounded, traceable implementation units
review.md                    # Implementation verification (optional, for complex changes)
```

Not every feature needs every file—some are optional and used to reduce ambiguity.

---

## The 10 Agents (5 Categories)

### Foundation (2 agents)

| Agent                  | Command                   | Output                                    | Purpose                                                                    |
| ---------------------- | ------------------------- | ----------------------------------------- | -------------------------------------------------------------------------- |
| Constitution           | `/constitution`           | `memories/repo/constitution.md`           | Establish & maintain repo-wide rules, guardrails, and quality expectations |
| Project Knowledge Base | `/project-knowledge-base` | `memories/repo/project-knowledge-base.md` | Capture & maintain durable descriptive repository knowledge                |

### Discovery & Analysis (1 agent)

| Agent   | Command    | Output                                  | Purpose                                                                 |
| ------- | ---------- | --------------------------------------- | ----------------------------------------------------------------------- |
| Analyze | `/analyze` | `artifacts/features/<slug>/analysis.md` | Investigate unclear systems, risks, or constraints before specification |

### Specification & Design (3 agents)

| Agent                    | Command                     | Output                                             | Purpose                                                                 |
| ------------------------ | --------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------- |
| Spec Requirement         | `/spec-requirement`         | `artifacts/features/<slug>/spec.md`                | Define what should change, for whom, and why (user-focused)             |
| Spec Review Requirements | `/spec-review-requirements` | `artifacts/features/<slug>/requirements-review.md` | Quality gate: Check if spec is ready for design/planning                |
| Spec Design              | `/spec-design`              | `artifacts/features/<slug>/design.md`              | Technical decisions & architectural clarification (optional, if needed) |

### Planning & Delivery (2 agents)

| Agent      | Command       | Output                               | Purpose                                                                   |
| ---------- | ------------- | ------------------------------------ | ------------------------------------------------------------------------- |
| Spec Plan  | `/spec-plan`  | `artifacts/features/<slug>/plan.md`  | Execution strategy: sequencing, phases, dependencies, rollout, validation |
| Spec Tasks | `/spec-tasks` | `artifacts/features/<slug>/tasks.md` | Decompose plan into bounded, independent, traceable implementation units  |

### Implementation & Quality (2 agents)

| Agent          | Command           | Output                                           | Purpose                                                  |
| -------------- | ----------------- | ------------------------------------------------ | -------------------------------------------------------- |
| Spec Implement | `/spec-implement` | Code changes + task status updates               | Execute implementation tasks with continuous validation  |
| Spec Review    | `/spec-review`    | `artifacts/features/<slug>/review.md` (optional) | Verify implementation against spec, plan, and repo rules |

---

## Standard Workflow

### Repository Setup (Once)

Establish baseline durable knowledge:

```
/constitution               → Create repo-wide rules
  ↓
/project-knowledge-base    → Capture durable descriptive context
```

### Feature Development (Per Feature)

Follow this path for typical feature work:

```
/analyze                            (if system is unclear or risky)
  ↓
/spec-requirement                   → Define what to build
  ↓
/spec-review-requirements           → Quality gate: Is spec ready?
  ↓
/spec-design                        (optional: only if tech clarity needed)
  ↓
/spec-plan                          → Execution strategy
  ↓
/spec-tasks                         → Bounded work units
  ↓
/spec-implement                     → Build & validate
  ↓
/spec-review                        → Final verification
```

### Variant: Small/Localized Changes

Skip analysis and design for low-risk, well-understood changes:

```
/spec-requirement
  ↓
/spec-review-requirements
  ↓
/spec-plan
  ↓
/spec-tasks
  ↓
/spec-implement
  ↓
/spec-review
```

---

## Key Principles

1. **Artifacts First** — Decisions are only real when written down and reviewed. Chat history is not enough.
2. **Durable Memory** — Repository knowledge is deliberately compact. Only genuinely durable context gets saved.
3. **Bounded Exploration** — Investigation (`/analyze`) is for learning, not planning. Technical decisions happen in design/planning phases.
4. **Quality Gates** — Specs are reviewed before planning. Implementations are reviewed before shipping.
5. **Explicit Boundaries** — Each agent has one job, enforced by preconditions and scope rules. No silent scope creep.
6. **Safe Defaults** — Agents stop at dependency points. Missing upstream work is surfaced, not worked around.
7. **Testable Scope** — Each artifact tier (spec → design → plan → tasks) is reviewed before moving downstream.

---

## How to Navigate This Repository

### Getting Started

- **First time?** Start with [docs/guides/getting-started.md](docs/guides/getting-started.md) for a quick onboarding
- **New feature?** Use [docs/workflows/README.md](docs/workflows/README.md) to choose the right agent sequence
- **Need a refresher?** See [docs/how it works.md](docs/how%20it%20work.md) for workflow details

### Documentation Map

| Section                                    | Purpose                                    |
| ------------------------------------------ | ------------------------------------------ |
| [docs/](docs/)                             | Complete documentation index               |
| [docs/guides/](docs/guides/)               | How-to guides and onboarding               |
| [docs/workflows/](docs/workflows/)         | Workflow patterns and decision trees       |
| [docs/reference/](docs/reference/)         | Quick lookups: commands, terminology, FAQ  |
| [docs/agents/](docs/agents/)               | Deep documentation for each agent category |
| [docs/memory-system/](docs/memory-system/) | How permanent memory works                 |

### Configuration Files

| File                                                                                         | Purpose                                                   |
| -------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| [.github/agents/](./github/agents/)                                                          | 10 agent definitions (YAML frontmatter + execution rules) |
| [.github/prompts/](./github/prompts/)                                                        | Prompt configurations for each agent                      |
| [.github/specs/templates/](./github/specs/templates/)                                        | Reusable artifact templates                               |
| [.github/specs/checklists/](./github/specs/checklists/)                                      | Definition of Ready & Definition of Done                  |
| [.github/instructions/copilot-instructions.md](.github/instructions/copilot-instructions.md) | Copilot behavior rules                                    |

### Feature Work

All feature work lives under `artifacts/features/<feature-slug>/`:

- [artifacts/](artifacts/) → Feature specifications and plans
- [memories/repo/](memories/repo/) → Durable repository knowledge
- [memories/session/](memories/session/) → Session-specific notes (per-conversation)

---

## Quick Start Examples

### Example 1: New Repository Setup

```bash
# Create durable repository knowledge
/constitution
  → memories/repo/constitution.md (repo rules, guardrails)

/project-knowledge-base
  → memories/repo/project-knowledge-base.md (subsystems, patterns, integrations)
```

### Example 2: Simple Feature

For a feature `add-dark-mode`:

```bash
/spec-requirement
  → artifacts/features/add-dark-mode/spec.md

/spec-review-requirements
  → artifacts/features/add-dark-mode/requirements-review.md

/spec-plan
  → artifacts/features/add-dark-mode/plan.md

/spec-tasks
  → artifacts/features/add-dark-mode/tasks.md

/spec-implement
  → Code changes + test updates

/spec-review
  → artifacts/features/add-dark-mode/review.md
```

### Example 3: Complex/Risky Feature

For a feature `payment-processing`:

```bash
/analyze
  → artifacts/features/payment-processing/analysis.md (risks, current state)

/spec-requirement
  → artifacts/features/payment-processing/spec.md

/spec-review-requirements
  → artifacts/features/payment-processing/requirements-review.md

/spec-design
  → artifacts/features/payment-processing/design.md (payment API integration, data flow)

/spec-plan
  → artifacts/features/payment-processing/plan.md

/spec-tasks
  → artifacts/features/payment-processing/tasks.md

/spec-implement
  → Code changes, tests, security review

/spec-review
  → artifacts/features/payment-processing/review.md
```

---

## Traceability & Cross-Referencing

All artifacts use a consistent ID scheme for linking:

- `REQ-###` — Functional requirements from spec
- `AC-###` — Acceptance criteria
- `TASK-###` — Implementation tasks
- `RISK-###` — Identified risks
- `FILE-###` — File references
- `DEP-###` — Dependencies

This allows complete traceability from user stories → requirements → design decisions → tasks → code.

---

## Quality Gates

### Definition of Ready (Before Implementation)

A feature is ready for `/spec-tasks` when:
- [ ] Problem statement is clear and specific
- [ ] Target users/stakeholders identified
- [ ] Success criteria are measurable
- [ ] In-scope items listed
- [ ] Out-of-scope items listed
- [ ] Functional requirements are concrete
- [ ] Non-functional requirements identified
- [ ] Dependencies and constraints known
- [ ] Risks and open questions documented
- [ ] Implementation approach is clear enough
- [ ] Task breakdown is actionable
- [ ] IDs can be traced (REQ-, AC-, TASK-, etc.)

See [.github/specs/checklists/definition-of-ready.md](.github/specs/checklists/definition-of-ready.md)

### Definition of Done (Before Shipping)

A feature is done when:
- [ ] All acceptance criteria satisfied
- [ ] Code matches spec and plan
- [ ] Tests added or updated
- [ ] Manual verification completed
- [ ] Limitations and follow-up work documented
- [ ] Logging, monitoring, ops concerns addressed
- [ ] Security, privacy, performance reviewed
- [ ] Documentation updated
- [ ] Decision logs reflect final state
- [ ] Partial work clearly recorded for next session

See [.github/specs/checklists/definition-of-done.md](.github/specs/checklists/definition-of-done.md)

---

## Configuration & Discipline

### Canonical Paths

- **Durable repo memory:** `memories/repo/` only (not `memories/*.md`)
- **Feature work:** `artifacts/features/<feature-slug>/` only
- **Agent definitions:** `.github/agents/` (source of truth)
- **Prompts:** `.github/prompts/` (agent execution rules)

### Required Context Before Work

Before planning, implementation, or review, read:
- `memories/repo/constitution.md` (if it exists)
- `memories/repo/project-knowledge-base.md` (if it exists)
- Current feature artifact set in `artifacts/features/<feature-slug>/`

### Working Style

- **Prefer reversible changes** — Small, tested, documented changes over big rewrites
- **Validate before moving on** — Run tests and verify scope before proceeding downstream
- **Avoid speculation** — Use analysis (`/analyze`) to establish facts before planning
- **Update as you go** — Keep artifacts current with implementation progress
- **Resist feature creep** — If scope changes, update artifacts explicitly

---

## What Changed From The Older Model

This kit evolved from a 13-agent model. Key changes:

| Old                              | New                                 | Approach                                                               |
| -------------------------------- | ----------------------------------- | ---------------------------------------------------------------------- |
| Separate `/discover` command     | Bounded `/analyze`                  | Discovery is time-boxed, findings become durable memory later          |
| Separate `/architecture` command | Combined with `/spec-design`        | Architecture clarity is just design, not a separate command            |
| Separate `/patterns` command     | Stored in `/project-knowledge-base` | Patterns are durable descriptive knowledge                             |
| Separate `/archive` command      | Removed                             | Artifact history is preserved by timestamping; no extra cleanup needed |

All discovery, architecture, and pattern knowledge still gets captured—just through the current agent set.

---

## How This Repository Is Structured

```
├── README.md                                (you are here)
├── artifacts/
│   └── features/
│       └── <feature-slug>/                 (feature work artifacts)
│           ├── analysis.md
│           ├── spec.md
│           ├── requirements-review.md
│           ├── design.md
│           ├── plan.md
│           ├── tasks.md
│           └── review.md
├── docs/                                   (documentation)
│   ├── README.md                           (nav hub)
│   ├── guides/
│   ├── workflows/
│   ├── agents/
│   ├── reference/
│   └── memory-system/
├── memories/
│   ├── repo/                               (durable repository knowledge)
│   │   ├── constitution.md
│   │   └── project-knowledge-base.md
│   ├── session/                            (per-conversation notes)
│   └── user/                               (user preferences)
└── .github/
    ├── agents/                             (10 agent definitions)
    ├── prompts/                            (agent prompting config)
    ├── specs/
    │   ├── templates/                      (artifact templates)
    │   └── checklists/                     (quality gates)
    └── instructions/
        └── copilot-instructions.md         (copilot behavior rules)
```

---

## Next Steps

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
