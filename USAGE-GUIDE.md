# AI Dev Kit: Usage Guide

**Version**: 1.0
**Last updated**: 2024-04-03

> 👈 **Start here instead?** See [README.md](README.md) for kit overview and navigation

---

## Quick Start

### First Time Using the Kit

1. **Read**: `.github/agents/spec-requirement.agent.md`
   - Learn how to create feature specs

2. **Read**: `memories/README.md`
   - Understand the memory system (where knowledge lives)

3. **Create**: Your first feature specification
   - Use: `.github/specs/templates/spec-template.md`
   - Run: Agent `spec-requirement.agent.md`

### If Working on Existing Project (Brownfield)

1. **Explore**: Use agent `discover-legacy-system.agent.md`
   - Maps existing code
   - Finds gotchas
   - Documents integration points

2. **Promote**: Use agent `promote-to-repo-memory.agent.md`
   - Move findings to `/memories/repo/`
   - Build institutional knowledge

3. **Read**: Memory files before creating specs
   - `/memories/repo/legacy-system-watchouts.md` → What to avoid
   - `/memories/repo/integration-points.md` → Where to connect
   - `/memories/repo/architecture-decisions.md` → Why it's built this way

---

## The Dev Kit Workflow

### For Greenfield (New Project)

```
1. spec-requirement.agent.md
   → Create feature spec (spec.md)
   → All AC, REQ, RISK defined

2. spec-review-requirements.agent.md
   → Review spec for quality
   → Approve or request changes

3. spec-plan.agent.md
   → Create implementation plan (plan.md)
   → Phases, risks, validation

4. spec-tasks.agent.md
   → Break into tasks (tasks.md)
   → Per-task AC, dependencies

5. (Git branch: feature/name)

6. spec-implement.agent.md
   → Implement tasks
   → Maintain traceability (link specs to code)

7. spec-review.agent.md
   → Review against spec
   → Quality gate before merge

8. (Merge to main)
```

### For Brownfield (Existing Project)

**Phase 1: Discovery (Autonomous)**
```
1. @discover-legacy-system "Map [system name]"
   → Outputs: /memories/session/investigation-notes.md
   → Agent finds: gotchas, architecture, patterns

2. @capture-architecture "Document architecture"
   → Outputs: /memories/repo/architecture-decisions.md
   → Agent infers: why built this way, trade-offs, constraints

3. @promote-to-repo-memory
   → Outputs: Updated /memories/repo/legacy-system-watchouts.md
   →          Updated /memories/repo/integration-points.md
   → Agent: Auto-classifies findings by confidence, organizes
```

**Phase 2: Feature Development (Now informed by memory)**
```
4. @spec-requirement "Add [feature]"
   → Agent reads repo memory first
   → Respects gotchas, integration points, patterns
   → Outputs: artifacts/features/[feature]/spec.md

5. @spec-review-requirements
   → Review spec for quality

6. @spec-plan
   → Design implementation respecting memory
   → Call out integration points

7. @spec-tasks
   → Break into tasks

8. @spec-implement
   → Implement with gotchas in mind
   → Reference architecture decisions

9. @spec-review
   → Quality gate
   → Verify gotchas handled

10. (Merge)
```

**Result**: Faster onboarding + fewer gotcha surprises

---

## Working with Agents

### Each Agent's Purpose

| Agent                      | Input                 | Output                 | When                  | Autonomy                                                          |
| -------------------------- | --------------------- | ---------------------- | --------------------- | ----------------------------------------------------------------- |
| `spec-requirement`         | Feature idea          | spec.md                | Start of feature      | Asks clarifying Qs                                                |
| `spec-review-requirements` | spec.md               | Approval/feedback      | After spec written    | Reviews & approves                                                |
| `spec-design`              | spec.md               | design.md              | Complex features      | Designs autonomously                                              |
| `spec-plan`                | spec.md + design.md   | plan.md                | Ready to implement    | Plans autonomously                                                |
| `spec-tasks`               | plan.md               | tasks.md               | Ready to break down   | Breaks down tasks                                                 |
| `spec-implement`           | tasks.md              | Code + commits         | During implementation | Implements & tests                                                |
| `spec-review`              | Implementation        | Quality feedback       | Before merge          | Reviews against spec                                              |
| `discover-legacy-system`   | (brief context)       | investigation-notes    | First with legacy     | **🔥 Autonomous**: Searches code, finds gotchas, maps architecture |
| `capture-architecture`     | (optional validation) | architecture-decisions | After discovery       | **🔥 Autonomous**: Infers from code, generates filled doc          |
| `promote-to-repo-memory`   | Session notes         | Updated repo files     | End of session        | **🔥 Autonomous**: Classifies, promotes, organizes                 |

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
└── /memories/repo/      # This project's knowledge
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
cat memories/legacy-system-watchouts.md
cat memories/integration-points.md

# Deep dive
cat memories/architecture-decisions.md
cat memories/project-knowledge-base.md
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
  → cat memories/legacy-system-watchouts.md
  → cat memories/integration-points.md

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
| [memories/constitution.md](memories/constitution.md)                       | Project rules            | Before designing features |
| [memories/project-knowledge-base.md](memories/project-knowledge-base.md)   | Project patterns         | Before implementing       |
| [memories/legacy-system-watchouts.md](memories/legacy-system-watchouts.md) | Gotchas in existing code | Before specs (brownfield) |
| [memories/architecture-decisions.md](memories/architecture-decisions.md)   | Why it's built this way  | Before designing          |
| [memories/integration-points.md](memories/integration-points.md)           | Where features connect   | Before specs              |
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
