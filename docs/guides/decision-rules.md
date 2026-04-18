# Decision Rules

## When To Use This Guide

Use this guide when choosing which workflow path to run.

## Prerequisites

- you know the type of change
- you know whether current behavior is clear

## Flow Guidance

### Use `/analyze` when

- the repository is brownfield
- a bug needs investigation
- boundaries or dependencies are unclear
- you need evidence before writing the spec

### Skip `/analyze` when

- current behavior is already well understood
- the change is local and low-risk

### Use `/spec-review-requirements` when

- the spec has meaningful scope or user-visible impact
- ambiguity or completeness could affect planning

### Skip `/spec-review-requirements` only when

- the change is very small
- the spec is obviously complete and low-risk

### Use `/spec-design` when

- the feature crosses boundaries
- interfaces change
- migration risk exists
- multiple technical approaches are plausible

### Skip `/spec-design` when

- planning can proceed safely without extra technical clarification

### Escalate to a fuller workflow when

- the change is broader than it first appeared
- current behavior is less clear than expected
- the spec is no longer obviously complete
- design decisions or interface concerns appear
- the plan cannot be sequenced safely
- task decomposition would require inventing missing strategy

Practical escalation pattern:

- tiny change -> standard feature workflow
- standard feature -> add `analyze`
- standard feature -> add `spec-design`
- bug fix -> add `spec-review-requirements` when the fix is user-visible, ambiguous, or broader than expected
- any workflow -> stop and repair the upstream artifact before continuing

### Stop planning when

- blocking clarification remains in `spec.md`
- requirements review says `not ready`
- the plan cannot sequence the work safely

### Stop task generation when

- phases are too vague
- validation direction is missing
- task slices would be too large or unclear

## Expected Outcome

After applying these rules, you should know:
- which command comes next
- which artifact should be updated next
- which upstream issue must be fixed before continuing

## If Blocked

- go back upstream one artifact
- repair the decision quality there
- rerun the next workflow step only after the upstream artifact is strong
