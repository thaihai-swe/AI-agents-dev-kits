# Repository Memory System

> 👈 **Back to main docs?** See [README.md](../README.md) | **Using the kit?** See [USAGE-GUIDE.md](../USAGE-GUIDE.md)

**Purpose**: This is where institutional knowledge lives. It persists across sessions, team members, and projects.

---

## Overview

This memory system has **three tiers**, each serving different needs:

| Tier           | Location             | Scope             | Owner   | Lifetime           | Examples                                         |
| -------------- | -------------------- | ----------------- | ------- | ------------------ | ------------------------------------------------ |
| **User**       | `/memories/`         | All your projects | You     | Forever            | Your workflow, debugging techniques, preferences |
| **Session**    | `/memories/session/` | This conversation | Session | Until you clear it | Notes from today's work, current investigation   |
| **Repository** | `/memories/repo/`    | This project      | Team    | Project lifetime   | Architecture decisions, gotchas, patterns        |

---

## Repository Memory (This Folder)

This is your **project's institutional knowledge**. It answers:

- **"Why was it built this way?"** → `architecture-decisions.md`
- **"What gotchas will bite us?"** → `legacy-system-watchouts.md`
- **"Where do features connect?"** → `integration-points.md`
- **"What rules must we follow?"** → `constitution.md` (project rules)
- **"What patterns do we use?"** → `project-knowledge-base.md` (project practices)

### Files in This Repository

📄 **constitution.md**
- Project rules and constraints
- Technical standards
- Non-negotiables
- Fill once at project start

📄 **project-knowledge-base.md**
- Proven patterns
- Naming conventions
- Architecture patterns
- Anti-patterns to avoid
- Update as patterns emerge

📄 **legacy-system-watchouts.md**
- Gotchas discovered in existing code
- Constraints to respect
- Impact of each gotcha
- Solutions/workarounds
- **Template**: [`.github/specs/templates/legacy-system-watchouts-template.md`](./../.github/specs/templates/legacy-system-watchouts-template.md)
- **Started**: During discovery phase (use `discover-legacy-system` agent)
- **Updated**: As new gotchas are discovered

📄 **architecture-decisions.md**
- Why is the system built this way?
- Technology choices and trade-offs
- Design principles
- Scaling assumptions
- **Template**: [`.github/specs/templates/architecture-decisions-template.md`](./../.github/specs/templates/architecture-decisions-template.md)
- **Started**: Fill executive summary first
- **Updated**: Add decisions as you explore the codebase

📄 **integration-points.md**
- Where do new features connect?
- What files typically change?
- What contracts must be respected?
- Gotchas to avoid by component
- **Template**: [`.github/specs/templates/integration-points-template.md`](./../.github/specs/templates/integration-points-template.md)
- **Started**: During discovery phase (use `discover-legacy-system` agent)
- **Updated**: As you learn where new features integrate

---

## How to Use Repository Memory

### Discovering a New System

1. **Explore**: Use `discover-legacy-system.agent.md`
   - Captures findings to `/memories/session/investigation-notes.md`

2. **Document**: Use `capture-architecture.agent.md`
   - Creates `/memories/repo/architecture-decisions.md`

3. **Promote**: Use `promote-to-repo-memory.agent.md`
   - Moves session findings to repo files
   - Updates `legacy-system-watchouts.md`, `integration-points.md`

### Working on a Feature

1. **Read**: Check all repo memory files
   - What gotchas affect us? (legacy-system-watchouts)
   - Where do we connect? (integration-points)
   - What patterns to follow? (project-knowledge-base)

2. **Respect**: Constraints from constitution.md and gotchas

3. **Add**: Document new discoveries to session memory

4. **Promote**: Move findings to repo at end of session

### Multi-Session Features

1. **Session 1 ends**: Promote findings to repo memory

2. **Session 2 starts**:
   - Re-read repo memory (refresh context)
   - Continue work

3. **Session 2 ends**: Promote new findings to repo memory

---

## File Reference

