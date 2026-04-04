# Agent Mapping

**How the 13 agents relate and work together.**

---

## Agent Dependencies

```
Project Start
  ├─→ /constitution (define rules)
  └─→ /patterns (after 1 week)

For Each Feature
  ├─→ /spec (create spec)
  ├─→ /requirement-review (validate spec, optional)
  ├─→ /analyze (research as needed)
  ├─→ /design (if complex)
  ├─→ /plan (create plan)
  ├─→ /tasks (break into tasks)
  ├─→ /implement (write code)
  ├─→ /review (verify quality)
  └─→ /archive (save learnings)

Understanding Existing Code
  ├─→ /discover (explore system)
  ├─→ /architecture (document design)
  ├─→ /analyze (specific questions)
  └─→ /archive (save findings)

Anytime
  ├─→ /analyze (question or problem)
  ├─→ /project-knowledge-base (access team knowledge)
  └─→ /archive (save discoveries)
```

---

## Agent Relationships

### Input/Output Flow

```
/spec (output)
    ↓ feeds into
/requirement-review (validates)
    ↓ and
/plan (uses spec)
    ↓ feeds into
/tasks (breaks down plan)
    ↓ feeds into
/implement (tasks to code)
    ↓ feeds into
/review (validates against spec/plan)
    ↓ then
/archive (saves learnings)
```

### Parallel Agents

These can run independently:
- `/analyze` — Anytime for questions
- `/discover` — When learning new system
- `/architecture` — After discovery
- `/project-knowledge-base` — Query anytime

---

## Agent Categories

### Specification & Planning Group
- `/spec` — Creates requirements
- `/design` — Creates architecture (builds on spec)
- `/plan` — Creates timeline (uses spec)
- `/tasks` — Creates task list (uses plan)
- `/requirement-review` — Validates spec

**Flow:** spec → review → design → plan → tasks

### Implementation Group
- `/implement` — Writes code (uses tasks)
- `/review` — Verifies code (uses spec, plan, implementation)

**Flow:** implement → review

### Discovery & Learning Group
- `/discover` — Explores code
- `/architecture` — Documents design (uses discovery findings)
- `/analyze` — Investigates (can be anytime)

**Flow:** discover → architecture (or analyze anytime)

### Foundation Group
- `/constitution` — Defines rules
- `/patterns` — Documents patterns
- `/project-knowledge-base` — Manages knowledge

**Flow:** constitution → patterns → knowledge-base

### Quality & Archive Group
- `/requirement-review` — Reviews specs
- `/archive` — Saves findings

**Flow:** Both are quality gates

---

## When to Invoke Each Agent

| Situation                | Agent                     | Why                         |
| ------------------------ | ------------------------- | --------------------------- |
| Starting feature         | `/spec`                   | Need baseline understanding |
| Spec seems incomplete    | `/requirement-review`     | Catch issues early          |
| Uncertain about approach | `/analyze`                | Research and clarify        |
| Complex feature          | `/design`                 | Plan architecture           |
| Ready to implement       | `/plan`                   | Create timeline             |
| Need task list           | `/tasks`                  | Know what to build          |
| Building code            | `/implement`              | Write implementation        |
| Code complete            | `/review`                 | Verify quality              |
| New to codebase          | `/discover`               | Understand architecture     |
| After discovery          | `/architecture`           | Document findings           |
| Project setup            | `/constitution`           | Define rules                |
| After first week         | `/patterns`               | Document practices          |
| Need team knowledge      | `/project-knowledge-base` | Access learnings            |
| Finished work            | `/archive`                | Save learnings              |

---

## Feature Workflows

### Complete Feature Workflow
```
START
  ↓
/spec "what to build"
  ↓
/requirement-review (optional)
  ↓
Issues? → Fix spec → /requirement-review again
  ↓
/design (if complex)
  ↓
/plan
  ↓
/tasks
  ↓
For each task:
  ├─ /implement
  └─ Review code
  ↓
/review (full feature)
  ↓
Issues? → Fix code → /review again
  ↓
/archive (optional)
  ↓
END (ready to deploy)
```

### Minimal Feature Workflow (Simple Features)
```
START
  ↓
/spec
  ↓
/plan
  ↓
/tasks
  ↓
/implement (per task)
  ↓
/review
  ↓
END
```

### Emergency Bug Fix Workflow
```
START
  ↓
/analyze "what's wrong"
  ↓
/implement fix
  ↓
/review
  ↓
END
```

---

## Which Agents Work Together

### Spec & Plan Agents Work Together
- `/spec` feeds into `/plan`
- `/plan` feeds into `/tasks`
- `/tasks` feeds into `/implement`

### Implementation & Quality Agents Work Together
- `/implement` creates code
- `/review` verifies against spec/plan
- Loop until perfect

### Discovery Agents Work Together
- `/discover` learns the system
- `/architecture` documents findings
- `/analyze` answers specific questions

### All Agents Can Use Archive
- `/archive` saves any learning
- `/project-knowledge-base` retrieves learnings
- All agents respect this knowledge

---

## Agent Communication

```
Agents that PROVIDE information:
  - /spec (provides spec)
  - /design (provides design)
  - /plan (provides plan)
  - /tasks (provides task list)
  - /implement (provides code)
  - /discover (provides discovery)
  - /architecture (provides document)

Agents that CONSUME information:
  - /requirement-review (uses spec)
  - /plan (uses spec)
  - /tasks (uses plan and spec)
  - /implement (uses tasks)
  - /review (uses spec, plan, code)
  - /analyze (can use anything)

Agents that VALIDATE:
  - /requirement-review (validates spec quality)
  - /review (validates implementation)

Agents that STORE/RETRIEVE:
  - /archive (stores)
  - /project-knowledge-base (retrieves)
```

---

## Decision Tree: Which Agent?

```
Do you want to...

├─ Build a new feature?
│  └─ /spec → /plan → /tasks → /implement → /review
│
├─ Plan it differently?
│  └─ /design or /plan
│
├─ Answer a question?
│  └─ /analyze
│
├─ Understand existing code?
│  └─ /discover → /architecture
│
├─ Set up project?
│  └─ /constitution → /patterns
│
├─ Save a learning?
│  └─ /archive
│
├─ Find team knowledge?
│  └─ /project-knowledge-base
│
├─ Validate something?
│  └─ /requirement-review or /review
│
└─ Something else?
   └─ /analyze [your question]
```

---

## Common Sequential Patterns

### Pattern 1: Full Feature
```
/spec → /plan → /tasks → /implement → /review → /archive
```

### Pattern 2: Quick Fix
```
/analyze → /implement → /review
```

### Pattern 3: Learn System
```
/discover → /architecture → /analyze (questions) → /archive
```

### Pattern 4: Performance Optimization
```
/analyze (measure problem) → /design → /plan → /tasks → /implement → /review → /archive
```

### Pattern 5: Onboard to Team
```
/discover (learn system) → /project-knowledge-base (learn team knowledge) → Ready to contribute
```

---

## Tips for Effective Agent Usage

1. **Follow dependencies** — Don't skip steps
2. **Use sequential patterns** — They're proven
3. **Run in order** — Each feeds the next
4. **Loop as needed** — If output isn't right, re-run
5. **Archive learnings** — Make knowledge available
6. **Consult knowledge** — `/project-knowledge-base` before starting

---

## Next Steps

- See [All Agents](README.md)
- See [Agents Reference](AGENTS-REFERENCE.md) for how to invoke
- See [Workflows](../workflows/) for complete scenarios
- See individual agent details in [details/](details/)

---

**Remember:** These agents work best as a system. Use them together in sequence for maximum power.
