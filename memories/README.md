# Project Memory System

**Your project's institutional knowledge lives here.**

This folder stores knowledge that compounds over time: patterns learned, gotchas discovered, architecture decisions made. It prevents rediscovery and helps new team members onboard.

---

## 📁 What Goes Where

### `repo/constitution.md` — Project Rules

Project-wide standards and non-negotiables:
- Code style requirements
- Technology choices (lock in decisions)
- Security requirements
- Deployment standards
- Testing requirements

**When**: Fill during project setup
**Owner**: Tech lead
**Update**: Rarely (only major decisions)

---

### `repo/project-knowledge-base.md` — Patterns & Conventions

Patterns your team has proven work:
- Naming conventions
- Common design patterns
- API conventions
- Error handling approach
- Authentication patterns
- Configuration approach

**When**: Start after first sprint
**Owner**: Team
**Update**: Every sprint (add patterns as they emerge)

---

### `repo/legacy-system-watchouts.md` — Gotchas

Things about the existing system that can break new features:
- What quirks exist?
- What unusual constraints?
- What's been broken before?
- Why did previous attempts fail?
- How to work around each gotcha?

**When**: Fill during discovery phase (use `analyze` agent)
**Owner**: Whoever discovers them
**Update**: Add new items as they're discovered

---

### `repo/architecture-decisions.md` — Design Choices

Why the system is built the way it is:
- Technology stack (and why)
- Key trade-offs made
- Design principles
- Scaling assumptions
- Integration patterns

**When**: Fill during discovery (use `analyze` agent)
**Owner**: Architects
**Update**: Annually or when architecture changes

---

### `repo/integration-points.md` — Where Features Connect

Where and how new features integrate:
- Entry points for new features
- Key files typically modified
- Contracts/services/interfaces to respect
- Gotchas specific to each integration point
- Effort estimates or complexity notes

**When**: Fill during discovery (use `analyze` agent)
**Owner**: Feature teams
**Update**: Add new integration points as features are built

---

## 🚀 How to Use This System

### For New Projects (Greenfield)

1. **Initialize** (Day 1):
   - Fill `repo/constitution.md` with project rules
   - Fill `repo/project-knowledge-base.md` with initial patterns

2. **First sprint**: Add patterns as you discover them

3. **Quarterly review**: Update patterns to match what you've learned

### For Existing Projects (Brownfield)

1. **Discovery phase** (start here):
   - Use `/analyze` agent to investigate existing systems
   - Agent will help fill `legacy-system-watchouts.md`, `architecture-decisions.md`, and `integration-points.md`
   - Review findings and save stable patterns to repo memory

2. **Regular feature work** after discovery:
   - Follow Greenfield workflow above
   - Reference memory files before creating specs

3. **Continuous updates**:
   - As you discover new gotchas → add to `legacy-system-watchouts.md`
   - As you learn new patterns → add to `project-knowledge-base.md`
   - As you build new features → document integration points

1. **Discovery phase** (start here with brownfield projects):
   ```
   @analyze Map [system name]
   → Outputs: investigation findings about existing system
   → Review and save key findings to memory files:
      - Legacy gotchas → legacy-system-watchouts.md
      - Architecture insights → architecture-decisions.md
      - Integration points → integration-points.md
   ```

2. **Regular use**:
   - Read these files before writing specs
   - Extract constraints into your feature design
   - Reference gotchas to understand what could break

3. **Update regularly**:
   - When you discover a new gotcha → add it
   - When you learn a new pattern → add it
   - When architecture changes → update it

---

## 📚 Reading Memory Before Feature Work

Before creating a feature spec, always check:

```bash
# Quick scan (2 min)
cat repo/constitution.md
cat repo/legacy-system-watchouts.md
cat repo/integration-points.md

# Deep dive (5 min)
cat repo/architecture-decisions.md
cat repo/project-knowledge-base.md
```

**These tell you**:
- What rules to follow (constitution)
- What gotchas to avoid (watchouts)
- Where to integrate (integration-points)
- Why it's built this way (architecture)
- What patterns to use (knowledge-base)

---

## ✍️ Keeping Memory Updated

### After Discovery Phase (using /analyze agent)
- Use `/analyze` agent findings to fill:
  - `legacy-system-watchouts.md` – Gotchas discovered
  - `architecture-decisions.md` – Design insights
  - `integration-points.md` – Where features integrate
