# Implementation And Delivery

This phase executes approved planned work and verifies it matches the intended change.

## Commands In This Group

- `/spec-implement` — Execute approved tasks
- `/spec-review` — Verify implementation matches spec and plan

## When Implementation Is Ready

Start `/spec-implement` when:
- ✅ `spec.md` exists and is approved
- ✅ `plan.md` exists and is approved
- ✅ `tasks.md` exists with clear acceptance criteria
- ✅ All dependencies and prerequisites are resolved
- ✅ Team is ready to start execution

## `/spec-implement`

**Purpose:** Execute planned work while maintaining scope discipline and continuous validation.

**Inputs (REQUIRED):**
- `spec.md` (what to build)
- `plan.md` (execution strategy)
- `tasks.md` (work breakdown)

**Optional inputs:**
- `design.md` (architectural guidance)
- `analysis.md` (brownfield context)
- `memories/repo/constitution.md` (repo rules)
- `memories/repo/project-knowledge-base.md` (system knowledge)

**Process:**
1. Select next unblocked task (or specifically request tasks)
2. Execute task according to acceptance criteria
3. Add or update validation (tests, verification)
4. Update the task `Status:` field immediately and mark the checkbox done only when validation passes
5. Resume notes for handoff or continuation
6. Repeat until feature is done

**Responsibilities:**
- ✅ Execute only selected or next unblocked tasks
- ✅ Keep scope matching approved spec/plan (no silent rewrites)
- ✅ Add validation evidence for every change
- ✅ Keep checkbox and `Status:` tracking current after each cycle
- ✅ Include resume/handoff notes for clarity
- ✅ Flag scope drift or blockers
- ✅ Stop if upstream artifacts are weak or contradictory

**Stop when:**
- ❌ Dependencies are not resolved
- ❌ Upstream artifacts (spec/plan/tasks) are unclear
- ❌ Scope is drifting from approved spec
- ❌ Implementation contradicts repo rules
- ❌ Validation is insufficient

## `/spec-review` [Quality Gate 2]

**Purpose:** Verify that implemented work matches approved spec, plan, tasks, validation expectations, and repo rules. Second formal quality gate.

**When to run:**
- After implementation tasks are done
- Before considering the feature "complete"
- When handing off to another team/person

**Optional output:** `artifacts/features/<slug>/review.md`

Use `review.md` when:
- Findings need preserving for future reference
- Complex tradeoffs or decisions were made
- Follow-up work is deferred
- Lessons learned should guide similar work

**Checks:**
- ✅ Completeness: approved scope is covered and no critical behavior is silently missing
- ✅ Correctness: delivered behavior and validation evidence support the intended outcome
- ✅ Coherence: artifacts, task status, and implementation all tell the same story
- ✅ Requirements and acceptance criteria are satisfied or explicitly called out as gaps
- ✅ Validation evidence matches the risk of the change
- ✅ Tasks, task status, and implementation reality align
- ✅ No scope drift from approved artifacts
- ✅ Repo rules from the constitution are respected
- ✅ Follow-up work is distinguished from blocking defects
- ✅ Deferred work, limitations, and handoff notes are documented

## Workflow Pattern

```
/spec-tasks (breakdown work)
      ↓
/spec-implement (execute)
      ↓
  Finished?
   Yes | No
    |   └─ Execute next task(s)
    ↓      (repeat)
/spec-review (verify)
      ↓
Ready? → Yes:  Release/merge
       → No:  Fix or update, then review again
```

## Common Patterns

### All-at-Once Implementation
Small features in single session:
```
/spec-implement (all tasks) → /spec-review → Done
```

### Phased Implementation
Complex features across multiple sessions:
```
Session 1: /spec-implement (TASK-001-003)
Session 2: /spec-implement (TASK-004-005)
Session 3: /spec-implement (TASK-006, final)
Final:     /spec-review → Done
```

### Handling Blocked Work
When tasks are blocked:
```
/spec-implement (TASK-001-003)
[TASK-004 blocked – add resume notes]
Later: /spec-implement (TASK-004 when available)
```

## Important Shift From Older Model

Older docs split implementation into separate commands. The current model integrates:
- `/spec-implement` includes continuous validation
- `/spec-review` is a bounded review step
- Both are part of same "Implementation & Quality" category
