# Visual Workflow Map: All 13 Agents

**Quick reference showing how all agents connect and flow.**

---

## The Complete Flow

```
┌─────────────────────────────────────────────────────────────────┐
│  PROJECT START: Memory System Initialization (First Time Only)  │
└─────────────────────────────────────────────────────────────────┘
                                  │
                                  ▼
                        ┌─────────────────────┐
                        │  /constitution      │
                        │  Create project     │
                        │  rules & guardrails │
                        └──────────┬──────────┘
                                  │
                                  ▼
                        ┌─────────────────────┐
                        │  /patterns          │
                        │  Document repo      │
                        │  patterns & context │
                        └──────────┬──────────┘
                                  │
                       ┌──────────────────────┐
                       │ memories/repo/*      │
                       │ Constitution         │
                       │ Patterns             │
                       └──────────┬───────────┘
                                  │
┌─────────────────────────────────────────────────────────────────┐
│               NEW FEATURE WORK (Repeatable)                      │
└─────────────────────────────────────────────────────────────────┘
                                  │
                    ┌─────────────────────────┐
                    │   DISCOVERY PHASE       │
                    │   (Optional, Recommended│
                    │    for brownfield)      │
                    └─────────┬───────────────┘
                              │
               ┌──────────────┼──────────────┐
               ▼              ▼              ▼
        ┌────────────┐ ┌────────────┐ ┌────────────┐
        │ /discover  │ │/architecture│ │ /archive   │
        │ Explore    │ │ Extract     │ │ Promote    │
        │ codebase   │ │ decisions   │ │ to memory  │
        └─────┬──────┘ └─────┬──────┘ └─────┬──────┘
              │              │              │
              └──────────────┼──────────────┘
                             │
                  ┌──────────────────────┐
                  │ memories/repo/*      │
                  │ Architecture         │
                  │ Watchouts            │
                  └──────────┬───────────┘
                             │
         │
         ▼
    ┌─────────┬──────────────────────────────────────────────┐
    │   PLANNING PHASE: Turn request into executable spec   │
    └─────────┴──────────────────────────────────────────────┘
              │
              ▼
    ┌──────────────────────────┐
    │  /spec                   │
    │  Write specification     │
    │  (what we're building)   │
    └──────────┬───────────────┘
               │
               ▼
    ┌──────────────────────────┐
    │  /requirement-review    │  ◀─── QA GATE 1
    │  Review spec quality    │
    └──────────┬───────────────┘
               │
        ┌──────▼───────┐
        │   APPROVED?  │
        └────┬─────────┘
        Yes  │  (if needed revisions, loop back to /spec)
             │
             ▼
    ┌──────────────────────────┐
    │  /design (if complex)    │
    │  Technical architecture  │
    └──────────┬───────────────┘
               │
               ▼
    ┌──────────────────────────┐
    │  /plan                   │
    │  Execution sequence      │
    │  & phases                │
    └──────────┬───────────────┘
               │
               ▼
    ┌──────────────────────────┐
    │  /tasks                  │
    │  Break into small tasks  │
    │  Ready for implement     │
    └──────────┬───────────────┘
               │
    │
    ├─────────────────────────────────────────────────────┐
    │  IMPLEMENTATION PHASE: Write code & pass tests      │
    └──────────┬──────────────────────────────────────────┘
               │
               ▼
    ┌──────────────────────────┐
    │  /implement              │  ◀─── QA GATE 2
    │  Build feature + tests   │
    │  Mark tasks Done         │
    └──────────┬───────────────┘
               │
               ▼
    ┌──────────────────────────┐
    │  /review                 │  ◀─── QA GATE 3
    │  Verify against spec     │
    │  Check tests pass        │
    └──────────┬───────────────┘
               │
        ┌──────▼───────┐
        │   PASS?      │
        └────┬─────────┘
        Yes  │  (if blocked, loop back to /implement)
             │
             ▼
    ┌──────────────────────────┐
    │  ✅ READY TO MERGE       │
    │                          │
    │  Feature complete,       │
    │  all tests passing       │
    │  all AC-* verified       │
    └──────────────────────────┘
```

---

## Agent Relationships

