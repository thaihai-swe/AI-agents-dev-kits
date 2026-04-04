# AI Development Kit

**Complete system for building software with AI: 13 specialized agents, 11 reusable templates, 3-tier memory system, and comprehensive documentation.**

Designed for sustainable, traceable feature development—from specification through implementation—that works seamlessly with AI while maintaining quality gates and team knowledge.

---

## ⚡ Quick Start

**New here?** (5 minutes)
1. Read [Getting Started](docs/guides/getting-started.md) — See how it works
2. Pick a workflow: [New feature?](docs/workflows/README.md) or [Existing code?](docs/workflows/README.md)
3. Use [All Commands](docs/reference/commands.md) as reference

**Questions?** → [FAQ (100+ Q&A)](docs/reference/faq.md)

---

## 📚 Documentation (21 files, organized by purpose)

| What You Need               | Where to Find It                                                                                    |
| --------------------------- | --------------------------------------------------------------------------------------------------- |
| **What are the 13 agents?** | [agents/README.md](docs/agents/README.md) + [Deep dives by category](docs/agents/details/)          |
| **How do I use them?**      | [Workflows Guide](docs/workflows/README.md)                                                         |
| **All commands reference**  | [All 13 Commands](docs/reference/commands.md) or [Agent Reference](docs/agents/AGENTS-REFERENCE.md) |
| **Key terms explained**     | [Terminology](docs/reference/terminology.md)                                                        |
| **Questions answered**      | [FAQ](docs/reference/faq.md)                                                                        |
| **Quality gates**           | [Checklists](docs/checklists/)                                                                      |
| **How memory works**        | [Memory System](docs/memory-system/README.md)                                                       |
| **Everything else**         | [Full Documentation Hub](docs/README.md)                                                            |

---

## 🎯 Your First Day

### Scenario 1: Starting a Brand New Feature
```
1. /spec                 Create specification
2. /requirement-review   Check for gaps (optional)
3. /design               Tech architecture (if complex)
4. /plan                 Execution sequence
5. /tasks                Break into small tasks
6. /implement            Build & test
7. /review               Verify it matches spec
```

### Scenario 2: Working with Existing Code
```
1. /discover             Explore and map the system
2. /architecture         Extract current design
3. /archive              Save findings to team memory
4. Then → follow new feature flow above
```

### Scenario 3: Setting Up a New Project
```
1. /constitution         Define project rules
2. /patterns             Document patterns & standards
3. /project-knowledge-base  Capture team knowledge
4. Then → start shipping features
```

---

## 📦 System Components

| Component             | Location                                    | Purpose                                             |
| --------------------- | ------------------------------------------- | --------------------------------------------------- |
| **13 Agents**         | [docs/agents/](docs/agents/)                | Spec, design, plan, code, review, discovery, memory |
| **Workflows**         | [docs/workflows/](docs/workflows/README.md) | How to chain agents together                        |
| **Templates**         | `.github/specs/templates/`                  | 11 reusable scaffolds                               |
| **Checklists**        | `.github/specs/checklists/`                 | Quality gates (ready/done)                          |
| **Memory System**     | `memories/`                                 | 3-tier knowledge storage                            |
| **Feature Artifacts** | `artifacts/features/<slug>/`                | spec.md, design.md, plan.md, tasks.md               |

---

## 🧠 How It Works

```
Request
   ↓
/spec → spec.md (what are we building?)
   ↓
/design → design.md (how will we build it?)
   ↓
/plan → plan.md (what's the execution order?)
   ↓
/tasks → tasks.md (what are the concrete steps?)
   ↓
/implement → code + tests (build it)
   ↓
/review → verification (does it match the spec?)
   ↓
MERGED & DONE
```

**Key concepts:**
- Each step produces a versioned artifact
- Artifacts flow through agents
- Memory learns from each feature
- Traceability connects code back to requirements (REQ-*, AC-*, TASK-*)

---

## 📂 Folder Structure

```
/
├── README.md ────────────────────── You are here
├── AGENT-SYSTEM-REVIEW.md ───────── Full agent analysis
├── USAGE-GUIDE.md ───────────────── Adoption roadmap
│
├── docs/ ────────────────────────── COMPLETE DOCUMENTATION (21 files)
│   ├── README.md ─────────────────── Doc hub with cross-links
│   ├── agents/ ───────────────────── How all 13 agents work
│   ├── workflows/ ────────────────── Patterns, sequences, decision trees
│   ├── guides/ ───────────────────── Step-by-step tutorials
│   ├── reference/ ────────────────── Quick lookups (commands, terms, FAQ)
│   ├── memory-system/ ────────────── Knowledge persistence explained
│   ├── checklists/ ───────────────── Quality gates
│   └── templates/ ────────────────── Reusable scaffolding
│
├── .github/ ──────────────────────── Config & definitions
│   ├── agents/ ───────────────────── 13 agent definitions (YAML)
│   ├── prompts/ ──────────────────── Agent instructions
│   ├── specs/templates/ ──────────── 11 reusable templates
│   ├── specs/checklists/ ─────────── 2 quality gate checklists
│   └── instructions/ ─────────────── Copilot instructions
│
├── memories/ ─────────────────────── Knowledge storage (3-tier)
│   ├── user/ ─────────────────────── Personal notes (persistent)
│   ├── session/ ──────────────────── Current task context
│   └── repo/ ─────────────────────── Team knowledge
│
├── artifacts/ ────────────────────── Generated feature work
│   └── features/<feature-slug>/
│       ├── spec.md
│       ├── design.md (optional)
│       ├── plan.md
│       ├── tasks.md
│       └── decision-log.md (optional)
│
└── tooling/ ──────────────────────── Dev tools (as needed)
```

---

## ✅ Status & Overview

| Metric                 | Count                            |
| ---------------------- | -------------------------------- |
| **Agents**             | 13 (fully documented & reviewed) |
| **Documentation**      | 21 files (organized by purpose)  |
| **Templates**          | 11 reusable scaffolds            |
| **Quality Checklists** | 2 (ready/done)                   |
| **Reference Q&A**      | 100+ FAQ answers                 |
| **Terms**              | 50+ defined                      |

**Status**: Production Ready | **Version**: 2.0 | **Updated**: April 4, 2026

---

## 🚀 Next Steps

1. **See it in action** → [Getting Started](docs/guides/getting-started.md)
2. **Need a command?** → [All Commands](docs/reference/commands.md)
3. **Have questions?** → [FAQ](docs/reference/faq.md)
4. **Want to understand design?** → [Agent System Review](AGENT-SYSTEM-REVIEW.md)
5. **Ready to adopt?** → [Usage Guide](USAGE-GUIDE.md)

---

## 🔗 Key Files

- [AGENT-SYSTEM-REVIEW.md](AGENT-SYSTEM-REVIEW.md) — Expert analysis of all 13 agents
- [USAGE-GUIDE.md](USAGE-GUIDE.md) — How to adopt and use the kit
- [docs/README.md](docs/README.md) — Main documentation hub
- [docs/guides/getting-started.md](docs/guides/getting-started.md) — First 10 minutes
- [docs/reference/commands.md](docs/reference/commands.md) — All commands
