# AI Dev Kit

**An opinionated, lightweight workflow for building features with AI agents—whether starting fresh or working with existing systems.**

**Status**: ✅ Production Ready | **Agents**: 13 | **Templates**: 11 | **Prompts**: 13

---

## ⚡ Quick Start

**New to this kit?** Start here:

1. **[USAGE-GUIDE.md](USAGE-GUIDE.md)** — Your day-to-day guide
   - 13 agents and what each one does
   - Complete feature workflow: spec → analyze → design → plan → tasks → implement → review → archive
   - Greenfield workflow (new projects)
   - Brownfield workflow (existing code)
   - Memory system (how knowledge persists across sessions)
   - Troubleshooting and best practices

2. **See all agents** — [kit-docs/AGENTS-REFERENCE.md](kit-docs/AGENTS-REFERENCE.md)
   - Detailed description of each agent's role
   - When to use each agent
   - What each agent reads and outputs
   - Success criteria for each agent

3. **Your first action** depends on your project:
   - **Greenfield (new project)?** → Run `/spec` to define requirements
   - **Brownfield (existing code)?** → Run `/discover` to explore the system

4. **Visual guides** → [visual-maps/](visual-maps/) for workflow flowcharts
   - Choose the right mode
   - Step-by-step decision trees
   - Complete process diagrams

---

## 🎯 What's Included

### 13 Agents (Executing Workflows)

**Specification & Analysis**
- `/spec` — Define what to build
- `/analyze` — Investigate bugs, research, requirements

**Design & Planning**
- `/design` — Create technical design
- `/plan` — Build implementation plan
- `/tasks` — Break into tasks

**Implementation & Review**
- `/implement` — Execute implementation
- `/review` — Verify completion
- `/requirement-review` — Review against spec

**Foundation**
- `/constitution` — Define project principles
- `/patterns` — Build patterns library

**Discovery**
- `/discover` — Understand existing code
- `/architecture` — Document architecture
- `/archive` — Archive learnings

See [.github/README.md](.github/README.md) for complete reference.

### 11 Reusable Templates
Specs, designs, plans, tasks, reviews, constitution, patterns, architecture decisions, integration points, legacy context, watchouts.

Located in `.github/specs/templates/`

### 13 Slash Commands
Quick access via: `/spec`, `/analyze`, `/design`, `/plan`, `/tasks`, `/implement`, `/review`, `/requirement-review`, `/constitution`, `/patterns`, `/discover`, `/architecture`, `/archive`

### 7 Visual Workflow Maps
Decision trees and flowcharts in `visual-maps/` showing exact steps for investigation, design, planning, implementation, and retrospective.

### Memory System (3 Tiers)
- **User Memory**: Cross-project preferences and learnings
- **Session Memory**: Current conversation notes
- **Repository Memory**: Project-specific knowledge (patterns, decisions, gotchas)

---

## 🎯 Information for Your Team

### Running Features (Most Common)

Follow the workflows in [USAGE-GUIDE.md](USAGE-GUIDE.md):

- **Complete workflow**: spec → analyze (if needed) → design (if complex) → plan → tasks → implement → review → archive
- **Minimal workflow**: spec → plan → tasks → implement
- **Bugfix workflow**: analyze → plan → implement → review
- **Resume work**: Check `artifacts/features/<feature>/` for existing status

### Using Slash Commands

All agents are accessible via slash commands:

```bash
/spec "Your feature description"
/analyze "Need to investigate first?"
/design "Complex? Needs design review."
/plan "Ready to plan?"
/tasks "Break into tasks"
/implement "Time to code"
/review "Verify completion"
/archive "Save learnings"
```

### Memory & Documentation

Your project knowledge lives in `memories/repo/`:

- `constitution.md` — Project rules and standards
- `project-knowledge-base.md` — Proven patterns
- `legacy-system-watchouts.md` — Gotchas to avoid
- `architecture-decisions.md` — Why it's built this way
- `integration-points.md` — Where features connect

Start here: [memories/README.md](memories/README.md)

