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
- 🔄 **Needs revision** → Return to `/spec-requirement`, fix gaps, review again
- ⚠️ **Too risky** → May need `/analyze` first to clarify unknowns

### Gate 2: `/spec-review` (After Implementation)

**Guard:** Ensures delivered work actually matches the spec, plan, and repo rules before shipping.

**When to use:** After `/spec-implement` completes.

**Output:** `artifacts/features/<slug>/review.md` (optional, save when findings are important)

**Checks:**

**Scope Alignment:**
- [ ] All approved requirements are implemented
- [ ] All acceptance criteria are satisfied
- [ ] No scope drift from approved spec
- [ ] Feature matches described use cases

**Code Quality:**
- [ ] Code matches approved design and plan
- [ ] Follows repo constitution (rules and guardrails)
- [ ] Code style and patterns consistent with codebase
- [ ] No technical debt introduced without documentation

**Validation:**
- [ ] Automated tests are comprehensive
- [ ] Manual verification completed where appropriate
- [ ] Edge cases are handled
- [ ] Error cases are handled gracefully

**Documentation & Operations:**
- [ ] User-facing documentation updated
- [ ] Developer documentation updated
- [ ] Logging and monitoring in place
- [ ] Performance impact assessed
- [ ] Security/privacy impacts addressed

**Traceability:**
- [ ] Each requirement links to implementation
- [ ] Each task links to code changes
- [ ] Acceptance criteria are verified
- [ ] Changes are auditable end-to-end

**Possible outcomes:**
- ✅ **Ready to ship** → Merge/release
- 🔄 **Needs fixes** → Return to `/spec-implement`, fix issues, review again
- ⚠️ **Scope mismatch** → Update spec, planning, or implementation accordingly
- 📋 **Follow-up work discovered** → Document for post-release work

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

**Gate 2: "Not ready to ship"**

Common reasons:
- Implementation differs from spec (missing requirements)
- Tests don't verify all acceptance criteria
- Code quality below repo standards
- Documentation missing
- Performance or security issues found

**Action:** Return to `/spec-implement`. Fix the gaps. Rerun review.
