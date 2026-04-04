# Commands Reference

**Quick reference for all 13 commands.**

---

## All 13 Commands

### Specification & Planning
```
/spec <description>              Create feature specification
/design                          Create technical design
/plan                            Create implementation plan
/tasks                           Create task list
```

### Implementation & Review
```
/implement <task description>    Write code and tests
/review                          Verify implementation quality
```

### Discovery & Learning
```
/analyze <question or problem>   Investigate and research
/discover [system]               Explore existing codebase
/architecture                    Document system design
```

### Foundation
```
/constitution [context]          Define project rules
/patterns [pattern type]         Document team patterns
/project-knowledge-base          Access team knowledge
```

### Quality & Archive
```
/requirement-review              Review specification quality
/archive <findings>              Archive learnings to project memory
```

---

## Command Details

### `/spec` — Feature Specification
**When:** Start of every feature
**Input:** What you want to build
**Output:** Specification with requirements and acceptance criteria
**Time:** 10-20 minutes

```
/spec Build a user dashboard with activity feed,
       filtering, real-time updates, mobile responsive
```

---

### `/design` — Technical Design
**When:** Complex features
**Input:** Spec, architecture context
**Output:** Technical design with architecture decisions
**Time:** 15-30 minutes

```
/design
(Read spec automatically)
```

---

### `/plan` — Implementation Plan
**When:** After spec approved
**Input:** Approved spec
**Output:** Plan with phases, timeline, risks
**Time:** 10-15 minutes

```
/plan
```

---

### `/tasks` — Task Breakdown
**When:** After plan approved
**Input:** Plan and spec
**Output:** Task list with sequencing and estimates
**Time:** 10-20 minutes

```
/tasks
```

---

### `/implement` — Write Code
**When:** During development
**Input:** Task description
**Output:** Code, tests, documentation
**Time:** 1-4 hours per task

```
/implement
/implement Task 1: Build authentication routes
/implement src/auth/login.ts
```

---

### `/review` — Quality Gate
**When:** After implementation
**Input:** Implemented code
**Output:** Quality report and verification
**Time:** 15-30 minutes

```
/review
```

---

### `/analyze` — Investigate
**When:** Anytime you have questions
**Input:** Question or problem description
**Output:** Analysis and recommendations
**Time:** 10-20 minutes

```
/analyze Why is the API slow?
/analyze How do we handle user sessions?
```

---

### `/discover` — Explore Code
**When:** First time on codebase
**Input:** System or directory to explore
**Output:** Overview of architecture and patterns
**Time:** 30-60 minutes

```
/discover
/discover authentication system
/discover src/api
```

---

### `/architecture` — Document Design
**When:** After discovery
**Input:** Findings from discovery
**Output:** Architecture documentation
**Time:** 20-30 minutes

```
/architecture
```

---

### `/constitution` — Define Rules
**When:** Project setup (one-time)
**Input:** Project context and constraints
**Output:** Project constitution
**Time:** 30-60 minutes

```
/constitution
We're building a TypeScript/React  SaaS app with Node.js backend
```

---

### `/patterns` — Document Patterns
**When:** After first week (one-time)
**Input:** Examples of team patterns
**Output:** Pattern documentation
**Time:** 30-60 minutes

```
/patterns
Show our testing patterns, state management patterns, error handling
```

---

### `/project-knowledge-base` — Query Knowledge
**When:** Need team knowledge
**Input:** Query or topic
**Output:** Relevant project knowledge
**Time:** 5-10 minutes

```
/project-knowledge-base
/project-knowledge-base What do we know about authentication?
```

---

### `/requirement-review` — Review Spec
**When:** After spec (optional)
**Input:** Approved spec
**Output:** Review report
**Time:** 15-20 minutes

```
/requirement-review
```

---

### `/archive` — Archive Learnings
**When:** After discoveries/implementations
**Input:** Key findings to save
**Output:** Archived to project memory
**Time:** 10-15 minutes

```
/archive
We discovered X about performance. Key learnings: Y and Z.
```

---

## Command Sequences

### Feature Development
```
/spec
  ↓
/requirement-review (optional)
  ↓
/design (if complex)
  ↓
/plan
  ↓
/tasks
  ↓
/implement (per task)
  ↓
/review
  ↓
/archive (optional)
```

### Understand Existing System
```
/discover
  ↓
/architecture
  ↓
/analyze (specific questions)
  ↓
/archive
```

### Project Setup
```
/constitution
  ↓
/patterns (after 1 week)
```

### When Stuck
```
/analyze
  ↓
(if complex)
  ↓
/design
  ↓
/plan
  ↓
/implement
```

---

## Quick Decision Matrix

| Need                  | Command                   |
| --------------------- | ------------------------- |
| Write a spec          | `/spec`                   |
| Plan implementation   | `/plan`                   |
| Break into tasks      | `/tasks`                  |
| Write code            | `/implement`              |
| Check quality         | `/review`                 |
| Learn about something | `/analyze`                |
| Explore codebase      | `/discover`               |
| Document design       | `/architecture`           |
| Set project rules     | `/constitution`           |
| Document patterns     | `/patterns`               |
| Review spec           | `/requirement-review`     |
| Save findings         | `/archive`                |
| Access team knowledge | `/project-knowledge-base` |

---

## Tips for Commands

1. **Be specific** — Vague input → vague output
2. **Provide context** — Background helps agents understand
3. **Iterate** — Run again if not satisfied
4. **Use results** — Output becomes input for next command
5. **Ask follow-ups** — Run agents multiple times

---

## Common Patterns

### Simple Feature
```
/spec → /plan → /tasks → /implement → /review
```

### Complex Feature
```
/spec → /design → /plan → /tasks → /implement → /review
```

### Bug Fix
```
/analyze → /implement → /review
```

### Performance Work
```
/analyze → /design → /plan → /tasks → /implement → /review → /archive
```

### Feature Learning
```
/spec → /plan → /tasks → /implement → /review → /archive
```

---

## Errors & Debugging

**Command not found?**
→ Check spelling and `/` prefix

**Agent output unclear?**
→ Run again with more context

**Not sure which command?**
→ See Decision Matrix above

**Stuck?**
→ Run `/analyze "your situation"`

---

## Pro Tips

- Combine commands in sequences for power
- Each command builds on previous outputs
- Save to memory with `/archive`
- Ask `/analyze` when stuck
- Review outputs before proceeding

---

## Next Steps

- See [Getting Started](../guides/getting-started.md)
- See [Workflows](../workflows/)
- See [Agents](../agents/)