### Templates & Agents

**Agents**: `.github/agents/` — 13 executable workflows
**Prompts**: `.github/prompts/` — Slash-command entrypoints
**Templates**: `.github/specs/templates/` — Reusable scaffolding (11 templates)
**Instructions**: `.github/instructions/` — Rules and configurations

### For Kit Maintainers

**How the kit works**: See [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md)
**Project structure**: See [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md)
**Memory system**: See [kit-docs/MEMORY-SYSTEM.md](kit-docs/MEMORY-SYSTEM.md)
**Agent reference**: See [kit-docs/AGENTS-REFERENCE.md](kit-docs/AGENTS-REFERENCE.md)

To customize:
1. Modify agents in `.github/agents/`
2. Update templates in `.github/specs/templates/`
3. Document team patterns in `memories/repo/`

---


## 📋 File Organization

See [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md) for complete file organization details.

Key folders:
- `kit-docs/` — Documentation for maintainers
- `memories/` — Project knowledge (automatic, shared across sessions)
- `artifacts/features/` — Your feature specs, plans, and tasks
- `.github/agents/`, `.github/instructions/`, `.github/prompts/`, `.github/specs/` — Agent definitions, instructions, prompts, and templates

---

## 🚀 Getting Started

1. **Read**: [USAGE-GUIDE.md](USAGE-GUIDE.md) (10 minute overview)
2. **Run first command**:
   - New project: `/constitution` → `/spec`
   - Existing project: `/discover` → `/architecture` → then `/spec`
3. **Follow prompts**: Each agent guides you through the process
4. **Save work**: Use `/archive` to save learnings to memory

---

## ❓ Common Questions

**Q: What do I read first?**
A: [USAGE-GUIDE.md](USAGE-GUIDE.md)

**Q: Which agent should I run first?**
A: `/spec` for new features, `/discover` for existing code

**Q: How do I investigate before specifying?**
A: Run `/analyze` first, then `/spec`

**Q: Where do my specs go?**
A: `artifacts/features/<feature-slug>/spec.md`

**Q: How do I save project knowledge?**
A: Run `/archive` to promote findings to `memories/repo/`

---

## 📖 Full Documentation Index

### Getting Started
- [USAGE-GUIDE.md](USAGE-GUIDE.md) — Complete workflows & patterns
- [.github/README.md](.github/README.md) — Kit structure & agent reference
- [visual-maps/README.md](visual-maps/README.md) — Workflow flowcharts

### Reference
- [kit-docs/AGENTS-REFERENCE.md](kit-docs/AGENTS-REFERENCE.md) — All 13 agents
- [kit-docs/AGENTS-MAPPING.md](kit-docs/AGENTS-MAPPING.md) — Agent-to-template mappings
- [memories/README.md](memories/README.md) — Memory system

### Deep Dives
- [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md) — Design & reasoning
- [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md) — File organization
- [kit-docs/MEMORY-SYSTEM.md](kit-docs/MEMORY-SYSTEM.md) — Memory architecture

---

## 💡 Key Concepts

**Artifacts**: Markdown files that capture each phase of feature work (spec, plan, tasks, implementation files)

**Memory tiers**: User (across projects) | Session (this conversation) | Repository (this project)

**Autonomous agents**: Agents that explore/generate independently, reducing questions and friction

**Traceability IDs**: REQ-* → AC-* → TASK-* linking requirements to implementation

**Definition gates**: Quality checklists that ensure specs, plans, and code meet standards

---

## 🎓 Learn More

- Workflow details: See [USAGE-GUIDE.md](USAGE-GUIDE.md)
- Memory design: See [kit-docs/MEMORY-SYSTEM.md](kit-docs/MEMORY-SYSTEM.md)
- Project setup: See [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md)
- Architecture decisions: See [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md)

**Version**: 1.0 (Production Ready)
**Last updated**: April 4, 2026

**Ready to start?** Run: `/spec "Describe your first feature"`
**Agents**: 12 | **Templates**: 11 | **Memory tiers**: 3
