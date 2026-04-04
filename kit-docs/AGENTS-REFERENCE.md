# AI Dev Kit: Complete Agent Reference

**Comprehensive guide to all 12 agents in the kit.**

For quick overviews, see [README.md](../README.md) or [USAGE-GUIDE.md](../USAGE-GUIDE.md).

---

## Agent Categories

1. **Project Setup Agents** (2) — Define project standards
2. **Feature Workflow Agents** (7) — Build features incrementally
3. **Autonomous Discovery Agents** (3) — Explore legacy systems

Total: 12 agents covering all workflows

---

## Project Setup Agents

### 1. Constitution Agent

**Purpose**: Define project rules and standards (created once, rarely changed)

**When to use**: Project initialization (Day 1)

**Input**: Your project's technical requirements

**Output**: `memories/repo/constitution.md`

**What it creates**:
- Code style requirements
- Technology stack (locked-in decisions)
- Testing minimums
- Deployment standards
- Security requirements
- Performance requirements

**How to run**:
```
@constitution
(Answer structured questions)
```

**Success criteria**:
- ✅ Project rules documented
- ✅ Non-negotiables explicit
- ✅ All developers reference the same document

---

### 2. Project Knowledge Base Agent

**Purpose**: Document team patterns and conventions (grows over time)

**When to use**: After first sprint (1-2 weeks into project)

**Input**: Patterns your team has proven work

**Output**: `memories/repo/project-knowledge-base.md`

**What it creates**:
- Naming conventions (files, functions, variables, classes)
- API design patterns
- Error handling approach
- Configuration patterns
- Testing patterns
- Common anti-patterns to avoid

**How to run**:
```
@project-knowledge-base
(Share patterns you want to standardize)
```

**Success criteria**:
- ✅ Team patterns documented
- ✅ New developers reference patterns
- ✅ Consistency increases across codebase

---

## Feature Workflow Agents

### 3. Spec Requirement Agent

**Purpose**: Transform a feature request into formal specification

**When to use**: Start of every feature

**Input**: Feature idea, problem statement, requirements

**Output**: `artifacts/features/<slug>/spec.md`

**What it reads first** (if brownfield):
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `memories/repo/legacy-system-watchouts.md` (if exists)
- `memories/repo/integration-points.md` (if exists)

**What it creates**:
- Problem statement
- Business value
- Functional requirements (REQ-FN-*)
- Non-functional requirements (REQ-NF-*)
- Acceptance criteria (AC-*)
- Risks and assumptions
- Open questions
- Out-of-scope items

**How to run**:
```
@spec-requirement "Add two-factor authentication"
```

**Success criteria**:
- ✅ All requirements explicit
- ✅ No ambiguity
- ✅ Acceptance criteria testable
- ✅ Ready for design/planning

---

### 4. Spec Review Requirements Agent

**Purpose**: Validate specification quality before proceeding

**When to use**: After `spec-requirement` agent completes

**Input**: Feature specification

**Output**: Approval or feedback

**Validates**:
- All requirements clear and testable
- Acceptance criteria specific
- Risks identified
- Assumptions documented
- Out-of-scope marked
- Traceability complete

**How to run**:
```
@spec-review-requirements <feature-slug>
```

**Success criteria**:
- ✅ Reviewer approves spec, OR
- ✅ Specific feedback provided for revision

---

### 5. Spec Design Agent

**Purpose**: Create technical design for complex features

**When to use**: Complex features OR features affecting architecture

**Input**: Feature specification

**Output**: `artifacts/features/<slug>/design.md`

**What it reads first**:
- `spec.md`
- `memories/repo/architecture-decisions.md` (if exists)
- `memories/repo/project-knowledge-base.md` (if exists)

**What it creates**:
- Architecture diagram
- Component interactions
- Data model changes
- API contracts
- Error handling strategy
- Performance considerations
- Security considerations
- Integration points

**How to run**:
```
@spec-design <feature-slug>
```

**Success criteria**:
- ✅ Design is concrete and implementable
- ✅ Traceability to spec maintained
- ✅ Integration points explicit

---

### 6. Spec Plan Agent

**Purpose**: Create implementation plan from spec + design

**When to use**: After spec approved (design optional)

**Input**: `spec.md` and optional `design.md`

**Output**: `artifacts/features/<slug>/plan.md`

**Prerequisites**:
- `spec.md` must exist
- If complex, `design.md` should exist
- `spec-review-requirements` should approve

**What it reads first**:
- `spec.md`
- `design.md` (if exists)
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `memories/repo/legacy-system-watchouts.md` (if exists)

