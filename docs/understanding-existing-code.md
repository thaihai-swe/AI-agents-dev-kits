# Understanding Existing Code

Use this page when the goal is to understand an existing subsystem, brownfield area, or risky boundary before proposing a change.

This is not the feature-writing path. It is the current-state understanding path.

The same `analyze` skill also owns debugging-oriented investigation when the request is about a failure rather than general subsystem understanding.

## Recommended Path

For most discovery work:

```text
/analyze
```

Then choose one of these follow-ups:

- `/spec-requirement` if the analysis reduced enough uncertainty to define a change
- `/memory-promotion` if the finding is durable and worth reusing
- update or create a domain spec when the repository is large enough to justify subsystem-level current-state docs

## What Good Analysis Produces

A useful `analysis.md` should make these things clear:

- the investigation scope
- the current behavior and relevant system map
- the important boundaries and risks
- facts versus inference
- the next safe workflow step

## When To Promote Findings

Use `/memory-promotion` when the discovery is:

- durable across future changes
- grounded in repository evidence
- useful beyond one feature

Promote to:

- `memories/repo/project-knowledge-base.md` for durable descriptive context
- `memories/repo/constitution.md` only for true repository-wide rules

Keep feature-local discoveries in `artifacts/features/<slug>/`.

## Where Domain Specs Fit

For large codebases, domain specs can sit between repo memory and feature artifacts:

- repo memory: durable repo-wide rules and patterns
- domain specs: current-state behavior for one subsystem
- feature artifacts: the proposed change against that baseline

See [../memories/repo/domain-specs.md](../memories/repo/domain-specs.md) for the pattern.

## Typical Uses

- joining a brownfield codebase
- tracing a legacy boundary before a feature
- understanding current auth, billing, or notification behavior
- collecting evidence before a risky refactor
