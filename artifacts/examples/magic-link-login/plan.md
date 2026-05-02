# Implementation Plan

## Metadata

- Feature name: Passwordless Email Magic Link Login
- Related spec: `spec.md`
- Related requirements review: `requirements-review.md`
- Related design: `design.md`
- Owner: authentication maintainers
- Status: Approved
- Last updated: 2026-05-02

## Plan Summary

Implement the feature in three phases: request-link flow, verify-link plus session creation, and validation plus closeout. Reuse existing email and session boundaries and keep rollout browser-only.

## Constitution Alignment

- Constitutional rule or principle: Skills own the workflow contract.
  Planning implication: preserve the approved spec, design, and task traceability rather than improvising during implementation.
- Constitutional rule or principle: Release claims require fresh evidence.
  Planning implication: validation must be explicit in both implementation and review tasks.

## Execution Context

- Design reference: `design.md`
- Relevant repository patterns for execution: centralized session creation and notification boundary reuse
- Brownfield execution constraints or greenfield assumptions: existing password login must remain untouched
- Unchanged behavior that must be preserved during delivery: password login and baseline auth session behavior

## Technical Approach

- Chosen approach: add request and verify routes backed by a single-use token service
- Architectural or integration shape: token lifecycle is local to auth; email and session creation reuse existing boundaries
- Key interfaces or contracts: session creation service, notification service, token storage contract
- Operational considerations: expiry configuration, request throttling, and failure telemetry

## Decision Rationale

- Why this approach was selected: it adds the needed capability without introducing a second session model
- Existing patterns reused: transactional email and session creation boundaries
- Alternatives considered: separate passwordless session path
- Why rejected: higher regression and maintenance cost

## Requirements And Constraints

- REQ-001:
  Implementation note: add a request endpoint and UI entry path
  Planned validation: request-flow test plus manual request scenario
  Linked scenario or outcome: US-001
- REQ-002:
  Implementation note: issue expiring single-use tokens and send email through existing mailer
  Planned validation: token issuance and replay-protection checks
  Linked scenario or outcome: US-001, US-002
- REQ-003:
  Implementation note: verify token and create session through the existing session service
  Planned validation: integration test for verify-link success path
  Linked scenario or outcome: US-002
- REQ-004:
  Implementation note: handle invalid, expired, and reused links explicitly
  Planned validation: negative-path tests and manual failure scenarios
  Linked scenario or outcome: US-003
- NFR-003:
  Implementation note: keep token lifecycle explicit and observable
- CON-001:
  Impact on plan: keep scope email-only and browser-based

## Impacted Areas

- Services or modules: auth routes, token service, notification integration
- APIs or interfaces: request-link and verify-link entry points
- Data model or storage: token persistence
- UI or UX: login entry point and failure messaging
- Infrastructure or deployment: none beyond normal rollout
- Documentation: testing guide and any auth usage notes

## Affected Domains And Integration Boundaries

- Domain or subsystem: authentication
  Why it matters: core user sign-in behavior
- Integration boundary or touchpoint: notification delivery and session creation
  Why it matters: both are reused rather than replaced

## Protected Behavior

- Behavior that must not regress: existing password login still works
  Protection approach: retain current login path and include regression validation

## Affected Files

- FILE-001 Path: auth request-link route
  Reason for change: issue tokens and trigger email
- FILE-002 Path: auth verify-link route or controller
  Reason for change: consume token and create session
- FILE-003 Path: token service and persistence model
  Reason for change: enforce expiry and single use
- FILE-004 Path: login UI entry point
  Reason for change: expose magic-link request path

## Dependencies

- DEP-001 Internal dependency: existing session creation service
  Why it matters: successful verification should reuse it
- DEP-002 External dependency: transactional email sender
  Why it matters: links are delivered through it

## Implementation Prerequisites

- PREREQ-001: confirm token expiry and request-rate policy
- PREREQ-002: confirm logging policy for verification failures

## Implementation Phases

### Phase 1

Goal: enable safe magic-link request flow
Enabled user scenario(s) or outcome(s): US-001

Tasks:

- TASK-001:
  Description: add request-link route, request validation, and mailer trigger
  Linked requirement(s): REQ-001, REQ-002
  Linked acceptance criteria: AC-001, AC-002
  Affected file(s): auth request route, notification integration

Completion criteria:

- CC-001: request flow issues a valid token and triggers email dispatch

### Phase 2

Goal: enable verification and authenticated session creation
Enabled user scenario(s) or outcome(s): US-002, US-003

Tasks:

- TASK-002:
  Description: add token verification, single-use invalidation, and session creation
  Linked requirement(s): REQ-002, REQ-003, REQ-004
  Linked acceptance criteria: AC-002, AC-003, AC-004
  Affected file(s): token service, verify endpoint, session integration

Completion criteria:

- CC-002: verify-link succeeds once, fails safely afterward, and reuses session creation

### Phase 3

Goal: close validation and release-readiness gaps
Enabled user scenario(s) or outcome(s): SC-001, SC-002, SC-003

Tasks:

- TASK-003:
  Description: add regression and negative-path validation plus testing guide
  Linked requirement(s): REQ-001, REQ-002, REQ-003, REQ-004
  Linked acceptance criteria: AC-001, AC-002, AC-003, AC-004
  Affected file(s): tests, `testing-scenarios.md`, review evidence

Completion criteria:

- CC-003: validation proves request, verify, replay, and preserved password-login behavior

## Validation Strategy

- TEST-001 Unit tests: token generation and invalidation
- TEST-002 Integration tests: request-link and verify-link flows
- TEST-003 End-to-end tests: optional if the repo already has auth flow coverage
- TEST-004 Manual verification: email request, success path, expired link, reused link
- TEST-005 Observability checks: failure logging and support visibility

## Traceability Matrix

- Scenario or outcome -> Plan phase(s): US-001 -> Phase 1, US-002 -> Phase 2, US-003 -> Phase 2 and 3
- REQ-001 -> Plan phase / task IDs: Phase 1 / TASK-001
- REQ-002 -> Plan phase / task IDs: Phase 1 / TASK-001 and Phase 2 / TASK-002
- REQ-003 -> Plan phase / task IDs: Phase 2 / TASK-002
- REQ-004 -> Plan phase / task IDs: Phase 2 / TASK-002 and Phase 3 / TASK-003
- AC-001 -> Validation step(s): TEST-002 and TEST-004
- AC-002 -> Validation step(s): TEST-001, TEST-002, TEST-004
- AC-003 -> Validation step(s): TEST-002
- AC-004 -> Validation step(s): TEST-002, TEST-004

## Rollout Plan

- Release approach: normal auth feature rollout
- Feature flags: optional if the repo already flags auth entry points
- Migration needs: none
- Backward compatibility notes: password login remains

## Rollback Plan

Disable the request-link and verify-link entry points, preserve password login, and invalidate outstanding magic-link tokens.

## Risks And Mitigations

- RISK-001 Risk: replay or partial session creation
  Mitigation: explicit token invalidation and negative-path validation

## Open Questions

- Q-001 Question: final request-rate thresholds
  Next step: resolve before implementation closes
