# Quality Gates and Definition of Done

The workflow has explicit quality checkpoints at two critical points to prevent defective work from proceeding.

## Two Quality Gates

### Gate 1: `/spec-review-requirements` (After Specification)

**Guard:** Ensures spec is clear, complete, and ready for downstream work before investing in design/planning.

**When to use:** After `/spec-requirement` produces `spec.md`.

**Output:** `artifacts/features/<slug>/requirements-review.md`

**Checks:**

**Clarity:**
- [ ] Problem statement is clear and specific
- [ ] Target users or stakeholders are identified
- [ ] Success criteria are measurable and testable

**Completeness:**
- [ ] In-scope items are listed
- [ ] Out-of-scope items are explicitly called out
- [ ] Functional requirements are concrete
- [ ] Non-functional requirements identified (performance, scalability, compliance)

**Readiness:**
- [ ] Dependencies and external constraints known
- [ ] Risks and open questions documented
- [ ] Implementation approach is clear enough to start planning
- [ ] Task breakdown is actionable

**Traceability:**
- [ ] Requirements have unique IDs (REQ-*)
- [ ] Acceptance criteria are specific (AC-*)
- [ ] Cross-references are clear

**Possible outcomes:**
- ✅ **Ready** → Proceed to `/spec-design` or `/spec-plan`
- 🔄 **Not ready** → Return to `/spec-requirement`, fix gaps, review again
- ⚠️ **Too risky** → May need `/analyze` first to clarify unknowns

### Gate 2: `/spec-review` (After Implementation)

**Guard:** Ensures delivered work actually matches the spec, plan, and repo rules before shipping.

**When to use:** After `/spec-implement` completes.

**Output:** `artifacts/features/<slug>/review.md` (optional, save when findings are important)

**Preconditions:**
- `spec.md` exists
- `plan.md` exists
- `tasks.md` exists
- implementation work has actually been attempted

**Checks:**

**Review Lens: Completeness**
- [ ] Requirements and acceptance criteria that should be covered are actually covered
- [ ] No important part of approved scope is silently missing
- [ ] Validation exists for the behavior that was supposed to change

**Review Lens: Correctness**
- [ ] Implemented behavior matches the approved intent
- [ ] Validation evidence supports the observed claims
- [ ] Important edge cases, regressions, and failure paths are handled appropriately

**Review Lens: Coherence**
- [ ] `spec.md`, `plan.md`, `tasks.md`, task state, and code tell the same story
- [ ] Reviewers can trace requirements to tasks to delivered behavior
- [ ] Handoff notes, deferred work, and final status are internally consistent

**Requirement Coverage:**
- [ ] Requirements appear fully, partially, or not satisfied based on evidence
- [ ] Acceptance criteria are actually observable in implementation or validation
- [ ] User-visible behavior matches approved intent

**Validation Quality:**
- [ ] Automated tests were added or updated when appropriate
- [ ] Manual verification exists when appropriate
- [ ] Validation matches the risk of the change
- [ ] Important edge cases and regressions are not ignored

**Scope Control:**
- [ ] Implementation stays within approved scope
- [ ] Task outcomes and actual implementation align
- [ ] Task `Status:` fields reflect reality
- [ ] No undeclared refactors or hidden behavior changes slipped in

**Quality And Safety:**
- [ ] Repository rules from `constitution.md` were followed
- [ ] Stable repository patterns were respected
- [ ] Compatibility, migration, security, privacy, performance, logging, and operational concerns were handled when relevant

**Documentation And Handoff:**
- [ ] Deferred work and limitations are clearly documented
- [ ] Reviewers can understand what shipped and what did not
- [ ] Traceability records remain usable for future contributors

**Possible outcomes:**
- ✅ **Approved** → Merge/release according to repository norms
- ✅ **Approved with follow-ups** → Acceptable to merge/ship, but non-blocking follow-up work remains
- 🔄 **Changes required** → Return to `/spec-implement` and fix blocking issues before approval

