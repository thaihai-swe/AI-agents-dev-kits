# AI Dev Kit

**An opinionated, lightweight workflow for building features with AI agents—whether starting fresh or working with existing systems.**

---

## ⚡ Quick Start

**New to this kit?** Start here:

1. **[USAGE-GUIDE.md](USAGE-GUIDE.md)** — Your day-to-day guide
   - 12 agents and what each one does
   - Greenfield workflow (new projects) — 7 agents
   - Brownfield workflow (existing code) — 3 discovery agents + 7 feature agents
   - Memory system (how knowledge persists across sessions)
   - Troubleshooting and best practices

2. **See all agents** — [kit-docs/AGENTS-REFERENCE.md](kit-docs/AGENTS-REFERENCE.md)
   - Detailed description of each agent's role
   - When to use each agent
   - What each agent reads and outputs
   - Success criteria for each agent

3. **Your first action** depends on your project:
   - **Greenfield (new project)?** → Run `constitution` agent first
   - **Brownfield (existing code)?** → Run `discover-legacy-system` agent

4. **Questions?** → [USAGE-GUIDE.md](USAGE-GUIDE.md) covers all workflows in detail

---

## 🎯 Enhancing Your Kit

Want to extend the kit with specialized agents, layered instructions, and prompt discoverability? See our enhancement resources:

**Start here** → [QUICK-START-SUMMARY.md](QUICK-START-SUMMARY.md) (10 min overview)

Then choose your path:
- **Full analysis & recommendations**: [ENHANCEMENT-REVIEW.md](ENHANCEMENT-REVIEW.md) (comparative analysis + priorities)
- **Month-by-month execution plan**: [IMPLEMENTATION-ROADMAP.md](IMPLEMENTATION-ROADMAP.md) (3-week breakdown)
- **Copy-ready templates & code**: [ADAPTATION-GUIDE.md](ADAPTATION-GUIDE.md) (patterns from Brad Stevens' starter kit)

**What's included**:
- ✨ 7 specialized Memory Bank agents (Planning, Implementation, Creative, Research, etc.)
- ✨ Layered instruction system (4 complexity levels + phase modes)
- ✨ Prompt templates with YAML frontmatter (discoverable via `/` commands)
- ✨ MCP server configuration examples
- ✨ Technology-specific instructions (optional)
- ✨ Automation scripts (optional)

**Estimated effort**: 1-3 weeks (25-36 hours), with high-priority items completable in Week 1

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

- **Instructions**: `.github/instructions/` — Always-on Copilot guidance for this kit
- **Prompts**: `.github/prompts/` — Slash-command entrypoints for spec, plan, tasks, and README flows
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


## 📋 File Organization

See [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md) for complete file organization details.

Key folders:
- `kit-docs/` — Documentation for maintainers
- `memories/` — Project knowledge (automatic, shared across sessions)
- `artifacts/features/` — Your feature specs, plans, and tasks
- `.github/agents/`, `.github/instructions/`, `.github/prompts/`, `.github/specs/` — Agent definitions, instructions, prompts, and templates

---

## 🚀 Getting Started

1. **Read**: [USAGE-GUIDE.md](USAGE-GUIDE.md) (10 minute overview covering both Greenfield and Brownfield workflows)
2. **Setup**: Run `@constitution` and `@project-knowledge-base` agents if new project
3. **Begin**: Run appropriate first agent based on project type
   - Greenfield: `@spec-requirement`
   - Brownfield: `@discover-legacy-system`

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

### For First-Time Users
1. [USAGE-GUIDE.md](USAGE-GUIDE.md) — Step-by-step workflows (Greenfield & Brownfield)
2. [kit-docs/AGENTS-REFERENCE.md](kit-docs/AGENTS-REFERENCE.md) — Complete reference for all 12 agents
3. [kit-docs/README.md](kit-docs/README.md) — Documentation hub (find what you need)

### For Using the Kit
- [memories/README.md](memories/README.md) — Project memory system & how to use it
- [kit-docs/AGENTS-MAPPING.md](kit-docs/AGENTS-MAPPING.md) — How agents relate to templates

### For Understanding the Kit
- [kit-docs/KIT-ARCHITECTURE.md](kit-docs/KIT-ARCHITECTURE.md) — Design principles, memory system reasoning
- [kit-docs/PROJECT-STRUCTURE.md](kit-docs/PROJECT-STRUCTURE.md) — File organization, kit vs project files
- [kit-docs/MEMORY-SYSTEM.md](kit-docs/MEMORY-SYSTEM.md) — Three-tier memory architecture

### For Maintaining/Extending the Kit
- [kit-docs/AGENTS-MAPPING.md](kit-docs/AGENTS-MAPPING.md) — How to customize agents & templates

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

**Version**: 2.0
**Last updated**: 2026-04-04
**Agents**: 12 | **Templates**: 11 | **Memory tiers**: 3
