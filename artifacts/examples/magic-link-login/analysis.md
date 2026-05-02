# Analysis

## Scope

Investigate the current authentication flow, email delivery boundary, and session creation path needed for passwordless magic-link login.

## Current State

- Users authenticate with email and password.
- Session creation already exists in a shared auth service.
- Transactional email is already available through the notification layer.
- No one-time login token flow exists today.

## Relevant System Map

- `AuthController` handles login entry points.
- `SessionService` creates and revokes browser sessions.
- `NotificationService` sends transactional email.
- User records already store verified email state.

## Findings

- The existing session path can be reused after token verification instead of creating a new session mechanism.
- The repo already has a notification boundary appropriate for sending magic links.
- The missing capability is a short-lived, single-use login token with clear invalidation rules.
- Email verification and login are adjacent concerns; the implementation must not silently merge those flows.

## Risks And Unknowns

- Token replay prevention must be explicit.
- Rate limiting is required to avoid email abuse.
- Existing password login must remain unchanged for users who still rely on it.

## Recommendation

Proceed to `/spec-requirement` with a bounded feature that adds request-link and verify-link flows while preserving the existing password login path.

## Promotion Candidates

- The notification service is a durable integration boundary worth keeping in repo memory if it was not already documented.
- Session creation is already centralized and should remain the canonical post-authentication path.
