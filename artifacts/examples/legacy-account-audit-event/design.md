# Technical Design

## Design Summary

Emit the audit event from the existing account-status service boundary and keep the event contract additive.

## Proposed Architecture

- existing account-status service remains the owner of the transition
- event emission happens after the status change is accepted
- downstream consumers receive a new additive event rather than a changed existing payload

## Brownfield Integration Notes

- Existing boundary to respect: downstream consumers of current lifecycle events
- Regression hotspot: status-change sequencing and retry behavior
