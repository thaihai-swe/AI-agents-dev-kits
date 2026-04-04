# Getting Started with the AI Development Kit

**Your first 10 minutes with the kit.**

---

## What You're Getting

The AI Development Kit is a system of **13 specialized AI agents** that help you:

- **Plan features** — Write specifications, create plans, break into tasks
- **Build code** — Generate code, tests, and documentation
- **Review work** — Verify quality before merging
- **Learn systems** — Explore and document existing code
- **Capture knowledge** — Save learnings for your team
- **Establish guardrails** — Define project rules and patterns

---

## The 30-Second Version

| If You Want              | Use This                                                |
| ------------------------ | ------------------------------------------------------- |
| Build a new feature      | `/spec` → `/plan` → `/tasks` → `/implement` → `/review` |
| Understand existing code | `/discover` → `/architecture`                           |
| Debug a problem          | `/analyze "your problem"`                               |
| Set up new project       | `/constitution` → `/patterns`                           |
| Save discoveries         | `/archive "what you learned"`                           |

---

## Your First Feature: Start to Finish

Let's say you want to build a "user profile" feature. Here's exactly what to do:

### Step 1: Write Specification (5 min)
```
/spec Build a user profile page showing user details,
       edit button, and logout option.
       Must load in under 2 seconds.
```

**What you get:**
- Feature specification with requirements
- Acceptance criteria (how to verify it works)
- Risks and constraints
- Open questions for clarification

### Step 2: Plan Implementation (5 min)
```
/plan
```

(The agent automatically reads your spec and creates a plan)

**What you get:**
- Implementation phases (Frontend, Backend, etc.)
- Timeline estimate (how long each phase)
- Risks identified
- Success criteria

### Step 3: Break Into Tasks (5 min)
```
/tasks
```

(The agent breaks the plan into concrete tasks)

**What you get:**
- List of tasks (Task 1, Task 2, etc.)
- What each task involves
- How long each should take
- Dependencies (what must come first)

### Step 4: Implement (2-4 hours)
```
/implement Task 1: Build backend GET /api/profile endpoint
```

(Repeat for each task)

**What you get:**
- Production-ready code
- Tests
- Documentation

### Step 5: Verify Quality (10 min)
```
/review
```

**What you get:**
- Issues found (if any)
- Coverage report
- Recommendations

**If issues:** Fix them and run `/review` again

### Step 6: Deploy
Code is ready! Push to main and deploy.

### Step 7: (Optional) Save What You Learned (5 min)
```
/archive Profile page completed. Learned: XYZ about auth, perf issues with...
```

**Why?** So your team remembers next time.

---

## Choose Your Starting Point

### I'm Starting a New Project
1. Run `/constitution "Project description"`
2. After first week, run `/patterns`
3. Then follow "Your First Feature" above

### I'm Joining an Existing Project
1. Run `/discover "main system/subsystem"`
2. Run `/architecture`
3. Ask questions with `/analyze`
4. Check project memory for team knowledge
5. Then follow "Your First Feature" above

### I Have a Quick Question
1. Run `/analyze "your question"`
2. Get answer back in 2-5 min

### I Found a Bug
1. Run `/analyze "describe the bug"`
2. If simple: Fix it with `/implement`
3. Otherwise: Run `/plan` to structure the work

---

## Key Concepts in 2 Minutes

### Specifications
A spec is the contract. It says:
- **What** you're building (features)
- **Why** you're building it (problem it solves)
- **How to verify** it works (acceptance criteria)

Before coding, have a spec. It saves time.

### Plans
A plan breaks down HOW:
- **Phases** — What gets built when
- **Milestones** — Checkpoints
- **Risks** — What could go wrong

### Tasks
Tasks are the concrete steps:
- Developer-friendly
- 2-4 hours each
- Clear completion criteria

### Implementation
Writing code with a task list:
- You know exactly what to build
- Code is tested
- Documentation is included

### Review
Quality gate before merging:
- Does it match the spec?
- Are tests sufficient?
- Performance OK?
- Security OK?

### Discovery & Archive
When joining or finishing:
- Learn the system → save findings
- Other developers can access your knowledge

---

## The 13 Agents: Quick Intro

| #   | Agent                  | What It Does           | Command                   |
| --- | ---------------------- | ---------------------- | ------------------------- |
| 1   | spec                   | Write specifications   | `/spec`                   |
| 2   | plan                   | Create plans           | `/plan`                   |
| 3   | tasks                  | Break into tasks       | `/tasks`                  |
| 4   | design                 | Technical design       | `/design`                 |
| 5   | implement              | Write code             | `/implement`              |
| 6   | review                 | Verify code            | `/review`                 |
| 7   | analyze                | Investigate problems   | `/analyze`                |
| 8   | discover               | Explore systems        | `/discover`               |
| 9   | architecture           | Document design        | `/architecture`           |
| 10  | constitution           | Define project rules   | `/constitution`           |
| 11  | patterns               | Document team patterns | `/patterns`               |
| 12  | project-knowledge-base | Access team knowledge  | `/project-knowledge-base` |
| 13  | promote-to-repo-memory | Archive findings       | `/archive`                |

---

## How to Use Agents

1. **Type the command** — `/spec`, `/plan`, etc.
2. **Provide context** — What you want (be specific)
3. **Read the output**
4. **Review and validate**
5. **Use output as input for next step**

### Example: Specific vs Vague

❌ **Vague:**
```
/spec Build a user feature
```

✅ **Specific:**
```
/spec Build a user profile page that displays name, email, and avatar.
       Users can edit their profile. Must be mobile responsive.
       Must load in under 2 seconds.
```

Better input → Better output

---

## Common Questions

**Q: Do I have to use ALL 13 agents?**
A: No. Most features use: `/spec` → `/plan` → `/tasks` → `/implement` → `/review`

**Q: Do I have to follow the order?**
A: The order matters. Don't `/implement` without `/spec`. But you can adapt for your situation.

**Q: Can I skip steps?**
A: Some steps are optional (like `/design` for simple features), but don't skip `/spec` and `/implement`.

**Q: How long does one feature take?**
A: Usually 6-8 hours:
- Spec + Plan + Tasks: 1-2 hours
- Implementation: 4-6 hours
- Review: 15-30 min

**Q: What if I'm not sure about what to build?**
A: Run `/analyze` to research. Or run `/spec` and let the agent help clarify.

**Q: Can I run agents multiple times?**
A: Yes! Run them again if you want to refine the output.

---

## Your First Command

You're ready! Pick one:

**New project?**
```
/constitution I'm building a TypeScript/React web app with Node.js backend
```

**Existing project?**
```
/discover
```

**Have an idea?**
```
/spec Build a... [your feature]
```

**Have a question?**
```
/analyze [your question]
```

---

## Next Steps

- [Full Workflows Guide](../workflows/)
- [All 13 Agents Explained](../agents/)
- [FAQ](../reference/faq.md)
- [References](../reference/)

---

## Pro Tips

1. **Be specific** — Vague input = vague output
2. **Provide context** — Agents work better with background
3. **Iterate** — Run agents multiple times to refine
4. **Archive knowledge** — Save learnings for your team
5. **Trust the process** — Specs + Plans + Tasks = better code

---

**Ready?** Pick a command from the quick reference above and give it a try!
