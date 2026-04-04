# Complete Workflow Example: Using All 13 Agents

**A practical walkthrough of building a feature using the entire agent system.**

---

## Scenario: Add Password Reset Feature to Existing App

Let's build a password reset feature on an existing system using all 13 agents.

---

## Phase 1: Foundation Setup (Run Once Per Project)

### Step 1: Create Constitution
**Agent**: `/constitution`

```
INPUT: Existing project code, README, templates
OUTPUT: memories/repo/constitution.md
```

**Created File Example**:
```markdown
# Project Constitution

## Core Principles
- All changes must be reversible
- Tests required: 75% minimum coverage
- Code review mandatory before merge
- Brownfield changes documented

## Quality Gates
- REQ-* identifiers required in all specs
- AC-* acceptance criteria must be testable
- Design review for changes touching >3 files

## Testing Rules
- Unit tests for all business logic
- Integration tests for auth changes
- E2E tests for user-facing features
```

### Step 2: Document Repository Patterns
**Agent**: `/patterns` (project-knowledge-base)

```
INPUT: memories/repo/constitution.md + codebase
OUTPUT: memories/repo/project-knowledge-base.md
```

**Created File Example**:
```markdown
# Project Knowledge Base

## Repository Structure
- `src/services/` — Business logic
- `src/routes/` — HTTP endpoints
- `src/models/` — Database schemas

## Patterns Used
- Express.js middleware for auth
- PostgreSQL for persistence
- Redis for session storage

## Reference: Email Sending
See `src/services/email.js` for how to send emails
(Used by password reset feature)

## Brownfield Gotchas
- Session storage: Must replicate to backup Redis
- Database: Always write migrations
- Tests: Must seed test database before running
```

---

## Phase 2: Feature Work Begins

### Step 3: Explore Existing Auth System (Discovery)
**Agent**: `/discover` (discover-legacy-system)

```
INPUT: User question: "Explore the authentication system"
OUTPUT: memories/session/investigation-notes.md
```

**Created Session Notes**:
```markdown
# Investigation Notes: Auth System

## Architecture
- Entry: `src/routes/auth.js` handles /login, /logout
- Session: Redis stores session tokens (30-min TTL)
- Models: `User` model in `src/models/user.js`
- Email: `src/services/email.js` handles all notifications

## Integration Points
**User Authentication**:
- Entry: POST /auth/login
- Files: src/routes/auth.js, src/models/user.js
- Contract: Requires email + password, returns session token
- Effort: ~6 hours to add password reset

## Gotchas Found

**Gotcha 1: Redis Session Replication**
- What: Session stored in Redis, not replicated to backup
- Impact: If primary Redis fails, users lose session
- Confidence: HIGH
- Solution: Must replicate state or fall back to DB
- Files: src/services/session.js

**Gotcha 2: Email Rate Limiting**
- What: No rate limit on email sending
- Impact: Could spam user with password reset emails
- Confidence: HIGH
- Solution: Add per-user rate limit (1 email/minute)
- Files: src/services/email.js
```

### Step 4: Capture Architecture Insights
**Agent**: `/architecture` (capture-architecture)

```
INPUT: memories/session/investigation-notes.md + codebase
OUTPUT: memories/repo/architecture-decisions.md
```

**Created File Example**:
```markdown
# Architecture Decisions

## Session Management Strategy

**Decision**: Use Redis for session storage
**Why**: Sub-100ms lookups needed
**Trade-off**: Lose sessions if Redis down
**Mitigation**: Implement fallback to DB for critical sessions
**Confidence**: HIGH (observed in code)

## Email Service Pattern

**Decision**: Centralized email service
**Why**: Single point for throttling, logging, testing
**Pattern**: All emails go through `services/email.js`
**Where**: Signup, login, password reset use this
```

### Step 5: Promote Discoveries to Team Memory
**Agent**: `/archive` (promote-to-repo-memory)

