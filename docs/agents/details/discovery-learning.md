# Discovery & Learning Agents

**Understand systems and research questions with these 3 agents.**

---

## The 3 Agents

1. **analyze** — Investigate problems
2. **discover** — Explore existing code
3. **architecture** — Document system design

---

## 1. `/analyze` — Investigate & Research

### What It Does
Systematically investigates problems, questions, or research topics. Gathers evidence and proposes solutions.

### When to Use
- Stuck on a technical problem
- Need to research something
- Want to understand existing code
- Evaluating technical options
- Debugging issues
- Understanding error messages

### What to Provide
```
/analyze <your question or problem>

Examples:
/analyze Why are database queries timing out?
/analyze How should we handle user authentication?
/analyze What's the best way to optimize image loading?
/analyze Why is the test suite failing on CI but passing locally?
```

**Provide:**
- Clear question or problem
- Context (error messages, behavior, etc.)
- What you've already tried
- Relevant code snippets

### What You Get
- **Systematic analysis** — Breaks down the problem
- **Evidence gathering** — Relevant code/logs
- **Root cause** — Why it's happening
- **Possible solutions** — Options to fix
- **Recommendations** — Best path forward
- **Research findings** — What you need to know

### Example: Analyze Performance Issue

```
/analyze Dashboard is loading slowly, takes 5+ seconds.
         Backend responds in <500ms but frontend takes forever.
         What's the bottleneck?
```

**Example output:**
```markdown
# Analysis: Slow Dashboard Load

## Problem Statement
Dashboard takes 5+ seconds to load despite fast backend.

## Investigation
1. Network waterfall shows:
   - DOM parse: 1.2s
   - React render: 2.1s
   - Other scripts: 1.5s

2. React profiler shows:
   - ActivityList component re-renders 12x
   - useEffect hook running repeatedly

3. Bundle analysis:
   - Total JS: 850KB
   - Unused code: ~200KB

## Root Cause
React components are re-rendering unnecessarily due to missing React.memo().
Combined with large bundle size causing slow parsing.

## Evidence
- React DevTools shows ActivityList re-renders on every state change
- Browser DevTools shows JS parsing takes 2.1s on first load
- 200KB of unused vendor code in bundle

## Solutions
1. **Quick Win (1 hour)**: Add React.memo() to prevent re-renders
2. **Medium Fix (4 hours)**: Code split and lazy load components
3. **Long-term (1 day)**: Tree-shake unused code from bundle

## Recommendation
1. Start with React.memo() → should see improvement immediately
2. Then code split Dashboard → further improvement
3. Monitor and measure

## Expected Outcome
With fixes:
- Dashboard load time: 5s → 1.2s (76% improvement)
- All without backend changes
```

### When to Use vs Other Agents

- **Use `/analyze` for:** Questions, problems, research
- **Use `/implement` for:** Writing code
- **Use `/discover` for:** Understanding new systems
- **Use `/design` for:** Planning architecture

### Tips

1. **Be specific** — "Slow" vs "Dashboard takes 5+ seconds"
2. **Provide context** — Error messages, logs, behavior
3. **Show what you tried** — "I tried X, didn't help because..."
4. **Include measurements** — "Was 5s, now 3s after Y change"

---

## 2. `/discover` — Explore Codebase

### What It Does
Systematically explores and documents an existing codebase or system. Ideal for onboarding to new projects.

### When to Use
- Joining a new project
- Unfamiliar with existing code
- Need to understand architecture
- Planning work on legacy code
- Understanding team patterns

### What to Provide
```
/discover

/discover authentication system
/discover src/api
/discover database layer
```

**Optional context:**
- Directory to explore
- System name
- What you want to understand

### What You Get
- **Codebase overview** — The big picture
- **Key components** — What's important
- **Architecture** — How things fit together
- **Patterns and conventions** — Team style
- **Dependencies** — External libraries
- **Gotchas and warnings** — Watch out for...
- **Entry points** — Where to start
- **Areas of technical debt** — Known issues

### Example: Discover Payment System

```
/discover payment processing system
```

**Example output:**
```markdown
# Payment System Discovery

## Overview
Handles credit card processing, recurring billing, and payment reconciliation.

## Key Components

### 1. Payment Service (`src/services/payment/`)
- Handles card processing via Stripe
- Manages payment state machines
- Supports retry logic

### 2. Billing Engine (`src/services/billing/`)
- Calculates recurring charges
- Handles invoice generation
- Sends notifications

### 3. Reconciliation (`src/jobs/reconcile-payments.js`)
- Daily job reconciles Stripe data with DB
- Handles payment confirmations
- Flags discrepancies

## Architecture
```
Payment Request
  → Stripe API
  → Payment Service
  → Database
  → Billing Engine
  → Invoice Service
```

## Key Patterns
- State machines for payment flow
- Async job queues for billing
- Idempotent endpoints (safe to retry)
- Webhooks for Stripe events

## Important Files
- `src/models/Payment.ts` — Payment schema
- `src/services/payment/index.ts` — Main logic
- `src/middleware/validateCard.ts` — Validation
- `tests/payment.integration.test.ts` — How to test

## Dependencies
- stripe (card processing)
- bull (job queue)
- node-cron (scheduling)

## Gotchas ⚠️
- Payment state machine has 7 states (not 3!)
- Webhook handling must be idempotent
- Timezone issues with recurring billing
- Rate limiting on Stripe test API

## Technical Debt
- Payment logging lacks transaction IDs
- No audit trail for reconciliation
- Retry logic is hardcoded (should be configurable)

## Next Steps
- Read `docs/payment-flow.md` for detailed flow
- Check `tests/` for usage examples
- Talk to @payments-team for business rules
```

