# AI Dev Kit - Project Structure

> 👈 **Back to main docs?** See [README.md](../README.md) | **Using the kit?** See [USAGE-GUIDE.md](../USAGE-GUIDE.md)

## Overview

This is a **reusable AI dev kit template** designed for multiple projects. It combines:
- **Agent guides** (how to work)
- **Spec templates** (what to create)
- **Memory system** (what to remember)

---

## Folder Structure Explained

### `.github/agents/` - Agent Guides (Reusable)

**Purpose**: Instructions for how to use agents at each workflow step

**Who owns it**: Kit maintainers (you)
**When to change**: When you improve the workflow
**Should be the same across**: All projects using the kit

**Agents include**:
- `spec-requirement.agent.md` - Turn request into spec
- `spec-design.agent.md` - Design the solution
- `spec-plan.agent.md` - Break into execution plan
- `spec-implement.agent.md` - Build the feature
- `spec-review.agent.md` - Review implementation
- `discover-legacy-system.agent.md` - 🔥 Autonomously explore existing code, find gotchas
- `capture-architecture.agent.md` - 🔥 Autonomously infer design from code
- `promote-to-repo-memory.agent.md` - 🔥 Autonomously promote findings to team knowledge

### `.github/specs/templates/` - Reusable Templates

**Purpose**: Markdown templates for common artifacts

**Who owns it**: Kit maintainers (you)
**When to change**: When you add new template types
**Should be the same across**: All projects using the kit

**Template types**:
- **Workflow**: `spec-template.md`, `plan-template.md`, `tasks-template.md`
- **Design**: `design-template.md`
- **Reviews**: `requirements-review-template.md`
- **Knowledge**: `constitution-template.md`, `project-knowledge-base-template.md`
- **Legacy systems**: `legacy-context-template.md`, `legacy-system-watchouts-template.md`, `architecture-decisions-template.md`, `integration-points-template.md`

### `memories/` - Project-Specific Memory

**Purpose**: Team's institutional knowledge for this project

**Who owns it**: Project team
**When to change**: Continuously as you learn
**Should be different for**: Each project

**Key files** (use templates from `.github/specs/templates/`):

| File                         | Purpose                       | When to start                      | Who fills it                 |
| ---------------------------- | ----------------------------- | ---------------------------------- | ---------------------------- |
| `repo/constitution.md`            | Project rules & standards     | Day 1                              | Tech lead or senior engineer |
| `repo/project-knowledge-base.md`  | Proven patterns & conventions | First sprint                       | Team lead                    |
| `repo/architecture-decisions.md`  | Why system is built this way  | During discovery                   | Architects, senior devs      |
| `repo/legacy-system-watchouts.md` | Gotchas in existing code      | During discovery of legacy systems | Whoever discovers them       |
| `repo/integration-points.md`      | Where features connect        | As team learns codebase            | Whoever works on features    |

### `artifacts/` - Project Artifacts (Evolving)

**Purpose**: Specs, plans, tasks, and knowledge docs created during project

**Structure**:
```
artifacts/
├── features/
│   ├── AUTH-001-user-signup.md (spec)
│   ├── AUTH-001-plan.md (plan)
│   ├── AUTH-001-tasks.md (tasks)
│   └── ...
└── knowledge/
    ├── discovery-2024-04-01.md (exploration notes)
    ├── architecture-v1.md (design doc)
    └── ...
```

### Root Documentation (Kit-Level)

| File                  | Purpose                      | For whom                          |
| --------------------- | ---------------------------- | --------------------------------- |
| `README.md`           | Kit overview & quick start   | New teams starting with kit       |
| `USAGE-GUIDE.md`      | How to use the kit workflows | Teams using the kit               |
| `KNOWLEDGE-SYSTEM.md` | Why memory system exists     | Kit designers, future maintainers |

---

## Project vs Kit Files - Key Distinction

### Kit Files (`.github/*`, root docs)

**Stay the same across projects** because they're about HOW to work:
- Agent guides (same workflow)
- Templates (same structure)
- Documentation (same guidance)

**When to update them**:
- You discover better workflow
- You add new spec type
- You improve agent guidance

**All projects should get the same versions** (ideally via version control)

### Project Files (`memories/*`, `artifacts/`)

**Vary per project** because they're about YOUR project:
- Constitution (your rules)
- Knowledge base (your patterns)
- Gotchas, architecture decisions, integration points (your discoveries)
- Specs, plans, tasks (your features)

**When to update them**:
- You discover a gotcha
- You make an architecture decision
- You complete a feature

**Each project fills these independently**

---

## Template vs Instance - How It Works

### Example: Legacy System Gotchas

**Template** (in kit):
```
.github/specs/templates/legacy-system-watchouts-template.md
├── Purpose statement
├── How-to section
├── Blank structure ready to fill
└── No examples (project-agnostic)
```

