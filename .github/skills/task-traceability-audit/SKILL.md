# Task Traceability Audit

Use this skill when an agent needs to verify that the implementation workflow preserves traceability from requirements through validation.

## Purpose

This skill checks the chain:

`REQ -> AC -> TASK -> validation`

It helps ensure the task system is complete, reviewable, and safe to execute or approve.

## When To Use It

Use this skill when:

- generating or refining `tasks.md`
- reviewing implementation in `/spec-review`
- checking whether a task list is safe for `/spec-implement`
- verifying that validation evidence matches the intended behavior

## Audit Checks

Check that:

- each material `REQ-*` maps to one or more `AC-*`
- each material `AC-*` maps to one or more `TASK-*`
- each task points back to relevant requirements and acceptance criteria
- validation notes or evidence exist for the tasks that change behavior
- no major requirement or acceptance criterion is orphaned
- task state does not claim completion without matching validation evidence

## Failure Patterns

Flag issues when:

- a requirement has no downstream task coverage
- an acceptance criterion has no validation path
- a task lacks links to requirements or acceptance criteria
- validation evidence is missing for completed behavior-changing tasks
- implementation reality and task status disagree

## Output Expectations

When using this skill, the agent should clearly report:

- what part of the chain is complete
- what part is partial or missing
- whether the traceability gap is blocking or non-blocking
