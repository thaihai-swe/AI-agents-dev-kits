# Implementation Plan

## Plan Summary

Trace the refresh expiry value from the refresh handler into the middleware decision point, repair the propagation mismatch, and verify that fresh and active sessions still behave correctly.

## Requirements And Constraints

- REQ-001:
  Implementation note: inspect and repair expiry propagation
  Planned validation: refresh regression test
- REQ-002:
  Implementation note: preserve baseline auth flows
  Planned validation: password-login and active-session regression checks

## Implementation Phases

### Phase 1

Goal: identify and repair refresh expiry propagation

Tasks:

- TASK-001:
  Description: inspect refresh path and middleware boundary, then apply the narrow propagation fix
  Linked requirement(s): REQ-001
  Linked acceptance criteria: AC-001

### Phase 2

Goal: prove the fix and preserve existing behavior

Tasks:

- TASK-002:
  Description: add targeted regression coverage and baseline auth regression checks
  Linked requirement(s): REQ-001, REQ-002
  Linked acceptance criteria: AC-001, AC-002
