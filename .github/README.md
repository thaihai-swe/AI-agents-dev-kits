# GitHub Dev Kit: Complete Structure

This directory contains the AI-assisted development kit - a structured system of agents, prompts, templates, and guidance for collaborative code delivery.

## Folder Organization

### `/agents/`
**Purpose**: Agent definitions for different workflow phases

Contains 12 agents organized into three categories:

**Workflow Agents** (primary delivery pipeline):
- `spec-requirement.md` - Define feature specifications
- `spec-design.md` - Create technical designs
- `spec-plan.md` - Build implementation plans
- `spec-tasks.md` - Break down into execution tasks
- `spec-implement.md` - Execute implementation
- `spec-review.md` - Verify feature completion
- `spec-review-requirements.md` - Review against original spec

**Discovery Agents** (understand existing systems):
- `discover-legacy-system.md` - Explore brownfield codebases
- `capture-architecture.md` - Document system architecture
- `promote-to-repo-memory.md` - Archive learnings as durable memory

**Foundation Agents** (establish project guardrails):
- `constitution.md` - Define project principles/guardrails
- `project-knowledge-base.md` - Build reusable patterns library

### `/prompts/`
**Purpose**: Slash commands and agent activation

Contains 12 simple prompt files that map commands to agents.

**Structure**: Single-line agent references
```
agent: 'agent-name'
```

**Usage**:
- Type `/spec` → activates spec-requirement agent
- Type `/design` → activates spec-design agent
- Type `/plan` → activates spec-plan agent
- (etc for all 12 agents)

See [prompts/README.md](prompts/README.md) for complete command reference.

### `/specs/`
**Purpose**: Reusable templates and checklists

**templates/** - 11 canonical templates:
- Requirements and specification templates
- Design and architecture templates
- Planning and execution templates
- Review and reflection templates
- Knowledge base templates

**checklists/** - Quality gates:
- `definition-of-ready.md` - Pre-work validation
- `definition-of-done.md` - Completion criteria

### `/instructions/`
**Purpose**: Rules, guidance, and operational procedures

#### `copilot-instructions.md`
Main rulebook for AI interaction:
- Agent activation patterns
- Tool capabilities and restrictions
- Response formatting guidelines
- Specialized modes (ANALYZE, DESIGN, PLAN, IMPLEMENT, REFLECT)
- Memory system overview

#### `local/`
**Purpose**: Project-specific customizations

Add your own instruction files here to override or extend kit defaults:
```
local/
  ├── custom-agent.md       (project-specific agent)
  ├── team-conventions.md   (team coding standards)
  └── local-contexts.md     (project-specific contexts)
```



---

## How to Use This Kit

### 1. Start with a Problem
```
/spec "Users can't find completed tasks"
```
The spec-requirement agent helps you define what you're building.

### 1.5. Investigate (If Needed)
```
/analyze "Why are users missing completed tasks?"
```
Use `/analyze` when you need to investigate bugs, research requirements, or explore options before writing a spec.

### 2. Design a Solution
```
/design "Real-time task status updates"
```
The spec-design agent creates architectural and design decisions.

### 3. Plan the Work
```
/plan "Get this ready for sprint"
```
The spec-plan agent sequences the work and identifies risks.

### 4. Create Task List
```
/tasks
```
The spec-tasks agent breaks work into trackable tasks.

### 5. Execute & Review
```
/review
```
Verify the implementation matches your original spec.

### 6. Archive Learnings
```
/archive
```
Promote key insights to repository memory for future reference.

---

## Agent Reference

| Agent                    | Command               | Purpose                       |
| ------------------------ | --------------------- | ----------------------------- |
| spec-requirement         | `/spec`               | Define feature requirements   |
| analyze                  | `/analyze`            | Investigate problems/research |
| spec-design              | `/design`             | Create technical design       |
| spec-plan                | `/plan`               | Build implementation plan     |
| spec-tasks               | `/tasks`              | Generate task list            |
| spec-implement           | `/implement`          | Execute implementation        |
| spec-review              | `/review`             | Verify completion             |
| spec-review-requirements | `/requirement-review` | Review against spec           |
| constitution             | `/constitution`       | Define project principles     |
| project-knowledge-base   | `/patterns`           | Build patterns library        |
| discover-legacy-system   | `/discover`           | Understand existing code      |
| capture-architecture     | `/architecture`       | Document architecture         |
| promote-to-repo-memory   | `/archive`            | Archive to memory             |

---

## Memory System

The kit uses a three-tier memory system:

**User Memory** (`/memories/user/`)
- Persistent across all projects
- Your personal preferences and learnings
- Example: "I prefer type-first designs"

**Session Memory** (`/memories/session/`)
- Current conversation only
- Task-specific context and notes
- Example: "Current sprint focuses on performance"

**Repository Memory** (`/memories/repo/`)
- Project-specific knowledge
- Reusable patterns and conventions
- Example: "This project uses React + TypeScript + Tailwind"

---

---

## Visual Workflow Maps

For workflow navigation and visual guidance, see `/visual-maps/` at the workspace root:
- `mode-discovery.md` - Decision tree for choosing workflow mode
- `workflow-analyze.md` - ANALYZE phase flowchart
- `workflow-design.md` - DESIGN phase flowchart
- `workflow-plan.md` - PLAN phase flowchart
- `workflow-implement.md` - IMPLEMENT phase flowchart
- `workflow-reflect.md` - REFLECT phase flowchart

---

## Customization

### Add Project-Specific Rules
Create `.github/instructions/local/README.md` describing your customizations.

### Create Custom Agents
Add agent files to `/agents/` and corresponding prompt files to `/prompts/`.

### Override Templates
Copy any template from `specs/templates/` to `local/` folder and customize.

---

## Quick Reference

- **Starting work?** → Run `/spec` to define requirements
- **Need design input?** → Run `/design` to explore solutions
- **Ready to build?** → Run `/plan` then `/tasks`
- **Learn existing patterns?** → Run `/discover` or `/architecture`
- **Save for later?** → Run `/archive` to save to repository memory

See [copilot-instructions.md](instructions/copilot-instructions.md) for detailed configuration and rules.
