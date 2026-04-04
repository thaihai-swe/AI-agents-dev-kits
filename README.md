# AI Development Kit

**Complete system for building software incrementally with AI agents.**

A federated toolkit of 13 agents, 11 templates, and 3-tier memory system that manages feature development from specification through implementation to production.

---

## 🚀 Quick Start

**New to the kit?** Start here:
- [Getting Started](docs/guides/getting-started.md) — First 10 minutes
- [Workflows Guide](docs/workflows/) — Real-world patterns
- [FAQ](docs/reference/faq.md) — Answers to common questions

**Already familiar?** Jump to:
- [All 13 Commands](docs/reference/commands.md) — Command lookup
- [Agent Reference](docs/agents/AGENTS-REFERENCE.md) — How to invoke agents
- [Full Documentation](docs/) — Complete guide

---

## 📚 Complete Documentation

All documentation is organized in the **[docs/](docs/)** folder:

### 📋 Agents - The 13 AI Specialists
- **[Agents Overview](docs/agents/README.md)** — All 13 agents at a glance
- **[Agent Command Reference](docs/agents/AGENTS-REFERENCE.md)** — How to invoke each agent
- **[Agent Mapping](docs/agents/agent-mapping.md)** — How agents work together
- **Agent Details:**
  - [Specification & Planning](docs/agents/details/specification-planning.md) — `/spec`, `/design`, `/plan`, `/tasks`
  - [Implementation & Delivery](docs/agents/details/implementation-delivery.md) — `/implement`, `/review`
  - [Discovery & Learning](docs/agents/details/discovery-learning.md) — `/analyze`, `/discover`, `/architecture`
  - [Foundation & Setup](docs/agents/details/foundation-setup.md) — `/constitution`, `/patterns`, `/project-knowledge-base`
  - [Quality & Knowledge](docs/agents/details/quality-knowledge.md) — `/requirement-review`, `/archive`

### 🔄 Workflows - How to Use Agents
- **[Workflows Overview](docs/workflows/README.md)** — Common patterns and sequences
- **[Feature Workflow](docs/workflows/README.md)** — Start-to-finish feature development
- **[Greenfield Setup](docs/workflows/README.md)** — New project from scratch
- **[Brownfield Setup](docs/workflows/README.md)** — Existing codebase
- **[Common Scenarios](docs/workflows/README.md)** — Real-world patterns

### 📖 Guides - Step-by-Step Tutorials
- **[Getting Started](docs/guides/getting-started.md)** — Your first 10 minutes
- **[All Guides](docs/guides/README.md)** — Complete list of tutorials

### 📚 Reference - Quick Lookups
- **[Commands Reference](docs/reference/commands.md)** — All 13 commands and how to use
- **[Terminology](docs/reference/terminology.md)** — Key terms and definitions
- **[FAQ](docs/reference/faq.md)** — Frequently asked questions
- **[All References](docs/reference/README.md)** — Complete reference index

### 🧠 Memory System - Knowledge Persistence
- **[Memory Overview](docs/memory-system/README.md)** — How knowledge persists
- **Three-Tier Architecture:**
  - User Memory — Personal across all workspaces
  - Session Memory — Current task only
  - Repo Memory — Entire team's knowledge

### ✅ Checklists - Quality Gates
- **[Definition of Ready](docs/checklists/definition-of-ready.md)** — Before starting work
- **[Definition of Done](docs/checklists/definition-of-done.md)** — After finishing work

### 🎯 Templates - Reusable Scaffolding
- **[Templates Guide](docs/templates/README.md)** — Available templates
- **[11 Reusable Templates](docs/templates/README.md)** — Specs, components, tests, docs

---

## 🎯 Usage Paths

### Path 1: New Project (Greenfield)
```
1. /constitution          → Define rules
2. /patterns              → Document patterns
3. /spec                  → Define feature
4. /plan → /tasks         → /implement → /review
5. /archive               → Save learnings
```

### Path 2: Existing Project (Brownfield)
```
1. /discover "system"     → Explore code
2. /architecture          → Document design
3. /archive               → Save findings
4. Then: /spec → /plan → /tasks → /implement → /review
```

