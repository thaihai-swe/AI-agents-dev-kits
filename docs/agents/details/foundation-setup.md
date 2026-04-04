# Foundation & Setup Agents

**Establish project parameters with these 3 agents.**

---

## The 3 Agents

1. **constitution** — Define project rules
2. **patterns** — Document team patterns
3. **project-knowledge-base** — Manage project memory

---

## 1. `/constitution` — Project Rules

### What It Does
Defines the fundamental rules, constraints, and guardrails for your project. This becomes the constitution your team operates under.

### When to Use
- Starting a new project (one-time)
- Onboarding new team members
- Need to document non-negotiable rules
- Establishing coding standards
- Setting architectural constraints

### What to Provide
```
/constitution

/constitution
We're building a TypeScript/React SaaS app with a Node.js backend.
Team of 3 engineers. Security is critical.
```

**Provide:**
- Project type and context
- Team size and experience level
- Key constraints
- Non-negotiable requirements
- Tech stack (if decided)

### What You Get
- **Project constitution** — Foundational rules
- **Must-follow standards** — Non-negotiable practices
- **Team guidelines** — How you operate
- **Quality gates** — Before merging code
- **Code organization** — Folder structure
- **Communication practices** — How team coordinates

### Example Constitution

```markdown
# Project Constitution: UserHub SaaS

## Project Overview
Building a team collaboration platform for remote teams.
- Tech Stack: TypeScript, React, Node.js, PostgreSQL
- Team: 3 engineers, 1 PM, 1 designer
- Timeline: MVP in 12 weeks, launch in 6 months
- Users: Starting with SaaS beta, targeting 100k year 1

## Non-Negotiable Rules

### 1. Security
- All endpoints require authentication
- Senitive data encrypted at rest and in transit
- No credentials in code (use env vars)
- Monthly security audits
- Response to security issues within 24 hours

### 2. Code Quality
- All code reviewed before merge
- Minimum 80% test coverage
- All linters passing
- TypeScript strict mode required
- No console.log in production code

### 3. Data & Persistence
- All data changes must be migrations
- Database queries must be indexed
- Sensitive data masked in logs
- Backup verified weekly

## Standards & Patterns

### Folder Structure
```
src/
  ├── components/     (React components)
  ├── services/       (Business logic)
  ├── apis/          (API clients)
  ├── types/         (TypeScript types)
  ├── utils/         (Utilities)
  ├── hooks/         (React hooks)
  └── tests/         (Tests)
```

### Naming Conventions
- Files: kebab-case (user-profile.ts)
- Classes: PascalCase (UserService)
- Functions: camelCase (getUserById)
- Constants: UPPER_SNAKE_CASE (MAX_RETRIES)

### Code Review Process
- PR must have approvals before merge
- Reviewer checks: correctness, tests, style, documentation
- If significant change: get 2 approvals
- Security-related: get security team approval

## Quality Gates

### Before Every Commit
- [ ] Tests pass locally
- [ ] Linters pass
- [ ] No console.log statements

### Before Every PR
- [ ] All tests passing on CI
- [ ] Code coverage not decreased
- [ ] Documentation updated

### Before Release
- [ ] Manual QA pass
- [ ] Performance check
- [ ] Security review
- [ ] Data migration tested

## Communication
- Slack for quick questions
- GitHub issues for tracking work
- Weekly standups (Tuesday 10am)
- Design reviews before implementation
- Architecture reviews for major changes

## Known Constraints
- Legacy authentication system (must integrate with)
- Regulatory compliance required (GDPR)
- Must support IE11 (despite its age)
- Performance budget: 3MB bundle size
```

### Tips for Constitution

1. **Keep it concise** — 1-2 pages, not a novel
2. **Focus on must-dos** — Non-negotiables only
3. **Be specific** — "80% test coverage" vs "good test coverage"
4. **Include examples** — Show folder structure, naming patterns
5. **Make it accessible** — New engineer should understand within 1 hour

