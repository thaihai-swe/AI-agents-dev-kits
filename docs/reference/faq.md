# FAQ: Frequently Asked Questions

**Answers to common questions about the AI Development Kit.**

---

## General Questions

### Q: What is the AI Development Kit?
**A:** A system of 13 AI agents that manage development from specification through implementation. It includes agents for planning, building, reviewing, discovering, and archiving knowledge.

### Q: Do I have to use all 13 agents?
**A:** No. Most projects use: `/spec` → `/plan` → `/tasks` → `/implement` → `/review`. Other agents are for specific situations.

### Q: How long does it take to learn?
**A:** 15 minutes to understand basics, 1 hour to feel comfortable, 1 week to master.

### Q: Can I use this for non-software projects?
**A:** Partially. The core workflow (spec → plan → implement → review) works for anything. But some agents are code-specific.

---

## About Specifications

### Q: How detailed should a spec be?
**A:** 2-3 pages typically. Include: problem, scope, requirements, acceptance criteria, risks. More for complex features.

### Q: What's the difference between spec, design, and plan?
**A:**
- **Spec** = WHAT to build
- **Design** = HOW to build it technically
- **Plan** = WHEN and how long to build it

### Q: Can I change the spec after planning?
**A:** Yes. Update spec, re-run `/plan`. Specs aren't locked, they evolve.

### Q: Should I always get spec reviewed?
**A:** For complex features: yes. For simple: optional.

---

## About Planning & Tasks

### Q: How many tasks should there be?
**A:** Typically 5-20. Each task should take 2-4 hours.

### Q: Can I skip planning?
**A:** For your own work: maybe. For team work: no. Plans coordinate effort.

### Q: Can I reorder tasks?
**A:** Only if they're independent (no dependencies).

### Q: What if a task takes longer than estimated?
**A:** Update task time and note why. Use learning to improve future estimates.

---

## About Implementation

### Q: How does `/implement` help if I'm an experienced developer?
**A:** It writes boilerplate, tests, docs, error handling. Saves time on mechanical work.

### Q: Can I use my own code instead?
**A:** Absolutely. `/implement` is a starting point. Modify as needed.

### Q: What if I dislike the code generated?
**A:** Run `/implement` again with more specific feedback.

### Q: What about code review?
**A:** Run `/review` after writing code. It's an automated code review.

---

## About Review & Quality

### Q: What does `/review` check?
**A:** Matches spec, covers acceptance criteria, has tests, documents, performance, security.

### Q: Can I skip review?
**A:** Technically yes, but catches bugs. 15-min review saves hours.

### Q: What if review finds issues?
**A:** Fix them and re-review. Iterate until passing.

### Q: How much test coverage is enough?
**A:** 80%+. Higher for critical features.

---

## About Discovery & Learning

### Q: When should I use `/discover`?
**A:** First time on a project, when joining team, or when learning new system.

### Q: How long does discovery take?
**A:** 30 min - 2 hours depending on system complexity.

### Q: Should I document everything?
**A:** No. Just enough for the team to understand and build.

---

## About Memory System

### Q: Where does knowledge go?
**A:** Three tiers: personal, session, team. Use `/archive` to save team knowledge.

### Q: How do I retrieve saved knowledge?
**A:** Use `/project-knowledge-base` or search with `/analyze`.

### Q: Can I share knowledge with other projects?
**A:** Not automatically. But you can reference it in other projects.

### Q: Does memory ever expire?
**A:** Team memory stays forever. Session memory clears each session.

---

## About Workflows

### Q: Should I follow the exact workflow?
**A:** Roughly, yes. But adapt for your situation. Emergency hotfix? Skip design.

### Q: Can I run agents out of order?
**A:** Some: `/analyze` anytime. But `/plan` needs `/spec` first.

### Q: What if I don't know what to build?
**A:** Run `/spec` anyway. Agent helps you clarify.

---

## About Project Setup

### Q: How often should I update constitution?
**A:** Once at start, then review annually or when major change.

### Q: What's the difference between constitution and patterns?
**A:** Constitution = must-follow rules. Patterns = usually-follow practices.

### Q: Should every project have a constitution?
**A:** Yes, even small ones. Prevents future disputes.

---

## Troubleshooting

### Q: An agent gave bad output. What do I do?
**A:** Provide more context and run again. Specific input = better output.

### Q: System seems too rigid. Can I adapt it?
**A:** Absolutely. This is a template. Adapt for your team.

### Q: Can I use this for legacy code?
**A:** Yes. Start with `/discover` and `/architecture`.

### Q: How do I measure if this is working?
**A:** Track: implementation time, bugs found in review, rework amount, team happiness.

---

## Team & Collaboration

### Q: How do I teach this to my team?
**A:** Have them read [Getting Started](getting-started.md), then pair program on first feature.

### Q: What if team wants to skip steps?
**A:** Show them rework when steps are skipped. They'll understand.

### Q: Can multiple people use the kit?
**A:** Yes. Memory system stores team knowledge. Each person has personal memory too.

### Q: How do I onboard new team members?
**A:** Have them run `/discover` and `/architecture`, then read `/project-knowledge-base`.

---

## Time & Effort

### Q: How long for a simple feature?
**A:** Spec + Plan + Tasks: 1 hour. Implement: 2-4 hours. Total: 3-5 hours.

### Q: How long for a complex feature?
**A:** Spec + Design + Plan + Tasks: 2-3 hours. Implement: 10-20 hours. Total: 12-23 hours.

### Q: Is this faster than ad-hoc development?
**A:** Usually yes. Prevents rework and catches bugs early.

### Q: When is this slowest?
**A:** One-person projects. Benefits show with team coordination.

---

## Technical Questions

### Q: Does this work with my tech stack?
**A:** Yes. Agents don't care about tech. They adapt.

### Q: What about CI/CD and testing?
**A:** Agents create tests. You integrate with your CI/CD.

### Q: How does this work with Git?
**A:** Agents don't require Git. But work well with version control.

### Q: What about containerization/deployment?
**A:** Agents generate code. You handle deployment separately.

---

## Pricing & Licensing

### Q: Is this free?
**A:** The kit and documentation are free. Agent access depends on your AI platform.

### Q: Can I use commercially?
**A:** Yes. No restrictions on use.

### Q: Can I modify the agents?
**A:** Yes, agents are customizable. See agent-customization skill.

---

## Still Have Questions?

- Check [Getting Started](getting-started.md)
- See [Workflows](../workflows/)
- Read [Agents](../agents/)
- Search [Reference](../reference/)

---

## Common Workflows Quick Ref

**Build a feature:**
```
/spec → /plan → /tasks → /implement → /review
```

**Understand code:**
```
/discover → /architecture → /analyze
```

**Setup project:**
```
/constitution → /patterns
```

**Debug problem:**
```
/analyze → /implement fix → /review
```

**Save learning:**
```
/archive "what we learned"
```

---

**Version:** 1.0
**Updated:** April 4, 2026
