# AI Development Kit Documentation

**Complete guide to the 13-agent system for building software with AI.**

This documentation covers:
- How the kit works
- The 13 agents and when to use them
- Workflows for different scenarios
- Memory system architecture
- Templates and checklists
- Step-by-step guides

---

## Start Here

- **[Quick Introduction](#quick-introduction)** — What is this?
- **[Common Workflows](#common-workflows)** — What to do right now
- **[5-Minute Primer](#5-minute-primer)** — Core concepts

### Quick Introduction

The AI Development Kit is a **federated system of 13 AI agents** that manage software development from specification through implementation to production. It includes:

- **13 Specialized Agents** — Each handles one phase of development
- **11 Reusable Templates** — Prompts and patterns for common tasks
- **3-Tier Memory System** — Captures learnings across conversations
- **Integrated Workflows** — Sequences agents in the right order

### Common Workflows

#### Building a New Feature
```
1. /spec              → Create feature specification
2. /plan              → Create delivery plan
3. /tasks             → Break into implementation tasks
4. /implement         → Write code
5. /review            → Quality gate
6. /archive           → Save learnings
```

#### Understanding Existing Code
```
1. /discover          → Explore codebase structure
2. /architecture      → Document system design
3. /archive           → Save discoveries
```

#### Setting Up a New Project
```
1. /constitution      → Define project rules
2. /patterns          → Document team patterns
3. Then follow: Feature workflow (above)
```

### 5-Minute Primer

**The 13 Agents:**

| Category           | Agents                                           | Purpose                            |
| ------------------ | ------------------------------------------------ | ---------------------------------- |
| **Planning**       | spec, plan, tasks, design                        | Turn ideas into executable plans   |
| **Implementation** | implement, review                                | Build code with verification       |
| **Discovery**      | discover, architecture, analyze                  | Learn about systems                |
| **Foundation**     | constitution, patterns, project-knowledge-base   | Set project parameters             |
| **Quality**        | spec-review-requirements, promote-to-repo-memory | Ensure quality & capture learnings |

---

## Documentation Structure

### 📋 [Agents](agents/)
Complete reference for all 13 agents:
- [Agent Overview](agents/README.md) — All agents at a glance
- [Agent Details](agents/details/) — Deep dive into each agent
- [Agent Command Reference](agents/AGENTS-REFERENCE.md) — How to invoke

### 🔄 [Workflows](workflows/)
How to use agents in practice:
- [Workflow Guide](workflows/README.md) — Common patterns
- [Greenfield Setup](workflows/greenfield.md) — New projects
- [Brownfield Setup](workflows/brownfield.md) — Existing projects
- [Common Scenarios](workflows/scenarios.md) — Real-world patterns

### 📖 [Guides](guides/)
Step-by-step tutorials:
- [Getting Started](guides/getting-started.md) — First 10 minutes
- [Feature Development](guides/feature-development.md) — Complete workflow
- [Team Onboarding](guides/team-onboarding.md) — Teaching team members
- [Troubleshooting](guides/troubleshooting.md) — Common problems

### 📚 [Reference](reference/)
Quick lookup materials:
- [Commands Reference](reference/commands.md) — All 13 commands
- [Terminology](reference/terminology.md) — Key terms
- [FAQ](reference/faq.md) — Answers to common questions
- [File Structure](reference/file-structure.md) — Where things go

### 🧠 [Memory System](memory-system/)
How knowledge persists:
- [Overview](memory-system/README.md) — System architecture
- [User Memory](memory-system/user-memory.md) — Personal preferences
- [Session Memory](memory-system/session-memory.md) — Task context
- [Repo Memory](memory-system/repo-memory.md) — Team knowledge

### ✅ [Checklists](checklists/)
Quality gates:
- [Definition of Ready](checklists/definition-of-ready.md) — Before starting
- [Definition of Done](checklists/definition-of-done.md) — After finishing

### 🎯 [Templates](templates/)
Reusable scaffolding:
- [Template Guide](templates/README.md) — Available templates
- [Template Index](templates/index.md) — All 11 templates

---

## Choose Your Path

**Are you...**

- **New to the kit?**
  Start with [Getting Started Guide](guides/getting-started.md)

- **Starting a new project?**
  Follow [Greenfield Workflow](workflows/greenfield.md)

- **Working in existing code?**
  Follow [Brownfield Workflow](workflows/brownfield.md)

- **Joining a team?**
  Read [Team Onboarding Guide](guides/team-onboarding.md)

- **Looking for a specific agent?**
  Check [Agents Details](agents/details/)

- **Need to troubleshoot?**
  See [Troubleshooting Guide](guides/troubleshooting.md)

- **Have a question?**
  Check [FAQ](reference/faq.md)

---

## Key Concepts

### The 13 Agents

1. **spec** — Write feature specifications
2. **plan** — Create delivery plans
3. **tasks** — Break features into implementation tasks
4. **design** — Create technical designs
5. **implement** — Write code and tests
6. **review** — Verify implementation quality
7. **analyze** — Investigate problems and research
8. **discover** — Explore existing codebases
9. **architecture** — Document system design
10. **constitution** — Define project rules
11. **patterns** — Document team patterns
12. **project-knowledge-base** — Manage project memory
13. **promote-to-repo-memory** — Archive learnings

### The Memory System

Three tiers of persistent memory:

- **User Memory** (`/memories/`) — Survives across all workspaces
- **Session Memory** (`/memories/session/`) — Scoped to current conversation
- **Repo Memory** (`/memories/repo/`) — Scoped to this project

### Artifacts Structure

Features are tracked in `artifacts/features/<slug>/`:
- `spec.md` — Feature specification
- `design.md` — Technical design (if applicable)
- `plan.md` — Delivery plan
- `tasks.md` — Implementation tasks
- `implementation/` — Code artifacts
- `tests/` — Test artifacts

---

## Getting Help

- **Quick answers:** Check [FAQ](reference/faq.md)
- **Specific agent help:** See [Agents Details](agents/details/)
- **Stuck on workflow:** Read [Common Scenarios](workflows/scenarios.md)
- **Technical questions:** Check [Reference](reference/)
- **Learn team patterns:** Check `memories/repo/`

---

**Version:** 1.0
**Last Updated:** April 4, 2026
**Status:** Production Ready