```
INPUT: memories/session/investigation-notes.md
OUTPUT: Updated memories/repo/legacy-system-watchouts.md
```

**Created/Updated File**:
```markdown
# Legacy System Watchouts

## HIGH CONFIDENCE GOTCHAS

### Redis Session State Not Replicated
**What**: Session stored in Redis, not backed up
**Impact**: Feature loss on Redis failure
**Solution**: Add session fallback to PostgreSQL
**Files**: src/services/session.js
**Status**: ✅ STABLE
**Discovered**: 2026-04-04 / Auth system discovery
**Confidence**: HIGH

### Email Rate Limiting Missing
**What**: No throttle on password reset emails
**Impact**: Spam/DoS if attacker requests reset repeatedly
**Solution**: Implement 1-email-per-minute-per-user limit
**Files**: src/services/email.js
**Status**: ✅ STABLE
**Discovered**: 2026-04-04 / Auth system discovery
**Confidence**: HIGH
```

---

## Phase 3: Planning & Specification

### Step 6: Write Feature Specification
**Agent**: `/spec` (spec-requirement)

```
INPUT: User request: "Add password reset feature"
OUTPUT: artifacts/features/password-reset/spec.md
```

**Created File Example** (abbreviated):
```markdown
# Feature Specification: Password Reset

## Problem Statement
Users who forget passwords cannot recover access to their accounts.

## Desired Outcomes
- Users can reset forgotten passwords
- Reset link expires after 15 minutes
- Email notification sent to user
- No unauthorized access through reset process

## Acceptance Criteria
- AC-001: User receives reset email within 30 seconds
- AC-002: Reset link valid for exactly 15 minutes
- AC-003: Invalid/expired links show error message
- AC-004: Password must meet complexity requirements
- AC-005: Email is rate-limited (1 per minute per user)

## In Scope
- Email-based reset flow
- Password validation
- Session invalidation after reset

## Out of Scope
- SMS-based reset
- Recovery codes
- 2FA reset process

## Risks
- RISK-001: Email delivery delays (mitigation: warn user)
- RISK-002: Attacker tries to reset random emails (mitigation: rate limit)
- RISK-003: Session replication issue if Redis down (mitigation: use fallback)
```

### Step 7: Review Specification Quality
**Agent**: `/requirement-review` (spec-review-requirements)

```
INPUT: artifacts/features/password-reset/spec.md
OUTPUT: artifacts/features/password-reset/requirements-review.md
```

**Created File Example**:
```markdown
# Review: Password Reset Specification

**Reviewed**: spec.md
**Reviewer**: Architecture Review
**Recommendation**: ✅ APPROVED WITH NOTES

## Summary
Spec is clear and well-scoped. Good identification of risks.
One open question on complexity requirements.

## Findings
✅ APPROVED - Clear in-scope and out-of-scope boundaries
✅ APPROVED - Acceptance criteria are testable
⚠️ NOTE - AC-004: Define "complexity requirements" (minimum length, special chars?)
⚠️ NOTE - RISK-003: Confirm PostgreSQL fallback strategy in plan

## Recommendation
Ready to design after clarifying password complexity requirements.
```

### Step 8: Design Technical Architecture
**Agent**: `/design` (spec-design)

```
INPUT: artifacts/features/password-reset/spec.md + project knowledge
OUTPUT: artifacts/features/password-reset/design.md
```

