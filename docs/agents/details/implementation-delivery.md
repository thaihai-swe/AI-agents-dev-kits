# Implementation & Delivery Agents

**Build and verify your code with these 2 agents.**

---

## The 2 Agents

1. **implement** — Write code and tests
2. **review** — Verify and quality gate

---

## 1. `/implement` — Write Code

### What It Does
Writes production-ready code, tests, and documentation based on your specification and tasks.

### When to Use
- Ready to start coding
- Need code generated
- Implementing specific tasks
- Need test coverage

### What to Provide
```
/implement

(or specify what to implement)
/implement Task 1: Build authentication routes
/implement src/auth/login.ts
/implement the dashboard component
```

**Required context:**
- Task description or file path
- Project code structure
- Existing patterns/conventions

**Optional:**
- Code examples to follow
- Specific libraries/frameworks
- Test requirements

### What You Get
- **Implementation code** with proper structure
- **Unit tests** for your code
- **Integration tests** (if applicable)
- **API documentation** (if endpoints)
- **Docstrings and comments**
- **Error handling**

### When to Use with `/tasks`

Typical workflow:
```
1. Get tasks from /tasks
2. For each task:
   /implement Task N: <task name>
   → Review code
   → Merge to branch
3. When all tasks done:
   /review
   → Quality gate
```

### Example: Implement Authentication Route

```
/implement Task 1: Build POST /api/auth/login endpoint that accepts
                   email and password, validates them, returns JWT token,
                   handles errors gracefully
```

**Example output:**
```typescript
// src/routes/auth.ts
import express from 'express';
import jwt from 'jsonwebtoken';
import { validateEmail, validatePassword } from '../validators';

const router = express.Router();

/**
 * POST /api/auth/login
 * Authenticate user with email and password
 * Returns: { token: string }
 */
router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    // Validate input
    if (!validateEmail(email)) {
      return res.status(400).json({
        error: 'Invalid email format'
      });
    }

    if (!validatePassword(password)) {
      return res.status(400).json({
        error: 'Password must be 8+ characters'
      });
    }

    // Find user and verify password
    const user = await findUserByEmail(email);
    if (!user) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }

    const validPassword = await verifyPassword(password, user.passwordHash);
    if (!validPassword) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }

    // Generate token
    const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET);

    res.json({ token });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

export default router;
```

```typescript
// test/auth.test.ts
import request from 'supertest';
import app from '../app';

describe('POST /api/auth/login', () => {
  it('should return token for valid credentials', async () => {
    const response = await request(app)
      .post('/api/auth/login')
      .send({ email: 'user@example.com', password: 'validPassword123' });

    expect(response.status).toBe(200);
    expect(response.body.token).toBeDefined();
  });

  it('should reject invalid email format', async () => {
    const response = await request(app)
      .post('/api/auth/login')
      .send({ email: 'invalid', password: 'password' });

    expect(response.status).toBe(400);
    expect(response.body.error).toContain('email');
  });

  it('should reject missing password', async () => {
    const response = await request(app)
      .post('/api/auth/login')
      .send({ email: 'user@example.com' });

    expect(response.status).toBe(400);
  });

  it('should reject invalid credentials', async () => {
    const response = await request(app)
      .post('/api/auth/login')
      .send({ email: 'user@example.com', password: 'wrongPassword' });

    expect(response.status).toBe(401);
    expect(response.body.error).toContain('credentials');
  });
});
```

### Tips for Getting Good Code

1. **Be specific** — "Build login route" vs "POST /api/auth/login that validates email and password"
2. **Show patterns** — Provide existing code examples
3. **State constraints** — "Use TypeScript", "No external validation library"
4. **Include test needs** — "Needs unit tests with >90% coverage"
5. **Mention error cases** — "Handle missing email, invalid format, wrong password"

---

## 2. `/review` — Quality Gate

### What It Does
Verifies that implemented code matches the specification and plan. Acts as a quality gate before merging.

