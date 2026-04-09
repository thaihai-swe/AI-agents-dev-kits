---
mode: agent
agent: analyze
description: Investigate unclear system behavior, brownfield constraints, or risks and produce one bounded analysis artifact.
---

Use this prompt when you need to understand what is true in the repository before writing a spec, design, or plan.

The agent should:
- investigate the current system using repository evidence
- separate facts from inferences
- keep the analysis bounded to the current change or question
- recommend next steps without turning the analysis into a spec or plan

Required inputs:
- feature slug or explicit investigation target

Read first when present:
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- relevant feature artifacts

Expected output:
- update `artifacts/features/<feature-slug>/analysis.md`

Stop when:
- the investigation scope is still too vague
- evidence is insufficient to support a confident analysis
- the request is really asking for a spec, design, or plan instead of discovery

Follow the contract in `.github/agents/analyze.agent.md`.