**What it creates**:
- Implementation phases (Phase 1, 2, 3...)
- Affected files and modules
- External dependencies
- Data migrations (if applicable)
- Validation strategy
- Rollout plan
- Rollback plan
- Risk mitigation

**How to run**:
```
@spec-plan <feature-slug>
```

**Success criteria**:
- ✅ Phases are logical and ordered
- ✅ Dependencies explicit
- ✅ Validation strategy clear
- ✅ Ready for task breakdown

---

### 7. Spec Tasks Agent

**Purpose**: Decompose plan into small, executable tasks

**When to use**: After plan is approved

**Input**: `spec.md` and `plan.md`

**Output**: `artifacts/features/<slug>/tasks.md`

**Prerequisites**:
- `spec.md` must exist
- `plan.md` must exist

**What it reads first**:
- `spec.md`
- `plan.md`
- `design.md` (if exists)
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

**What it creates**:
- Ordered task list (TASK-001, TASK-002...)
- Task dependencies marked
- Acceptance criteria per task
- Estimated effort (hours)
- Traceability (TASK linked to AC)
- Task status fields (Not Started → In Progress → Done)

**Task sizing**:
- Each task: 2-8 hours
- Clear completion criteria
- Parallelizable where possible

**How to run**:
```
@spec-tasks <feature-slug>
```

**Success criteria**:
- ✅ Tasks are small and focused
- ✅ Dependencies explicit
- ✅ Total work roughly matches plan estimate
- ✅ Ready for implementation

---

### 8. Spec Implement Agent

**Purpose**: Write code, tests, and maintain traceability

**When to use**: During implementation (after tasks.md exists)

**Input**: `tasks.md` and source code directory

**Output**: Code + tests + updated `tasks.md`

**Prerequisites**:
- `tasks.md` must exist

**What it reads first**:
- `spec.md`
- `design.md` (if exists)
- `plan.md`
- `tasks.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `memories/repo/legacy-system-watchouts.md` (if exists)

**Implementation approach**:
1. Mark task "In Progress" in `tasks.md`
2. Implement task (code + tests)
3. Validate acceptance criteria
4. Mark task "Done"
5. Move to next task
6. Update `decision-log.md` if decisions change

**Traceability requirements**:
- Every line of code relates to acceptance criteria
- Tests named after AC-* they verify
- Commits reference TASK-* and AC-*
- Comments cite acceptance criteria

**How to run**:
```
@spec-implement <feature-slug>
(Agent reads tasks.md, continues from last position)
```

**Works best when**:
- One session implementation 1-2 tasks
- Tasks immediately marked done/blocked
- Blockers documented
- Tests run and pass before marking done

**Success criteria**:
- ✅ All tasks marked Done
- ✅ All tests passing
- ✅ Code review ready
- ✅ Traceability maintained

---

### 9. Spec Review Agent

**Purpose**: Final quality gate before merge

**When to use**: After implementation complete

**Input**: Implementation + all artifacts

**Output**: Pass/Fail + recommendations

**Checks**:
- All REQ-* addressed in code
- All AC-* have tests
- Tests passing
- Traceability complete
- No scope creep
- Constitution rules followed
- Knowledge base patterns used
- Gotchas handled

**How to run**:
```
@spec-review <feature-slug>
```

**Success criteria**:
- ✅ Review approves implementation, OR
- ✅ Reviewer identifies specific issues to fix
- ✅ Action items explicit

---

## Autonomous Discovery Agents

**Key trait**: 🔥 **Fully autonomous** — Explore/generate without user questions

### 10. Discover Legacy System Agent

**Purpose**: Autonomously explore existing codebase

**When to use**: First time working with legacy/existing system

**Input**: Brief context (e.g., "auth system", "payment module")

**Output**: `/memories/session/investigation-notes.md`

**What it does** (fully autonomous, no questions asked):

1. **Architecture Discovery**
   - Entry points (main files, server startup)
   - Core modules mapped
   - Data flow traced
   - External systems identified
   - Directory structure analyzed

2. **Gotcha Finding** (the key value)
   - Identifies 5-10 surprising patterns
   - Each with: name, description, file paths, code evidence, impact, solution
   - Confidence levels (HIGH/MEDIUM/LOW)
   - Specific files referenced

3. **Pattern Extraction**
   - Error handling pattern
   - Configuration approach
   - Async handling (callbacks vs promises vs async/await)
   - Testing approach
   - Module structure

4. **Integration Point Mapping**
   - Where do new features typically connect?
   - What files get modified?
   - What contracts/interfaces to respect?
   - Effort estimate for integrations

**How to run**:
```
@discover-legacy-system "auth system"
or
@discover-legacy-system "entire backend"
```

**What happens**:
- Agent searches codebase with semantic_search
- Reads routing, middleware, models, services, tests
- Analyzes patterns and surprising behavior
- **Generates populated investigation-notes.md** (no user interaction needed)

**Success criteria**:
- ✅ 5+ concrete gotchas with file paths
- ✅ Architecture map with entry points
- ✅ Integration points identified
- ✅ Code evidence provided
- ✅ Confidence levels clear

**Output includes**:
```markdown
# Investigation Notes