---

## 2. `/patterns` — Document Patterns

### What It Does
Documents team conventions, best practices, and patterns. How you usually do things (subject to exceptions).

### When to Use
- After working together for a bit
- Want to document team practices
- Onboarding new team members
- Establishing best practices
- Consistency across codebase

### What to Provide
```
/patterns

/patterns
Show examples of authentication patterns, testing patterns, and state management
```

**Provide:**
- Examples of patterns in your code
- Code snippets showing the pattern
- When to use each pattern
- Variations or exceptions

### What You Get
- **Pattern documentation** — How you do things
- **Code examples** — Shows each pattern
- **When to use** — Context for each
- **Anti-patterns** — What to avoid
- **Exceptions** — When rules can be broken
- **Onboarding guide** — Pattern primer for new team members

### Example: Patterns Document

```markdown
# Project Patterns: UserHub SaaS

## Service Pattern
How we implement business logic services.

### Template
```typescript
// src/services/UserService.ts
export class UserService {
  constructor(private db: Database) {}

  async getUserById(id: string): Promise<User> {
    const user = await this.db.query('SELECT * FROM users WHERE id = ?', [id]);
    if (!user) throw new NotFoundError('User not found');
    return user;
  }
}
```

### When to Use
Every piece of business logic lives in a service.
Services are injected into routes or other services.

### Benefits
- Separation of concerns (logic separate from HTTP)
- Easy to test (mock the database)
- Reusable logic

---

## 1. React Component Pattern
How we structure React components.

### Template
```typescript
interface UserProfileProps {
  userId: string;
}

