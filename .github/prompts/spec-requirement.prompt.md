---

agent: spec-requirement
description: Create or refine a feature specification, including clarification of blocking ambiguity before requirements review.
---

Use this prompt when you need to create or improve `artifacts/features/<feature-slug>/spec.md`.

The agent should:
- clarify missing or ambiguous product intent before finalizing the spec
- use reasonable defaults where safe
- document non-blocking assumptions
- keep unresolved blocking questions visible instead of guessing

Required inputs:
- feature slug
- feature request, idea, or existing `spec.md`

Read first when present:
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- `artifacts/features/<feature-slug>/analysis.md`

Expected output:
- update `artifacts/features/<feature-slug>/spec.md`

Stop when:
- users, problem, core workflow, or success outcomes are too unclear to define safely
- acceptance criteria cannot be made observable and traceable
- unresolved clarification would materially affect scope, security/privacy, or core UX

Follow the contract in `.github/agents/spec-requirement.agent.md`.
