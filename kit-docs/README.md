# Kit Documentation Index

**Comprehensive documentation for the AI Dev Kit**

---

## Quick Navigation

### For Everyone: Where to Start

1. **[README.md](../README.md)** — Kit overview, quick start, common questions
2. **[USAGE-GUIDE.md](../USAGE-GUIDE.md)** — Step-by-step workflows (Greenfield & Brownfield)

### Reference Guides

3. **[AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)** — All 12 agents described in detail
   - What each agent does
   - When to use it
   - How to run it
   - Success criteria

4. **[AGENTS-MAPPING.md](AGENTS-MAPPING.md)** — How agents relate to templates
   - Agent → Template connections
   - Workflow diagrams
   - Customization guide

5. **[MEMORY-SYSTEM.md](MEMORY-SYSTEM.md)** — How knowledge persists
   - Three-tier memory architecture
   - How discovery agents populate memory
   - How feature agents read memory

6. **[KIT-ARCHITECTURE.md](KIT-ARCHITECTURE.md)** — Design decisions for the kit
   - Why the kit is structured this way
   - Problem solved by memory system
   - How agents use memory
   - File organization

7. **[PROJECT-STRUCTURE.md](PROJECT-STRUCTURE.md)** — Where files live
   - Kit files vs project files
   - Folder purposes
   - Template organization

### Project Memory (Per-Project)

8. **[../memories/](../memories/)** — Your project's knowledge
   - `constitution.md` — Project rules
   - `project-knowledge-base.md` — Team patterns
   - `legacy-system-watchouts.md` — Gotchas
   - `architecture-decisions.md` — Design choices
   - `integration-points.md` — Feature connection points

---

## What You Are (Choose One)

### **I'm new to this kit**

**Path**: README.md → USAGE-GUIDE.md → AGENTS-REFERENCE.md

1. Read [README.md](../README.md) to understand the kit at a high level
2. Read [USAGE-GUIDE.md](../USAGE-GUIDE.md) to see workflows for your situation
3. Reference [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md) when you need agent details

**Time**: 30-45 minutes

---

### **I'm maintaining this kit**

**Path**: KIT-ARCHITECTURE.md → AGENTS-MAPPING.md → PROJECT-STRUCTURE.md

1. Understand [KIT-ARCHITECTURE.md](KIT-ARCHITECTURE.md) — Design principles
2. Review [AGENTS-MAPPING.md](AGENTS-MAPPING.md) — How components connect
3. Check [PROJECT-STRUCTURE.md](PROJECT-STRUCTURE.md) — Organization rules
4. Modify agents/templates as needed
5. Update this index if you make significant changes

---

### **I'm using the kit on a project**

**Path**: USAGE-GUIDE.md → AGENTS-REFERENCE.md → Project memory

1. Run workflows from [USAGE-GUIDE.md](../USAGE-GUIDE.md)
2. Reference [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md) when running agents
3. Build your project's memory in `memories/repo/`
4. Check [MEMORY-SYSTEM.md](MEMORY-SYSTEM.md) if you have memory questions

---

### **I need to understand something specific**

**Quick lookup**:

