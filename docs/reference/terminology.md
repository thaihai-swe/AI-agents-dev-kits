# Terminology

**Key terms and concepts in the AI Development Kit.**

---

## Core Concepts

### Agent
An AI assistant specialized for one task. There are 13 agents, each with a specific purpose.

**Example:** `/spec` agent writes specifications, `/implement` agent writes code.

### Command
The slash command to invoke an agent.

**Example:** `/spec`, `/plan`, `/implement`

---

## Specification & Planning

### Specification (Spec)
A detailed document defining what will be built:
- Problem statement
- Functional requirements
- Non-functional requirements
- Acceptance criteria
- Constraints and risks

**Result:** `artifacts/features/<slug>/spec.md`

### Design
A technical architecture document for complex features:
- Technical approach
- Architecture decisions
- Data model
- API design
- Integration points

**Result:** `artifacts/features/<slug>/design.md`

### Plan
An implementation roadmap:
- Phases of work
- Milestones
- Timeline estimates
- Risk analysis
- Success criteria

**Result:** `artifacts/features/<slug>/plan.md`

### Task
A concrete work item (2-4 hours typically):
- Specific thing to implement
- Dependencies (what must come first)
- Completion criteria
- Effort estimate

**Result:** `artifacts/features/<slug>/tasks.md`

---

## Implementation

### Implementation
The code, tests, and documentation for a feature.

**Result:** Code in `src/`, tests in `tests/`, updated docs

### Code Review / Review
Verification that implementation matches spec and plan.

**Result:** Review report with findings and recommendations

### Acceptance Criteria
Testable criteria that define when a feature is complete.

**Example:** "Dashboard loads in < 2 seconds", "Supports all 5 activity types"

---

## Discovery & Learning

### Discovery
The process of exploring and understanding an existing codebase.

**Result:** Architecture understanding, patterns identified, gotchas noted

### Gotcha
A tricky aspect or pitfall to watch for.

**Example:** "Auth token expiration isn't checked on API requests"

### Pattern
A recurring approach or practice.

**Example:** "We use async/await for all async operations"

### Architecture
The structure and design of a system.

**Result:** `artifacts/architecture.md` or saved to project memory

---

### Knowledge Base / Project Memory
Accumulated learnings and best practices for the project.

**Saved via:** `/archive` command

---

## Foundation

### Constitution
Project rules and constraints that must be followed.

**Example:** "All code must have >80% test coverage"

**Result:** `artifacts/constitution.md`

### Patterns
Team conventions and usual practices.

**Example:** "We usually use React hooks, not class components"

**Result:** `artifacts/patterns.md`

---

## Quality & Verification

### Definition of Ready
Checklist of items needed before starting work.

**Example:** "Spec approved, plan created, tasks defined"

### Definition of Done
Checklist of items needed to consider work complete.

**Example:** "Code written, tests > 80%, review passed, documented"

### Coverage
Percentage of code covered by tests.

**Example:** "85% test coverage"

### Technical Debt
Code that's not ideal but functional. Usually created to go fast.

**Example:** "This function is a bit hacky, should refactor later"

---

## Workflow Terms

### Greenfield
Starting a new project from scratch.

**Workflow:** `/constitution` → `/patterns` → feature workflow

### Brownfield
Working with existing code or legacy system.

**Workflow:** `/discover` → `/architecture` → feature workflow

### Feature Workflow
The standard process for building a feature.

**Steps:** `/spec` → `/plan` → `/tasks` → `/implement` → `/review`

### Sprint
A time-boxed period of work (usually 1-2 weeks).

---

## Memory System

### Memory
Persistent knowledge that survives across conversations.

**Three tiers:** User, Session, Repo

### User Memory
Personal preferences and learnings (survives all workspaces).

**Storage:** `/memories/`

### Session Memory
Task-specific notes (current conversation only).

**Storage:** `/memories/session/`

### Repo Memory
Team knowledge (this project, visible to all).

