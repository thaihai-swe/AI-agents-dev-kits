# Analysis

## Scope

Investigate the reported auth timeout loop where users are redirected back to login immediately after an apparently successful session refresh.

## Current State

- Session refresh exists and should extend the current browser session.
- The timeout loop appears only after idle-session recovery.
- Standard password login still works on a fresh session.

## Findings

- The visible symptom is a redirect loop after refresh rather than an outright login failure.
- The first failing boundary is between refreshed session issuance and the middleware that reads session expiry.
- The strongest supported hypothesis is stale expiry propagation between the refresh path and auth middleware.

## Risks And Unknowns

- Any fix must preserve normal password login and active-session behavior.
- The exact configuration and cache interaction still needs confirming in code and logs.

## Recommendation

Proceed to a narrow bug-fix spec that preserves the current auth contract and focuses on refresh expiry propagation.