## Architecture Map
- Entry point: [files]
- Core modules: [list with paths]
- Data flow: [description]
- External systems: [list]

## Found Patterns
- Error handling: [description]
- Configuration: [description]
- Async approach: [description]
- Testing: [description]

## Gotchas (≥5)
### Gotcha 1: [Name]
- What: [specific behavior]
- Files: [paths]
- Impact: [consequences]
- Solution: [workaround]
- Confidence: HIGH/MEDIUM

### Gotcha 2: ...

## Integration Points
- For auth features: [files changed, effort]
- For API features: [files changed, effort]
- ...
```

---

### 11. Capture Architecture Agent

**Purpose**: Autonomously document design decisions

**When to use**: After `discover-legacy-system` completes

**Input**: Codebase (agent analyzes autonomously)

**Output**: `/memories/repo/architecture-decisions.md`

**What it does** (fully autonomous):

1. **Technology Stack Analysis**
   - Framework (Express, Rails, Django...)
   - Database (PostgreSQL, MongoDB...)
   - Message queue (Redis, RabbitMQ...)
   - Authentication (JWT, OAuth, sessions...)
   - Caching layer (Redis, Memcached...)
   - Deployment (Docker, Kubernetes, serverless...)

2. **Design Pattern Identification**
   - MVC, MVVM, event-driven, microservices...
   - Module organization
   - Dependency injection pattern
   - Request/response flow

3. **Trade-Off Documentation**
   - Why this tech? (benefits)
   - Why not alternatives? (trade-offs)
   - What constraints exist?
   - What assumptions were made?

4. **Scaling Assumptions**
   - Current expected scale
   - Scaling points identified
   - Bottlenecks
   - Performance targets

**How to run**:
```
@capture-architecture
(Agent analyzes code autonomously, minimal input)
```

**What happens**:
- Agent reads package.json, docker-compose.yml, requirements.txt, Dockerfile
- Analyzes source code structure
- **Generates filled architecture-decisions.md** (8-10 decisions)

**Success criteria**:
- ✅ Technology stack documented with trade-offs
- ✅ Design patterns identified
- ✅ Scaling assumptions explicit
- ✅ Decision rationale clear

**Output format**:
```markdown
# Architecture Decisions

## 1. Framework: Express.js
**Why**: Lightweight, JavaScript/Node.js ecosystem
**Alternatives**: Fastify (faster), Hapi (more structure)
**Trade-off**: Simplicity vs structure
**Constraint**: Requires Node.js expertise
**Date**: [inferred]