- **"Which agent should I run?"** → [AGENTS-REFERENCE.md: Decision Tree](AGENTS-REFERENCE.md#quick-decision-tree)
- **"How do the 12 agents work together?"** → [AGENTS-REFERENCE.md: Relationships](AGENTS-REFERENCE.md#agent-relationships)
- **"What templates does agent X use?"** → [AGENTS-MAPPING.md: Mapping Table](AGENTS-MAPPING.md#agent--template-mapping)
- **"How does memory work?"** → [MEMORY-SYSTEM.md](MEMORY-SYSTEM.md)
- **"Why is the kit designed this way?"** → [KIT-ARCHITECTURE.md](KIT-ARCHITECTURE.md)
- **"Where should this file live?"** → [PROJECT-STRUCTURE.md](PROJECT-STRUCTURE.md)
- **"How do I customize X?"** → [AGENTS-MAPPING.md: Customization](AGENTS-MAPPING.md#how-to-customize)

---

## The 12 Agents (Quick Summary)

| #   | Agent                      | Type        | Purpose               | Time      |
| --- | -------------------------- | ----------- | --------------------- | --------- |
| 1   | `constitution`             | Setup       | Project rules         | 30 min    |
| 2   | `project-knowledge-base`   | Setup       | Team patterns         | 30 min    |
| 3   | `spec-requirement`         | Feature     | What to build         | 45-90 min |
| 4   | `spec-review-requirements` | QA          | Spec quality          | 15-30 min |
| 5   | `spec-design`              | Feature     | How to build          | 1-2 hours |
| 6   | `spec-plan`                | Feature     | Implementation phases | 1-2 hours |
| 7   | `spec-tasks`               | Feature     | Task breakdown        | 1-2 hours |
| 8   | `spec-implement`           | Code        | Write code & tests    | varies    |
| 9   | `spec-review`              | QA          | Code quality          | 30-60 min |
| 10  | `discover-legacy-system`   | 🔥 Discovery | Explore codebase      | 5-10 min  |
| 11  | `capture-architecture`     | 🔥 Discovery | Document design       | 5-10 min  |
| 12  | `promote-to-repo-memory`   | 🔥 Discovery | Organize findings     | 5-10 min  |

🔥 = Fully autonomous agents

**Full details**: See [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)

---

## Key Concepts (Definitions)

### Artifact
A structured markdown file created during feature development. Examples: `spec.md`, `plan.md`, `tasks.md`, `design.md`, code comments with traceability IDs.

### Memory Tier
One of three contexts where knowledge lives:
- **User memory** (`/memories/`) — Across all projects
- **Session memory** (`/memories/session/`) — This conversation
- **Repository memory** (`/memories/repo/`) — This project

### Traceability ID
Identifiers that link requirements → implementation:
- `REQ-*` — Requirement
- `AC-*` — Acceptance criterion
- `TASK-*` — Implementation task
- `RISK-*` — Risk
- All used in code, commits, tests

### Gotcha
A pattern or constraint in existing code that affects new features. Discovered by `discover-legacy-system` agent, documented in `legacy-system-watchouts.md`.

### Integration Point
A specific place in codebase where new features typically connect. Documented in `integration-points.md`.

### Autonomous Agent
An agent that explores or generates independently without asking many questions. All 3 discovery agents (marked 🔥) are autonomous.

---

## Common Workflows (Step-by-Step)

### Workflow 1: New Project (Greenfield)

```
setup/
  constitution agent → Project rules defined
  project-knowledge-base agent → Initial patterns documented

feature 1/
  spec-requirement → What to build
  spec-review-requirements → Spec approved
  spec-plan → Implementation phases
  spec-tasks → Task breakdown
  spec-implement → Write code
  spec-review → Code approved

feature 2, 3, N...
  (Repeat)
```

**Time per feature**: 6-8 hours

### Workflow 2: Legacy System (Brownfield)

```
discovery/ (one-time, ~30 min)
  discover-legacy-system → Explore codebase
  capture-architecture → Document design
  promote-to-repo-memory → Organize findings
  (Result: Memory files populated)

feature 1/
  (Same as Greenfield, but with memory context)
  spec-requirement → Reads memory, respects gotchas
  (Continue as Greenfield: review → plan → tasks → implement → review)

feature 2, 3, N...
  (Repeat, each agent reads memory)
  (New findings promoted to memory at session end)
```

**Time to discovery**: ~30 min (autonomous)
**Time per feature**: 6-8 hours (informed by memory)

### Workflow 3: Resume Feature Work

```
1. Check: artifacts/features/<slug>/
2. Determine: What's missing? (spec? plan? tasks? code?)
3. Read: memories/repo/* for context
4. Run: Appropriate next agent
5. Continue from where you left off
```

---

## File Organization

```
Your project:
├── README.md (this kit overview)
├── USAGE-GUIDE.md (workflows + agent instruction)
│
├── kit-docs/ (documentation)
│   ├── README.md (this file)
│   ├── AGENTS-REFERENCE.md (all 12 agents)
│   ├── AGENTS-MAPPING.md (agents ↔ templates)
│   ├── KIT-ARCHITECTURE.md (design principles)
│   ├── MEMORY-SYSTEM.md (how knowledge persists)
│   └── PROJECT-STRUCTURE.md (where files live)
│
├── .github/ (kit files)
│   ├── agents/ (12 agent guides)
│   └── specs/templates/ (11 templates)
│
├── memories/ (project knowledge)
│   ├── constitution.md (project rules)
│   ├── project-knowledge-base.md (patterns)
│   ├── legacy-system-watchouts.md (gotchas)
│   ├── architecture-decisions.md (design decisions)
│   └── integration-points.md (feature connections)
│
└── artifacts/ (per-feature files)
    ├── features/
    │   └── <feature-slug>/
    │       ├── spec.md
    │       ├── design.md (optional)
    │       ├── plan.md
    │       ├── tasks.md
    │       └── decision-log.md (optional)
    └── knowledge/
        └── (exploration notes)
```

---

## Updating This Kit

### If you want to...

**Add a new agent**:
1. Create `.github/agents/my-agent.md`
2. Document in [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)
3. Add to [AGENTS-MAPPING.md](AGENTS-MAPPING.md)
4. Update [USAGE-GUIDE.md](../USAGE-GUIDE.md) if it affects workflows
5. Update this README

**Add a new template**:
1. Create `.github/specs/templates/my-template.md`
2. Update [AGENTS-MAPPING.md](AGENTS-MAPPING.md) table
3. Link from relevant agent in [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)

**Change a workflow**:
1. Update agent `.md` files in `.github/agents/`
2. Update workflows in [USAGE-GUIDE.md](../USAGE-GUIDE.md)
3. Update diagrams in [AGENTS-MAPPING.md](AGENTS-MAPPING.md)

**Improve documentation**:
1. Make changes to relevant `.md` file in `kit-docs/`
2. Ensure cross-references still work
3. Update this README if necessary

---

## Support

**Need help?**
1. Check [USAGE-GUIDE.md](../USAGE-GUIDE.md) for your workflow
2. Reference [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md) for agent details
3. Read [MEMORY-SYSTEM.md](MEMORY-SYSTEM.md) if stuck on memory
4. Review [KIT-ARCHITECTURE.md](KIT-ARCHITECTURE.md) to understand design

**Found a bug or have a suggestion?**
1. Check if it's documented in these files
2. Update the relevant doc locally or suggest upstream
3. Test the fix works for your use case

---

## Versions

- **Kit version**: 2.0
- **Last updated**: 2026-04-04
- **Agents**: 12 (7 feature + 3 discovery + 2 setup)
- **Templates**: 11
- **Memory tiers**: 3 (user, session, repository)

---

Next: [README.md](../README.md) | [USAGE-GUIDE.md](../USAGE-GUIDE.md) | [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)
