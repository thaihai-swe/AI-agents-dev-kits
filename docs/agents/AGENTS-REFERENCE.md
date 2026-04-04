# Agent Command Reference

**How to invoke each of the 13 agents.**

---

## Invoking Agents

All agents are invoked using slash commands in the chat. The basic format is:

```
/agent-name [your-instructions-here]
```

For example:
```
/spec Build a user authentication system with email and password
/plan
/tasks
/implement
```

---

## All 13 Commands

### Planning Agents

#### 1. `/spec` — Create Feature Specification
**Agent:** spec-requirement
**Purpose:** Create detailed specification from a request

```
/spec <brief description of what to build>

Example:
/spec Build a user authentication system with email login, password reset, and session management
```

**Provide:**
- What you want built
- Context about your project
- Any constraints or requirements

**Get:**
- Feature specification
- Requirements and acceptance criteria
- Risks and assumptions
- Open questions

---

#### 2. `/plan` — Create Delivery Plan
**Agent:** spec-plan
**Purpose:** Create implementation plan from approved spec

```
/plan

Example:
/plan
(reads your approved spec and creates delivery plan)
```

**Provide:**
- Approved spec (from `/spec`)
- Any project constraints
- Timeline expectations

**Get:**
- Implementation plan with phases
- Risk analysis
- Timeline and milestones
- Success criteria

---

#### 3. `/tasks` — Create Task List
**Agent:** spec-tasks
**Purpose:** Break plan into concrete implementation tasks

```
/tasks

Example:
/tasks
(breaks plan into implementation tasks)
```

**Provide:**
- Approved plan (from `/plan`)
- Spec context (from `/spec`)

**Get:**
- Task list with sequencing
- Dependencies between tasks
- Estimated effort per task
- Clear completion criteria

---

#### 4. `/design` — Create Technical Design
**Agent:** spec-design
**Purpose:** Design technical architecture for complex features

```
/design

Example:
/design
(creates technical design for your feature)
```

**Provide:**
- Feature spec (from `/spec`)
- Project architecture context
- Technical constraints

**Get:**
- Technical design document
- Architecture decisions
- Data flow diagrams
- API specifications (if applicable)

---

### Implementation Agents

#### 5. `/implement` — Write Code
**Agent:** spec-implement
**Purpose:** Write code, tests, and documentation

```
/implement [task description or file path]

Example:
/implement
/implement Task 1: Build authentication routes
/implement src/auth/login.ts
```

**Provide:**
- Tasks to implement (from `/tasks`)
- Spec and plan context
- Existing codebase patterns
- Any code templates

**Get:**
- Implementation code
- Unit and integration tests
- API documentation
- Comments and docstrings

---

#### 6. `/review` — Quality Gate
**Agent:** spec-review
**Purpose:** Verify implementation matches spec and plan

```
/review

Example:
/review
```

**Provide:**
- Implemented code
- Original spec
- Implementation plan
- Tests

**Get:**
- Review findings
- Coverage analysis
- Gaps and issues
- Recommendations

---

### Discovery Agents

#### 7. `/analyze` — Research & Investigation
**Agent:** analyze
**Purpose:** Investigate problems, research questions

```
/analyze <question or problem description>

Example:
/analyze How do we handle user session expiration?
/analyze Why are API tests failing?
```

**Provide:**
- Your question or problem
- Relevant context
- Existing code (if applicable)

**Get:**
- Systematic analysis
- Evidence and findings
- Root cause analysis
- Recommendations

---

#### 8. `/discover` — Explore Codebase
**Agent:** discover-legacy-system
**Purpose:** Understand existing code structure and patterns

```
/discover [system name or path]

Example:
/discover
/discover authentication system
/discover src/api
```

**Provide:**
- Directory paths to explore
- System boundaries

**Get:**
- Architecture overview
- Key patterns and conventions
- Dependencies
- Gotchas and warnings

---

#### 9. `/architecture` — Document System Design
**Agent:** capture-architecture
**Purpose:** Document system design and decisions

```
/architecture

Example:
/architecture
```

**Provide:**
- Findings from `/discover`
- System components
- Design decisions

**Get:**
- Architecture document
- Component diagrams
- Design rationale
- Integration points

---

### Foundation Agents

#### 10. `/constitution` — Define Project Rules
**Agent:** constitution
**Purpose:** Define project guardrails and rules

```
/constitution [project context]

Example:
/constitution
/constitution We're building a TypeScript/React SaaS app
```

**Provide:**
- Project type and context
- Team size and experience
- Key constraints
- Non-negotiable rules

**Get:**
- Project constitution
- Must-follow rules
- Team guidelines
- Review process standards

---

#### 11. `/patterns` — Document Team Patterns
**Agent:** project-knowledge-base
**Purpose:** Document team conventions and patterns

```
/patterns [pattern type or context]

Example:
/patterns
/patterns naming conventions
/patterns testing patterns
```

**Provide:**
- Examples of team patterns
- Code samples
- Existing conventions

**Get:**
- Pattern documentation
- Code examples
- When to use patterns
- Exceptions and variations

---

#### 12. `/project-knowledge-base` — Manage Knowledge
**Agent:** project-knowledge-base
**Purpose:** View and manage project memory

```
/project-knowledge-base

Example:
/project-knowledge-base
```

**Provide:**
- Query or topic

**Get:**
- Relevant project knowledge
- Accumulated learnings
- Patterns and conventions

---

### Quality & Archive Agents

#### 13. `/archive` — Save Learnings
**Agent:** promote-to-repo-memory
**Purpose:** Archive findings to project memory

```
/archive <topic or finding description>

Example:
/archive
/archive Authentication flow decisions
/archive Performance optimization patterns
```

**Provide:**
- Key findings to save
- Context about learnings
- Why it matters

**Get:**
- Archived knowledge in project memory
- Confirmation of what was saved
- How to retrieve later

---

## Command Sequences

### Build a Complete Feature
```
/spec                    Create specification
/plan                    Create plan
/tasks                   Create tasks
/implement               Write code
/review                  Verify quality
/archive                 Save learnings
```

### Understand Existing System
```
/discover                Explore code
/architecture            Document design
/analyze [question]      Research topics
/archive                 Save findings
```

### Setup New Project (One-time)
```
/constitution            Define rules
/patterns                Document patterns
```

### When Stuck
```
/analyze [problem]       Investigate
/discover [area]         Explore
/archive [finding]       Save result
```

---

## Tips for Using Commands

1. **Read agent output carefully** — Agents are thorough, don't skim
2. **Provide context** — More context = better results
3. **Use in sequence** — Each command builds on previous outputs
4. **Archive regularly** — Save learnings while fresh
5. **Review before accepting** — Validate agent outputs
6. **Ask follow-up questions** — Run agents again with refined input

---

## Need Help?

- **Agent not working well?** Try `/analyze` to break down the problem
- **Unsure which command?** See [Workflow Guide](../workflows/README.md)
- **Want agent details?** See [Agents Explained](README.md)
- **Have questions?** Check [FAQ](../reference/faq.md)

---

**Pro Tip:** You can run agents multiple times. If the first output isn't quite right, run it again with more specific input.