```
KNOWLEDGE LAYERS:
═════════════════════════════════════════

┌─ Durable Memory (Survives All Features) ──────┐
│                                               │
│  /constitution ──────────────────┐           │
│  Project rules & guardrails      │           │
│                                  │ reused by │
│  /patterns ──────────────────────┤ planning  │
│  Repository context & patterns   │ agents    │
│                                  │           │
│  /discover → /architecture ──────┼──────┐    │
│  Detected patterns from code     │      │    │
│                                  │      │    │
│  /archive ───────────────────────┴──────┼──┐ │
│  Promote findings to repo memory        │  │ │
└──────────────────────────────────────────┘  │ │
                                              ▼ │
PLANNING & SPECS:                      ┌──────────┤
════════════════════════────────────────┤ Consumed │
                                        │ by       │
┌─ Feature Artifacts (Per Feature) ────┤ implement│
│                                       │ & review │
│  /spec ────────────────────┐          │          │
│  What are we building?     │          │          │
│                            │ fed into │          │
│  /requirement-review       │ planning │          │
│  Is spec good enough?      │  agents  │          │
│                            │          │          │
│  /design ──────────────────┼──────────┤          │
│  How do we build it?       │          │          │
│                            │          │          │
│  /plan ────────────────────┼──────────┤          │
│  What's the sequence?      │          │          │
│                            │          │          │
│  /tasks ───────────────────┘          │          │
│  Small testable tasks                 │          │
└────────────────────────────────────────────────┘
                                         │
                                         │
IMPLEMENTATION & DELIVERY:               │
═════════════════════════════════════════│
                                         │
┌─ Code & Tests ─────────────┐          │
│                             │◀────────┘
│  /implement                 │
│  Write code, update tasks   │
│                             │
│  /review ───────────────────┤
│  Verify against spec        │
│                             │
│  ✅ Ready to Merge          │
└─────────────────────────────┘
```

---

## Parallel vs Sequential Work

```
LINEAR PATH (Most Common):
══════════════════════════════════════════════════════════════

/spec
  │
  ├─→ /requirement-review
  │
  ├─→ /design (optional, for complex)
  │
  ├─→ /plan
  │
  ├─→ /tasks
  │
  ├─→ /implement ────────── Build AND Test
  │   │
  │   ├─→ Write code
  │   ├─→ Add tests
  │   └─→ Update tasks.md
  │
  └─→ /review ────────────── QA Gate: Pass/Fail?


DISCOVERY & MEMORY (Can Run Anytime):
══════════════════════════════════════════════════════════════

/discover ───────┐
                 ├─→ /archive ────→ memories/repo/*
/architecture ───┘

(Can run before, during, or after feature work)
(Findings persist for all future features)


INITIALIZATION (Once Per Project):
══════════════════════════════════════════════════════════════

/constitution ──→ /patterns ──→ memories/repo/*

(Must run first)
(Enables all later agents)
```

---

## Agent Dependencies (What Each Needs)