### `constitution.md`
**What**: Project rules (non-negotiable)
**When to create**: Start of project
**Who updates**: Tech lead, architecture team
**Frequency**: Rarely (only major pivots)
**Should contain**:
- Required code style
- Required tests
- Security requirements
- Deployment standards
- Compliance rules

### `project-knowledge-base.md`
**What**: Project patterns and conventions
**When to create**: Start of project
**Who updates**: Team as they discover patterns
**Frequency**: Quarterly
**Should contain**:
- Common design patterns
- Naming conventions
- Error handling patterns
- Configuration approach
- Logging approach
- Known limitations

### `legacy-system-watchouts.md`
**What**: Gotchas in the existing system
**When to create**: After exploring existing code
**Who updates**: Discovery agents, anyone finding gotchas
**Frequency**: As new gotchas discovered
**Should contain**:
- What's the gotcha?
- Why does it matter?
- How to work around it?
- What files are affected?
- Confidence level

### `architecture-decisions.md`
**What**: Why is it built this way?
**When to create**: When onboarding or starting major work
**Who updates**: Architects, discovery agents
**Frequency**: Annually
**Should contain**:
- Technology choices and why
- Trade-offs made
- Design principles
- Scaling assumptions
- Integration patterns
- Revisit triggers

### `integration-points.md`
**What**: Where do new features connect?
**When to create**: After exploring existing system
**Who updates**: Discovery agents, feature teams
**Frequency**: As new integration points discovered
**Should contain**:
- Entry point for new features
- Key files typically modified
- Contracts/constraints
- Gotchas to avoid
- Effort estimates

---

## Workflow: How Memory Flows

### Phase 1: Discovering a New System

```
User: "I need to add SSO to our legacy auth system"
     ↓
Agent: discover-legacy-system.agent.md
     ↓
Output: `/memories/session/investigation-notes.md`
       (Session findings: gotchas, architecture, integration points)
     ↓
Agent: capture-architecture.agent.md
     ↓
Output: `/memories/repo/architecture-decisions.md`
       (Architecture documented)
     ↓
Agent: promote-to-repo-memory.agent.md
     ↓
Output: `/memories/repo/legacy-system-watchouts.md` (updated)
        `/memories/repo/integration-points.md` (updated)
```

### Phase 2: Designing a Feature

```
User: "Create feature spec for SSO"
     ↓
Agent: spec-requirement.agent.md
     ↓
Agent READS:
  - `/memories/repo/legacy-system-watchouts.md` → Avoid these gotchas
  - `/memories/repo/integration-points.md` → Connect here
  - `/memories/repo/architecture-decisions.md` → Follow these patterns
     ↓
Output: `artifacts/features/sso/spec.md` (informed by repo memory)
```

### Phase 3: Implementing Over Multiple Sessions

```
Session 1:
  - Implement, make discoveries
  - Update repo memory with findings
     ↓
Session 2:
  - Read repo memory (refresh context)
  - Continue implementation
  - Update repo memory with new findings
     ↓
Session 3:
  - Same as Session 2
```

---

## Best Practices

### Adding to Repository Memory

✅ **Do**:
- Add specific examples, not abstractions
- Include confidence levels (HIGH / MEDIUM / LOW)
- Link to relevant files and line numbers
- Document who discovered it and when
- Explain the "why" not just the "what"
- Update when facts change (with date and explanation)

❌ **Don't**:
- Add every observation (only durable knowledge)
- Add low-confidence speculation
- Assume readers know the system
- Leave questions unanswered
- Keep outdated info without marking it
- Create new categories (stick to the 5 files)

### Reading from Repository Memory

✅ **Do**:
- Start every feature work by reading all 5 files
- Check gotchas before implementing
- Reference constraints from architecture decisions
- Check integration points for new feature entry
- Mark anything outdated so it gets updated

❌ **Don't**:
- Skip repo memory because you think you know it
- Ignore gotchas ("that won't happen to me")
- Assume integration points haven't changed
- Treat architecture decisions as suggestions

---

## Example: Complete Flow

### Session 1: Discovering Auth System

