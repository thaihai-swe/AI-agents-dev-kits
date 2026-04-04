---
name: spec-review
description: 'Review implementation against the AI delivery kit artifacts'
---

# Goal

Review a change against its spec, plan, tasks, and definition of done.

# Instructions

1. Read:
   - `artifacts/features/<feature-slug>/spec.md`
   - `artifacts/features/<feature-slug>/design.md` if present
   - `artifacts/features/<feature-slug>/plan.md`
   - `artifacts/features/<feature-slug>/tasks.md`
   - `memories/repo/constitution.md` if present
   - `memories/repo/project-knowledge-base.md` if present
   - `.github/specs/checklists/definition-of-done.md`
2. Compare the current implementation or diff against the documented intent.
3. Identify:
   - missing requirements
   - deviations from the approved technical design when `design.md` exists
   - broken traceability between `REQ-*`, `AC-*`, and `TASK-*`
   - scope drift
   - insufficient test coverage
   - operational or rollback gaps
   - undocumented tradeoffs
4. Prioritize findings by severity.
5. Cite the relevant requirement, acceptance criterion, task, constitution rule, or checklist item for each major issue.
6. End with:
   - pass/fail recommendation
   - unresolved risks
   - suggested follow-up actions
7. Do not modify implementation files during this step.
8. Do not create or update:
   - `spec.md`
   - `plan.md`
   - `tasks.md`
   - source code
9. If written output is needed, limit it to a review summary only.
---

# Review Checklist

Ensure implementation meets spec by verifying:

### Requirement Alignment
- [ ] Each REQ-* from spec is addressed in code or tests?
- [ ] Each AC-* has corresponding test demonstrating it works?
- [ ] Any REQ-* marked out-of-scope in spec? (should not appear in code)
- [ ] In-scope boundaries respected? (no scope creep?)

### Traceability
- [ ] Commits reference task IDs and AC-*?
- [ ] Code comments cite acceptance criteria being implemented?
- [ ] Tests are named after AC-* they verify?
- [ ] Task status fully updated in tasks.md?

### Technical Quality
- [ ] Design.md followed when present?
- [ ] Constitution rules respected (testing, naming, patterns)?
- [ ] Project knowledge base patterns used (not reinventing)?
- [ ] Error handling matches project standards?
- [ ] No console.logs or debug code left in?

### Validation
- [ ] All tests passing (100% pass rate, no skipped tests)?
- [ ] Test coverage meets minimum threshold (75%)?
- [ ] Linting clean (no style violations)?
- [ ] Performance meets non-functional requirements (REQ-NF-*)?

### Release Readiness
- [ ] Database migrations tested and reversible?
- [ ] Rollback plan documented?
- [ ] Feature flag strategy clear?
- [ ] Monitoring/alerting configured?

---

# Example Review Finding

**Finding**: REQ-FN-004 (send reset email) is not covered by test.

**Severity**: Blocking - Cannot verify email is sent.

**Citation**:
- Spec: REQ-FN-004 requires email delivery
- Acceptance: AC-001 requires email within 30s
- Code: Email sending function exists but not tested
- Test: No test file covering email delivery

**Recommendation**: Add integration test that verifies SendGrid receives email after password reset request.
- Suggested file: `src/services/password-reset.integration.test.ts`
- Success: Test demonstrates AC-001 (email <30s)

---
# User Input

Feature slug: ${input:slug:Enter the feature slug}