**Storage:** `/memories/repo/` or accessed via `/project-knowledge-base`

### Archive
The act of saving learnings to project memory.

**Command:** `/archive`

---

## Testing

### Unit Test
Test of a single function or class in isolation.

**Example:** Testing that `validateEmail()` correctly validates emails

### Integration Test
Test of multiple components working together.

**Example:** Testing that login flow works: form → API → database → response

### End-to-End Test (E2E)
Test of complete user workflow.

**Example:** Testing full user journey: sign up → login → create profile → logout

### Mock
A fake object used in tests to simulate dependencies.

**Example:** Mock database that returns test data

---

## Artifacts

### Artifacts
Project files and outputs from agents.

**Location:** `artifacts/` folder

### Feature Artifact
All files related to one feature.

**Location:** `artifacts/features/<slug>/`

**Contents:**
- `spec.md` — Specification
- `design.md` — Technical design (optional)
- `plan.md` — Implementation plan
- `tasks.md` — Task list
- `implementation/` — Implementation artifacts
- `tests/` — Test artifacts

---

## Miscellaneous

### Blocker
Something preventing work from proceeding.

**Example:** "Can't implement until database schema is designed"

### Milestone
A checkpoint or significant point in a plan.

**Example:** "API endpoints complete", "Frontend prototype ready"

### Rework
Work that has to be done again because it was done incorrectly.

**Goal:** Minimize rework (hence planning helps!)

### Performance Optimization
Making something faster.

**Focus:** Profile first, optimize smart

### Non-functional Requirement
Requirement about how something works (not what it does).

**Example:** "Must load in < 2 seconds", "Must support 10k concurrent users"

### Scalability
How well something handles growth.

**Example:** "System scales to 100k users"

---

## Related Concepts

### Continuous Integration (CI)
Automatic testing and building on every code change.

**Result:** Catch issues early

### Continuous Deployment (CD)
Automatic deployment of passing code to production.

**Result:** Fast feedback, frequent releases

### Code Style / Linting
Enforcing consistent code formatting and conventions.

**Result:** Readable, maintainable code

### Type Safety
Using type systems (TypeScript, etc.) to catch errors at compile time.

**Result:** Fewer bugs, better IDE support

---

## Acronyms

| Acronym | Meaning                                        |
| ------- | ---------------------------------------------- |
| API     | Application Programming Interface              |
| CI/CD   | Continuous Integration / Continuous Deployment |
| CRUD    | Create, Read, Update, Delete                   |
| DTO     | Data Transfer Object                           |
| E2E     | End-to-End                                     |
| JWT     | JSON Web Token                                 |
| MVC     | Model-View-Controller                          |
| ORM     | Object-Relational Mapping                      |
| REST    | Representational State Transfer                |
| UI/UX   | User Interface / User Experience               |
| QA      | Quality Assurance                              |
| RCA     | Root Cause Analysis                            |

---

## Index by Category

**Agents & Commands:** Agent, Command, `/spec`, `/plan`, `/tasks`, `/implement`, `/review`, `/analyze`, `/discover`, `/architecture`, `/constitution`, `/patterns`, `/archive`

**Planning:** Specification, Design, Plan, Task, Acceptance Criteria

**Development:** Implementation, Code Review, Unit Test, Integration Test, E2E Test, Mock

**Quality:** Definition of Ready, Definition of Done, Coverage, Technical Debt

**System:** Architecture, Pattern, Gotcha, Performance Optimization, Scalability

**Memory:** Memory, User Memory, Session Memory, Repo Memory, Archive

**Workflow:** Feature Workflow, Greenfield, Brownfield, Sprint, Milestone

---

## Need Help?

- **Still confused?** See [FAQ](faq.md)
- **Want examples?** See [Getting Started](../guides/getting-started.md)
- **Ready to use?** See [Commands Reference](commands.md)

---

**Remember:** These terms describe a process that helps you build better software faster.