### When to Use
- After implementing tasks
- Before merging to main
- Want to catch issues early
- Need coverage analysis

### What to Provide
```
/review

(automatically checks against your spec and plan)
```

**Required:**
- Implemented code
- Original spec (from `/spec`)
- Implementation plan (from `/plan`)

**Optional:**
- Test coverage targets
- Performance targets
- Specific quality gates

### What You Get
- **Verification against spec** — Does it match requirements?
- **Verification against plan** — Does it match design?
- **Test coverage analysis** — Coverage percentage
- **Code quality findings** — Issues to fix
- **Performance analysis** — Meets targets?
- **Security check** — Any vulnerabilities?
- **Issues and gaps** — What's missing
- **Recommendations** — What to improve

### Review Checklist

`/review` checks:
- ✅ All acceptance criteria met
- ✅ Code follows project patterns
- ✅ Tests pass and coverage adequate
- ✅ Documentation is complete
- ✅ Performance meets targets
- ✅ Security best practices followed
- ✅ Error handling is comprehensive
- ✅ Code is maintainable

### Example Review Output

```markdown
# Implementation Review: User Dashboard

## Verification Against Spec
✅ Displays activity for past 30 days
✅ Supports filtering by activity type
✅ Mobile responsive
⚠️ Real-time updates: Partial (only on manual refresh)

## Verification Against Plan
✅ Phase 1 API endpoints: Complete
✅ Phase 2 React components: Complete
⚠️ Performance optimization: Needs work

## Test Coverage
- Backend: 92% coverage ✅
- Frontend: 78% coverage ⚠️ (target: 85%)
- Integration: Missing tests for real-time updates

## Code Quality
✅ Follows TypeScript strict mode
✅ All linters pass
⚠️ 2 console.log() statements need removal
✅ Docstrings present

## Performance
✅ Dashboard loads in 1.2s (target: <2s)
⚠️ Initial data fetch could be optimized
✅ Caching working correctly

## Security
✅ User ID filtering server-side
✅ JWT validation
⚠️ Missing CORS configuration
⚠️ rate limiting not implemented

## Issues to Fix
1. Real-time updates not working (Medium priority)
2. Frontend test coverage below target (Low priority)
3. CORS headers missing (High priority)
4. Rate limiting not implemented (High priority)

## Recommendations
1. Add WebSocket for real-time updates
2. Increase frontend test coverage to 85%+
3. Add CORS middleware
4. Implement rate limiting on API
5. Remove debug console.log statements
6. Add monitoring for dashboard performance

## Overall Status
⚠️ NEEDS WORK — Address high-priority issues before merging
```

### What Happens Next

**If review is green (✅):**
- Code is ready to merge
- Proceed to production deployment

**If review finds issues (⚠️):**
- Fix issues identified
- Run `/review` again
- Repeat until green

### Tips

1. **Run early and often** — Review incomplete work to catch issues
2. **Address high priority first** — Don't ignore critical issues
3. **Re-review after fixes** — Ensure fixes don't introduce new issues
4. **Use as learning** — Review findings help improve future code

---

## Workflow: Implement → Review → Merge

```
1. Create tasks (/tasks)
   ↓
2. Implement task 1 (/implement)
   ↓
3. Review implementation (/review)
   ↓
4. Fix issues if needed
   ↓
5. Re-review (/review)
   ↓
6. Once green: Merge and deploy
   ↓
7. Repeat for next task
```

---

## Quick Comparison

| Step      | Agent        | Input            | Output         | Time      |
| --------- | ------------ | ---------------- | -------------- | --------- |
| Implement | `/implement` | Task description | Code + tests   | 1-4 hours |
| Review    | `/review`    | Implementation   | Quality report | 10-20 min |

---

## Next Steps

- **Done with all tasks?** Run final `/review`
- **Need to research something?** Use `/analyze`
- **Ready to save learnings?** Use `/archive`
- **Questions?** Check [FAQ](../../reference/faq.md)