- **You**: Review findings and decide what's stable enough to keep

### During Feature Work
- **Find a gotcha**: Add to `legacy-system-watchouts.md`
- **Learn a pattern**: Add to `project-knowledge-base.md`
- **Integrate somewhere new**: Add to `integration-points.md`

### End of Session
- Update repo memory files with any new patterns, gotchas, or insights
- Keep memory files current so future features benefit from your discoveries

---

## 🔄 Memory Workflow Example

### Session 1: Exploring Auth System

```
@analyze: Map auth system
→ Finds: Redis session format, JWT TTL quirk, architecture trade-offs

You review findings and save:
→ legacy-system-watchouts.md: "Redis uses non-standard session format..."
→ architecture-decisions.md: "Redis chosen for..."

Result: Team now knows about auth gotchas and design decisions
```

### Session 2: Building SSO Feature

```
User reads: legacy-system-watchouts.md
  → "Ah, Redis session format is non-standard. Must respect that."

User reads: architecture-decisions.md
  → "SSO needs to work with Redis session storage, not replace it."

@spec-requirement: Add SSO feature
  → Agent reads memory files automatically
  → Spec includes: Must respect Redis format, integrate with existing sessions

Result: Feature design respects learned constraints
```

### Session 3: Continued SSO Implementation

```
@spec-implement continues from Session 2
  → Agent reads memory files for context
  → Implementation builds on previous session's findings

After implementation:
  → Save new discoveries (OAuth integration approach) to memory files
  → Update project-knowledge-base.md with patterns learned

Result: Next session picks up with all context preserved
```

---

## 💾 File Format

Each file uses simple Markdown:

```markdown
# File Title

## Topic or Item 1

**What**: Description
**Why**: Why this matters
**How**: How to handle/use it
**Impact**: What breaks if you ignore this?
**References**: Links to relevant files

---

## Topic or Item 2
...
```

---

## 🎯 Best Practices

### ✅ Do

- **Read memory before specs**: It shapes better designs
- **Promote findings regularly**: End-of-session promotion
- **Document gotchas even if small**: They save debugging time
- **Update when facts change**: Mark with date and explanation
- **Link to code**: Include file paths and line numbers
- **Mark confidence levels**: Found (HIGH), Suspected (MEDIUM), Heard (LOW)

### ❌ Don't

- **Add every thought**: Only stable, durable knowledge
- **Forget to update**: Out-of-date memory is worse than no memory
- **Leave low-confidence items**: Mark them if included
- **Treat as immutable**: Update when you learn better info
- **Leave session notes here**: Promote, don't accumulate
- **Duplicate across files**: Link instead of repeating

---

## 📋 Checklist: Starting a New Feature

Before writing `artifacts/features/<feature>/spec.md`:

- [ ] Read `constitution.md` — Know project rules
- [ ] Read `legacy-system-watchouts.md` — Avoid known gotchas
- [ ] Read `integration-points.md` — Understand where to integrate
- [ ] Read `architecture-decisions.md` — Understand why it's built this way
- [ ] Read `project-knowledge-base.md` — Use proven patterns

---

## 🔍 Searching Memory

**"What gotchas affect me?"**
→ Search `legacy-system-watchouts.md`

**"Where do features typically integrate?"**
→ Search `integration-points.md`

**"Why was this technology chosen?"**
→ Search `architecture-decisions.md`

**"What patterns should I follow?"**
→ Search `project-knowledge-base.md`

**"What are the project rules?"**
→ Read `constitution.md`

---

## 🎓 Learn More

- **For documentation overview**: See [docs/README.md](../docs/README.md)
- **For memory system details**: See [docs/memory-system/README.md](../docs/memory-system/README.md)
- **For agent reference**: See [docs/reference/commands.md](../docs/reference/commands.md)
- **Getting started**: See [docs/guides/getting-started.md](../docs/guides/getting-started.md)

---

## Quick Links

- [Constitution Template](../.github/specs/templates/constitution-template.md)
- [Project Knowledge Base Template](../.github/specs/templates/project-knowledge-base-template.md)
- [Legacy System Watchouts Template](../.github/specs/templates/legacy-system-watchouts-template.md)
- [Architecture Decisions Template](../.github/specs/templates/architecture-decisions-template.md)
- [Integration Points Template](../.github/specs/templates/integration-points-template.md)
