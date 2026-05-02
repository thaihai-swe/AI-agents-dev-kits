# Feature Specification

## Metadata

- Feature name: Fix Idle Session Refresh Timeout Loop
- Feature slug: auth-timeout-bug
- Owner: authentication maintainers
- Status: Approved
- Last updated: 2026-05-02

## Problem Statement

After an idle session refresh, some users are redirected back to login immediately even though the refresh flow reports success.

## Desired Outcomes

- Idle-session recovery creates a usable authenticated session.
- The fix does not regress standard password login or already-active sessions.

## Functional Requirements

### REQ-001

Requirement: Refreshed sessions must propagate the effective expiry state consistently to the auth middleware.

Why it matters: Users should not loop back to login after a successful refresh.

### REQ-002

Requirement: Standard password login and active-session requests must remain unchanged.

Why it matters: The fix must stay narrow.

## Acceptance Criteria

- [ ] AC-001 Linked requirement(s): REQ-001
  Validation method: targeted refresh regression test
- [ ] AC-002 Linked requirement(s): REQ-002
  Validation method: password-login and active-session regression checks