**Created File Example** (abbreviated):
```markdown
# Technical Design: Password Reset

## Architecture

[User clicks "Forgot Password"]
  ↓
POST /auth/forgot-password (email)
  ↓
→ Check rate limit
→ Generate token (random, 32-byte)
→ Store token in PostgreSQL (passwords table)
→ Send email with reset URL
  ↓
[User clicks email link]
  ↓
GET /auth/reset/:token
  ↓
→ Verify token valid
→ Show password form
  ↓
[User submits new password]
  ↓
POST /auth/reset/:token (password)
  ↓
→ Validate password complexity
→ Hash password (bcrypt)
→ Invalidate all sessions for user
→ Add log entry
  ↓
Success / Redirect to /login


## Database Changes
- New table: `password_reset_tokens`
- Fields: id, user_id, token_hash, expires_at, used_at

## Rate Limiting
- 1 email per minute per user
- Track in Redis: `forgot:email:{user_id}`

## Session Invalidation
- After password reset, all sessions => REVOKED
- Next request: user must re-login
- Use both Redis and PostgreSQL for safety

## Brownfield Constraints
- Must work with existing session system (Redis + fallback)
- Email service already exists, just add template
- User model already has email field
```

### Step 9: Create Execution Plan
**Agent**: `/plan` (spec-plan)

```
INPUT: spec.md + design.md + constitution
OUTPUT: artifacts/features/password-reset/plan.md
```

**Created File Example** (abbreviated):
```markdown
# Execution Plan: Password Reset

## Affected Modules
- src/routes/auth.js (add endpoints)
- src/services/email.js (add template)
- src/models/user.js (add reset logic)
- database (migration for new table)
- tests (new integration tests)

## Phase 1: Foundation (2 hours)
- [ ] Create PostgreSQL migration
- [ ] Add `password_reset_tokens` table
- Success: `npm run migrate` passes

## Phase 2: Implementation (4 hours)
- [ ] Add POST /auth/forgot-password endpoint
- [ ] Add rate limiting middleware
- [ ] Add token generation + storage logic
- [ ] Add GET /auth/reset/:token endpoint
- [ ] Add POST /auth/reset/:token endpoint
- [ ] Add password reset email template
- [ ] Implement session invalidation
- Success: All endpoints return correct status codes

## Phase 3: Validation (2 hours)
- [ ] Add unit tests for token generation
- [ ] Add integration tests for happy path
- [ ] Add integration tests for rate limiting
- [ ] Add integration tests for session invalidation
- Success: 85%+ test coverage, 0 failing tests

## Validation Strategy
- Unit tests: Token generation, validation logic
- Integration tests: Full HTTP flow (forgot → email → reset)
- Security tests: Token expiration, rate limiting, session safety

## Risks & Mitigations
- RISK: Email delayed → Mitigation: Show user timestamp, retry option
- RISK: Rate limiting not working → Mitigation: Monitor logs, alert on spikes
- RISK: Sessions not invalidated → Mitigation: Add test forcing re-login
```

### Step 10: Decompose into Small Tasks
**Agent**: `/tasks` (spec-tasks)

```
INPUT: spec.md + plan.md + design.md
OUTPUT: artifacts/features/password-reset/tasks.md
```

