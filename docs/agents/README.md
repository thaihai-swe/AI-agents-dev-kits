# Agents

This repo currently defines 10 agents organized into 5 categories.

## Quick Overview

| Category                     | Command                     | Backing File                        | Main Output                               |
| ---------------------------- | --------------------------- | ----------------------------------- | ----------------------------------------- |
| **Foundation**               | `/constitution`             | `constitution.agent.md`             | `memories/repo/constitution.md`           |
|                              | `/project-knowledge-base`   | `project-knowledge-base.agent.md`   | `memories/repo/project-knowledge-base.md` |
| **Discovery & Analysis**     | `/analyze`                  | `analyze.agent.md`                  | `analysis.md`                             |
| **Specification & Design**   | `/spec-requirement`         | `spec-requirement.agent.md`         | `spec.md`                                 |
|                              | `/spec-review-requirements` | `spec-review-requirements.agent.md` | `requirements-review.md`                  |
|                              | `/spec-design`              | `spec-design.agent.md`              | `design.md`                               |
| **Planning & Delivery**      | `/spec-plan`                | `spec-plan.agent.md`                | `plan.md`                                 |
|                              | `/spec-tasks`               | `spec-tasks.agent.md`               | `tasks.md`                                |
| **Implementation & Quality** | `/spec-implement`           | `spec-implement.agent.md`           | code, tests, task status updates          |
|                              | `/spec-review`              | `spec-review.agent.md`              | review findings, optionally `review.md`   |

## Category Details

- [details/foundation-setup.md](details/foundation-setup.md) - Foundation
- [details/discovery-learning.md](details/discovery-learning.md) - Discovery & Analysis
- [details/specification-planning.md](details/specification-planning.md) - Specification & Design + Planning & Delivery
- [details/implementation-delivery.md](details/implementation-delivery.md) - Implementation & Quality
- [details/quality-knowledge.md](details/quality-knowledge.md) - Quality Gates (across phases)

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