**Instance** (in project):
```
memories/repo/legacy-system-watchouts.md
├── Points to template
├── Filled with PROJECT's gotchas
├── Created during discovery phase
└── Updated as new gotchas found
```

**Workflow**:
1. Kit provides blank template
2. Project team discovers gotchas
3. Team fills `memories/repo/legacy-system-watchouts.md` using that template
4. Gotchas become shared team knowledge

---

## Setup Flow for New Projects

### Step 1: Copy Kit
```bash
git clone <this-kit>
cd my-project
```

### Step 2: Customize Project Memory

Fill these **once at project start**:
- `memories/repo/constitution.md` (project rules)
- `memories/repo/project-knowledge-base.md` (emerging patterns)

### Step 3: Discover Legacy System (if applicable)

Agents autonomously explore and document the system. No questions asked—just provide context and receive findings.

```bash
# Day 1: Autonomously explore (15-30 min)
→ Use: discover-legacy-system.agent.md
→ Agent: Searches code, identifies gotchas, maps architecture
→ Output: session notes (8+ findings with file references)

# Then: Autonomously document (5-10 min)
→ Use: capture-architecture.agent.md
→ Agent: Infers from code structure, generates design decisions
→ Output: architecture-decisions.md (filled with 8+ decisions)

# Then: Autonomously promote (5-10 min)
→ Use: promote-to-repo-memory.agent.md
→ Agent: Classifies findings by confidence, organizes into files
→ Fills: memories/repo/legacy-system-watchouts.md (HIGH confidence findings)
→ Fills: memories/repo/architecture-decisions.md (architectural insights)
→ Fills: memories/repo/integration-points.md (feature connection points)

Total discovery time: ~30 min (vs 3-5 hours manual exploration)
```

### Step 4: Start Feature Work

```bash
# Next: Use spec workflow
→ Use: spec-requirement.agent.md
→ Create: artifacts/features/XXX-001-feature.md
→ Continue through pipeline...
```

---

## Autonomous Discovery Workflow

The three memory agents work together autonomously—no user interaction needed beyond initial context:

**Input**: "Map authentication system" or "Explore payment module"

**Autonomous Phase 1** (5-10 minutes):
```
discover-legacy-system agent:
  → Reads entire codebase with semantic_search
  → Identifies gotchas (HIGH/MEDIUM/LOW confidence)
  → Maps architecture (entry points, data flow)
  → Documents integration points with specific file paths
Output: /memories/session/investigation-notes.md (fully populated)
```

**Autonomous Phase 2** (5-10 minutes):
```
capture-architecture agent:
  → Analyzes package.json, docker-compose.yml, source code
  → Infers technology stack and design patterns
  → Documents architecture decisions with trade-offs
  → Identifies scaling assumptions and constraints
Output: /memories/repo/architecture-decisions.md (fully populated with 8+ decisions)
```

**Autonomous Phase 3** (5-10 minutes):
```
promote-to-repo-memory agent:
  → Reads session notes from Phase 1
  → Auto-classifies findings: HIGH → promote, MEDIUM → flag, LOW → archive
  → Organizes across team knowledge files
Output:
  - /memories/repo/legacy-system-watchouts.md (updated with HIGH-confidence gotchas)
  - /memories/repo/integration-points.md (updated with integration knowledge)
  - /memories/repo/architecture-decisions.md (enhanced with additional context)
```

**Total Time**: ~30 minutes for complete system discovery
**(vs 3-5 hours manual exploration)**

---

## File Lifespan

### Kit Files (Forever)

These don't change much:
- `.github/agents/*.md` - Only update if workflow improves
- `.github/specs/templates/*.md` - Only update if adding new template type
- Root docs - Update for tool changes or new sections

### Project Memory (Project Lifetime)

These grow continuously:
- `memories/repo/constitution.md` - Set at start, rarely changes
- `memories/repo/project-knowledge-base.md` - Grows with project
- `memories/repo/legacy-system-watchouts.md` - Added during discovery
- `memories/repo/architecture-decisions.md` - Added during discovery
- `memories/repo/integration-points.md` - Added during discovery

### Project Artifacts (Per-Feature Lifetime)

These are created and archived:
- `artifacts/features/*.md` - Created for each feature, archived when done
- `artifacts/knowledge/*.md` - Created during explorations, referenced from memory

---


## For Kit Users

When you copy this kit to your project:

1. **Don't change** `.github/` folder (that's kit infrastructure)
2. **Do customize** `memories/` folder (that's your project)
3. **Do create** `artifacts/` folder contents (that's your work)
4. **Reference** templates from `.github/specs/templates/` when creating artifacts

The kit stays the same, your project knowledge grows in `memories/`.