### Tips for Discovery

1. **Set scope** — "Discover payment system" vs "Discover entire codebase"
2. **Use specific paths** — Helps guide the exploration
3. **Follow up with** `/architecture` to document findings
4. **Run `/analyze`** for specific questions that arise
5. **Use `/archive`** to save the discoveries

---

## 3. `/architecture` — Document System Design

### What It Does
Creates comprehensive architecture documentation. Documents structure, decisions, design patterns, and integration points.

### When to Use
- After running `/discover`
- Need to document system design
- Want to share architecture with team
- Planning integration with other systems
- Onboarding new team members
- Evaluating architectural changes

### What to Provide
```
/architecture

(should follow /discover for best results)
```

**Required context:**
- Component overview
- Integration points
- Key flows

**Optional:**
- Specific areas to focus on
- Team questions about architecture

### What You Get
- **Architecture document** — Complete system design
- **Component diagrams** — Visual representation
- **Data flow diagrams** — How data moves
- **Design decisions** — Why things are structured this way
- **Trade-offs** — What was chosen and what wasn't
- **Integration points** — How it connects to other systems
- **Scalability notes** — How to handle growth
- **Known limitations** — What's hard about this design

### Example: Architecture Document

```markdown
# Payment System Architecture

## System Overview
```
┌─────────────┬──────────────┬──────────────┐
│  API Layer  │ Service Layer│  Data Layer  │
├─────────────┼──────────────┼──────────────┤
│ Route /pay  │ PaymentSvc   │ PaymentDB    │
│ Route /bill │ BillingSvc   │ InvoiceDB    │
└─────────────┴──────────────┴──────────────┘
```

## Component Details

### API Layer
- `/api/payments/charge` — Initiate payment
- `/api/payments/status` — Check payment status
- `/api/subscriptions/create` — Set up recurring billing

### Service Layer
- **PaymentService** — Coordinates with Stripe
- **BillingService** — Calculates charges
- **ReconcileService** — Validates data consistency

### Data Layer
- Payment store (transaction records)
- Invoice store (billing history)
- Subscription store (recurring billing config)

## Key Design Decisions

### Why State Machines?
Payment flow has many states (pending → processing → completed/failed).
State machines prevent invalid transitions and make logic explicit.

### Why Async Billing?
Billing is not blocking. Charges happen in background via job queue.
Allows fast response to user even if processing takes time.

### Why Webhooks?
Stripe asynchronously confirms/fails payments. Webhooks keep our DB in sync.

## Trade-offs

| Choice         | Pros                           | Cons                     |
| -------------- | ------------------------------ | ------------------------ |
| Queue-based    | Async, scalable                | Complex, harder to debug |
| State machines | Explicit, safe                 | More code initially      |
| Webhooks       | Reliable, eventual consistency | Hard to test offline     |

## Data Flow: Credit Card Charge

```
User submits payment form
  ↓
POST /api/payments/charge
  ↓
PaymentService validates input
  ↓
Call Stripe API
  ↓
Create Payment record (pending)
  ↓
Add job to queue (billing)
  ↓
Return payment ID to user
  ↓
[Async] Stripe webhook confirms → Update Payment (confirmed)
  ↓
[Async] BillingService processes → Create Invoice
```

## Scalability
- Job queue can handle 10k charges/second
- Database partitioned by customer ID
- Stripe handles high volume on their side
- Bottleneck: reconciliation job (nightly, not blocking)

## Known Limitations
- Refunds require manual intervention
- Cannot cancel subscriptions with existing invoices
- No audit trail (should add)
```

### Tips for Architecture

1. **Follow discovery** — Use `/discover` findings
2. **Include diagrams** — Visual > text
3. **Document why** — Not just what
4. **Note trade-offs** — Why not alternatives?
5. **Call out limitations** — Be honest about problems

---

## Typical Discovery Workflow

```
1. /discover "system name"
   ↓ (read findings)
   ↓
2. /analyze "specific questions"
   ↓ (get clarity on specific areas)
   ↓
3. /architecture
   ↓ (document full design)
   ↓
4. /archive
   ↓ (save to project memory)
```

---

## Quick Comparison

| Agent           | Use For                       | Time      | Output           |
| --------------- | ----------------------------- | --------- | ---------------- |
| `/analyze`      | Questions, problems, research | 10-20 min | Analysis report  |
| `/discover`     | Explore existing code         | 15-30 min | System overview  |
| `/architecture` | Document design               | 10-20 min | Architecture doc |

---

## Next Steps

- **After discovery?** Run `/architecture`
- **Have questions?** Run `/analyze`
- **Want to save findings?** Use `/archive`
- **Ready to build features?** Use `/spec`

---

## Pro Tips

- **Discovery first** — When joining new projects, always start with `/discover`
- **Archive findings** — Save discoveries for team to learn from
- **Follow up specifics** — Use `/analyze` for questions that arise
- **Think of it as learning** — These agents help your team level up
