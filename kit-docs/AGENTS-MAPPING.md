# Agents & Templates Mapping

**How 12 agents use 11 templates to guide software development.**

See full agent details: [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)

---

## Agent → Template Mapping

| Agent                      | Primary Template                                                        | Secondary Templates                      | Artifact Folder                  |
| -------------------------- | ----------------------------------------------------------------------- | ---------------------------------------- | -------------------------------- |
| `constitution`             | `constitution-template.md`                                              | —                                        | `memories/`                      |
| `project-knowledge-base`   | `project-knowledge-base-template.md`                                    | —                                        | `memories/`                      |
| `spec-requirement`         | `spec-template.md`                                                      | —                                        | `artifacts/features/<slug>/`     |
| `spec-review-requirements` | `requirements-review-template.md`                                       | `spec-template.md` (ref)                 | —                                |
| `spec-design`              | `design-template.md`                                                    | `spec-template.md` (ref)                 | `artifacts/features/<slug>/`     |
| `spec-plan`                | `plan-template.md`                                                      | `spec-template.md`, `design-template.md` | `artifacts/features/<slug>/`     |
| `spec-tasks`               | `tasks-template.md`                                                     | `spec-template.md`, `plan-template.md`   | `artifacts/features/<slug>/`     |
| `spec-implement`           | `tasks-template.md`                                                     | —                                        | (source code)                    |
| `spec-review`              | `requirements-review-template.md`                                       | All templates (ref)                      | —                                |
| `discover-legacy-system`   | `legacy-context-template.md`                                            | —                                        | `artifacts/knowledge/` (session) |
| `capture-architecture`     | `architecture-decisions-template.md`                                    | —                                        | `memories/repo/`                 |
| `promote-to-repo-memory`   | `legacy-system-watchouts-template.md`, `integration-points-template.md` | —                                        | `memories/repo/`                 |

---

## Workflow Templates (Feature Development)

### 1. Feature Specification

**File**: `spec-template.md`
**Agent**: `spec-requirement`
**Output**: `artifacts/features/<slug>/spec.md`

**Sections**:
- Problem statement
- Business value
- Functional requirements (REQ-FN-*)
- Non-functional requirements (REQ-NF-*)
- Acceptance criteria (AC-*)
- Risks & assumptions
- Open questions
- Out-of-scope

---

### 2. Implementation Plan

**File**: `plan-template.md`
**Agent**: `spec-plan`
**Output**: `artifacts/features/<slug>/plan.md`

**Sections**:
- Phase breakdown
- Affected modules/files
- Dependencies
- Validation strategy
- Rollout & rollback

---

### 3. Task Breakdown

**File**: `tasks-template.md`
**Agent**: `spec-tasks`
**Output**: `artifacts/features/<slug>/tasks.md`

**Sections**:
- Metadata (feature, owner, dates)
- Task list (TASK-001 → TASK-N)
- Per-task: acceptance criteria, effort, dependencies
- Status tracking fields

---

### 4. Technical Design (for complex features)

**File**: `design-template.md`
**Agent**: `spec-design`
**Output**: `artifacts/features/<slug>/design.md`

**Sections**:
- Architecture diagram
- Component interactions
- Data model
- API contracts
- Error handling
- Performance considerations

---

## Review Templates

### Requirements Review

**File**: `requirements-review-template.md`
**Agent**: `spec-review-requirements`
**Output**: Approval/feedback (inline or separate doc)

**Checks**:
- Requirements complete and clear
- Acceptance criteria testable
- Risks identified
- Assumptions documented

### Implementation Review

**File**: `requirements-review-template.md` (reused)
**Agent**: `spec-review`
**Output**: Pass/Fail + recommendations

**Checks**:
- All REQ-* addressed
- All AC-* tested
- Traceability complete
- Constitution followed

---

## Knowledge Templates (Memory System)

### Project Rules

**File**: `constitution-template.md`
**Agent**: `constitution`
**Output**: `memories/repo/constitution.md`

**Sections**:
- Project standards & rules
- Technology decisions (locked-in)
- Code style requirements
- Testing minimums
- Deployment standards
- Security requirements

---

### Project Patterns

**File**: `project-knowledge-base-template.md`
**Agent**: `project-knowledge-base`
**Output**: `memories/repo/project-knowledge-base.md`

**Sections**:
- Naming conventions
- API patterns
- Error handling
- Configuration approach
- Testing patterns
- Anti-patterns to avoid

---

### Legacy System Gotchas

**File**: `legacy-system-watchouts-template.md`
**Agent**: `discover-legacy-system` → `promote-to-repo-memory`
**Output**: `memories/repo/legacy-system-watchouts.md`

**Format per gotcha**:
- What: [specific behavior]
- Impact: [consequences]
- Files: [where it matters]
- Solution: [workaround]
- Status: ✅ STABLE / ⚠️ NEEDS VERIFICATION
- Confidence: HIGH / MEDIUM
- Date discovered: [date]

---

### Architecture Decisions

**File**: `architecture-decisions-template.md`
**Agent**: `capture-architecture` → `promote-to-repo-memory`
**Output**: `memories/repo/architecture-decisions.md`

**Per decision**:
- Technology/pattern chosen
- Why: [benefits]
- Why not: [alternatives & trade-offs]
- Constraints: [limitations]
- Assumptions: [what must remain true]

---

### Integration Points

