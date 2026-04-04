# Workflows

**How to use the 13 agents in practice.**

Choose your situation and follow the recommended workflow.

---

## Quick Navigation

- **[Greenfield Workflow](#greenfield)** — Starting a new project
- **[Brownfield Workflow](#brownfield)** — Working with existing code
- **[Common Scenarios](#scenarios)** — Real-world patterns
- **[Feature Development](#features)** — Building features step-by-step

---

## Greenfield: New Project

Use this workflow when starting a new project from scratch.

### One-Time Setup (1-2 hours)

```
1. /constitution "Project description and constraints"
   ↓ Creates project rules and guardrails

2. /patterns [optional, after first week of work]
   ↓ Documents team conventions
```

**Output:**
- Project constitution (saved to artifacts/)
- Team patterns document (saved to artifacts/)

**Next:** Move to Per-Feature Workflow (below)

### Per-Feature Workflow (6-8 hours per feature)

```
1. /spec "What you want to build"
   ↓ Creates specification

2. /requirement-review [optional]
   ↓ Validates spec quality

3. /design [optional, for complex features]
   ↓ Creates technical design

4. /plan
   ↓ Creates delivery plan

5. /tasks
   ↓ Creates implementation tasks

6. /implement Task 1, Task 2, ...
   ↓ Writes code for each task

7. /review
   ↓ Quality gate on implementation

8. /archive [optional]
   ↓ Save learnings for future
```

**Decision Points:**

- **Skip `/requirement-review`?** For simple features, yes. For complex or risky, no.
- **Skip `/design`?** Yes, unless feature involves new architecture or data models.
- **Skip `/archive`?** For minor features, yes. For learnings worth sharing, no.

---

## Brownfield: Existing Project

Use this workflow when joining an existing project or working with legacy code.

### One-Time Discovery (1-2 hours)

```
1. /discover "system or subsystem name"
   ↓ Explores codebase

2. /architecture
   ↓ Documents system design

3. /analyze "specific questions"
   ↓ Researches particular topics

4. /archive "key findings"
   ↓ Saves discoveries for team
```

**Output:**
- System understanding
- Architecture documentation
- Project memory updated

**Next:** Move to Per-Feature Workflow (under Greenfield above)

---

## Common Scenarios

### Scenario 1: Build New Feature (Start to Finish)

1. Create spec → `/spec`
2. Plan implementation → `/plan`
3. Break into tasks → `/tasks`
4. Implement each task → `/implement` (multiple times)
5. Quality check → `/review`
6. Save learnings → `/archive`

### Scenario 2: Fix Bug

1. Investigate → `/analyze "describe the bug"`
2. Plan fix → `/plan [if complex]` or skip for simple bugs
3. Implement fix → `/implement`
4. Verify → `/review`
5. Document → `/archive` if it's a learnable bug

### Scenario 3: Onboard to Existing Codebase

1. Explore system → `/discover`
2. Understand architecture → `/architecture`
3. Ask specific questions → `/analyze [your questions]`
4. Read project memory → `/project-knowledge-base`
5. Ready to contribute → Follow feature workflow

### Scenario 4: Research Design Question

1. Ask the question → `/analyze "your design question"`
2. If complex → `/design` to create formal design
3. Archive the decision → `/archive [why we chose X]`

### Scenario 5: Performance Problem

1. Investigate → `/analyze "describe performance issue and data"`
2. If architectural → `/design [proposed solution]`
3. Plan optimization → `/plan`
4. Implement → `/implement`
5. Measure improvement → `/review`
6. Archive findings → `/archive [what we learned]`

### Scenario 6: Refactoring

1. Analyze impact → `/analyze "what's the refactoring goal?"`
2. Plan refactoring → `/plan [breaking down the work]`
3. Create tasks → `/tasks`
4. Implement → `/implement` (multiple tasks)
5. Review → `/review`
6. Archive patterns → `/archive [new patterns discovered]`

---

## Feature Development: Step-by-Step

This is the most common workflow—building a new user-facing feature.

### Step 1: Clarify What to Build
```
/spec "I want to build: <description>"

Provides:
- Feature requirements
- Acceptance criteria
- Risks and constraints
- Open questions
```

**When done:** You have a clear spec approved by stakeholders

### Step 2: (Optional) Validate Spec Quality
```
/requirement-review

Provides:
- Clarity assessment
- Completeness check
- Open questions highlighted
- Recommendations for improvement
```

**When done:** Spec has been validated for quality

### Step 3: (Optional) Design Complex Features
```
/design

Provides:
- Technical architecture
- Data model
- API design
- Integration points
- Trade-off analysis
```

**When done:** You have a technical design approved

### Step 4: Plan Implementation
```
/plan

Provides:
- Implementation phases
- Timeline estimates
- Risk analysis
- Success criteria
- Dependencies
```

**When done:** You have a delivery plan

### Step 5: Break Into Tasks
```
/tasks

Provides:
- Ordered task list
- Task descriptions
- Dependencies between tasks
- Effort estimates
- Completion criteria for each
```

**When done:** Ready to start coding

### Step 6: Implement Each Task
```
For each task:
  /implement "Task N: <description>"
```

Repeat for each task until all complete.

**When done:** All code written, tested, documented

### Step 7: Verify Quality
```
/review

Provides:
- Verification against spec
- Verification against plan
- Test coverage report
- Code quality findings
- Performance analysis
- Issues and gaps
- Recommendations
```

**Decision:**
- **If green:** Ready to deploy!
- **If issues:** Fix them, then `/review` again

### Step 8: (Optional) Save Learnings
```
/archive "key findings and learnings"
```

Save so future developers know what you learned.

---

## Decision Tree: Which Command to Use?

```
Are you...

├─ Starting a new project?
│  └─ /constitution (then /patterns later)
│
├─ Joining existing codebase?
│  └─ /discover → /architecture
│
├─ Building a feature?
│  ├─ /spec (start)
│  ├─ /plan
│  ├─ /tasks
│  ├─ /implement (write code)
│  └─ /review (verify)
│
├─ Fixing a bug?
│  ├─ /analyze (understand issue)
│  ├─ /implement (write fix)
│  └─ /review (verify)
│
├─ Have a question/problem?
│  └─ /analyze
│
├─ Done with implementation?
│  └─ /archive (save learnings)
│
└─ Need to verify spec quality?
   └─ /requirement-review
```

---

## Common Agent Sequences

### Build Feature
1. `/spec` → `/plan` → `/tasks` → `/implement` → `/review` → `/archive`

### Understand System
1. `/discover` → `/architecture` → `/analyze (questions)` → `/archive`

### Fix Bug
1. `/analyze` → `/implement` → `/review`

### Optimize Performance
1. `/analyze` → `/design` → `/plan` → `/implement` → `/review` → `/archive`

### Onboard Team
1. `/discover` → `/architecture` → Reference `/project-knowledge-base`

---

## Tips for Workflows

1. **Go step by step** — Don't skip phases even to "save time"
2. **Get feedback** — Review outputs before proceeding
3. **Iterate as needed** — Run agents multiple times if first output isn't right
4. **Adapt workflows** — These are templates, adjust for your team
5. **Save learnings** — Archive regularly so team learns together

---

## Anti-Patterns to Avoid

❌ **Skip `/spec` and jump to coding** — Leads to rework
❌ **Plan without spec** — Plan doesn't have requirements to plan against
❌ **Implement without tasks** — Tasks force you to think through execution
❌ **Skip `/review`** — Catches bugs early while they're cheap to fix
❌ **Never archive** — Each project becomes an island of knowledge

---

## When to Deviate

| Situation             | Normal Workflow                     | Deviation                                   |
| --------------------- | ----------------------------------- | ------------------------------------------- |
| Simple bug fix        | /analyze → /implement → /review     | Skip /plan and /tasks                       |
| Emergency hotfix      | /spec → /plan → /tasks → /implement | Skip /design, /requirement-review, /archive |
| Small feature         | Full workflow                       | Skip /design and /requirement-review        |
| Complex system change | Full workflow                       | Add /design, expect longer timeline         |

---

## Next Steps

- **Greenfield?** Follow [Greenfield Workflow](#greenfield)
- **Brownfield?** Follow [Brownfield Workflow](#brownfield)
- **Unsure which step?** Check [Decision Tree](#decision-tree)
- **Want specifics on an agent?** See [Agents](../agents/)