### Path 3: Join Team
```
1. Read [Team Onboarding Guide](docs/guides/team-onboarding.md)
2. Run `/discover` for system context
3. Review [Definition of Done](docs/checklists/definition-of-done.md)
4. Start with simple feature
```

---

## 📦 What's Included

| Component        | Count | Location                                   |
| ---------------- | ----- | ------------------------------------------ |
| **Agents**       | 13    | [docs/agents/](docs/agents/)               |
| **Templates**    | 11    | `.github/specs/templates/`                 |
| **Commands**     | 13    | [docs/workflows/](docs/workflows/)         |
| **Guides**       | 6+    | [docs/guides/](docs/guides/)               |
| **Checklists**   | 2     | [docs/checklists/](docs/checklists/)       |
| **Memory Tiers** | 3     | [docs/memory-system/](docs/memory-system/) |

---

## 🔗 Related Resources

- **Agent Definitions**: `.github/agents/` (13 agent YAML files)
- **Prompts**: `.github/prompts/` (13 prompt files)
- **Templates**: `.github/specs/templates/` (11 template files)
- **Checklists**: `.github/specs/checklists/` (2 checklist files)
- **Artifacts**: `artifacts/features/<slug>/` (created during feature work)
- **Memory**: `memories/` (3-tier: user, session, repo)

---

## 💡 Key Concepts

**Agents**: Specialized AI tools for specific tasks (spec creation, code implementation, architecture discovery, etc.)

**Templates**: Reusable scaffolding that agents and teams use to structure work

**Memory System**: 3-tier knowledge storage:
- **User Memory**: Your personal notes & preferences
- **Session Memory**: Current task context
- **Repo Memory**: Team knowledge that persists long-term

**Traceability**: Requirements → Code → Tests (linked through marks like REQ-*, AC-*, TASK-*)

---

## 🚦 Next Steps

1. **Understanding the system?** → Read [Design Principles](docs/architecture/design-principles.md)
2. **Starting your first feature?** → Follow [Beginner Start](docs/guides/beginner-start.md)
3. **Questions?** → Check [FAQ](docs/guides/faq.md) or [Troubleshooting](docs/guides/troubleshooting.md)
4. **Need an agent?** → See [Command Index](docs/reference/command-index.md)

---

## 📄 Documentation Map

```
README.md (YOU ARE HERE)
├── docs/ ───────────────────────── Complete documentation
│   ├── agents/ ──────────────────── All about agents
│   ├── workflows/ ───────────────── How to use agents
│   ├── templates/ ───────────────── Reusable scaffolding
│   ├── memory-system/ ──────────── Knowledge persistence
│   ├── architecture/ ───────────── System design
│   ├── guides/ ─────────────────── Step-by-step tutorials
│   ├── reference/ ──────────────── Quick lookup tables
│   └── checklists/ ────────────---- Quality gates
│
├── .github/ (UNCHANGED)
│   ├── agents/ ──────────────────── 13 agent definitions
│   ├── prompts/ ─────────────────── 13 agent prompts
│   ├── specs/
│   │   ├── templates/ ────────────── 11 templates
│   │   └── checklists/ ───────────── 2 checklists
│   └── instructions/
│
├── memories/ ────────────────────── 3-tier knowledge storage
├── artifacts/ ───────────────────── Feature work (generated)
└── REBUILD-PLAN.md ──────────────── Migration plan
```

---

## 🎓 Learn More

- **How does the kit work?** → [KIT-ARCHITECTURE.md](docs/architecture/KIT-ARCHITECTURE.md)
- **How is memory organized?** → [MEMORY-SYSTEM.md](docs/memory-system/MEMORY-SYSTEM.md)
- **What's the folder structure?** → [PROJECT-STRUCTURE.md](docs/architecture/PROJECT-STRUCTURE.md)
- **What are the design principles?** → [Design Principles](docs/architecture/design-principles.md)

---

**Version**: 1.0 (Production Ready) | **Last Updated**: April 4, 2026 | **Status**: Complete & Tested
