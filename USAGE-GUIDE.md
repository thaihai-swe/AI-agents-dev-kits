# AI Dev Kit: Usage Guide

**Version**: 2.0
**Last updated**: 2026-04-04

> 👈 **Quick overview?** See [README.md](README.md) | **All agents?** See [kit-docs/AGENTS-REFERENCE.md](kit-docs/AGENTS-REFERENCE.md)

---

## Quick Start: Choose Your Path

### Path 1: New Project (Greenfield)

**One-time setup** (1 hour total):
1. `@constitution` → Define project rules
2. `@project-knowledge-base` → Document initial patterns

**Per feature** (6-8 hours):
1. `@spec-requirement` → Write spec
2. `@spec-review-requirements` → Get approval
3. `@spec-design` (optional) → Create technical design
4. `@spec-plan` → Plan implementation
5. `@spec-tasks` → Break into tasks
6. `@spec-implement` → Write code
7. `@spec-review` → Quality gate

**See details**: [Greenfield Workflow](#greenfield-workflow-new-project) below

### Path 2: Existing Project (Brownfield)

**One-time autonomous discovery** (~30 minutes):
1. `@discover-legacy-system "system name"` → Explore codebase
2. `@capture-architecture` → Document design
3. `@promote-to-repo-memory` → Organize findings

**Result**: Project memory populated with gotchas, patterns, architecture

**Then**: Use Greenfield workflow (features now respect project constraints)

**See details**: [Brownfield Workflow](#brownfield-workflow-existing-project) below

### Path 3: Resume Work

1. Check `artifacts/features/<slug>/` for current status
2. Read `memories/repo/*` for project context
3. Run appropriate next agent
4. Continue from last checkpoint

**See details**: [Resuming Multi-Session Work](#resuming-multi-session-work) below

---

## Greenfield Workflow (New Project)

### Setup Phase: One-Time (30 minutes)

**Step 1: Constitution Agent** (15 min)
```
@constitution
```
Creates: `memories/repo/constitution.md` with project rules

**Step 2: Project Knowledge Base** (15 min)
```
@project-knowledge-base
```
Creates: `memories/repo/project-knowledge-base.md` with team patterns

### Feature Workflow: Per Feature (6-8 hours)

**Step 1: Spec** (45-90 min)
```
@spec-requirement "Add [feature]"
```
Output: `spec.md` with requirements and AC

**Step 2: Spec Review** (15-30 min)
```
@spec-review-requirements <slug>
```
Output: Approval or feedback

**Step 3: Design** (1-2 hours, optional)
```
@spec-design <slug>
```
Output: `design.md` for complex features

**Step 4: Plan** (1-2 hours)
```
@spec-plan <slug>
```
Output: `plan.md` with phases and timeline

**Step 5: Tasks** (1-2 hours)
```
@spec-tasks <slug>
```
Output: `tasks.md` with task breakdown (TASK-001...)

**Step 6: Implement** (2-4 hours per task)
```
@spec-implement <slug>
```
Output: Code, tests, traceability

**Step 7: Review** (30-60 min)
```
@spec-review <slug>
```
Output: Final approval before merge

### Timeline Summary

- Setup: 30 min (one-time)
- Per feature: 6-8 hours total
- Knowledge reused across features

---

## Brownfield Workflow (Existing Project)

### Phase 1: Discovery (Autonomous, ~30 min)

**Step 1: Explore**
```
@discover-legacy-system "auth system"
```
Output: `/memories/session/investigation-notes.md`

**Step 2: Document**
```
@capture-architecture
```
Output: `/memories/repo/architecture-decisions.md`

**Step 3: Promote**
```
@promote-to-repo-memory
```
Output: Updated `/memories/repo/` with gotchas and patterns

### Phase 2: Features (Follow Greenfield workflow)

With memory populated:
- Spec respects project constraints
- Gotchas known and avoided
- Integration points identified
- Knowledge compounds with each feature

---

## Resuming Multi-Session Work

1. Check task status: `artifacts/features/<slug>/tasks.md`
2. Read project memory: `/memories/repo/*`
3. Resume from last checkpoint
4. Knowledge persists across sessions

---

## Working with Agents

### Each Agent's Purpose

| Agent                      | Input        | Output            | When           | Autonomy     |
| -------------------------- | ------------ | ----------------- | -------------- | ------------ |
| `constitution`             | Team input   | constitution.md   | Setup          | Interactive  |
| `project-knowledge-base`   | Patterns     | knowledge-base.md | Setup          | Interactive  |
| `spec-requirement`         | Feature idea | spec.md           | Start          | Questions    |
| `spec-review-requirements` | spec.md      | Approval          | After spec     | Reviews      |
| `spec-design`              | spec.md      | design.md         | Complex        | Autonomous   |
| `spec-plan`                | spec.md      | plan.md           | Plan           | Autonomous   |
| `spec-tasks`               | plan.md      | tasks.md          | Tasks          | Autonomous   |
| `spec-implement`           | tasks.md     | Code+tests        | Implementation | Autonomous   |
| `spec-review`              | Code         | Feedback          | Review         | Autonomous   |
| `discover-legacy-system`   | Context      | investigation     | Legacy         | 🔥 Autonomous |
| `capture-architecture`     | Context      | arch-decisions    | Design         | 🔥 Autonomous |
| `promote-to-repo-memory`   | Notes        | /memories/repo    | End            | 🔥 Autonomous |


**New agents (🔥) are autonomous**: Less questions, more action. Output ready to use immediately.

### How to Run an Agent

**From Copilot chat** (recommended):
1. Open VS Code Copilot
2. Type: `@<agent-name> [brief context]`
3. Example: `@discover-legacy-system Explore auth system`
4. Agent explores autonomously → Outputs generated files

**Key difference**: Agents don't ask many questions—they explore/generate directly:
- `discover-legacy-system` → Searches code, generates `/memories/session/investigation-notes.md`
- `capture-architecture` → Analyzes codebase, generates `/memories/repo/architecture-decisions.md`
- `promote-to-repo-memory` → Auto-classifies findings, updates all repo files

**From command line** (when CLI exists):
```bash
./scripts/run-agent discover-legacy-system "auth system"
```

---

## Memory System

### Where Knowledge Lives

```
/memories/
├── user/                # Your preferences (across all projects)
├── session/             # This conversation only
└── repo/                # This project's durable knowledge
    ├── constitution.md
    ├── project-knowledge-base.md
    ├── legacy-system-watchouts.md
    ├── architecture-decisions.md
    └── integration-points.md
```

### Reading Memory

**Before creating any feature**:

```bash
# Quick scan
cat memories/repo/legacy-system-watchouts.md
cat memories/repo/integration-points.md

# Deep dive
cat memories/repo/architecture-decisions.md
cat memories/repo/project-knowledge-base.md
```

**What each tells you**:

- `legacy-system-watchouts.md` → "What could go wrong?"
- `integration-points.md` → "Where does my feature go?"
- `architecture-decisions.md` → "Why is it built this way?"
- `project-knowledge-base.md` → "What patterns should I follow?"
- `constitution.md` → "What rules must I follow?"

### Writing to Memory

**During session**:
- Capture findings to `/memories/session/investigation-notes.md`

**End of session**:
1. Review findings
2. Promote to `/memories/repo/` via `promote-to-repo-memory.agent.md`

**To promote finding manually**:
1. Open `/memories/repo/legacy-system-watchouts.md`
2. Add new gotcha section
3. Include: status, confidence, impact, solution
4. Commit and push

---

## File Templates

### For Features

All feature files go in: `artifacts/features/<feature-slug>/`

**Required files**:
- `spec.md` — What to build
- `plan.md` — How to build it
- `tasks.md` — Work breakdown

**Optional files**:
- `design.md` — Architecture for complex features
- `decision-log.md` — Decisions made during implementation
- `legacy-context.md` — How this integrates with existing code

### For Knowledge

**Feature-specific knowledge**: `artifacts/features/<feature>/legacy-context.md`

**Project-wide knowledge**: `/memories/repo/<topic>.md`

### Templates Available

Browse: `.github/specs/templates/`

```
├── spec-template.md
├── plan-template.md
├── tasks-template.md
├── design-template.md
├── requirements-review-template.md
├── constitution-template.md
├── project-knowledge-base-template.md
├── legacy-context-template.md
├── legacy-system-watchouts-template.md
├── architecture-decisions-template.md
└── integration-points-template.md
```

---

## Traceability IDs

The kit uses IDs to track requirements through implementation:

- **REQ-*** → Requirement (from spec.md)
  - REQ-FN-001 → Functional requirement
  - REQ-NF-001 → Non-functional requirement

- **AC-*** → Acceptance criterion (from spec.md)

- **TASK-*** → Implementation task (from tasks.md)

- **RISK-*** → Risk (from spec.md or plan.md)

- **Q-*** → Open question

### How to Use IDs

1. **Spec**: Define REQ-FN-001, AC-001, RISK-001
2. **Plan**: Trace RISK-001 → Mitigation strategy
3. **Tasks**: Each task maps to AC-001, TASK-001
4. **Commit**: `TASK-001: AC-001 - Implement...`
5. **Code comment**: `// REQ-FN-001: ...`

---

## Multi-Session Features

### Session Notes (Temporary)

During session, keep notes in:
- `/memories/session/work-plan.md` — What we're doing
- `/memories/session/investigation-notes.md` — What we learned
- `/memories/session/blockers.md` — What's stopping us

Delete before session ends (move to repo memory via promote agent).

---

## Brownfield / Legacy System Work

### Discovery Phase

```
1. Run: discover-legacy-system.agent.md
   → Explore existing code
   → Find gotchas
   → Identify integration points

2. Output: /memories/session/investigation-notes.md

3. Run: capture-architecture.agent.md
   → Document design decisions

4. Run: promote-to-repo-memory.agent.md
   → Move findings to repo memory
```

### After Discovery

All future features for this system:
- Read `/memories/repo/legacy-system-watchouts.md` first
- Read `/memories/repo/integration-points.md` first
- Design respects known gotchas
- Implementation handles constraints

---

## Best Practices

### ✅ Do

- **Read memory before specs**: Shapes better specifications
- **Promote findings regularly**: Helps future teammates
- **Document gotchas**: Even "weird" things are valuable
- **Update integration points**: As system grows
- **Link to memory in specs**: "See gotcha: Session format"
- **Use IDs consistently**: REQ → AC → TASK → CODE
- **Checkpoint between sessions**: Enable quick resume
- **Archive old checkpoints**: Keep recent ones, archive yearly

### ❌ Don't

- **Ignore warnings in legacy-system-watchouts**: They're there for a reason
- **Assume integration points haven't changed**: Verify with architecture team
- **Skip memory reads**: Costs you time later
- **Leave session notes in memory**: Clean up (promote or delete)
- **Add every thought to repo memory**: Only stable, durable knowledge
- **Treat memory as immutable**: Update when facts change (with date)
- **Forget traceability IDs**: They connect spec to code
- **Over-document**: Brief is better; link to source code if need detail

---

## Common Workflows

### Fast Path: Add Feature to Known System

```
Step 1: Agent retrieves context (you don't read manually)
  → @spec-requirement Add user profile feature
  → Agent reads: /memories/repo/* automatically
  → Spec includes gotchas, integration points

Step 2: Design & plan
  → @spec-plan
  → @spec-tasks

Step 3: Implement
  → Code with gotchas in mind
  → Update repo memory if new discoveries

Step 4: Review & merge
  → @spec-review
```

### First Time: Explore New Codebase

```
Step 1: Autonomous discovery (5-10 min)
  → @discover-legacy-system Map the auth system
  → Agent autonomously explores code
  → Output: /memories/session/investigation-notes.md with 5+ gotchas

Step 2: Capture architecture (5-10 min)
  → @capture-architecture
  → Agent infers from code structure
  → Output: /memories/repo/architecture-decisions.md (filled)

Step 3: Promote findings (2-5 min)
  → @promote-to-repo-memory
  → Agent auto-classifies HIGH/MEDIUM confidence
  → Output: Updated legacy-system-watchouts.md, integration-points.md

Step 4: Now use normal workflow
  → All future specs respect discovered constraints
  → Team knowledge persists across sessions
```

**Total discovery time**: ~15-30 min vs ~3-5 hours manual exploration

### Adding a Feature to Existing System

```
Step 1: Read memory
  → cat memories/repo/legacy-system-watchouts.md
  → cat memories/repo/integration-points.md

Step 2: Create spec (informed by memory)
  → @spec-requirement Add user profile feature
  → Reference gotchas: "Must respect session key format"
  → Reference integration: "Hooks at src/routes/users.ts"

Step 3: Design & plan
  → @spec-plan
  → @spec-tasks

Step 4: Implement (1+ sessions)
  → Session N: Implement, discover new gotcha
  → Update repo memory with findings

Step 5: Review & merge
  → @spec-review
  → Ensure gotchas handled
```

### Exploring New Codebase

```
Step 1: Autonomous discovery (autonomous, minimal input needed)
  → @discover-legacy-system Map the auth system
  → Agent explores code, finds gotchas, maps architecture
  → Output: /memories/session/investigation-notes.md (filled)

Step 2: Capture architecture
  → @capture-architecture
  → Agent infers from code structure
  → Output: /memories/repo/architecture-decisions.md (filled)

Step 3: Promote findings
  → @promote-to-repo-memory
  → Agent auto-classifies HIGH/MEDIUM, organizes
  → Updates: legacy-system-watchouts.md, integration-points.md

Step 4: Future work
  → All specs read repo memory
  → Design respects discovered constraints
```

### Multi-Week Feature

```
Session 1 (6 hours)
  → @spec-requirement
  → Phase 1 implementation
  → End: @promote-to-repo-memory (auto-save new findings)

Session 2 (6 hours)
  → Agent automatically reads repo memory for context
  → Phase 2 implementation
  → End: @promote-to-repo-memory (new discoveries added)

Session 3 (8 hours)
  → Agent automatically reads repo memory for context
  → Phase 3 implementation
  → End: @promote-to-repo-memory (findings added)

Session 4 (4 hours)
  → Final review with memory context
  → @spec-review → Merge

**Benefit**: Each session builds on previous discoveries, no context rediscovery
```

---

## Troubleshooting

### "I don't know where to start"

1. Check `/memories/repo/` for project knowledge
2. Check `/memories/repo/integration-points.md` for where features go
3. If new project: Use `spec-requirement.agent.md`
4. If existing project: Use `discover-legacy-system.agent.md` first

### "This system is too complex"

1. Read `/memories/repo/architecture-decisions.md`
2. Run: `discover-legacy-system.agent.md` to map it
3. Ask: "What are the 3 most important components?"
4. Document findings to repo memory

### "I keep hitting the same gotcha"

1. Check: Is it in `/memories/repo/legacy-system-watchouts.md`?
2. If yes, read more carefully
3. If no, add it (help future teammates)
5. Promote it so other features avoid it

### "How do I know what to implement?"

1. Read: `artifacts/features/<feature>/tasks.md`
2. Pick: Next incomplete task
3. Read: Task requirements (AC-*)
4. Check: Any gotchas related to this task?
5. Implement: Make tests pass

### "I finished but forgot where to save it"

1. Check: `artifacts/features/<feature>/decision-log.md`
2. Save findings there
3. At session end, promote to repo memory

---

## What's Next

### Kit Improvements (Roadmap)

- [ ] CLI tool (`./kit` commands)
- [ ] Extension framework (community contributions)
- [ ] Health checks (git quality gates)
- [ ] Prompts directory (starter examples)
- [ ] Quality gates (auto-check against spec)
- [ ] Agent auto-detection

### For Your Project

1. **Week 1**: Initialize repository memory
   - Run discovery agents
   - Promote findings

2. **Week 2+**: Use kit for features
   - All new work follows kit process
   - Knowledge compounds over time

3. **Month 1**: Refine templates
   - See what works
   - Customize for your project

4. **Month 2+**: Team adoption
   - Onboard teammates
   - Scale shared knowledge

---

## Links & References

| Document                                                                   | Purpose                  | When to Read              |
| -------------------------------------------------------------------------- | ------------------------ | ------------------------- |
| [memories/README.md](memories/README.md)                                   | Memory system overview   | First time setup          |
| [memories/repo/constitution.md](memories/repo/constitution.md)                       | Project rules            | Before designing features |
| [memories/repo/project-knowledge-base.md](memories/repo/project-knowledge-base.md)   | Project patterns         | Before implementing       |
| [memories/repo/legacy-system-watchouts.md](memories/repo/legacy-system-watchouts.md) | Gotchas in existing code | Before specs (brownfield) |
| [memories/repo/architecture-decisions.md](memories/repo/architecture-decisions.md)   | Why it's built this way  | Before designing          |
| [memories/repo/integration-points.md](memories/repo/integration-points.md)           | Where features connect   | Before specs              |
| [.github/agents/](/.github/agents/)                                        | All agent guides         | When running agents       |
| [.github/specs/templates/](/.github/specs/templates/)                      | All templates            | When creating artifacts   |

---

## Questions?

If this guide is unclear:

1. Check the agent guides (they have detailed examples)
2. Read the templates (they show expected output)
3. Look at existing artifacts in `artifacts/features/`
4. Ask the team (document the answer in repo memory)

---

## Version History

| Version | Date       | Changes                            |
| ------- | ---------- | ---------------------------------- |
| 1.0     | 2024-04-03 | Initial release with memory system |
