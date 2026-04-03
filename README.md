# AI Dev Kit

**An opinionated, lightweight workflow for building features with AI agents—whether starting fresh or working with existing systems.**

---

## ⚡ Quick Start

**New to this kit?** Start here:

1. **[USAGE-GUIDE.md](USAGE-GUIDE.md)** — Your day-to-day guide
   - Workflows for Greenfield (new projects) and Brownfield (existing code)
   - How to use each agent
   - Common patterns and best practices

2. **Your first feature** — Pick a workflow:
   - **Starting fresh?** → Use `spec-requirement` agent
   - **Existing project?** → Use `discover-legacy-system` agent

3. **Questions?** → See the relevant section in USAGE-GUIDE.md

---

## 📚 For Your Team

### Running Features (Most Common)

Follow the workflows in [USAGE-GUIDE.md](USAGE-GUIDE.md):

- **Greenfield workflow**: spec → review → plan → tasks → implement → review
- **Brownfield workflow**: discover → capture → promote → then use Greenfield workflow
- **Resume work**: Check `artifacts/features/<feature>/` for existing specs

### Memory & Documentation

Your project knowledge lives in `memories/repo/`:

- `constitution.md` — Project rules and standards
- `project-knowledge-base.md` — Proven patterns
- `legacy-system-watchouts.md` — Gotchas to avoid
- `architecture-decisions.md` — Why it's built this way
- `integration-points.md` — Where features connect

Start here: [memories/README.md](memories/README.md)

### Templates & Agents

- **Templates**: `.github/specs/templates/` — Use these as starting points
- **Agents**: `.github/agents/` — Run these to automate workflow steps

---

## 🛠️ For Kit Maintainers

### Understanding the Kit

**How the kit works**: [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md)
- Three-tier memory system
- Why each component exists
- How to extend the kit

**Project structure**: [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md)
- What belongs where
- Kit files vs project files
- Setup for new projects

**Memory system details**: [kit-docs/MEMORY-SYSTEM.md](kit-docs/MEMORY-SYSTEM.md)
- How memory is organized
- How to use each tier
- Best practices

### Customizing for Your Team

1. Update templates in `.github/specs/templates/`
2. Modify agents in `.github/agents/` if needed
3. Document team patterns in `kit-docs/`

---

## 🎯 Workflows at a Glance

### Greenfield (New Project)

1. `spec-requirement` → Create spec
2. `spec-review-requirements` → Validate
3. `spec-plan` → Create plan
4. `spec-tasks` → Break down tasks
5. `spec-implement` → Build
6. `spec-review` → Quality gate

**Time**: ~6 hours per feature

### Brownfield (Existing Project)

**Phase 1: Autonomously discover** (~30 min)
1. `discover-legacy-system` → Explore code, find gotchas
2. `capture-architecture` → Document design decisions
3. `promote-to-repo-memory` → Save learnings for team

**Phase 2: Use Greenfield workflow** (informed by discoveries)
→ All features now respect known constraints

### Multi-Session Features

- Session 1: Implement phase 1, promote findings
- Session 2: Agent reads memory, continue phase 2
- Session 3: Agent reads memory, finish phase 3
- Result: Knowledge compounds, no rediscovery

---

## 📋 File Organization

```
project-root/
├── README.md ← You are here
├── USAGE-GUIDE.md ← Your day-to-day guide
│
├── kit-docs/ ← Maintainer documentation
│   ├── KIT-ARCHITECTURE.md (why it's designed this way)
│   ├── PROJECT-STRUCTURE.md (what lives where)
│   └── MEMORY-SYSTEM.md (detailed reference)
│
├── .github/
│   ├── agents/ (13 autonomous workflow steps)
│   └── specs/
│       ├── templates/ (11 templates for all phases)
│       └── checklists/ (quality gates)
│
├── memories/ ← Project-specific knowledge
│   ├── README.md (navigation guide)
│   ├── constitution.md (project rules)
│   ├── project-knowledge-base.md (patterns)
│   ├── legacy-system-watchouts.md (gotchas)
│   ├── architecture-decisions.md (design)
│   └── integration-points.md (where features go)
│
└── artifacts/
    ├── features/ (your feature specs, plans, tasks)
    └── knowledge/ (exploration notes)
```

---

## 🚀 Getting Started with a New Project

1. **Copy this kit** to your project
2. **Read** [USAGE-GUIDE.md](USAGE-GUIDE.md) (takes 10 min)
3. **Initialize** project knowledge:
   - Fill `memories/constitution.md` (project rules)
   - Fill `memories/project-knowledge-base.md` (patterns)
4. **Start feature work**:
   - Greenfield? → Use `spec-requirement` agent
   - Brownfield? → Use `discover-legacy-system` agent first

---

## ❓ Common Questions

**Q: What do I read first?**
A: [USAGE-GUIDE.md](USAGE-GUIDE.md) — it covers both greenfield and brownfield workflows

**Q: Where do I put my specs?**
A: `artifacts/features/<feature-slug>/spec.md`

**Q: How do I resume work from last session?**
A: Check `artifacts/features/<feature>/` → read existing artifacts → continue from last agent used

**Q: What's in memories/?**
A: Project knowledge that agents read automatically. See [memories/README.md](memories/README.md)

**Q: How do I customize this kit?**
A: See [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md) for extension guidance

---

## 📖 Full Documentation Index

### For Users (Day-to-Day)
- [USAGE-GUIDE.md](USAGE-GUIDE.md) — Workflows, agents, best practices
- [memories/README.md](memories/README.md) — Project memory system

### For Kit Maintainers
- [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md) — Design, memory system, reasoning
- [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md) — Organization, what lives where
- [kit-docs/MEMORY-SYSTEM.md](kit-docs/MEMORY-SYSTEM.md) — Detailed memory reference

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

---

**Version**: 1.0
**Last updated**: 2024-04-03
