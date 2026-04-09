---

agent: spec-design
description: Create a technical design artifact when planning depends on explicit architecture, interface, migration, or boundary decisions.
---

Use this prompt when a feature needs technical clarification before planning.

The agent should:
- create or refine `artifacts/features/<feature-slug>/design.md`
- focus on technical decisions, interfaces, flows, and tradeoffs
- stay above implementation-level detail
- recommend skipping design if the feature is simple enough to plan directly

Required inputs:
- feature slug

Read first when present:
- `artifacts/features/<feature-slug>/spec.md`
- `artifacts/features/<feature-slug>/requirements-review.md`
- `artifacts/features/<feature-slug>/analysis.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Expected output:
- update `artifacts/features/<feature-slug>/design.md`

Stop when:
- `spec.md` is missing or clearly incomplete
- `requirements-review.md` says the specification is not ready
- a design artifact is unnecessary because planning can proceed safely without it

Follow the contract in `.github/agents/spec-design.agent.md`.
