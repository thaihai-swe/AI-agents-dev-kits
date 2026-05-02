# Testing Scenarios

## Purpose

Validate the delivered passwordless email login flow and confirm that the existing password-login path still works.

## Scope

- Feature name: Passwordless Email Magic Link Login
- Feature slug: magic-link-login
- Delivered scope under test: request link, receive link, verify link, failure handling, password-login regression
- Out of scope: SMS login and native mobile flows

## Estimated Time

- Approximate total time: 25-35 minutes

## Prerequisites

- Required environment: staging or review environment with email delivery enabled
- Required accounts or permissions: one verified user account
- Required services or dependencies: auth service, notification service
- Required data or fixtures: ability to inspect delivered email or test inbox

## Setup

- Step 1: Sign out of any existing session.
- Step 2: Open the login screen.
- Step 3: Prepare access to the test inbox for the verified user.

## Scenario Matrix

| Scenario | Goal | Priority | Notes |
|----------|------|----------|-------|
| SCN-001 | Request and use a valid magic link | High | Happy path |
| SCN-002 | Reuse the same link after success | High | Replay protection |
| SCN-003 | Use an expired or invalid link | High | Failure messaging |
| SCN-004 | Confirm password login still works | High | Regression |

## Happy Path Scenarios

### SCN-001: Request and use a valid magic link

Goal:

Complete a full passwordless login from request through authenticated session creation.

Steps:

1. Choose the magic-link login entry point.
2. Submit the verified email address.
3. Open the delivered email and follow the link.

Expected results:

- A login email is delivered.
- Following the link creates an authenticated session.
- The user lands on the normal post-login destination.

## Edge Cases And Failure Paths

### SCN-EDGE-001: Reuse the same link after successful login

Goal:

Confirm the link is single-use.

Steps:

1. Complete SCN-001.
2. Re-open the same magic link.

Expected results:

- The second use fails safely.
- No second session is created.
- The UI explains that the link is invalid or already used.

### SCN-EDGE-002: Use an expired or invalid link

Goal:

Confirm failure behavior is clear and safe.

Steps:

1. Open an expired or malformed link.
2. Observe the resulting screen and session state.

Expected results:

- The user is not signed in.
- The UI offers a path back to request a new link.
- Failure telemetry is available to support or logs.

## Regression Checks

- Behavior that must still work: existing password login
- Validation approach: sign in with email and password after the magic-link scenarios

## Notes For Testers

- Known limitations: this fixture assumes a browser-based first release
- Follow-up observations to record: request-rate behavior and response wording for unknown emails
- What should be escalated immediately: any sign of replay success or partial session creation

## Sign-Off

- Tested by:
- Date:
- Passed scenarios:
- Failed scenarios:
- Deferred scenarios:
- Overall outcome:
