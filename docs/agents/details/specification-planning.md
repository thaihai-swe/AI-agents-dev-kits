# Specification, Design, Planning, And Delivery

This phase turns vague intentions into clear specifications and execution-ready tasks.

## Agent Groups

### Specification & Design (3 agents)

Define what should change and clarify technical approach:

- **`/spec-requirement`** — Define what to build, for whom, and why
- **`/spec-review-requirements`** — Check if spec is ready for downstream work (quality gate)
- **`/spec-design`** — Clarify technical approach (only when planning needs clarity)

### Planning & Delivery (2 agents)

Create execution strategy and bounded work:

- **`/spec-plan`** — Define how to build: sequencing, dependencies, validation, rollout
- **`/spec-tasks`** — Break plan into bounded, independent implementation units

## Process Flow

```
Analysis (if needed) ──→ Specification
                              ↓
                    /spec-requirement
                              ↓
                    /spec-review-requirements [QUALITY GATE]
                              ↓
                    /spec-design (if needed)
                              ↓
                         Planning
                              ↓
                      /spec-plan
                              ↓
                      /spec-tasks
                              ↓
                      Implementation
```

## Phase 1: Specification ("What?")

### `/spec-requirement`

**Purpose:** Define what should change and why. User-focused, not technical.

**Inputs:**
- Analysis (if investigation was needed)
- User feedback or requirements
- Business objectives
- Acceptance criteria

**Output:** `artifacts/features/<slug>/spec.md`

**Contains:**
- Target users
- User scenarios and stories
- Key requirements
- Acceptance criteria (testable)
- In-scope items
- Out-of-scope items
- Success metrics

**Discipline:** Keep it user-focused. "Who benefits and how?" Not "how will we build it?"

### `/spec-review-requirements` [Quality Gate]

**Purpose:** Ensure spec is ready for design and planning. First formal quality gate.

**Outputs:** `artifacts/features/<slug>/requirements-review.md`

**Checks:**
- ✅ Problem statement is clear
- ✅ Target users/stakeholders identified
- ✅ Success criteria testable
- ✅ Scope boundaries clear (in/out)
- ✅ Requirements valid and complete
- ✅ No hidden assumptions
- ✅ Acceptance criteria are specific
- ✅ Dependencies identified
- ✅ Risks surfaced
- ✅ Implementation approach is clear enough
- ✅ Task breakdown is actionable
- ✅ Traceability IDs present (REQ-*, AC-*)

**If not ready:** Return to `/spec-requirement`, fix gaps, rerun review.

**If ready:** Proceed to design (if needed) or planning.

### `/spec-design` (Optional, Specification & Design)

**Purpose:** Resolve technical ambiguity when planning depends on architecture decisions.

**Use when:**
- Feature crosses subsystem boundaries
- Changes affect public interfaces
- Data migration or compatibility risk
- Multiple viable technical approaches
- Planning depends on architecture clarity

**Skip when:**
- Single clear technical approach
- Changes are localized
- Architecture is not affected
- Planning can proceed with current knowledge

**Output:** `artifacts/features/<slug>/design.md`

**Contains:**
- Technical approach overview
- Architecture decisions
- Interface changes
- Data model impacts
- Implementation strategy
- Tradeoffs considered
- Rollout approach

**Discipline:** Technical clarity only. Not implementation details or task breakdown.

## Phase 2: Planning ("How?")

### `/spec-plan`

**Purpose:** Define execution strategy, sequencing, and validation.

**Inputs:**
- Spec (what to build)
- Design (how, if needed)
- Repo memory (constraints, patterns)

**Output:** `artifacts/features/<slug>/plan.md`

**Contains:**
- Technical approach overview
- Execution phases with sequencing
- Phase dependencies
- Validation strategy for each phase
- Rollout and rollback approach
- Risk handling
- Prerequisites and blockers
- Success criteria per phase
- Traceability (REQ-* ↔ PHASE-*)

**Discipline:** Strategy level, not implementation details. Clear enough for tasks to decompose.

### `/spec-tasks`

**Purpose:** Break plan into bounded, reviewable, independent work units.

**Inputs:**
- Plan (execution strategy)
- Spec (requirements)
- Design (if created)

**Output:** `artifacts/features/<slug>/tasks.md`

**Contains:**
- Task list (TASK-001, TASK-002, ...)
- Task dependencies
- Status tracking
- Acceptance criteria per task
- Validation notes
- Resume/handoff guidance
- Traceability (REQ-* ↔ AC-* ↔ TASK-*)

**Discipline:** Tasks are independent slices. Small enough to review, large enough to be meaningful.

## Decision Rules

| Situation                       | Decision                                     |
| ------------------------------- | -------------------------------------------- |
| Spec is vague or incomplete     | ❌ Don't plan. Return to `/spec-requirement`. |
| Spec review says "not ready"    | ❌ Don't proceed. Fix spec first.             |
| Planning feels uncertain        | ❓ Do you need `/spec-design`?                |
| Multiple valid approaches exist | ✅ May benefit from `/spec-design`.           |
| Features crosses subsystems     | ✅ Include `/spec-design`.                    |
| Simple, localized change        | ⏩ Can skip `/spec-design`.                   |
| Tasks feel unclear              | ❌ Planning is too vague. Improve `plan.md`.  |
| Implementation feels blocked    | ❌ Check task clarity and dependencies first. |

## Troubleshooting

**"Planning feels uncertain"**
→ Usually missing or vague `design.md`
→ Return to `/spec-design` or improve existing design

**"Task breakdown is hard"**
→ `plan.md` is too strategic or missing phases
→ Improve `plan.md` before running `/spec-tasks`

**"Spec review keeps failing"**
→ Requirements are fundamentally unclear
→ Consider `/analyze` to investigate before re-speccing

**"Too many tasks"**
→ `plan.md` may need more phases
→ Break plan into smaller, sequential phases

**"Tasks are too small"**
→ Combine related tasks that can be reviewed together
→ Or accept more granularity for better resumability

## Traceability Through Spec & Planning

```
REQ-001 (spec) ──→ AC-001 (spec acceptance criteria)
                        ↓
                    PHASE-A (plan)
                        ↓
                    TASK-001 (tasks)
                        ↓
                    Implementation references TASK-001
                        ↓
                    Review verifies AC-001 coverage
```

Every requirement should trace forward to tasks and implementation.