**Created File Example** (abbreviated):
```markdown
# Task Breakdown: Password Reset

## Phase 1: Foundation
- **TASK-001** | Create database migration | Status: Not Started
  - Dependencies: None (foundation task)
  - Files: migrations/001_create_password_reset_tokens.sql
  - AC-linked: AC-002 (token storage)
  - Success: Migration runs without error

- **TASK-002** | Add User.invalidateAllSessions() method | Status: Not Started
  - Dependencies: None (foundation)
  - Files: src/models/user.js
  - AC-linked: AC-005 (session invalidation)
  - Success: Method tested with 100% coverage

## Phase 2: Implementation
- **TASK-003** | POST /auth/forgot-password endpoint | Status: Not Started
  - Dependencies: TASK-001, TASK-002
  - Files: src/routes/auth.js
  - AC-linked: AC-001, AC-005
  - Success: Endpoint accepts email, sends email, rate limits

- **TASK-004** | GET /auth/reset/:token endpoint | Status: Not Started
  - Dependencies: TASK-001
  - Files: src/routes/auth.js
  - AC-linked: AC-002 (token validation)
  - Success: Returns form or error based on token validity

- **TASK-005** | POST /auth/reset/:token endpoint | Status: Not Started
  - Dependencies: TASK-002, TASK-004
  - Files: src/routes/auth.js, src/models/user.js
  - AC-linked: AC-004 (password complexity), AC-005 (session invalidation)
  - Success: Updates password, invalidates sessions, logs action

- **TASK-006** | Add password reset email template | Status: Not Started
  - Dependencies: TASK-003
  - Files: src/templates/password-reset.email.txt
  - AC-linked: AC-001 (email delivery)
  - Success: Template includes user name, reset link, expiration time

## Phase 3: Validation
- **TASK-007** | Unit tests for token logic | Status: Not Started
  - Dependencies: All Phase 2 tasks
  - Files: test/unit/password-reset.test.js
  - AC-linked: AC-002, AC-003
  - Success: 10+ tests, all passing, >90% coverage

- **TASK-008** | Integration tests for happy path | Status: Not Started
  - Dependencies: All Phase 2 tasks
  - Files: test/integration/password-reset.integration.test.js
  - AC-linked: AC-001 through AC-005
  - Success: Full flow works: forgot → email → reset → login

- **TASK-009** | Security tests | Status: Not Started
  - Dependencies: All Phase 2 tasks
  - Files: test/security/password-reset.security.test.js
  - AC-linked: AC-005 (rate limiting)
  - Success: Rate limit blocks, expired tokens rejected
```

---

## Phase 4: Implementation & Verification

### Step 11: Implement Tasks
**Agent**: `/implement` (spec-implement)

```
INPUT: All artifacts above + constitution
OUTPUT: Code + Tests + Updated tasks.md
```

**During Implementation** (sample updates to tasks.md):
```markdown
## Phase 2: Implementation

- **TASK-003** | POST /auth/forgot-password endpoint
  - Status: In Progress → Done ✅
  - Implementation: Added endpoint, rate limiting working
  - Test: POST /auth/forgot-password returns 200, email queued
  - AC-linked: AC-001, AC-005 ✅

- **TASK-005** | POST /auth/reset/:token endpoint
  - Status: In Progress → Blocked ⛔
  - Blocker: Password hashing not consistent with existing code
  - Note: Found existing bcrypt rounds in User.setPassword(), will reuse
  - Next: Check User model, copy hashing logic
```

**Code Created Example**:
```javascript
// src/routes/auth.js
const PASSWORD_RESET_TOKEN_EXPIRES_MINUTES = 15;
const FORGOT_PASSWORD_RATE_LIMIT_SECONDS = 60;

router.post('/forgot-password', async (req, res) => {
  // AC-001: Deliver email within 30 seconds
  // AC-005: Rate limit 1 email per minute
  const { email } = req.body;

  // Check rate limit (Redis with PostgreSQL fallback)
  const rateLimitKey = `forgot:email:${email}`;
  const recentRequest = await redisClient.get(rateLimitKey);
  if (recentRequest) {
    return res.status(429).json({
      error: 'Too many requests. Try again later.'
    });
  }

  // Generate token
  const token = crypto.randomBytes(32).toString('hex');
  const tokenHash = crypto.createHash('sha256').update(token).digest();

  // Store in database
  const expiresAt = new Date(Date.now() + PASSWORD_RESET_TOKEN_EXPIRES_MINUTES * 60 * 1000);
  await db.query(
    'INSERT INTO password_reset_tokens (user_id, token_hash, expires_at) VALUES ($1, $2, $3)',
    [user.id, tokenHash, expiresAt]
  );

  // Send email (TASK-006)
  await emailService.sendPasswordReset(user.email, token);

  // Set rate limit
  await redisClient.setex(rateLimitKey, FORGOT_PASSWORD_RATE_LIMIT_SECONDS, '1');

  res.json({ message: 'Password reset email sent' });
});

router.post('/reset/:token', async (req, res) => {
  // AC-004: Password complexity
  // AC-005: Invalidate all sessions
  const { token } = req.params;
  const { password } = req.body;

  // Find token
  const tokenHash = crypto.createHash('sha256').update(token).digest();
  const row = await db.query(
    'SELECT * FROM password_reset_tokens WHERE token_hash = $1 AND expires_at > NOW()',
    [tokenHash]
  );

  if (!row.rows.length) return res.status(403).json({ error: 'Invalid or expired token' }); // AC-003

  // Update password
  const user = await User.findById(row.rows[0].user_id);
  user.password = password; // Uses existing bcrypt logic
  await user.save();

  // Invalidate all sessions (AC-005: RISK-003 mitigation)
  await user.invalidateAllSessions();

  // Mark token as used
  await db.query(
    'UPDATE password_reset_tokens SET used_at = NOW() WHERE token_hash = $1',
    [tokenHash]
  );

  res.json({ message: 'Password reset successful' });
});
```

