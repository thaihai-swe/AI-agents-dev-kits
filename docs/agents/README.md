# Agents

This repo currently defines 10 agents.

## Quick Overview

| Category | Command | Backing File | Main Output |
| --- | --- | --- | --- |
| Foundation | `/constitution` | `constitution.agent.md` | `memories/repo/constitution.md` |
| Foundation | `/project-knowledge-base` | `project-knowledge-base.agent.md` | `memories/repo/project-knowledge-base.md` |
| Discovery | `/analyze` | `analyze.agent.md` | `analysis.md` |
| Specification | `/spec-requirement` | `spec-requirement.agent.md` | `spec.md` |
| Quality Gate | `/spec-review-requirements` | `spec-review-requirements.agent.md` | `requirements-review.md` |
| Design | `/spec-design` | `spec-design.agent.md` | `design.md` |
| Planning | `/spec-plan` | `spec-plan.agent.md` | `plan.md` |
| Planning | `/spec-tasks` | `spec-tasks.agent.md` | `tasks.md` |
| Delivery | `/spec-implement` | `spec-implement.agent.md` | code, tests, task status updates |
| Review | `/spec-review` | `spec-review.agent.md` | review findings, optionally `review.md` |

## Categories

- [details/specification-planning.md](details/specification-planning.md)
- [details/implementation-delivery.md](details/implementation-delivery.md)
- [details/discovery-learning.md](details/discovery-learning.md)
- [details/foundation-setup.md](details/foundation-setup.md)
- [details/quality-knowledge.md](details/quality-knowledge.md)

## Standard Feature Flow

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design        (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

## Important Shift From The Older Model

The current agent set intentionally consolidates several older responsibilities:

- brownfield discovery is handled through `analysis.md`
- durable architecture and pattern knowledge belongs in `project-knowledge-base.md`
- durable repo-wide rules belong in `constitution.md`
- there is no separate archive or memory-promotion command in the current codebase

Treat the files under `.github/agents/` as the source of truth.
