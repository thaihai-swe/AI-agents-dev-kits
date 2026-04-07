# Foundation And Setup

The foundation layer establishes durable repository knowledge that guides all future work.

## Commands In This Group

- `/constitution` — Establish repo-wide rules
- `/project-knowledge-base` — Document durable descriptive knowledge

## When To Use Foundation Commands

**Run once per repository** when:
- Setting up a new repo for the first time
- Making fundamental shifts in repo policy or architecture
- Newly understanding a major brownfield system

**Review/update quarterly or when:**
- Repository rules change significantly
- New architectural patterns emerge
- Subsystem boundaries shift
- Integration points change

## `/constitution`

Maintains `memories/repo/constitution.md`.

**Purpose:** Establish durable, normative rules that guide all future decisions and prevent scope creep or quality degradation.

**Use it for:**
- Testing expectations (unit, integration, end-to-end)
- Compatibility rules (backward compatibility, deprecation policy)
- Safety and security requirements
- Architecture guardrails (layering, service boundaries)
- Review and rollout expectations
- Code style and quality standards
- Release or deployment constraints
- AI agent behavioral constraints

**Examples of constitutional rules:**
- "All features must include automated tests"
- "Database migrations must be backward compatible"
- "All user-facing changes require documentation"
- "No hardcoded credentials anywhere"
- "All APIs must be versioned"

**Remember:** Constitution is NORMATIVE. It says what MUST be true, not just observations.

## `/project-knowledge-base`

Maintains `memories/repo/project-knowledge-base.md`.

**Purpose:** Capture durable descriptive knowledge about the system that helps teams navigate architecture and avoid recurring gotchas.

**Use it for:**
- Subsystem boundaries and responsibilities
- Integration seams and external dependencies
- Stable testing patterns discovered through practice
- Durable brownfield watchouts ("if you change X, always check Y")
- Recurring implementation patterns ("that's how we always do async here")
- Known constraints ("this service handles 10K requests/sec max")
- Historical decisions ("we chose this architecture because of Z")

**Examples of project knowledge:**
- "Auth subsystem lives in /services/auth, manages tokens and sessions"
- "Database writes go through migration scripts in /db/migrations"
- "When changing user model, remember to update legacy data mapper in /compat"
- "All async jobs use Bull queue pattern"
- "Frontend cache invalidation is handled by X service"

**Remember:** Only save information that:
- Is durable (true across many features)
- Is grounded in evidence (observed in the codebase)
- Helps future work (not just historic curiosity)

## The Difference: Constitution vs Project Knowledge

| Aspect               | Constitution                         | Project Knowledge Base                 |
| -------------------- | ------------------------------------ | -------------------------------------- |
| **Type**             | Normative (MUST)                     | Descriptive (IS)                       |
| **Purpose**          | Rules that guide decisions           | Context that informs decisions         |
| **Examples**         | Testing requirements, security rules | Subsystem boundaries, patterns         |
| **Relationship**     | Subordinate to nothing               | Subordinate to constitution            |
| **Update frequency** | Rarely (changes are big deals)       | Regularly (patterns emerge constantly) |
| **Scope**            | Entire repository                    | Entire repository                      |

## Workflow Pattern

```
New Repository?
    ↓
/constitution
    ↓ Create initial rules
/project-knowledge-base
    ↓ Document initial architecture
    ↓
[All future features refer back to these]
    ↓
Quarterly review to update if patterns or rules change
```

## Common Mistakes

❌ **Don't:** Put feature-specific details in repo memory
✅ **Instead:** Keep them in `artifacts/features/<slug>/`

❌ **Don't:** Let repo memory get outdated
✅ **Instead:** Review quarterly; delete what's no longer true

❌ **Don't:** Put everything there
✅ **Instead:** Consolidate; save only genuinely durable knowledge

❌ **Don't:** Treat project-knowledge as policy
✅ **Instead:** Remember it's descriptive; constitution is what you MUST follow

## Important Shift From Older Model

Older docs treated patterns and architecture capture as separate durable memory commands. The current codebase consolidates those responsibilities:
- All durable rules → `constitution.md`
- All durable descriptive knowledge → `project-knowledge-base.md`
- No separate "patterns" or "architecture'' commands
