# Memory System

**How knowledge persists across conversations.**

The AI Development Kit uses a 3-tier memory system to help your team learn and grow over time.

---

## The 3 Tiers

### Tier 1: User Memory
**Scope:** Survives across all workspaces
**Visibility:** Personal (only you)
**Purpose:** Your preferences, patterns, and insights

```
/memories/ (in root)
```

**Examples:**
- Your preferred code style
- Commands you use frequently
- Patterns you like
- Troubleshooting notes you've made

### Tier 2: Session Memory
**Scope:** Current conversation only
**Visibility:** Personal (current task only)
**Purpose:** Task-specific notes and tracking

```
/memories/session/
```

**Examples:**
- Notes about current feature
- Task lists
- Decisions made this session
- Links to relevant docs

### Tier 3: Repo Memory
**Scope:** This project/repository
**Visibility:** Entire team
**Purpose:** Team knowledge and learnings

```
/memories/repo/
```

**Examples:**
- Architectural decisions
- Performance learnings
- Gotchas discovered
- Team patterns
- Integration requirements
- Scaling guidelines

---

## How Each Tier Works

### User Memory

**When it's saved:**
- Automatically when you provide feedback
- When you run `/archive` at personal level
- When you take notes

**What to store:**
- Preferences and configurations
- Personal learning and tricks
- Debugging techniques you've discovered

**Read it:**
- Available in all conversations
- Check beginning of every session

**Example:**
```markdown
# My Development Patterns

## Testing Approach
I prefer integration tests over unit tests.
They catch real bugs, not test implementation.

## Debugging Process
1. Check error message carefully
2. Look for similar issues in git log
3. Reproduce in isolation
4. Add test that reproduces the issue
5. Fix and verify test passes

## Performance Optimization
When slow: Profile first, don't guess.
Use Chrome DevTools for frontend.
Use Node --prof for backend.
```

### Session Memory

**When it's saved:**
- Automatically during conversations
- When you run `/tasks` and save output
- When you create session notes

**What to store:**
- Task progress
- Decision made this session
- Links to artifacts
- "Remember for next time" notes

**Read it:**
- Check at resumption
- Reference during work
- Update as progress happens

**Example:**
```markdown
# Current Task: Build Payment System

## Progress
- [x] Spec completed and reviewed
- [x] Plan created
- [ ] Tasks created (running next)
- [ ] Task 1: Backend setup
- [ ] Task 2: Integration tests
- [ ] Task 3: Frontend

## Decisions Made
- Using Stripe (not home-grown)
- Async job queue for billing
- Webhooks for confirmations

## Next: Run /tasks then /implement task 1
```

### Repo Memory

**When it's saved:**
- When you run `/archive`
- When you run `/discover` + `/architecture`
- When team intentionally captures knowledge

**What to store:**
- Architectural decisions and why
- Performance findings and metrics
- Hard-won gotchas
- Integration patterns
- Scaling insights
- Common mistakes to avoid

**Read it:**
- New team members read this first
- Reference when building features
- Check before making architectural decisions

**Example:**
```markdown
# Team Knowledge: Database Scaling

## Decision: Added Redis Caching
**When:** March 2026
**Why:** Database queries were bottleneck
**Result:** 60% reduction in DB queries, 80% improvement in latency

## Gotchas
- Connection pool defaults too low
- Query cache has timezone bugs
- N+1 queries happen in reports

## Performance Targets
- P95 query: <100ms
- P99 query: <500ms
- DB CPU: <70%

## Scaling Guidelines
At 10k users: Keep current setup
At 50k users: Add read replicas
At 100k+ users: Partition by tenant

## Team Contact
@alice for questions about this
```

---

## Using Each Tier

### Save to User Memory
```
1. Run agents (all tiers captured automatically)
2. Manually add notes via /memories/
3. Review notes regularly and update
```

### Save to Session Memory
When working on a task:
```
1. Create session notes with plan
2. Update progress as you go
3. Link to artifacts and decisions
4. Next session, read these notes
```

### Save to Repo Memory
After completing work:
```
/archive "key findings and learnings"

This automatically saves to repo memory that entire team can access.
```

---

## Memory Best Practices

### ✅ DO

- **Capture specifics** — "Caching reduced queries 60%" not "caching helps"
- **Include numbers** — Quantify everything
- **Note who, when, why** — For context
- **Point to code** — "See src/auth/login.ts"
- **Link related knowledge** — "See also: Database scaling patterns"
- **Update regularly** — Memory gets stale

### ❌ DON'T

- **Store credentials** — Never! Use env vars
- **Store PII** — Customer data doesn't go in memory
- **Store duplicate** — Check before writing
- **Overwrite old** — Archive instead of delete
- **Make it vague** — Be specific

