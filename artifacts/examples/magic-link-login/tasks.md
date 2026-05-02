# Task Breakdown

## Metadata

- Feature name: Passwordless Email Magic Link Login
- Related spec: `spec.md`
- Related plan: `plan.md`
- Related design: `design.md`
- Owner: authentication maintainers
- Last updated: 2026-05-02

## Rules

- Keep each task small and testable.
- Include validation tasks, not just implementation tasks.
- Record blockers and dependencies explicitly.
- Link every task back to requirement and acceptance criteria IDs.
- Link every task back to the plan task or phase it came from.
- Do not finalize task lists until REQ -> AC -> TASK -> validation coverage is complete.

## Status Tracking Requirements

Every task MUST have both a checkbox and a Status field for implementation tracking.

## Phase 1: Foundations

Goal: enable request-link generation and delivery

Completion criteria:

- [ ] CC-001

Tasks:

- [ ] TASK-001
  Status: Not Started
  Summary: Add request-link endpoint and request validation
  Plan reference: Phase 1 / TASK-001
  Linked requirement(s): REQ-001
  Linked acceptance criteria: AC-001
  Affected file(s) or module(s): auth request route, validation layer
  Depends on:
  Can run in parallel: No
  Validation note: request-path integration test
  Session note:

- [ ] TASK-002
  Status: Not Started
  Summary: Add token issuance and transactional email trigger
  Plan reference: Phase 1 / TASK-001
  Linked requirement(s): REQ-002
  Linked acceptance criteria: AC-002
  Affected file(s) or module(s): token service, notification integration
  Depends on: TASK-001
  Can run in parallel: No
  Validation note: token issuance test plus mailer invocation check
  Session note:

## Phase 2: Core Implementation

Goal: enable verification and authenticated session creation

Completion criteria:

- [ ] CC-002

Tasks:

- [ ] TASK-003
  Status: Not Started
  Summary: Implement verify-link endpoint and token lookup
  Plan reference: Phase 2 / TASK-002
  Linked requirement(s): REQ-002, REQ-003
  Linked acceptance criteria: AC-002, AC-003
  Affected file(s) or module(s): verify route, token service
  Depends on: TASK-002
  Can run in parallel: No
  Validation note: verify success integration test
  Session note:

- [ ] TASK-004
  Status: Not Started
  Summary: Invalidate token on first use and create session through existing session service
  Plan reference: Phase 2 / TASK-002
  Linked requirement(s): REQ-003, REQ-004
  Linked acceptance criteria: AC-003, AC-004
  Affected file(s) or module(s): token consume path, session integration
  Depends on: TASK-003
  Can run in parallel: No
  Validation note: replay-protection and no-partial-session checks
  Session note:

## Phase 3: Validation And Closeout

Goal: prove negative paths and preserved behavior

Completion criteria:

- [ ] CC-003

Tasks:

- [ ] TASK-005
  Status: Not Started
  Summary: Add expired, invalid, and reused-link automated coverage
  Plan reference: Phase 3 / TASK-003
  Linked requirement(s): REQ-002, REQ-004
  Linked acceptance criteria: AC-002, AC-004
  Affected file(s) or module(s): auth tests
  Depends on: TASK-004
  Can run in parallel: No
  Validation note: targeted negative-path tests
  Session note:

- [ ] TASK-006
  Status: Not Started
  Summary: Validate preserved password-login behavior
  Plan reference: Phase 3 / TASK-003
  Linked requirement(s): REQ-003
  Linked acceptance criteria: AC-003
  Affected file(s) or module(s): auth regression tests
  Depends on: TASK-004
  Can run in parallel: Yes
  Validation note: regression check for existing password login
  Session note: parallel-safe because it adds validation only

- [ ] TASK-007
  Status: Not Started
  Summary: Produce implementation review evidence and manual testing guide
  Plan reference: Phase 3 / TASK-003
  Linked requirement(s): REQ-001, REQ-002, REQ-003, REQ-004
  Linked acceptance criteria: AC-001, AC-002, AC-003, AC-004
  Affected file(s) or module(s): `review.md`, `testing-scenarios.md`
  Depends on: TASK-005, TASK-006
  Can run in parallel: No
  Validation note: review plus manual scenario coverage
  Session note:

## Completion Notes

- What was delivered:
- What was deferred:
- What needs follow-up:

## Resume Notes

- Current phase: Phase 1
- Next recommended task: TASK-001
- Active blocker: finalize request-rate policy
- Last validation evidence added: none yet
