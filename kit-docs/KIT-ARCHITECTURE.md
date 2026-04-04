# AI Dev Kit: Knowledge & Memory System

> 👈 **Back to main docs?** See [README.md](../README.md) | **Using the kit?** See [USAGE-GUIDE.md](../USAGE-GUIDE.md)

**Purpose**: Enable AI agents and teams to work effectively on existing projects without losing context between sessions.

**Status**: ✅ Implemented and ready to use

---

## Problem Solved

### Before: Context Loss in Legacy Systems

When working with existing (brownfield) projects:

❌ **Inefficiencies**:
- Agents rediscover the same gotchas repeatedly
- Context is only in chat history → lost after session ends
- Team knowledge scattered (in code, comments, Slack, one person's head)
- Same questions asked by different agents in different sessions
- New team members ramp up slowly (no documented patterns)
- Debugging the same issue multiple times

### After: Institutional Knowledge Preserved

✅ **Solution**: Three-tier memory system with discovery workflow

```
Session 1: Learn gotcha → Promote to repo memory
Session 2: Read repo memory → Gotcha already known → Faster progress
Session 3: Read repo memory → Benefit from all previous discoveries
Result: Knowledge compounds instead of repeating
```

---

## Three-Tier Memory Architecture

### 1. **User Memory** (`/memories/`)
**Scope**: Persistent across all your projects
**Owner**: You
**Lifetime**: Forever
**Your files**:
- `debugging-patterns.md` (techniques that work for you)
- `my-workflow.md` (how you like to use dev kit)
- `tech-stack-preferences.md` (languages, frameworks you use)

---

### 2. **Session Memory** (`/memories/session/`)
**Scope**: Current conversation only
**Owner**: Session
**Lifetime**: This chat only (save if useful)
**Your files**:
- `work-plan.md` (what we're doing this session)
- `investigation-notes.md` (what we learned about the legacy system)
- `blockers.md` (what's preventing progress)

**Use this for**: Temporary notes that don't belong to permanent memory

---

### 3. **Repository Memory** (`/memories/repo/`)
**Scope**: This specific project
**Owner**: Team
**Lifetime**: For the life of the project
**Pre-existing files**:
- `constitution.md` (durable project rules)
- `repo/project-knowledge-base.md` (project patterns)

**New files added**:
- **`legacy-system-watchouts.md`** ← Gotchas in existing code
- **`architecture-decisions.md`** ← Why it's built this way
- **`integration-points.md`** ← Where features connect
- **`README.md`** ← Navigation guide

**Use this for**: Stable, team-shared knowledge that prevents rediscovery

---

## What's Implemented

### ✅ Three New Autonomous Agents

These agents **automatically manage** your memory system with minimal input:

| Agent                      | Purpose                       | Input                                | Output                                     | Autonomy                                                       |
| -------------------------- | ----------------------------- | ------------------------------------ | ------------------------------------------ | -------------------------------------------------------------- |
| **discover-legacy-system** | Explore existing code         | (brief context, e.g., "auth system") | `/memories/session/investigation-notes.md` | 🔥 Fully autonomous: searches code, finds gotchas, no questions |
| **capture-architecture**   | Document design decisions     | (optional context)                   | `/memories/repo/architecture-decisions.md` | 🔥 Fully autonomous: infers from code, generates filled doc     |
| **promote-to-repo-memory** | Move session findings to repo | Session notes exist                  | Updated `/memories/repo/*` files           | 🔥 Fully autonomous: classifies, organizes, promotes            |

### ✅ Memory System Files

**Master index**: `/memories/README.md` — How memory works and how to use it

**Gotchas tracking**: `/memories/repo/legacy-system-watchouts.md` — Template with examples

**Architecture guide**: `/memories/repo/architecture-decisions.md` — Why tech choices were made

**Integration guide**: `/memories/repo/integration-points.md` — Where new features connect

### ✅ Feature Templates

**Legacy integration**: `.github/specs/templates/legacy-context-template.md`

### ✅ Usage Guide

**Complete guide**: `USAGE-GUIDE.md` — How to use entire kit with memory system

---

## How to Use This System

### Quick Start: Your First Brownfield Feature

```
Step 1: Explore existing system (5-10 min, autonomous)
  @discover-legacy-system Explore the auth system
  ↓ Agent autonomously searches code, finds gotchas
  ↓ Outputs: /memories/session/investigation-notes.md

Step 2: Document architecture (5-10 min, autonomous)
  @capture-architecture
  ↓ Agent infers from code structure
  ↓ Outputs: /memories/repo/architecture-decisions.md (filled)

Step 3: Promote findings (2-5 min, autonomous)
  @promote-to-repo-memory
  ↓ Agent auto-classifies: HIGH/MEDIUM confidence
  ↓ Organizes into:
    - /memories/repo/legacy-system-watchouts.md
    - /memories/repo/integration-points.md

Step 4: Now design your feature (informed by memory)
  @spec-requirement.agent.md "Add SSO feature"
  ↓ Agent reads repo memory automatically
  ↓ Spec respects constraints, gotchas, patterns
  ↓ Outputs: artifacts/features/sso/spec.md
```

**Total time**: 15-30 min (vs 3-5 hours manual exploration)

---

## How Agents Use Memory

**Every agent that designs or implements reads**:
- `/memories/repo/legacy-system-watchouts.md` → "What gotchas affect us?"
- `/memories/repo/integration-points.md` → "Where do we connect?"
- `/memories/repo/architecture-decisions.md` → "Why this design?"
- `/memories/repo/project-knowledge-base.md` → "What patterns to follow?"

**Result**: Specifications and implementations that respect real project constraints, not guesses.

---

## File Organization

### Where Everything Lives

```
project-root/
├── memories/
│   ├── README.md ← START HERE (navigation)
│   ├── constitution.md (project rules)
│   ├── project-knowledge-base.md (project patterns)
│   ├── legacy-system-watchouts.md  (gotchas)
│   ├── architecture-decisions.md  (design)
│   └── integration-points.md  (where features go)
│
├── .github/agents/
│   ├── discover-legacy-system.agent.md
│   ├── capture-architecture.agent.md
│   ├── promote-to-repo-memory.agent.md
│   └── (existing agents)
│
├── .github/specs/templates/
│   ├── legacy-context-template.md
│   └── (existing templates)
│
├── artifacts/
│   ├── features/
│   │   └── <feature-name>/
│   │       ├── spec.md
│   │       ├── plan.md
│   │       ├── tasks.md
│   │       └── legacy-context.md  (integration doc)
│   └── knowledge/
│       └── (exploratory findings)
│
└── USAGE-GUIDE.md ← How to use entire kit
```

---

## Next Steps

1. **Read**: `/memories/README.md` (navigation guide)
2. **Start**: With `discover-legacy-system.agent.md` or `spec-requirement.agent.md`
3. **View**: [USAGE-GUIDE.md](USAGE-GUIDE.md) for complete workflow guide

---

## Quick Links

- [Memory System Guide](memories/README.md) — Detailed memory system explanation
- [Usage Guide](USAGE-GUIDE.md) — Complete kit usage with memory system
- [Discover Legacy System](/.github/agents/discover-legacy-system.agent.md) — Explore existing code
- [Capture Architecture](/.github/agents/capture-architecture.agent.md) — Document design
- [Promote to Memory](/.github/agents/promote-to-repo-memory.agent.md) — Save findings
