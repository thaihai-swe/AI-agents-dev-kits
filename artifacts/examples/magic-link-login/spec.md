# Feature Specification

## Metadata

- Feature name: Passwordless Email Magic Link Login
- Feature slug: magic-link-login
- Owner: Product authentication team
- Status: Approved
- Last updated: 2026-05-02
- Related knowledge artifact(s): `memories/repo/project-knowledge-base.md`

## Problem Statement

Users who do not remember their password or prefer low-friction sign-in currently have no passwordless login path. The repository already has session creation and transactional email, so the missing capability is a secure one-time login flow.

## Desired Outcomes

- Users can request a one-time login link by email.
- Users can complete sign-in from that link without a password.

## Success Criteria

- SC-001: Eligible users can complete login through a one-time link in one browser session.
- SC-002: Expired, reused, or invalid links fail safely with clear user messaging.
- SC-003: Request and verification flows preserve the existing password-login behavior.

## In Scope

- request magic link flow
- verify magic link flow
- single-use token invalidation
- basic request throttling

## Out Of Scope

- SMS login
- native mobile deep-link flows
- replacing password login

## Users And Stakeholders

- Primary users: returning users who prefer passwordless login
- Secondary stakeholders: auth maintainers, support, security review

## User Stories And Key Scenarios

- US-001: As a returning user, I can request a magic link and receive it by email.
- US-002: As a returning user, I can open the link and receive an authenticated session.
- US-003: As a user or support agent, I get a clear failure outcome when the link is invalid or expired.

## Current Context

The repository already supports password login, central session creation, and transactional email. No single-use login token currently exists, and password login must remain unchanged.

## Dependencies And External Touchpoints

- DEP-001: transactional email delivery service
- DEP-002: existing session creation path

## Functional Requirements

### REQ-001

Requirement: The system must let a user request a magic link with a verified email address.

Why it matters: Users need a passwordless entry point.

Impacted users or scenarios: US-001

Related success criteria: SC-001

Priority: Must Have

Acceptance notes: The response should not reveal whether an email exists beyond the repository's existing auth policy.

### REQ-002

Requirement: The system must issue a short-lived, single-use login token and send it through the existing email delivery boundary.

Why it matters: The link must be usable and secure.

Impacted users or scenarios: US-001, US-002

Related success criteria: SC-001, SC-002

Priority: Must Have

Acceptance notes: Token issuance, expiry, and replay prevention must be explicit.

### REQ-003

Requirement: The system must verify the token, invalidate it after first successful use, and create a normal authenticated session through the existing session path.

Why it matters: Passwordless login should reuse the established session contract.

Impacted users or scenarios: US-002

Related success criteria: SC-001, SC-003

Priority: Must Have

Acceptance notes: Password login remains available and unchanged.

### REQ-004

Requirement: Expired, invalid, and reused links must fail with clear user-visible messaging and no partial session creation.

Why it matters: Failure handling is part of the core auth behavior.

Impacted users or scenarios: US-003

Related success criteria: SC-002

Priority: Must Have

Acceptance notes: The failure page should guide users back to the request-link flow.

## Non-Functional Requirements

- NFR-001 Performance: request and verify flows should feel comparable to current login latency
- NFR-002 Reliability: token verification must be deterministic and single-use
- NFR-003 Security or Privacy: tokens must expire and must not be reusable
- NFR-004 Accessibility: request and error flows must remain keyboard- and screen-reader-friendly
- NFR-005 Observability or Supportability: failed verification reasons should be visible in logs or support telemetry
- NFR-006 Compliance or Policy: preserve existing email and auth policy constraints

## Constraints

- Technical constraints: reuse the existing session creation boundary
- Business constraints: do not remove password login in this feature
- Delivery constraints: keep the first slice browser-based and email-only

## Assumptions

- ASM-001: verified email users are already identifiable in the current auth model

## Risks

- RISK-001 Risk: token replay or ambiguous invalidation
  Mitigation: make token lifecycle explicit in design and validation

## Open Questions

- Q-001 Question: should the request flow return identical UI for unknown versus known emails?
  Type: Non-blocking
  Owner: auth product + security
  Next step: confirm policy before implementation finalization

## Acceptance Criteria

- [ ] AC-001 Linked requirement(s): REQ-001
  Linked user story or scenario: US-001
  Linked success criteria: SC-001
  Validation method: request-flow test plus manual request scenario
- [ ] AC-002 Linked requirement(s): REQ-002
  Linked user story or scenario: US-001, US-002
  Linked success criteria: SC-001, SC-002
  Validation method: token issuance test and replay-protection verification
- [ ] AC-003 Linked requirement(s): REQ-003
  Linked user story or scenario: US-002
  Linked success criteria: SC-001, SC-003
  Validation method: verify-link integration test through session creation
- [ ] AC-004 Linked requirement(s): REQ-004
  Linked user story or scenario: US-003
  Linked success criteria: SC-002
  Validation method: expired/invalid/reused-link manual and automated checks

## Notes

The first slice should optimize for correctness and replay safety over broad channel support.
