# Visual Workflow Maps: Agent Command Reference

These flowcharts show how to navigate through feature development using the 13 agents and slash commands.

---

## Quick Navigation

### 🤔 "I don't know what to do?"
→ Start here: **[mode-discovery.md](mode-discovery.md)**

This flowchart helps you choose the right command for your task.

---

## Complete Workflow (Typical Feature Path)

```
1️⃣  /spec          → Define what to build
    ↓
2️⃣  /analyze       → Investigate (optional, if needed)
    ↓
3️⃣  /design        → Design architecture (optional, if complex)
    ↓
4️⃣  /plan          → Plan implementation
    ↓
5️⃣  /tasks         → Break into tasks
    ↓
6️⃣  /implement     → Write code
    ↓
7️⃣  /review        → Verify completion
    ↓
8️⃣  /archive       → Save learnings
```

---

## All 13 Commands at a Glance

### 📋 Specification Workflow

**`/spec`** — Define feature specification
- When: You have a feature idea
- Duration: 45-90 minutes
- Output: `spec.md` with requirements & AC
- Next: `/analyze` or `/design`

**`/analyze`** — Investigate problems & research
- When: Need to investigate first
- Duration: 30 min to 2 hours
- Output: `analysis.md` with findings
- Next: `/spec` or `/plan`

---

### 🎨 Design & Planning Workflow

**`/design`** — Create technical design
- When: Complex feature needs architecture review
- Duration: 1-8 hours
- Output: `design.md` with options & decisions
- Next: `/plan`

**`/plan`** — Plan implementation strategy
- When: Ready to sequence the work
- Duration: 1-2 hours
- Output: `plan.md` with phases & risks
- Next: `/tasks`

**`/tasks`** — Break into trackable tasks
- When: Ready to start execution
- Duration: 1-2 hours
- Output: `tasks.md` (TASK-001...)
- Next: `/implement`

---

### ⚙️ Implementation Workflow

**`/implement`** — Execute implementation
- When: Tasks defined, ready to code
- Duration: 2-4 hours per task
- Output: Code + tests + traceability
- Next: `/review`

**`/review`** — Verify completion against spec
- When: Feature complete, tests passing
- Duration: 30-60 minutes
- Output: Approval or feedback
- Next: `/archive` or fix and `/review` again

**`/requirement-review`** — Technical review of spec
- When: Spec needs approval
- Duration: 15-30 minutes
- Output: Review feedback
- Used: Before or during `/design`

---

### 📚 Foundation & Learning

**`/constitution`** — Define project principles
- When: Project startup (one-time)
- Duration: 15-30 minutes
- Output: `memories/repo/constitution.md`
- Team reference: Project rules & standards

**`/patterns`** — Build patterns library
- When: Project startup (one-time)
- Duration: 15-30 minutes
- Output: `memories/repo/project-knowledge-base.md`
- Team reference: Reusable patterns

**`/archive`** — Save learnings to memory
- When: Feature shipped & merged
- Duration: 15-30 minutes
- Output: Updated `memories/repo/`
- Benefits: Knowledge persists, reused in future features

---

### 🔍 Discovery Workflow

**`/discover`** — Explore existing codebase
- When: Working with existing system
- Duration: 20-30 minutes
- Output: Investigation findings
- Next: `/architecture` → `/archive`

**`/architecture`** — Document system architecture
- When: Need to understand existing design
- Duration: 20-30 minutes
- Output: `memories/repo/architecture-decisions.md`
- Next: `/archive`

---

## Workflow Patterns

### Pattern 1: New Feature (Typical)
```
/spec → /design (if complex) → /plan → /tasks → /implement → /review → /archive
```
**Duration**: 6-8 hours

### Pattern 2: Investigation First
```
/analyze → /spec → /design (if needed) → /plan → /tasks → /implement → /review → /archive
```
**Duration**: 7-10 hours

### Pattern 3: Bug Fix
```
/analyze → /plan → /implement → /review → /archive
```
**Duration**: 2-4 hours

### Pattern 4: Brownfield Exploration
```
/discover → /architecture → /archive → then /spec for features
```
**Duration**: 1 hour setup, then normal patterns

### Pattern 5: Project Setup (First Day)
```
/constitution → /patterns
```
**Duration**: 30 minutes one-time setup

---

## Visual Flowcharts

Each command has a detailed flowchart:

- **[mode-discovery.md](mode-discovery.md)** — Decision tree for choosing commands
- **[workflow-analyze.md](workflow-analyze.md)** — `/analyze` command flow
- **[workflow-design.md](workflow-design.md)** — `/design` command flow
- **[workflow-plan.md](workflow-plan.md)** — `/plan` command flow
- **[workflow-implement.md](workflow-implement.md)** — `/implement` command flow
- **[workflow-reflect.md](workflow-reflect.md)** — `/archive` command flow

---

## Quick Decision Guide

**Starting new project?**
→ Run `/constitution` then `/spec`

**New feature in existing project?**
→ Run `/spec` (agent reads project memory automatically)

**Need to investigate first?**
→ Run `/analyze` then `/spec`

**Complex feature?**
→ Run `/spec` → `/design` → `/plan` → `/tasks`

**Simple feature?**
→ Run `/spec` → `/plan` → `/tasks`

**Exploring existing code?**
→ Run `/discover` → `/architecture` → `/archive`

**Merging to main?**
→ Run `/review` first, then `/archive` after merge

---

## Memory & Knowledge

All commands automatically read from project memory:

- `constitution.md` — Project principles & standards
- `project-knowledge-base.md` — Team patterns
- `legacy-system-watchouts.md` — Known gotchas
- `architecture-decisions.md` — Why it's built this way
- `integration-points.md` — Where features connect

**Agents read these automatically. No manual setup needed.**

---

## Next Steps

1. Read [USAGE-GUIDE.md](../USAGE-GUIDE.md) for detailed workflows
2. Try your first command: `/spec "describe your feature"`
3. Save learnings with `/archive` when done

**Ready?** Start here: `type /spec "Your first feature"`
