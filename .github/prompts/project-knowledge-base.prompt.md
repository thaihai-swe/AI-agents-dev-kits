---

agent: project-knowledge-base
description: Create or refine the durable project knowledge base that captures stable architecture context, boundaries, and reusable patterns.
---

Use this prompt when you need to document descriptive repository knowledge that future work can reuse.

The agent should:
- maintain `memories/repo/project-knowledge-base.md`
- keep the knowledge base descriptive, not normative
- promote only durable findings from feature work
- avoid duplicating temporary or feature-specific notes

Required inputs:
- repository context
- any durable findings worth promoting

Read first when present:
- `memories/repo/project-knowledge-base.md`
- `memories/repo/constitution.md`
- relevant feature artifacts such as `analysis.md`

Expected output:
- update `memories/repo/project-knowledge-base.md`

Stop when:
- the finding is feature-specific rather than durable
- the content is really a repo-wide rule that belongs in the constitution
- the evidence is too weak to justify promotion into durable memory

Follow the contract in `.github/agents/project-knowledge-base.agent.md`.
