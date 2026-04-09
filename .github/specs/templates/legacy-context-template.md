# Legacy Context: [Feature] & Existing Systems

**Feature**: [Feature name]
**Last updated**: [Date]
**Updated by**: [Agent/Person]

---

## How This Feature Connects to Legacy Code

### Overview

[1-2 sentences: Where does this feature touch existing systems?]

---

## Existing Systems Affected

### System 1: [Name]

**Purpose**: [What does this existing system do?]
**Key files**:
- `src/system/file1.ts` → [Role]
- `src/system/file2.ts` → [Role]

**How our feature integrates**:
- [Integration point 1]
- [Integration point 2]

**Contracts we must respect**:
- [Contract 1]
- [Contract 2]

**Durable watchouts from `project-knowledge-base.md`**:
- [Gotcha 1]: How we handle it
- [Gotcha 2]: How we handle it

### System 2: [Name]

...

---

## Data Model Changes

### New Tables/Fields

```sql
-- New table: feature_records
CREATE TABLE feature_records (
  id UUID PRIMARY KEY,
  user_id UUID NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);
```

**Migration strategy**: [How will we migrate existing data?]

### Modified Tables

- `users` table: Adding `feature_enabled` boolean
  - Default: [true/false]
  - Backfill: [How?]
  - Impact on reads: [Will this slow queries?]

---

## API Contracts

### Endpoints Added

```
POST /api/feature
GET /api/feature/:id
PUT /api/feature/:id
DELETE /api/feature/:id
```

### Endpoints Modified

None (or list any changes to existing endpoints)

---

## Authorization & Permissions

**Who can access?** [All users / Specific role / Feature flag]
**Existing permission model**: [How does your system check permissions?]
**Our integration**: [How do we leverage existing permissions?]

---

## Event Flows

### If Async/Event-Driven System

**Events we publish**:
- `feature.created` → [Who subscribes?]
- `feature.updated` → [Who subscribes?]

**Events we subscribe to**:
- `user.created` → [What do we do?]

---

## Performance Considerations

**Existing system constraints**:
- [PostgreSQL: Max X concurrent connections]
- [Redis: Y GB max memory]
- [API rate limits: Z req/min]

**Our impact**:
- New queries add [X] ms to typical requests
- Cache pressure: [Low / Medium / High]
- Event volume increase: [Estimated]

---

## Testing Strategy

### Tests We Wrote

- Unit tests: [Coverage area]
- Integration tests: [What systems interact?]
- Compatibility tests: [What existing behavior must we preserve?]

### Systems We Must Test Against

- [ ] System 1 still works with our changes
- [ ] System 2 performance unaffected
- [ ] Data consistency between legacy and new code

---

## Deployment Risk

### Risk Level

[🟢 LOW / 🟡 MEDIUM / 🔴 HIGH]

### Why

[Justification for risk level]

### Mitigations

- [Mitigation 1]
- [Mitigation 2]
- [Rollback plan if needed]

---

## Questions & Unknowns

- [ ] [Question 1?] - Owner: [Person]
- [ ] [Question 2?] - Owner: [Person]

---

## Related Documents

- **Repository rules**: [Link to memories/repo/constitution.md](#)
- **Durable repository knowledge**: [Link to memories/repo/project-knowledge-base.md](#)
- **Feature analysis**: [Link to artifacts/features/<slug>/analysis.md](#)
- **Feature-specific constraints**: [See specific notes below]

---

## Gotchas & Constraints: Specific to This Feature

### For This Feature, Remember:

- [Gotcha 1]: [Specific impact on this feature]
- [Gotcha 2]: [Specific impact on this feature]

### Constraints We Must Respect:

- [Constraint 1]: Why it matters
- [Constraint 2]: Why it matters

---

## Template: Copy and Modify

```markdown
# Legacy Context: [Feature]

## Overview
[1-2 sentences about integration]

## Existing Systems Affected

### System 1: [Name]
- Purpose: [...]
- Files: [...]
- Integration: [...]
- Contracts: [...]
- Gotchas: [...]

## Data Changes
[Schema additions/modifications]

## Performance
[Impact on existing systems]

## Testing
[What must work]

## Risk
[Risk level and mitigations]

## Questions
[Open items]
```

---

## Approval Checklist

Before integration, verify:

- [ ] Durable watchouts from project-knowledge-base.md understood and handled
- [ ] Relevant integration boundaries from project-knowledge-base.md respected
- [ ] Existing system tests still pass
- [ ] No performance degradation
- [ ] Deployment plan includes rollback
- [ ] Team understands the risks
