# Specification & Planning Agents

**Turn ideas into executable plans with these 4 agents.**

---

## The 4 Agents

1. **spec** — Write specifications
2. **design** — Create technical designs
3. **plan** — Plan implementation
4. **tasks** — Break into tasks

---

## 1. `/spec` — Feature Specification

### What It Does
Creates a detailed feature specification that serves as the contract between what you want to build and what the team will build.

### When to Use
- Starting a new feature
- Need clarity on requirements
- Feature is vague or incomplete

### What to Provide
```
/spec <description of what you want to build>

Example:
/spec Build a user dashboard that shows stats about their recent activity,
       with filters for date range and activity type
```

**Optional context:**
- Project constraints
- User context
- Technical preferences
- Non-functional requirements

### What You Get
- **Feature specification** with clear scope
- **Functional requirements** (what it does)
- **Non-functional requirements** (performance, security, etc.)
- **Acceptance criteria** (how to verify it works)
- **Risks and assumptions** (gotchas to watch)
- **Open questions** (clarifications needed)

### Output Location
Saved to `artifacts/features/<slug>/spec.md`

### Example Output
```markdown
# User Dashboard Feature Specification

## Problem Statement
Users need a quick view of their recent activity with filtering capabilities.

## Scope
- Dashboard view with activity chart
- Filters: date range, activity type
- Real-time updates
- Mobile responsive

## Requirements
1. Display activity for past 30 days
2. Support filtering by 5+ activity types
3. Load dashboard in <2 seconds
4. Show max 100 recent activities

## Acceptance Criteria
- [ ] Dashboard loads within 2 seconds
- [ ] Filters work correctly
- [ ] Mobile layout looks good
- [ ] Real-time updates work

## Constraints
- Must use existing analytics data
- Cannot add new database tables
- Must support 10k concurrent users
```

### Tips
- Be specific, not vague
- Include "why" not just "what"
- Mention non-functional requirements
- List any constraints early

---

## 2. `/design` — Technical Design

### What It Does
Creates a technical architecture and design for complex features. Defines how you'll build it.

### When to Use
- Feature is architecturally complex
- New data models or APIs needed
- Performance is critical
- Building new integrations

### What to Provide
```
/design

(or provide context like)
/design for dashboard with real-time updates
```

**Required context:**
- Approved spec (from `/spec`)
- Project architecture overview
- Technology stack

### What You Get
- **Technical design document**
- **Architecture decisions** and trade-offs
- **Data model** (if applicable)
- **API specifications** (if applicable)
- **Integration points** with existing systems
- **Performance considerations**
- **Security considerations**

### Output Location
Saved to `artifacts/features/<slug>/design.md`

### Example Output
```markdown
# User Dashboard Technical Design

## Architecture

### Components
1. Frontend: React dashboard component
2. Backend: Node.js API with GraphQL
3. Cache: Redis for activity cache
4. Database: Existing analytics DB

### Data Flow
User Request → API → Cache → DB → Response

## Database Schema
- Dashboard can reuse existing analytics tables
- No new tables needed

## API Endpoints
POST /api/dashboard/activities?filter=type,date_range
GET /api/dashboard/stats

## Performance
- Cache activity data for 5 minutes
- Paginate results (max 100 per request)
- Target response time: <500ms

## Security
- Require authentication
- Filter activities by user ID server-side
- Rate limit to 100 requests/minute
```

### Tips
- Reference existing architecture
- Call out trade-offs
- Include performance targets
- Address security early

---

## 3. `/plan` — Delivery Plan

### What It Does
Creates an implementation plan with phases, milestones, risks, and timeline.

### When to Use
- Starting implementation
- Need to sequence work
- Coordinating team effort
- Need timeline estimates

### What to Provide
```
/plan

(plan automatically reads your spec and suggests phases)
```

**Required:**
- Approved spec (from `/spec`)

**Optional:**
- Design (from `/design`)
- Timeline constraints
- Team size/availability

