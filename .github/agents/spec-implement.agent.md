---
agent: 'agent'
description: 'Implement a feature from the approved spec, plan, and task list'
---

# Goal

Execute the approved implementation tasks while staying aligned with the AI delivery kit artifacts.

# Instructions

1. Read:
   - `artifacts/features/<feature-slug>/spec.md`
   - `artifacts/features/<feature-slug>/design.md` if present
   - `artifacts/features/<feature-slug>/plan.md`
   - `artifacts/features/<feature-slug>/tasks.md`
   - `memories/repo/constitution.md` if present
   - `memories/repo/project-knowledge-base.md` if present
2. Implement only the approved in-scope tasks and follow `design.md` when it exists.
3. Follow task order unless a dependency or technical constraint requires resequencing.
4. Keep changes small and traceable to specific tasks and acceptance criteria.
5. Add or update tests as part of implementation.
6. When starting work on a task, immediately mark it `In Progress` in `artifacts/features/<feature-slug>/tasks.md`.
7. As soon as one task is completed, immediately update `artifacts/features/<feature-slug>/tasks.md` before moving to the next task.
8. Use only these task states unless the file already defines a stronger local convention: `Not Started`, `In Progress`, `Blocked`, `Done`, `Deferred`.
9. For each task touched, record:
   - implementation status
   - validation evidence or test references
   - blocker or follow-up notes when relevant
   - resequencing notes when task order changed
10. If work stops before the feature is complete, leave the next recommended action in the task notes so another session can resume safely.
11. If new tradeoffs or scope changes appear, update the decision log or call them out explicitly before continuing.
12. End with:
   - tasks completed
   - tests run
   - remaining blockers or follow-up tasks
13. During this step, code changes are allowed, but planning artifacts must stay bounded.
14. Do not create or update:
   - `spec.md` unless a clarification or scope issue explicitly requires pausing and revising the spec
   - `plan.md` unless a major implementation decision invalidates the existing plan
15. Limit artifact updates to:
   - source code and tests
   - `artifacts/features/<feature-slug>/tasks.md`
   - `artifacts/features/<feature-slug>/decision-log.md` when needed

---

# Traceability Through Implementation

Every line of code should trace back to the spec:

```
Spec (REQ-*)
  ↓
Acceptance Criteria (AC-*)
  ↓
Task (TASK-*)
  ↓
Code + Test
```

**Example**:
- Spec: `REQ-FN-003: Generate time-limited reset token`
- Acceptance: `AC-001: Token valid for exactly 15 minutes`
- Task: `TASK-001: Create password reset token schema`
- Code: `// AC-001: Token expires after 15 minutes`
- Test: `describe("AC-001: Token expiry") { it("expires after 15m") }`
---

# Success Indicators

✅ Implementation is complete when:
- All acceptance criteria (AC-*) have corresponding tests
- All tests passing before task marked `Done`
- Traceability chain intact: spec → tasks → code → tests
- Blockers called out early (not discovered at review)
- Resumable from tasks.md + decision-log.md alone
- Each commit references task ID and AC-*

---

# User Input

Feature slug: ${input:slug:Enter the feature slug}