```
Input: "Explore auth, we're adding SSO"

discover-legacy-system.agent.md outputs:
→ /memories/session/investigation-notes.md
  - Found: Redis session replication issue (HIGH confidence)
  - Found: Session key uses user_id (HIGH confidence)
  - Found: JWT TTL 7 days, not checked (MEDIUM confidence)

End of session 1:
promote-to-repo-memory.agent.md runs
→ /memories/repo/legacy-system-watchouts.md updated
  - Added: Redis Replication Issue (HIGH)
  - Added: Session Key Format (HIGH)
  - Flagged: JWT TTL (MEDIUM - needs team decision)

→ /memories/repo/integration-points.md updated
  - SSO entry at: src/routes/auth.ts
  - Must call: sessionManager.createSession()
  - Gotcha: Fix Redis first or users randomly log out
```

### Session 2: Designing SSO Feature

```
Input: "Create feature spec for SSO"

spec-requirement.agent.md reads repo memory:
- Reads: `legacy-system-watchouts.md`
  → "OK, Redis replication must be fixed first"
- Reads: `integration-points.md`
  → "OK, entry point is src/routes/auth.ts, must call sessionManager"
- Reads: `project-knowledge-base.md`
  → "OK, follow existing error handling pattern"

Output: artifacts/features/sso/spec.md
- Includes: "FIX Redis replication before SSO (blocker)"
- Includes: "SAML validation then sessionManager.createSession()"
- Includes: "Follow project error handling pattern"
```

### Session 3: Implementing SSO

```
Input: "Implement SSO, continuing from previous findings"

spec-implement.agent.md reads repo memory:
- Reads: /memories/repo/legacy-system-watchouts.md (gotchas)
- Reads: /memories/repo/integration-points.md (where to connect)
- Reads: /memories/repo/architecture-decisions.md (patterns)

Implementation respects:
✅ Discovered gotchas
✅ Known integration points
✅ Project patterns
✅ Architecture decisions
```

---

## Preventing Context Loss

### Without Memory System
```
Session 1: Discover Redis issue → Only in chat
Session 2: "Why is Redis weird?" → Rediscover issue
Session 3: Same question again → Rediscover again
Waste: 3 hours duplicated
```

### With Memory System
```
Session 1: Discover → Promote to legacy-system-watchouts.md
Session 2: Read legacy-system-watchouts.md → Already know
Session 3: Read legacy-system-watchouts.md → Already know
Benefit: Hours saved, knowledge compounds
```

---

## Searching Repository Memory

### "What gotchas affect my feature?"
→ Search `legacy-system-watchouts.md`

### "Where do features typically connect?"
→ Search `integration-points.md`

### "Why was this technology chosen?"
→ Search `architecture-decisions.md`

### "What patterns should I follow?"
→ Search `project-knowledge-base.md`

### "What are the project rules?"
→ Search `constitution.md`

---

## Keeping Memory Current

**Monthly**: Quick review of all files
- Mark anything outdated
- Add any major discoveries

**Quarterly**: Team review
- Update patterns section
- Revisit architecture assumptions
- Add new gotchas discovered

**Annually**: Major audit
- Does architecture still hold?
- Are patterns still accurate?
- Should rules change?

---

## Quick Start

1. **Explore existing system**
   ```
   Agent: discover-legacy-system.agent.md
   Output: /memories/session/investigation-notes.md
   ```

2. **Document architecture**
   ```
   Agent: capture-architecture.agent.md
   Output: /memories/repo/architecture-decisions.md
   ```

3. **Promote findings**
   ```
   Agent: promote-to-repo-memory.agent.md
   Updates: legacy-system-watchouts.md, integration-points.md
   ```

4. **Use memory for next feature**
   ```
   Read: All 5 files
   Design: Informed by constraints
   Implement: Respecting gotchas
   ```

---

## Questions?

**"What if I find something that contradicts memory?"**
→ Document the new finding, note the contradiction, ask team

**"How long should things stay in memory?"**
→ Architecture decisions: years. Gotchas: until fixed. Patterns: until replaced.

**"Who maintains this?"**
→ Everyone. You add what you discover. Team reviews together.

**"What if memory gets too large?"**
→ Archive by date: legacy-system-watchouts-2023.md, legacy-system-watchouts-2024.md