## 2. Database: PostgreSQL
**Why**: ACID compliance, relational model
**Alternatives**: MongoDB (schema-free), MySQL (simpler)
**Trade-off**: Features vs operational complexity
## ...
```

---

### 12. Promote to Repository Memory Agent

**Purpose**: Autonomously organize session findings into team memory

**When to use**: After `discover-legacy-system` and `capture-architecture` complete

**Input**: `/memories/session/investigation-notes.md`

**Output**: Updated `/memories/repo/*` files

**Prerequisites**:
- `investigation-notes.md` must exist

**What it does** (fully autonomous):

1. **Classification Phase**
   - Each finding: HIGH → promote, MEDIUM → flag for review, LOW → archive
   - Removes duplicates
   - Preserves confidence levels

2. **Promotion Phase**
   - HIGH-confidence gotchas → `legacy-system-watchouts.md`
   - Integration findings → `integration-points.md`
   - Architecture insights → `architecture-decisions.md`
   - Patterns → `project-knowledge-base.md`

3. **Organization Phase**
   - Groups by component/module
   - Maintains traceability (discovery source noted)
   - Flags MEDIUM findings for team review
   - Merges with existing knowledge (no duplicates)

**How to run**:
```
@promote-to-repo-memory
(Agent reads session notes automatically)
```

**What happens**:
- Agent reads `/memories/session/investigation-notes.md`
- Classifies by confidence and durability
- **Automatically updates** repo memory files
- Removes session notes marked as archived

**Success criteria**:
- ✅ Session findings processed autonomously
- ✅ HIGH-confidence promoted
- ✅ MEDIUM-confidence flagged & visible
- ✅ No duplicates or loss of confidence info
- ✅ Organized by target file

**Effects**:
```markdown
# legacy-system-watchouts.md changes:

## ✅ STABLE GOTCHAS (from discovery)
[HIGH-confidence items added]

## ⚠️ NEEDS VERIFICATION (from discovery)
[MEDIUM-confidence items flagged]

## END-OF-SESSION ADDITIONS
- Date: [discovery session date]
- Source: discover-legacy-system agent
- Findings: [count]
```

---

## Quick Decision Tree

**Which agent should I run?**

```
START
  │
  ├─ Never used this kit before?
  │  └─ New project? → constitution, project-knowledge-base
  │  └─ Existing project? → discover-legacy-system
  │
  ├─ Starting a feature?
  │  └─ spec-requirement
  │
  ├─ Already have spec?
  │  ├─ Simple feature? → spec-plan
  │  └─ Complex feature? → spec-design → spec-plan
  │
  ├─ Have plan?
  │  └─ spec-tasks
  │
  ├─ Have tasks?
  │  └─ spec-implement
  │
  ├─ Code done?
  │  └─ spec-review
  │
  ├─ Exploring new part of codebase?
  │  └─ discover-legacy-system (for that subsystem)
  │
  └─ Got findings from discovery?
     └─ promote-to-repo-memory (organize into team memory)
```

---

## Agent Relationships

```
SETUP PHASE (one-time)
  └─ constitution
  └─ project-knowledge-base

LEGACY DISCOVERY (one-time)
  └─ discover-legacy-system
  └─ capture-architecture
  └─ promote-to-repo-memory
     (all memory populated)

PER-FEATURE PHASE (repeats every feature)
  └─ spec-requirement
     (reads: constitution, project-knowledge-base, legacy-system-watchouts, integration-points)
  └─ spec-review-requirements
  └─ spec-design (if needed)
  └─ spec-plan
  └─ spec-tasks
  └─ spec-implement
     (reads: all above + architecture-decisions)
     (updates: tasks.md continuously)
     (may: add to session/investigation-notes.md if new findings)
  └─ spec-review

POST-SESSION (optional)
  └─ If new findings during feature work
  └─ promote-to-repo-memory (organize new findings)
```

---

## Common Patterns

### Pattern: Full Greenfield Feature

1. `@spec-requirement` → Create spec
2. `@spec-review-requirements` → Approve
3. `@spec-design` → Design (if complex)
4. `@spec-plan` → Create plan
5. `@spec-tasks` → Break tasks
6. `@spec-implement` → Code
7. `@spec-review` → Quality gate

**Time**: 6-8 hours per feature

### Pattern: Discover Legacy System

1. `@discover-legacy-system "auth system"`
2. `@capture-architecture`
3. `@promote-to-repo-memory`

**Time**: ~30 minutes (fully autonomous)

### Pattern: Resume Feature Work

1. Check `artifacts/features/<slug>/` for status
2. Read `memories/repo/*` files for context
3. Run appropriate next agent

### Pattern: New Subsystem in Legacy Codebase

1. `@discover-legacy-system "payment module"`
2. `@promote-to-repo-memory` (add to existing memory)
3. Continue with feature work

---

## Troubleshooting

### "Agent said 'file not found'"

**Most common causes**:
- Feature slug doesn't match folder name
- Running agent in wrong project root
- File path case sensitivity issue

**Fix**: Check `artifacts/features/` exists and has expected folder

### "Spec is incomplete but agent won't comment"

**Issue**: Spec gaps make planning impossible

**Fix**: Go back to `spec-requirement`, clarify with agent, re-run `spec-review-requirements`

### "Design conflicts with existing code"

**Issue**: `spec-design` doesn't reflect existing patterns

**Fix**:
1. Read `memories/repo/architecture-decisions.md`
2. Read `memories/repo/legacy-system-watchouts.md`
3. Re-run `spec-design` with additional context

### "Implementation blocked by gotcha"

**Issue**: Discovered new gotcha during coding

**Fix**:
1. Document in `/memories/session/` investigation notes
2. Update `tasks.md` with blocker
3. At end of session, run `promote-to-repo-memory`
4. Next developer benefits from this knowledge

---

## Next Steps

- **New project?** Start with [constitution](#1-constitution-agent) and [project-knowledge-base](#2-project-knowledge-base-agent)
- **Existing project?** Start with [discover-legacy-system](#10-discover-legacy-system-agent)
- **Feature work?** Start with [spec-requirement](#3-spec-requirement-agent)
- **Details?** See [USAGE-GUIDE.md](../USAGE-GUIDE.md)
