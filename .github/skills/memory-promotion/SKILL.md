# Memory Promotion

Use this skill when an agent needs to decide what should move from feature artifacts into durable repository memory.

## Purpose

This skill helps an agent distinguish:

- durable repository knowledge that belongs in `memories/repo/project-knowledge-base.md`
- repository-wide rules that belong in `memories/repo/constitution.md`
- feature-specific findings that should remain in `artifacts/features/<slug>/`

## When To Use It

Use this skill when:

- reviewing `analysis.md` for durable findings
- updating `project-knowledge-base.md`
- deciding whether a discovery is stable enough to promote
- deciding whether something is a durable fact, a repo rule, or a one-off feature note

## Decision Rules

Promote a finding only when it is:

- durable across multiple future changes
- grounded in repository evidence
- useful to future contributors or agents
- more general than a single feature implementation

Keep a finding in feature artifacts when it is:

- temporary
- speculative
- tied to one feature only
- still uncertain

Move a finding to the constitution only when it is a true repository-wide rule or non-negotiable guardrail.

## Output Expectations

When using this skill, the agent should say one of:

- promote to `project-knowledge-base.md`
- promote to `constitution.md`
- keep in feature artifacts

The decision should include a short reason.