## Full Quality Flow

```
Feature Definition
      ↓
/spec-requirement → spec.md
      ↓
/spec-review-requirements [QUALITY GATE 1]
      ↓ Ready?
     Yes → /spec-design (if needed)
      ↓
Planning Phase
      ↓
/spec-plan → plan.md
      ↓
/spec-tasks → tasks.md
      ↓
Implementation Phase
      ↓
/spec-implement → code changes + tests
      ↓
/spec-review [QUALITY GATE 2]
      ↓ Ready?
     Yes → Ship!
      No → Fix and review again
```

## Definition of Ready

Before starting implementation (`/spec-implement`), verify using the Definition of Ready checklist:

- [ ] Problem statement is clear and specific
- [ ] Target users or stakeholders identified
- [ ] Success criteria are measurable
- [ ] In-scope items listed
- [ ] Out-of-scope items listed
- [ ] Functional requirements are concrete
- [ ] Non-functional requirements identified
- [ ] Dependencies and external constraints known
- [ ] Risks and open questions documented
- [ ] Implementation approach clear enough
- [ ] Task breakdown is actionable
- [ ] All IDs traceable (REQ-, AC-, TASK-)

**If not ready:** Stop. Return to specification or planning phase.

## Definition of Done

Before shipping (`/spec-review` pass), verify using the Definition of Done checklist:

- [ ] All acceptance criteria satisfied
- [ ] Code matches agreed spec and plan
- [ ] Automated tests added or updated
- [ ] Manual verification completed
- [ ] Limitations and follow-up work documented
- [ ] Logging, monitoring, operational concerns addressed
- [ ] Security, privacy, and performance impacts reviewed
- [ ] User-facing or developer documentation updated
- [ ] Decision logs and task status recorded
- [ ] Partial completion or deferred work clearly noted

**If not done:** Return to implementation. Don't ship incomplete work.

## Blocking vs Follow-Up Issues

**Blocking issues** prevent approval. Typical reasons:
- a requirement or acceptance criterion is unmet or unverifiable
- validation is too weak for the risk of the change
- implementation materially diverges from approved scope
- repository rules are violated
- task state or handoff state is misleading enough to create delivery risk

**Follow-up issues** do not invalidate the delivered change. Typical examples:
- documentation cleanup
- observability improvements
- robustness improvements that are useful but not required for approval
- non-critical polish work

Reviews should keep these categories separate.

## Why Two Gates?

### Gate 1 Prevents

❌ Vague specs that create ambiguity during planning/implementation  
❌ Missing requirements that surface late (expensive to fix)  
❌ Scope creep disguised as "clarifications"  
❌ Wasted planning effort on unclear specs  

### Gate 2 Prevents

❌ Incomplete implementations that sneak through  
❌ Scope drift during execution  
❌ Missing tests or validation  
❌ Poor code quality shipped  
❌ Misleading task status or handoff records  
❌ Undocumented decisions or limitations  

## When Quality Gates Can Be Skipped

**Never skip Gate 1** unless:
- Feature is literally "do exactly what was done before" (which shouldn't happen if spec needed)

**Never skip Gate 2** unless:
- You're completely isolated (no one else will use it) – still bad practice

**Recommendation:** Never skip either gate. They catch 80% of problems before they become expensive.

## What "Not Ready" Means

**Gate 1: "Not ready for design/planning"**

Common reasons:
- Spec doesn't actually say what needs to change (too vague)
- Missing critical requirements
- Acceptance criteria aren't measurable
- Key dependencies not identified
- Assumptions not made explicit

**Action:** Return to `/spec-requirement`. Fix the roots of the ambiguity.

**Gate 2: "changes required"**

Common reasons:
- Implementation differs from spec (missing requirements)
- Tests don't verify all acceptance criteria
- Code quality below repo standards
- Documentation missing
- Performance or security issues found

**Action:** Return to `/spec-implement`. Fix the gaps. Rerun review.
