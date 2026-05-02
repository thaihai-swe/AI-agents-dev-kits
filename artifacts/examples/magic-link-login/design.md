# Technical Design

## Metadata

- Feature name: Passwordless Email Magic Link Login
- Feature slug: magic-link-login
- Related spec: `spec.md`
- Related requirements review: `requirements-review.md`
- Owner: authentication maintainers
- Status: Approved
- Last updated: 2026-05-02

## Design Summary

Add a request-link endpoint, a single-use token store, and a verify-link endpoint that reuses the existing session creation path after successful token validation.

## Current State And Context

- Existing system baseline: password login and session creation already exist
- Relevant repository patterns: transactional email goes through a notification boundary; sessions are centralized
- Brownfield constraints or greenfield assumptions: existing login flow must remain unchanged
- Unchanged behavior that must be preserved: password login, session creation contract, auth logging

## Design Drivers

- REQ-001:
  Design implication: add a request endpoint with existing auth-policy response behavior
- AC-001:
  Verification impact: request flow needs request-path validation and manual happy-path coverage
- REQ-003:
  Design implication: verify endpoint must call the existing session service
- NFR-003:
  Design implication: token must be single-use and expire
- CON-001:
  Design implication: keep the first slice email-only and browser-focused

## Proposed Architecture

- Major components or modules: request handler, token storage/service, verification handler, mail composition path
- Responsibilities: request flow issues token; verification flow consumes token and creates session
- Interaction model: request -> generate token -> send email -> verify -> invalidate token -> create session
- Key boundaries: notification boundary and session boundary remain reused rather than replaced

## Data Flow And Interfaces

- Inputs and entry points: request-link route and verify-link route
- Internal interfaces or contracts: token generation/lookup/consume service plus existing session creation API
- Data transformations or storage changes: persist hashed or otherwise protected token metadata with expiry and consumed state
- External systems or integrations: transactional email sender

## Design Decisions And Tradeoffs

- Decision: Reuse the current session creation path after token verification.
  Why chosen: It preserves the existing authenticated session contract.
  Tradeoff: The verify endpoint must map into an existing auth boundary cleanly.

- Decision: Treat tokens as short-lived and single-use.
  Why chosen: Replay prevention is a core auth requirement.
  Tradeoff: Users may need to request a new link more often if they delay too long.

## Alternatives Considered

- Alternative: Create a separate passwordless session path.
  Reason not chosen: It would duplicate auth behavior and increase regression risk.

## Brownfield Integration Notes

- Existing boundary to respect: notification delivery should stay behind the current mailer interface
- Migration or compatibility concern: no user migration is required because password login remains
- Regression hotspot: token invalidation and session creation sequencing

## Non-Functional Design Considerations

- Performance: token lookup should be lightweight
- Reliability: verification should be deterministic and idempotent on already-consumed tokens
- Security: prevent replay, expire tokens, avoid partial session creation
- Observability: log request and failure outcomes without leaking sensitive token material
- Accessibility or UX consistency: request and error states should match existing auth UI conventions

## Open Questions

- Q-001 Question: confirm the exact expiry window and request-rate policy
  Next step: align with security policy during planning