**File**: `integration-points-template.md`
**Agent**: `discover-legacy-system` → `promote-to-repo-memory`
**Output**: `memories/repo/integration-points.md`

**Per point**:
- Feature type: [auth, API, database, etc]
- Files typically modified: [list]
- Contract to respect: [interfaces/exports]
- Effort estimate: [hours]
- Gotchas specific to this point: [list]

---

### Legacy Context (Optional Feature-Specific)

**File**: `legacy-context-template.md`
**Agent**: (manual or `spec-implement` ref)
**Output**: `artifacts/features/<slug>/legacy-context.md`

**Use when**: Feature integrates with legacy code

**Sections**:
- What existing code does it affect?
- What contracts must be respected?
- What gotchas apply here?
- Integration strategy

---

## Complete Flow: Greenfield Feature

```
1. spec-requirement agent
   Reads: constitution.md, project-knowledge-base.md
   Uses: spec-template.md
   Outputs: spec.md
           ├─ REQ-FN-* (functional)
           ├─ REQ-NF-* (non-functional)
           └─ AC-* (acceptance criteria)

2. spec-review-requirements agent
   Reads: spec.md
   Uses: requirements-review-template.md
   Outputs: Approval / Requests revision

3. spec-design agent (if complex)
   Reads: spec.md
   Uses: design-template.md
   Outputs: design.md
           ├─ Architecture
           ├─ Data model
           ├─ API contracts
           └─ Error handling

4. spec-plan agent
   Reads: spec.md, design.md (if exists)
   Uses: plan-template.md
   Outputs: plan.md
           ├─ Phase 1, 2, 3, ...
           ├─ Dependencies
           ├─ Validation
           └─ Rollout

5. spec-tasks agent
   Reads: spec.md, plan.md
   Uses: tasks-template.md
   Outputs: tasks.md
           ├─ TASK-001: [with AC-* linked]
           ├─ TASK-002: [with AC-* linked]
           └─ ...

6. spec-implement agent
   Reads: spec.md, plan.md, tasks.md
   Uses: (code + test templates, framework-specific)
   Outputs: Source code
           ├─ Tests matching AC-*
           ├─ Comments citing REQ-*
           └─ Commits referencing TASK-*

7. spec-review agent
   Reads: spec.md, implementation, tests
   Uses: requirements-review-template.md
   Outputs: Pass / Issues to resolve
```

---

## Complete Flow: Brownfield Feature

```
**DISCOVERY** (~30 min, fully autonomous)

1. discover-legacy-system agent
   Reads: (entire codebase via semantic search)
   Uses: legacy-context-template.md (ref)
   Outputs: /memories/session/investigation-notes.md
           ├─ Architecture map
           ├─ 5-10 gotchas
           ├─ Integration points
           └─ Patterns found

2. capture-architecture agent
   Reads: (package.json, docker-compose, code structure)
   Uses: architecture-decisions-template.md
   Outputs: /memories/repo/architecture-decisions.md
           ├─ Technology decisions
           ├─ Trade-offs
           ├─ Scaling assumptions
           └─ Design patterns

3. promote-to-repo-memory agent
   Reads: /memories/session/investigation-notes.md
   Uses: legacy-system-watchouts-template.md, integration-points-template.md
   Outputs: /memories/repo/
           ├─ legacy-system-watchouts.md (updated)
           ├─ integration-points.md (updated)
           └─ architecture-decisions.md (enhanced)

**FEATURE** (then proceed with Greenfield flow above)

4. spec-requirement agent
   Reads: spec-template.md
           + constitution.md
           + project-knowledge-base.md
           + legacy-system-watchouts.md (NOW AVAILABLE)
           + integration-points.md (NOW AVAILABLE)
           + architecture-decisions.md (NOW AVAILABLE)
   Outputs: spec.md (respects gotchas, constraints)

5-11. (Continue with Greenfield flow)
```

---

## Template Organization

```
.github/specs/templates/
├── spec-template.md ← What to build
├── design-template.md ← How to build
├── plan-template.md ← Phases of work
├── tasks-template.md ← Task breakdown
├── requirements-review-template.md ← Quality gate
├── constitution-template.md ← Project rules
├── project-knowledge-base-template.md ← Team patterns
├── legacy-context-template.md ← Integration doc
├── legacy-system-watchouts-template.md ← Gotchas
├── architecture-decisions-template.md ← Design decisions
└── integration-points-template.md ← Feature connection points
```

Each template:
- ✅ Reusable across projects
- ✅ Kit-maintained (same across all projects)
- ✅ Referenced by specific agents
- ✅ Filled by agents or teams

---

## How to Customize

### To add a new template:

1. Create `.github/specs/templates/my-template.md`
2. Add to corresponding agent's "reads" section
3. Document in this mapping

### To modify existing template:

1. Update template in `.github/specs/templates/`
2. Update this mapping
3. Update agent instructions if flow changed
4. All projects get new version (via version control)

### To add a new agent:

1. Create `.github/agents/my-agent.md`
2. Document which templates it uses
3. Add to this mapping
4. Reference in AGENTS-REFERENCE.md
5. Update workflows in USAGE-GUIDE.md

---

## Next Steps

- **See all agents**: [AGENTS-REFERENCE.md](AGENTS-REFERENCE.md)
- **Use templates**: See `.github/specs/templates/`
- **Run a workflow**: See [USAGE-GUIDE.md](../USAGE-GUIDE.md)
