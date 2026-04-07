# Memory System

The workflow maintains two types of memory: repository memory (durable, shared) and feature artifacts (temporary, feature-specific).

## Repository Memory Structure

Durable repo memory lives under `memories/repo/`:

```
memories/repo/
├── constitution.md              # Repo-wide rules (normative)
└── project-knowledge-base.md    # Durable descriptive context
```

## Constitution (`constitution.md`)

**Nature:** Normative — establishes rules that MUST be followed

**Purpose:** Prevent scope creep, quality degradation, and risky patterns by establishing repo-wide guardrails

**Stores:**
- Testing expectations (unit tests, integration tests, etc.)
- Compatibility rules (backward compatibility policy, deprecation strategy)
- Migration safety requirements (data integrity, downtime rules)
- Architecture guardrails (layering, service boundaries)
- Review and rollout expectations
- Security and compliance constraints
- AI agent behavioral constraints
- Code quality and style standards

**Examples of constitutional rules:**
- "All database changes must include migration scripts"
- "No feature ships without automated tests"
- "All API changes require versioning"
- "Security review required for any auth or data handling changes"

**Discipline:** Constitution is about "what MUST be true" not "what IS true"

## Project Knowledge Base (`project-knowledge-base.md`)

**Nature:** Descriptive — documents what IS true about the system

**Purpose:** Help teams understand architecture and avoid repeatedly discovering the same gotchas

**Stores:**
- Subsystem boundaries and responsibilities
- Integration seams and external dependencies
- Recurring implementation patterns
- Stable testing patterns that work well
- Durable brownfield watchouts ("if you change X, always check Y")
- Known constraints (capacity, performance, compatibility)
- Historical context for major decisions

**Examples of project knowledge:**
- "Auth lives in /services/auth, manages tokens and sessions"
- "Database migrations live in /db/migrations and must be backward compatible"
- "Async jobs use Bull queue; check consumers in /workers"
- "When changing user model, update legacy data mapper in /compat module"
- "Cache invalidation is handled by edge service X"

**Discipline:** Only save information that:
- Is durable (true across many features)
- Is grounded in code (observed, not speculated)
- Is useful to future teams (not historic curiosity)

## Constitution vs Project Knowledge

| Aspect         | Constitution        | Project Knowledge           |
| -------------- | ------------------- | --------------------------- |
| **Type**       | Normative rule      | Descriptive fact            |
| **Says**       | "MUST be this way"  | "IS this way"               |
| **Enforced**   | Yes, mandatory      | Informational only          |
| **Examples**   | Tests required      | How auth subsystem works    |
| **Violating?** | Block work          | Inform but don't block      |
| **Update**     | Rarely (big change) | Regularly (patterns emerge) |
| **Scope**      | Repository-wide     | Repository-wide             |
| **Replaces**   | Nothing             | Feature repetition          |

## Memory Lifecycle

### Creation

1. **Initial Setup** (once per repo):
   - Run `/constitution` to establish rules
   - Run `/project-knowledge-base` to document architecture

2. **During Feature Work**:
   - Discoveries in `/analyze` may reveal durable patterns
   - If finding is durable → Add to project-knowledge-base
   - If finding is a rule violation → Update constitution
   - If finding is feature-specific → Keep in `artifacts/features/<slug>/`

### Maintenance

- **Review quarterly** - Is information still true?
- **Keep updated** - Delete what's outdated
- **Consolidate** - Merge redundant entries
- **Link** - Reference from specs and plans

### Archival

- Don't "archive" memory; just delete what's no longer true
- Feature artifacts are preserved by timestamping
- No separate archive command needed

## When Memory Conflicts

**Subordination rule:** Project-knowledge-base NEVER overrides constitution

```
Constitution (normative rules)
        ↑
  (must not violate)
        ↑
Project Knowledge Base (descriptive facts)
```

Example:
- Constitution says: "All features need tests"
- Project Knowledge says: "We tested feature X manually"
- Result: That's outdated project knowledge. Update it.

## Relationship To Feature Artifacts

**Repo Memory** (shared, durable):
- `constitution.md` - Rules for all features
- `project-knowledge-base.md` - Context for all features
- Written rarely, used constantly

**Feature Artifacts** (per-feature, temporary):
- `analysis.md` - Investigation for THIS feature
- `spec.md` - Requirements for THIS feature
- `design.md` - Technical decisions for THIS feature
- `plan.md` - Execution strategy for THIS feature
- `tasks.md` - Work breakdown for THIS feature
- `review.md` - Validation for THIS feature
- Written constantly, archived after feature ships

**Key difference:** Repo memory is shared across all future work. Feature artifacts help one feature.

## Common Mistakes

❌ **Too much in memory** - Every observation gets saved
✅ **Selective** - Only durable, broadly useful knowledge

❌ **Feature-specific in memory** - "Feature X uses pattern Y"
✅ **General pattern** - "We always use pattern Y for this type of work"

❌ **Outdated memory** - Never reviewed or cleaned
✅ **Current** - Quarterly audit, delete what's stale

❌ **Subordinating constitution** - "We usually follow rule X"
✅ **Enforcing constitution** - "Rule X is not negotiable"

❌ **Storing decisions** - "We decided X"
✅ **Storing patterns** - "This is how X is typically done"

## Memory Workflow

```
Feature Investigation (/analyze)
       ↓
Find durable pattern?
  ├─ Yes → Update project-knowledge-base
  ├─ No → Keep in feature artifact
  └─ Is it a rule? → Update constitut
