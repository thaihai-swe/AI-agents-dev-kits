# Quality & Knowledge Agents

**Ensure quality and capture learnings with these 2 agents.**

---

## The 2 Agents

1. **spec-review-requirements** — Review specifications
2. **promote-to-repo-memory** — Archive learnings

---

## 1. `/requirement-review` — Review Specifications

### What It Does
Reviews a specification for clarity, completeness, and readiness for planning. Catches gaps and ambiguities early.

### When to Use
- After creating a spec (optional but recommended)
- Before starting planning
- Spec seems incomplete or vague
- Want extra validation before committing
- Complex or high-risk features

### What to Provide
```
/requirement-review

(automatically reviews your approved spec)
```

**Required:**
- Your specification (from `/spec`)

**Optional:**
- Specific concerns
- Quality criteria
- Team feedback

### What You Get
- **Clarity analysis** — Is it clear?
- **Completeness check** — Are there gaps?
- **Acceptance criteria review** — Are they testable?
- **Assumptions identified** — What's assumed?
- **Open questions** — What's ambiguous?
- **Risk assessment** — What could go wrong?
- **Recommendations** — How to improve

### Example: Requirement Review

```
/requirement-review
```

**Example output:**
```markdown
# Specification Review: User Dashboard

## Overall Assessment
✅ Well-structured and readable
⚠️ Some ambiguities need clarification
⚠️ One missing acceptance criterion

## Clarity Analysis
✅ Problem statement is clear
✅ Functional requirements are specific
⚠️ "Real-time updates" is vague (every 5 seconds? On every keystroke?)
⚠️ "Dark mode support" is mentioned but not in requirements

## Completeness Check
✅ Functional requirements covered
⚠️ Missing: Security requirements (who can see whose data?)
⚠️ Missing: Accessibility requirements (WCAG compliance?)
✅ Performance targets included
❌ Missing: Migration plan from old dashboard

## Acceptance Criteria Review
✅ Most criteria are testable
⚠️ "Looks good on mobile" is not testable (needs metric)
⚠️ "Fast performance" needs specific target (2s? 500ms?)
✅ "Support 5 activity types" is clear and testable

## Identified Assumptions
1. Assumes existing analytics data is accurate
2. Assumes database can handle activity queries within 500ms
3. Assumes no changes to user authentication system
4. Assumes activity data is available in real-time

## Open Questions
1. What happens when analytics data is unavailable? Show cached data?
2. How to handle timezone differences across users?
3. Should filters persist across sessions?
4. What about mobile app users - same dashboard?

## Risk Assessment
- **High**: Database scaling (activity table might be huge)
- **Medium**: Real-time data consistency
- **Medium**: Mobile rendering performance
- **Low**: Browser compatibility

## Recommendations

### Must Fix Before Planning
1. Define "real-time updates" specifically (frequency/trigger)
2. Add security requirements (who sees what data)
3. Fix performance criterion (needs metric, not adjective)
4. Clarify accessibility requirements

### Should Address
1. Plan for handling stale data
2. Specify timezone handling
3. Define mobile behavior

### Nice to Have
1. Migration plan from old dashboard
2. Analytics during/after rollout

## Action Items
- [ ] Clarify real-time update frequency
- [ ] Add security requirements
- [ ] Fix performance acceptance criteria
- [ ] Document timezone handling
- [ ] Add accessibility requirements

## Next Steps
1. Address must-fix items
2. Re-run /requirement-review
3. Once green, proceed to /plan
```

### When Review Finds Issues

**If review is green (✅):**
- Spec is ready for planning
- Proceed to `/plan`

**If review finds issues (⚠️):**
- Address the must-fix items
- Update your spec
- Run `/requirement-review` again
- Iterate until green

### Tips for Reviews

1. **Use as learning** — Understand what makes good specs
2. **Don't skip for small features** — Even small features benefit
3. **Address red items** — Don't ignore recommendations
4. **Iterate** — Specs get better with feedback
5. **Archive the review** — Shows improvement over time

---

## 2. `/archive` — Archive Learnings

### What It Does
Saves important findings and learnings to project memory. Makes discoveries available to entire team and future developers.

### When to Use
- After completing a feature
- After solving a hard problem
- After discovering system behavior
- Periodically (weekly or after major work)
- When you find important gotchas

### What to Provide
```
/archive <what to save>

Examples:
/archive
/archive Authentication corner cases we found
/archive Performance optimization recommendations
/archive Database indexing decisions
```

**Provide:**
- Key findings to save
- Why it matters
- How it applies going forward
- Any gotchas or warnings

### What You Get
- **Archived knowledge** — Saved to project memory
- **Confirmation** — What was saved
- **Access info** — How to retrieve later
- **Scope** — Who can see it

### Example: Archive Session

```
/archive
During implementation, we discovered database scaling issues.
Connection pool exhausted at 200 concurrent users.
Added caching layer (Redis) - reduced DB queries by 60%.
This is critical knowledge for future scaling decisions.
```