---

## Common Memory Patterns

### Pattern 1: Feature Learnings
```markdown
# Feature: User Dashboard

## What We Built
- Real-time activity feed
- Customizable dashboards
- Export to CSV

## Performance Learnings
- WebSocket connections need pooling
- Real-time updates can't be naive polling
- Caching helps (but invalidation is hard)

## Gotchas
- Timezone issues across regions
- Activity ordering tricky in real-time
- Mobile needs different UX

## What We'd Do Differently
- Start with polling, add WebSocket later
- Pay attention to cache invalidation
- Mobile UX should start earlier

## Next Improvement
Add analytics to understand usage patterns
```

### Pattern 2: Technical Decision
```markdown
# Decision: Use GraphQL Instead of REST

## Options Considered
1. REST API (standard, team familiar)
2. GraphQL (powerful, learning curve)
3. gRPC (performance, but overkill)

## Why GraphQL
- Complex queries (reduce N+1)
- Strong typing (prevents bugs)
- Team wanted to learn

## Trade-offs
- Learning curve (1 week)
- Slower simple queries
- GraphQL debugging harder than REST

## Recommendation
✅ Use GraphQL for this project
⚠️ For next project, consider team expertise
```

### Pattern 3: Performance Fix
```markdown
# Fix: Reduced API Response Time 2s → 500ms

## Problem
Dashboard took 5+ seconds to load. Users complaining.

## Root Cause
1. N+1 queries (main issue)
2. No caching
3. Large bundle size

## Solution
1. Fixed N+1 queries (saved 1.2s)
2. Added Redis caching (saved 1s)
3. Code split (saved 300ms)

## Metrics
| Metric      | Before | After | Improvement |
| ----------- | ------ | ----- | ----------- |
| Load time   | 5200ms | 500ms | 90%         |
| DB queries  | 200    | 50    | 75%         |
| Bundle size | 850KB  | 450KB | 47%         |

## Would Do Differently
- Profile first (almost did code split first)
- Query optimization should be earlier
- Monitor metrics continuously
```

---

## Retrieving Stored Knowledge

### Access User Memory
```
Check /memories/ folder (personal, only you)
```

### Access Session Memory
```
Check /memories/session/ folder (current task)
```

### Access Repo Memory
```
/project-knowledge-base

Returns relevant team knowledge on a topic
```

### Search for Knowledge
```
/analyze "What do we know about X?"

Agent searches repo memory and answers
```

---

## Memory Lifecycle

```
Discovery Work
  ↓
Run /archive to save to Repo Memory
  ↓
Entire team can access
  ↓
New developer reads during onboarding
  ↓
Patterns become team conventions
  ↓
Next project builds on this knowledge
```

---

## Settings for Memory

### Configuration
- Auto-save: On (agents auto-capture learnings)
- Retention: Permanent for repo memory
- Expiration: Never (knowledge is forever)
- Sharing: Team has access to repo memory

### Managing Memory
- Review memories quarterly
- Archive outdated information
- Update when understanding improves
- Link related memories together

---

## Examples by Tier

### User Memory Example
```markdown
# My Debugging Checklist

When code doesn't work:
1. Read error message completely (most clues here)
2. Check similar issues in git log
3. Reproduce in isolation
4. Add failing test
5. Fix code
6. Verify test plus
7. Check for side effects

This works 95% of time.
```

### Session Memory Example
```markdown
# Session: Building Auth System

## Plan
1. Create spec (DONE)
2. Create plan (DONE)
3. Create tasks (DONE)
4. Implement Task 1: Database setup
5. Implement Task 2: Auth routes
6. Implement Task 3: Frontend
7. Test and review

## Next
Run /implement for Task 1
```

### Repo Memory Example
```markdown
# Architecture Decision: Monolith vs Microservices

## Decision
Keep monolith (at least for next year)

## Why
- Team too small for microservices overhead
- Easier to understand and debug
- Data consistency simpler
- Deployment simpler

## When to Revisit
When single team can't own entire system
When latency between services critical
When need to scale services independently
```

---

## Getting Started with Memory

1. **Check user memory** — See what you've saved before
2. **Create session notes** — For current task
3. **After work** — Run `/archive` to save team learnings
4. **Next project** — Access repo memory for team patterns

---

## Next Steps

- **Read user memory** — Check `/memories/`
- **Learn about saving** — Use `/archive` command
- **Access team knowledge** — Use `/project-knowledge-base`
- **Questions?** See [FAQ](../reference/faq.md)

---

**Remember:** This memory system is your gift to your team. Capture learnings, update regularly, and make knowledge accessible. Future developers (including future you) will be grateful!
