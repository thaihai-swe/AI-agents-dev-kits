# Implementation Plan

## Plan Summary

Add the event at the existing account-status boundary, validate the event contract, and prove the unchanged status-change path still works.

## Implementation Phases

### Phase 1

Goal: define and emit the additive audit event

Tasks:

- TASK-001:
  Description: add structured event emission at the status-change service boundary
  Linked requirement(s): REQ-001
  Linked acceptance criteria: AC-001

### Phase 2

Goal: validate compatibility and unchanged behavior

Tasks:

- TASK-002:
  Description: validate event shape and preserve existing status-change flow
  Linked requirement(s): REQ-001, REQ-002
  Linked acceptance criteria: AC-001, AC-002