**Example output:**
```markdown
# Archived Learning: Database Performance & Scaling

## Finding
Database connection pool exhausted at 200 concurrent users during load testing.
Caused 30+ second latencies and cascading failures.

## Root Cause
Default connection pool size is 10. With 200 users making queries,
we quickly exceeded available connections.

## Solution Implemented
1. Increased connection pool from 10 to 50
2. Added Redis caching layer (1 hour TTL for user data)
3. Optimized slow queries with proper indexing

## Results
- Connection exhaustion eliminated
- P95 query latency: 850ms → 150ms (82% improvement)
- DB queries reduced 60% (cache hit rate 85%)
- Infrastructure cost saved ~$2k/month

## Critical Learnings
1. ⚠️ **GOTCHA**: Default pool size is too low for production
2. ✅ Connection pooling is worth it
3. ✅ Caching >= index optimization for this workload
4. ❌ Not worth building custom cache layer (Redis was perfect)

## What We'd Do Differently
- Perform connection pool stress test during initial setup
- Run load tests before launch, not after reaching production
- Consider caching architecture from day 1

## Key Metrics
| Metric                | Before | After |
| --------------------- | ------ | ----- |
| P95 latency           | 850ms  | 150ms |
| DB queries/sec        | 5000   | 2000  |
| Connection pool usage | 95%    | 30%   |
| Monthly infra cost    | $5k    | $3k   |

## Next Opportunity
Monitor connection pool usage continuously. If we hit 70%, scale further.
Current setup can handle 2x concurrent users before hitting limits again.

## Team Reference
- Who did this: @alice (DM for questions)
- When: March 2026
- Feature: Dashboard scaling phase
- Impacts: All features using user data queries

## How to Use This Knowledge
When implementing new features:
1. Check query patterns early
2. Consider caching for frequently-accessed data
3. Run load tests before deployment
4. Monitor connection pool usage

---

**Saved to repo memory: database-scaling**
**Visibility: Entire team**
**Expires: Never (permanent reference)**
```

### Archive Categories

Typical things to archive:
- **Performance Optimizations** — What worked to speed things up
- **Bug Fixes** — Hard bugs and their solutions
- **Architectural Decisions** — Why we chose X over Y
- **Gotchas** — Watch-outs for the team
- **Integration Learnings** — How to work with external systems
- **Scaling Insights** — When to scale and how
- **Test Patterns** — What kinds of tests are most valuable

### Tips for Archiving

1. **Archive regularly** — Don't wait until project end
2. **Be specific** — Not "performance stuff", but "caching reduced queries 60%"
3. **Include numbers** — Quantify improvements
4. **Note gotchas** — Warn team about dangers
5. **Explain why** — Help future readers understand context
6. **Make it searchable** — Future team needs to find this

### Archive in Different Scenarios

#### After Feature Implementation
```
/archive
Completed user dashboard feature. Key learnings:
- Real-time updates need WebSocket, not polling
- Caching is essential for performance
- Mobile needs different component structure
- Testing real-time features is tricky
```

#### After Solving Bug
```
/archive
Fixed cascading user deletion bug. Took 4 hours to track down.
Issue: Deleting user didn't clean up related records.
Solution: Added cascade delete in database schema
AND check for orphaned records before deletion.
Lesson: ORM doesn't always cascade—verify at DB level!
```

#### After Performance Work
```
/archive
Optimized API response time from 2s to 500ms.
Main wins:
1. Fixed N+1 queries (biggest win)
2. Added Redis caching
3. Reused database connections

Without fix, would fail at 10k users.
With fix, can handle 100k users.
```

#### After System Discovery
```
/archive
Completed discovery of payment system.
Key gotchas:
- Payment state machine has 7 states (not obvious in code)
- Stripe webhooks must be idempotent (can receive duplicates)
- Reconciliation job is critical (runs nightly)
- No audit trail for payment history

Next person should read code starting with:
1. src/models/Payment.ts
2. src/services/PaymentService.ts
3. docs/webhooks.md (if exists)
```

---

## Quality Workflow

```
1. Create spec (/spec)
   ↓
2. Review spec (/requirement-review)
   ↓
3. If issues found → Fix → Re-review
   ↓
4. If green → Proceed to /plan
   ↓
5. Implement (/implement)
   ↓
6. Review implementation (/review)
   ↓
7. Archive learnings (/archive)
   ↓
8. Done!
```

---

## Quick Comparison

| Agent                 | Purpose        | When                 | Output             |
| --------------------- | -------------- | -------------------- | ------------------ |
| `/requirement-review` | Validate spec  | After `/spec`        | Review report      |
| `/archive`            | Save learnings | After implementation | Archived knowledge |

---

## Pro Tips

1. **Review early, save often** — Catch issues before they're expensive
2. **Archive is the gift you give future self** — Future you will thank you
3. **Make archives discoverable** — Use good naming so team can find them
4. **Archive as you go** — Don't wait until the end
5. **Link archives together** — "See also: [Database Performance Optimization]()"

---

## Next Steps

- **Ready to review a spec?** Use `/requirement-review`
- **Have learnings to save?** Use `/archive`
- **Need to retrieve past knowledge?** Let team know (check `memories/repo/`)
- **Questions?** Check [FAQ](../../reference/faq.md)