**Tests Created** (sample):
```javascript
// test/integration/password-reset.integration.test.js
describe('Password Reset Feature', () => {

  it('AC-001: Sends reset email within 30s', async () => {
    const start = Date.now();
    const response = await request(app)
      .post('/auth/forgot-password')
      .send({ email: 'user@example.com' });
    const elapsed = Date.now() - start;

    expect(response.status).toBe(200);
    expect(elapsed).toBeLessThan(30000); // AC-001
    expect(mockEmailService.send).toHaveBeenCalled();
  });

  it('AC-005: Rate limits to 1 email per minute', async () => {
    const email = 'user@example.com';

    const res1 = await request(app)
      .post('/auth/forgot-password')
      .send({ email });
    expect(res1.status).toBe(200);

    const res2 = await request(app)
      .post('/auth/forgot-password')
      .send({ email });
    expect(res2.status).toBe(429); // Too many requests
  });

  it('AC-003: Rejects expired tokens', async () => {
    // Create expired token
    const expiredToken = 'expired-token-from-db';
    const response = await request(app)
      .post('/auth/reset/expired-token')
      .send({ password: 'NewPassword123!' });
    expect(response.status).toBe(403);
  });

  it('AC-005: Invalidates all other sessions after reset', async () => {
    // Login creates session
    const session1 = await createSession(user);

    // Reset password and invalidate sessions
    await resetPassword(user, 'NewPassword123!');

    // Old session should be invalid
    const oldSessionValid = await isSessionValid(session1);
    expect(oldSessionValid).toBe(false);
  });
});
```

### Step 12: Review Implementation
**Agent**: `/review` (spec-review)

```
INPUT: Code + Tests + All Artifacts + Constitution
OUTPUT: Review Summary (pass/fail)
```

**Review Output Example**:
```markdown
# Implementation Review: Password Reset

**Reviewed**: Code, tests, all artifacts
**Reviewer**: Automated Review
**Recommendation**: ✅ PASS (Ready to merge)

## Requirement Alignment
- REQ-FN-001: Users can reset passwords ✅
- REQ-FN-002: Reset link expires in 15 min ✅
- AC-001: Email within 30s ✅ (tested, avg 2.3s)
- AC-002: Token valid 15 min ✅ (database constraint + test)
- AC-003: Invalid links show error ✅ (test covers)
- AC-004: Password complexity enforced ✅ (reuses existing logic)
- AC-005: Email rate limit + session invalidation ✅ (tests pass)

## Traceability
✅ TASK-003 → Code in auth.js → Test in integration.test.js
✅ TASK-005 → Password reset → Session invalidation logic
✅ TASK-008 → Full integration test covers all AC-*

## Quality Checks
✅ Test coverage: 87% (exceeds 75% minimum)
✅ All tests passing (15 tests, 0 failures)
✅ No console.logs in code
✅ Constitution rules followed (reversible, tested, documented)
✅ Design.md followed (uses existing patterns)

## Security
✅ Token expiration checked
✅ Rate limiting prevents spam
✅ Sessions invalidated after reset
✅ Password hashing consistent with project

## Blockers: None
## Recommendations: None
## Status: ✅ PASS
```