```
┌─────────────────────────────────────────────────────────────┐
│ /constitution (PROJECT START)                              │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • Project README or description                           │
│   • Existing code (if brownfield)                           │
│   • Templates or guidelines (if exist)                      │
│                                                              │
│ Outputs:                                                    │
│   • memories/repo/constitution.md                           │
│                                                              │
│ Then run:                                                   │
│   → /patterns                                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /patterns (PROJECT START, after /constitution)            │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • memories/repo/constitution.md ✓ (from /constitution)   │
│   • Existing codebase                                       │
│                                                              │
│ Outputs:                                                    │
│   • memories/repo/project-knowledge-base.md                │
│                                                              │
│ Then run:                                                   │
│   → /spec (start feature work)                              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /discover (FEATURE WORK - Optional Discovery Phase)       │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • User question ("explore auth system")                   │
│   • Codebase                                                │
│                                                              │
│ Outputs:                                                    │
│   • memories/session/investigation-notes.md                │
│                                                              │
│ Then run:                                                   │
│   → /architecture, /archive                                 │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /spec (FEATURE WORK - Start)                               │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • User request ("Add password reset")                     │
│   • memories/repo/constitution.md ✓                        │
│   • memories/repo/project-knowledge-base.md ✓              │
│                                                              │
│ Outputs:                                                    │
│   • artifacts/features/<slug>/spec.md                      │
│                                                              │
│ Then run:                                                   │
│   → /requirement-review                                     │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /requirement-review (QA GATE #1)                           │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • artifacts/features/<slug>/spec.md ✓ (from /spec)       │
│                                                              │
│ Outputs:                                                    │
│   • artifacts/features/<slug>/requirements-review.md       │
│   • Recommendation: Approved / Approved With Notes / Needs  │
│                      Revision                               │
│                                                              │
│ Then run:                                                   │
│   → /design (if approved)                                   │
│   → /spec (if needs revision)                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /design (Complex Features - Optional)                      │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • artifacts/features/<slug>/spec.md ✓                    │
│   • artifacts/features/<slug>/requirements-review.md ✓     │
│   • memories/repo/constitution.md ✓                        │
│   • memories/repo/project-knowledge-base.md ✓              │
│                                                              │
│ Outputs:                                                    │
│   • artifacts/features/<slug>/design.md                    │
│                                                              │
│ Then run:                                                   │
│   → /plan                                                   │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /plan (Next)                                                │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • artifacts/features/<slug>/spec.md ✓                    │
│   • artifacts/features/<slug>/design.md (if complex)        │
│   • memories/repo/constitution.md ✓                        │
│   • memories/repo/project-knowledge-base.md ✓              │
│                                                              │
│ Outputs:                                                    │
│   • artifacts/features/<slug>/plan.md                      │
│                                                              │
│ Then run:                                                   │
│   → /tasks                                                  │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /tasks (Ready to Build)                                    │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • artifacts/features/<slug>/spec.md ✓                    │
│   • artifacts/features/<slug>/plan.md ✓                    │
│   • artifacts/features/<slug>/design.md (if exists)        │
│                                                              │
│ Outputs:                                                    │
│   • artifacts/features/<slug>/tasks.md                     │
│   • Task states: Not Started, In Progress, Done, Blocked   │
│                                                              │
│ Then run:                                                   │
│   → /implement                                              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /implement (BUILD)                                          │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • ALL artifacts above ✓                                   │
│   • Task list with clear sequencing                         │
│                                                              │
│ Outputs:                                                    │
│   • Source code                                             │
│   • Tests                                                   │
│   • artifacts/features/<slug>/tasks.md (UPDATED)           │
│   • artifacts/features/<slug>/decision-log.md (optional)   │
│                                                              │
│ Then run:                                                   │
│   → /review                                                 │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ /review (QA GATE #2)                                        │
├─────────────────────────────────────────────────────────────┤
│ Inputs needed:                                              │
│   • Code implementation                                     │
│   • ALL artifacts ✓                                         │
│   • Test results                                            │
│                                                              │
│ Outputs:                                                    │
│   • Review summary                                          │
│   • Pass/Fail recommendation                                │
│                                                              │
│ Then:                                                       │
│   → PASS: Merge & deploy                                    │
│   → FAIL: Loop back to /implement                           │
└─────────────────────────────────────────────────────────────┘
```

---

## Red Flags & Checkpoints

```
If planning is taking >3 hours             → Feature spec too vague, return to /spec
If tasks don't fit in 2-week sprint        → Plan needs breaking down, use /tasks better
If implementation finds spec ambiguity     → Pause, revise at /spec level
If review finds test coverage <75%         → Implement again, add more tests
If review finds scope drift                → Check against original /spec
If requirements-review says "Needs Revision" → Don't proceed, loop back to /spec
If design doesn't align with existing code → Check /project-knowledge-base, realign
If rate of blockers >20%                   → Plan underestimated complexity
```

---

## Usage Checklist

### First-Time Setup
- [ ] Project created & basic README written
- [ ] Run `/constitution` → review constitution.md
- [ ] Run `/patterns` → review project-knowledge-base.md
- [ ] Commit memories/repo/* to version control

### For Each Feature (Recommended Order)
- [ ] **Optional**: `/discover` + `/archive` (brownfield work)
- [ ] `/spec` → Create spec.md
- [ ] `/requirement-review` → Check spec quality
- [ ] `/design` → If touching >3 files or complex
- [ ] `/plan` → Create execution plan
- [ ] `/tasks` → Break into small tasks
- [ ] `/implement` → Build + test (update tasks.md as you go)
- [ ] `/review` → Pass/fail check (loop back if issues)
- [ ] ✅ **MERGE READY**

---

**Print this page and use as a quick reference while building features.**