### What You Get
- **Implementation phases** (phases of work)
- **Milestones** (checkpoints)
- **Timeline estimate** (how long each phase)
- **Risk analysis** (what could go wrong)
- **Success criteria** (how to verify)
- **Dependencies** (what needs to happen first)

### Output Location
Saved to `artifacts/features/<slug>/plan.md`

### Example Output
```markdown
# User Dashboard Implementation Plan

## Overview
4-week implementation across 3 phases

## Phase 1: Backend Setup (Week 1)
- Implement analytics API endpoints
- Set up Redis caching
- Write backend tests

Milestone: API endpoints working and tested

## Phase 2: Frontend (Week 2-3)
- Build React components
- Integrate with API
- Mobile responsive design
- E2E tests

Milestone: Dashboard fully functional

## Phase 3: Optimization & Polish (Week 4)
- Performance tuning
- Security hardening
- Documentation
- User acceptance testing

Milestone: Ready for production

## Risks
- Real-time updates might need WebSocket (low probability)
- Analytics DB query performance (medium probability)
- Mobile design complexity (low probability)

## Success Criteria
- All acceptance criteria met
- <2s load time
- 99.9% uptime
- >95% test coverage
```

### Tips
- Be realistic about timelines
- Call out critical risks
- Include testing in each phase
- Plan for burndown buffer

---

## 4. `/tasks` — Task Breakdown

### What It Does
Breaks the plan into concrete, actionable implementation tasks.

### When to Use
- About to start coding
- Need to coordinate team
- Want clear task list
- Assigning work to people

### What to Provide
```
/tasks

(automatically breaks down your approved plan)
```

**Required:**
- Approved plan (from `/plan`)
- Approved spec (from `/spec`)

### What You Get
- **Ordered task list** (step-by-step)
- **Task descriptions** (what to implement)
- **Dependencies** (what must come first)
- **Effort estimate** (time per task)
- **Completion criteria** (how to verify each task)
- **Assignability** (who can do what)

### Output Location
Saved to `artifacts/features/<slug>/tasks.md`

### Example Output
```markdown
# User Dashboard Tasks

## Phase 1: Backend Setup

### Task 1: Implement Analytics API Endpoints
- Implement GET /api/dashboard/activities
- Support filtering by date and type
- Add pagination
- Estimated: 8 hours
- Depends: None
- Criteria: All endpoints return correct data

### Task 2: Set Up Redis Caching
- Configure Redis connection
- Cache activity data for 5 minutes
- Cache invalidation on new activity
- Estimated: 4 hours
- Depends: Task 1
- Criteria: Cache reduces DB queries by 80%

### Task 3: Write Backend Tests
- Unit tests for API endpoints
- Integration tests with database
- Achieve >90% coverage
- Estimated: 6 hours
- Depends: Task 1, Task 2
- Criteria: All tests passing, >90% coverage

## Phase 2: Frontend

### Task 4: Build Dashboard Component
- React component for dashboard
- Connect to API
- Handle loading/error states
- Estimated: 12 hours
- Depends: Task 1
- Criteria: Component displays data correctly

...
```

### Tips
- Each task should take 2-4 hours
- Order by dependencies
- Be specific about criteria
- Estimate conservatively

---

## Workflow: Spec → Design → Plan → Tasks

```
1. Create Spec
   ↓
2. Review/approve spec
   ↓
3. Create Design (if complex)
   ↓
4. Create Plan
   ↓
5. Review/approve plan
   ↓
6. Create Tasks
   ↓
7. Start implementation (/implement)
```

---

## Quick Tips

| Agent     | Input               | Output           | Time      |
| --------- | ------------------- | ---------------- | --------- |
| `/spec`   | Description         | Specification    | 10-20 min |
| `/design` | Spec + architecture | Technical design | 15-30 min |
| `/plan`   | Spec + design       | Delivery plan    | 10-15 min |
| `/tasks`  | Plan + spec         | Task list        | 10-20 min |

---

## Next Steps

- **Ready to implement?** See [Implementation Agents](implementation-delivery.md)
- **Need design help?** Run `/design` on your specific feature
- **Have questions?** Check [FAQ](../../reference/faq.md)
