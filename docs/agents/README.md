# The 13 Agents

**Complete reference for all 13 specialized AI agents in the kit.**

Each agent is a specialized assistant for one phase of development. Learn when to use each, what it does, and what to provide as input.

---

## Quick Overview

| #   | Agent                  | Command                   | Purpose                         | When to Use              |
| --- | ---------------------- | ------------------------- | ------------------------------- | ------------------------ |
| 1   | spec                   | `/spec`                   | Create feature specification    | Start every feature      |
| 2   | plan                   | `/plan`                   | Create delivery plan            | After spec approved      |
| 3   | tasks                  | `/tasks`                  | Break into implementation tasks | After plan approved      |
| 4   | design                 | `/design`                 | Create technical design         | For complex features     |
| 5   | implement              | `/implement`              | Write code and tests            | During development       |
| 6   | review                 | `/review`                 | Quality gate & verification     | After implementation     |
| 7   | analyze                | `/analyze`                | Investigate problems            | When need clarity        |
| 8   | discover               | `/discover`               | Explore existing code           | First time with codebase |
| 9   | architecture           | `/architecture`           | Document system design          | After discovery          |
| 10  | constitution           | `/constitution`           | Define project rules            | Project setup (one-time) |
| 11  | patterns               | `/patterns`               | Document team patterns          | Project setup (one-time) |
| 12  | project-knowledge-base | `/project-knowledge-base` | Manage project memory           | Ongoing knowledge mgmt   |
| 13  | promote-to-repo-memory | `/archive`                | Archive learnings               | After discoveries        |

---

## Agents by Category

### 🎯 Specification & Planning
These agents turn ideas into executable plans.

- **[spec]** — Write detailed feature specifications with requirements
- **[design]** — Create technical architecture and design decisions
- **[plan]** — Plan implementation timeline and milestones
- **[tasks]** — Break plan into concrete implementation tasks

### 💻 Implementation & Delivery
These agents build and verify the code.

- **[implement]** — Write code, tests, and documentation
- **[review]** — Verify implementation matches spec and plan

### 🔍 Discovery & Learning
These agents explore and document systems.

- **[discover]** — Explore existing codebase and structure
- **[architecture]** — Document system design and decisions
- **[analyze]** — Investigate problems and research questions

### 🏗️ Foundation & Setup
These agents establish project parameters.

- **[constitution]** — Define project rules and constraints
- **[patterns]** — Document team conventions and patterns
- **[project-knowledge-base]** — Manage and organize project memory

### 📦 Quality & Knowledge
These agents ensure quality and capture learnings.

- **[spec-review-requirements]** — Review specification quality
- **[promote-to-repo-memory]** — Archive learnings to project memory

---

## Typical Feature Workflow

```
1. /spec                    Create specification
   ↓
2. (Optional) /analyze       Research if needed
   ↓
3. /plan                    Create plan
   ↓
4. (Optional) /design        Design if complex
   ↓
5. /tasks                   Break into tasks
   ↓
6. /implement               Write code
   ↓
7. /review                  Verify quality
   ↓
8. /archive                 Save learnings
```

---

## Detailed Agent Links

- [→ Specification & Planning Agents](details/specification-planning.md)
- [→ Implementation & Delivery Agents](details/implementation-delivery.md)
- [→ Discovery & Learning Agents](details/discovery-learning.md)
- [→ Foundation & Setup Agents](details/foundation-setup.md)
- [→ Quality & Knowledge Agents](details/quality-knowledge.md)

---

## Usage Principles

### Each Agent Has:
- **Clear Input Requirements** — What you provide
- **Defined Output** — What you get back
- **Specific Tools** — What it can do
- **Documented Guardrails** — What it avoids

### How to Use an Agent:
1. **Gather Input** — Provide context, requirements, existing artifacts
2. **Invoke Agent** — Run the agent command
3. **Review Output** — Check artifacts and clarifications
4. **Iterate if Needed** — Run again with refined input
5. **Move Forward** — Use output as input for next agent

### Tips for Better Results:
- **Be Specific** — Vague input → vague output
- **Provide Context** — More context → better decisions
- **Build Incrementally** — Each agent builds on previous
- **Review Outputs** — Don't just accept, validate
- **Archive Learnings** — Use `/archive` to capture insights

---

## Next Steps

- **See agent details:** Pick a category above
- **Learn workflows:** [Workflow Guide](../workflows/README.md)
- **Get started:** [Getting Started Guide](../guides/getting-started.md)
- **Full reference:** [Commands Reference](../reference/commands.md)

---

**Want to dive deep into a specific agent?**
Check the [details/](details/) folder for comprehensive guides to each agent.