---

## Complete Artifact Tree

After all 13 agents, here's what exists:

```
memories/repo/
├── constitution.md (Project rules, quality gates)
├── project-knowledge-base.md (Repository patterns, module structure)
├── architecture-decisions.md (Tech stack, patterns discovered)
└── legacy-system-watchouts.md (Gotchas found during discovery)

artifacts/features/password-reset/
├── spec.md (What to build)
├── requirements-review.md (Quality check on spec)
├── design.md (Technical architecture)
├── plan.md (Execution sequence)
├── tasks.md (Small ordered tasks, with status)
└── [code files created during implementation]

memories/session/ (Temporary, can be cleaned up)
└── investigation-notes.md (From discovery phase)

Test Results:
├── src/__tests__/password-reset.unit.test.js (utility functions)
├── test/integration/password-reset.integration.test.js (full flow)
└── test coverage: 87%
```

---

## Agent Usage Summary Table

| #                             | Agent                 | Input                      | Output                                | Purpose                |
| ----------------------------- | --------------------- | -------------------------- | ------------------------------------- | ---------------------- |
| 1                             | `/constitution`       | Project README, code       | constitution.md                       | Establish rules        |
| 2                             | `/patterns`           | Code + constitution        | project-knowledge-base.md             | Document patterns      |
| **Discovery → Memory**        |                       |                            |                                       |                        |
| 3                             | `/discover`           | Question + codebase        | investigation-notes.md (session)      | Explore system         |
| 4                             | `/architecture`       | Investigation notes + code | architecture-decisions.md             | Extract architecture   |
| 5                             | `/archive`            | Session notes              | legacy-system-watchouts.md (+ others) | Curate findings        |
| **Planning → Execution**      |                       |                            |                                       |                        |
| 6                             | `/spec`               | User request               | spec.md                               | Define feature         |
| 7                             | `/requirement-review` | spec.md                    | requirements-review.md                | QA gate on spec        |
| 8                             | `/design`             | spec.md + memory           | design.md                             | Technical architecture |
| 9                             | `/plan`               | spec + design + memory     | plan.md                               | Execution plan         |
| 10                            | `/tasks`              | spec + plan + design       | tasks.md                              | Small ordered tasks    |
| **Implementation → Delivery** |                       |                            |                                       |                        |
| 11                            | `/implement`          | All above + constitution   | Code + Tests + tasks.md (updated)     | Build feature          |
| 12                            | `/review`             | Code + all artifacts       | Review summary (pass/fail)            | QA gate on code        |

---

## Time Estimate Breakdown

| Phase          | Agent                             | Effort                        |
| -------------- | --------------------------------- | ----------------------------- |
| Foundation     | constitution + patterns           | 1-2 hours (once per project)  |
| Discovery      | discover + architecture + archive | 1-2 hours                     |
| Planning       | spec → design → plan → tasks      | 2-3 hours                     |
| Implementation | implement + tests                 | 4-6 hours (varies by feature) |
| Review         | review                            | 0.5-1 hour                    |
| **Total**      | **13 agents**                     | **8-15 hours**                |

---

## Key Takeaways

✅ **All 13 agents work together** — spec → review → design → plan → tasks → implement → review
✅ **Discovery feeds planning** — /discover and /archive create repo memory for future features
✅ **Traceability maintained** — REQ-* → AC-* → TASK-* → Code → Tests
✅ **Artifacts persist** — Every decision documented in versioned files
✅ **Resumable** — Can pause after any agent, resume knowing exact state
✅ **Quality gates** — 4 explicit review points (spec, design, plan, tests)