export const UserProfile: React.FC<UserProfileProps> = ({ userId }) => {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchUser();
  }, [userId]);

  const fetchUser = async () => {
    setLoading(true);
    try {
      const user = await userApi.getUser(userId);
      setUser(user);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <Loading />;
  if (!user) return <Error />;

  return (
    <div>
      <h1>{user.name}</h1>
      {/* content */}
    </div>
  );
};
```

### When to Use
For every reusable component.
- Props should be typed
- useState for local state
- useEffect for side effects
- Error and loading states

---

## Testing Pattern
How we test code.

### Unit Test Template
```typescript
describe('UserService', () => {
  let service: UserService;
  let mockDb: jest.Mocked<Database>;

  beforeEach(() => {
    mockDb = createMockDatabase();
    service = new UserService(mockDb);
  });

  it('should return user by ID', async () => {
    const user = { id: '123', name: 'Alice' };
    mockDb.query.mockResolvedValue(user);

    const result = await service.getUserById('123');

    expect(result).toEqual(user);
    expect(mockDb.query).toHaveBeenCalledWith(
      'SELECT * FROM users WHERE id = ?',
      ['123']
    );
  });

  it('should throw when user not found', async () => {
    mockDb.query.mockResolvedValue(null);

    await expect(service.getUserById('123')).rejects.toThrow('User not found');
  });
});
```

### When to Use
- Test business logic with mocks
- Test error cases
- Aim for 80%+ coverage
- Fast to run (seconds, not minutes)

---

## Error Handling Pattern
How we handle and report errors.

### Template
```typescript
export class UserNotFoundError extends Error {
  constructor(userId: string) {
    super(`User not found: ${userId}`);
    this.name = 'UserNotFoundError';
  }
}

// In service
async function getUser(id: string) {
  const user = await db.query(...);
  if (!user) {
    throw new UserNotFoundError(id);  // Use specific errors
  }
  return user;
}

// In route
app.get('/users/:id', async (req, res) => {
  try {
    const user = await userService.getUser(req.params.id);
    res.json(user);
  } catch (error) {
    if (error instanceof UserNotFoundError) {
      res.status(404).json({ error: error.message });
    } else {
      console.error('Unexpected error:', error);
      res.status(500).json({ error: 'Internal error' });
    }
  }
});
```

### When to Use
- Always throw specific custom errors
- Catch and handle appropriately
- Log unexpected errors
- Return proper HTTP status codes

---

## API Pattern
How we design API endpoints.

### Rules
1. RESTful — GET, POST, PUT, DELETE
2. Consistent URLs — `/api/users/{id}`, not `/api/getUser`
3. Consistent responses — Wrap in envelope

### Example
```typescript
// GET /api/users/123
Response:
{
  "success": true,
  "data": { "id": "123", "name": "Alice" }
}

// POST /api/users (error)
Response:
{
  "success": false,
  "error": "Email already exists"
}
```

---

## Exceptions to Patterns

### When Can You Break Patterns?
- Document why in PR comment
- Get team consensus first
- Plan to refactor later if needed

### Example
"Using useReducer instead of useState here because state logic is complex (4+ interdependent fields)"
```

### Tips for Patterns

1. **Show examples** — Code speaks louder than rules
2. **Explain why** — Help team understand the rationale
3. **Be specific** — Show file paths, import statements
4. **Keep growing** — Add patterns as team discovers them
5. **Link to constitution** — Patterns are "usually", constitution is "always"

---

## 3. `/project-knowledge-base` — Project Memory

### What It Does
Manages and organizes project memory. Views accumulated knowledge from past discoveries and implementations.

### When to Use
- Looking for project knowledge
- Need to reference previous learnings
- Understanding team patterns
- Checking for known gotchas

### What to Provide
```
/project-knowledge-base

/project-knowledge-base Show me what we know about authentication
/project-knowledge-base Performance optimization findings
```

**Provide:**
- Query or topic
- Context if needed

### What You Get
- **Relevant knowledge** — From past work
- **Patterns identified** — Recurring solutions
- **Gotchas** — Known issues
- **Architecture decisions** — Why things are the way they are
- **Performance learnings** — What works/doesn't

### Example: Project Knowledge Query

```
/project-knowledge-base
Show me what we've learned about database performance
```

**Example output:**
```markdown
# Project Knowledge: Database Performance

## Indexed Queries
✅ All frequently-queried columns are indexed
✅ Composite indexes on user_id + created_at for activity queries
❌ Don't add unnecessary indexes (creates write overhead)

## Query Optimization
- Activity queries: Use pagination (max 100 per request)
- User queries: Cache in Redis for 5 minutes
- Bulk operations: Use batch insert, not individual inserts

## Known Gotchas
- Connection pool exhausted at 200 concurrent users (need to scale)
- Default query timeout is 30s (too long for real-time features)
- N+1 queries happen in reports (use JOINs or batch queries)

## Performance Targets
- P95 query response: <100ms
- P99 query response: <500ms
- Database CPU: <70% during peak load

## Learnings
1. Index before scaling, not after (1 day improvement to response time)
2. Connection pooling saved us $$$$ on infrastructure
3. Caching reduced DB load by 60% (biggest win)
4. Batch operations are 10x faster than individual
```

---

## Foundation Workflow

```
Project Start
  ↓
1. /constitution     Define rules
  ↓
2. /patterns         Document patterns
  ↓
3. Then start building with /spec, /plan, etc.
  ↓
Throughout
  ↓
- Use /project-knowledge-base to recall learnings
- Use /archive to add new learnings
```

---

## Quick Tips

| Agent                     | Purpose      | When                 | Time      |
| ------------------------- | ------------ | -------------------- | --------- |
| `/constitution`           | Rules        | Start (one-time)     | 30-60 min |
| `/patterns`               | Practices    | After 1 week of work | 30-60 min |
| `/project-knowledge-base` | Query memory | Anytime              | 5-10 min  |

---

## Next Steps

- **Ready to build?** Move to [Specification & Planning](specification-planning.md)
- **Questions about team practices?** Use `/patterns`
- **Need clarity on rules?** Check your constitution
