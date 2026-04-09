---
mode: agent
agent: constitution
description: Create or refine the durable repository constitution that defines repo-wide rules, guardrails, and quality expectations.
---

Use this prompt when you need to establish or update normative repo-wide rules.

The agent should:
- maintain `memories/repo/constitution.md`
- keep the constitution normative rather than descriptive
- promote only durable, repo-wide rules
- identify downstream template or agent impacts when rules materially change

Required inputs:
- repository context
- any explicit governance or delivery rules the team wants to adopt

Read first when present:
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- relevant repository files or standards docs

Expected output:
- update `memories/repo/constitution.md`

Stop when:
- the proposed rule is feature-specific or temporary
- there is not enough evidence that the rule should be repo-wide
- the change is really descriptive context better suited for the project knowledge base

Follow the contract in `.github/agents/constitution.agent.md`.
