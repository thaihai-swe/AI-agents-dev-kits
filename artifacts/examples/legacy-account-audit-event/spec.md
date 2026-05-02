# Feature Specification

## Metadata

- Feature name: Emit Audit Event For Legacy Account Status Changes
- Feature slug: legacy-account-audit-event
- Owner: account platform team
- Status: Approved
- Last updated: 2026-05-02

## Problem Statement

Legacy account status changes are operationally important, but the repository does not currently emit a durable audit event for them.

## Functional Requirements

### REQ-001

Requirement: Emit a structured audit event whenever legacy account status changes.

Why it matters: Support, compliance, and downstream observability need a durable event.

### REQ-002

Requirement: Preserve existing status-change behavior and avoid breaking current downstream consumers.

Why it matters: This is a brownfield extension, not a redesign.

## Acceptance Criteria

- [ ] AC-001 Linked requirement(s): REQ-001
  Validation method: event emission integration check
- [ ] AC-002 Linked requirement(s): REQ-002
  Validation method: regression check for existing status-change flow
