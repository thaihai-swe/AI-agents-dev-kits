# Analysis

## Scope

Investigate how legacy account status changes currently flow through the service boundary and where an audit event can be added safely.

## Current State

- Legacy account status changes pass through a service layer before persistence.
- Some downstream notifications already subscribe to adjacent account lifecycle events.
- No durable audit event currently exists for this status change.

## Findings

- The service boundary is the correct insertion point for emitting an audit event.
- The data needed for the event already exists at the point of status transition.
- The risky boundary is downstream consumers that may assume only existing lifecycle events.

## Recommendation

Proceed to a brownfield feature spec with explicit compatibility notes and an optional design step for event shape and consumer boundaries.
