# GitHub Copilot Adoption

This guide explains how to use the AI Agents Development Kit with GitHub Copilot in a real repository.

## What Copilot Should Read

For this kit, GitHub Copilot should treat these locations as the main operating context:

- `.github/copilot-instructions.md` - Repository-wide Copilot behavior and workflow rules
- `.github/agents/` - Canonical agent contracts
- `memories/repo/constitution.md` - Durable repository rules
- `memories/repo/project-knowledge-base.md` - Durable descriptive repository knowledge
- `artifacts/features/<feature-slug>/` - Canonical per-feature workflow artifacts

If path-specific instructions are added later, place them under `.github/instructions/` using the `NAME.instructions.md` naming pattern.

## Canonical Working Model

Use the kit with these assumptions:

- durable repository memory is limited to `constitution.md` and `project-knowledge-base.md`
- per-feature work lives under `artifacts/features/<feature-slug>/`
- `analysis.md` captures feature-specific discovery before promotion into durable memory
- agents should follow `.github/agents/` as the source of truth for workflow behavior

## Recommended Setup For A Repository

1. Add the repository-wide Copilot file at `.github/copilot-instructions.md`.
2. Add the agent definitions under `.github/agents/`.
3. Add the supporting templates and checklists under `.github/specs/`.
4. Create `memories/repo/constitution.md` and `memories/repo/project-knowledge-base.md`.
5. Create `artifacts/features/` for feature workflow outputs.

For this kit repository, the canonical paths already exist or are scaffolded.

## Recommended Feature Flow With Copilot

For most meaningful changes, guide Copilot through this sequence:

```text
/analyze                      (if current system behavior is unclear)
/spec-requirement
/spec-review-requirements
/spec-design                  (when technical clarity is needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Each step should produce or update the expected artifact under `artifacts/features/<feature-slug>/`.

## What To Ask Copilot To Do

### New Repository Setup

Ask Copilot to:

- create or refine `memories/repo/constitution.md`
- create or refine `memories/repo/project-knowledge-base.md`
- keep rules in the constitution and facts in the knowledge base

### Brownfield Investigation

Ask Copilot to:

- create `artifacts/features/<slug>/analysis.md`
- separate observed facts from inferences
- recommend promotion candidates rather than writing directly to repo memory unless asked

### Feature Definition And Delivery

Ask Copilot to:

- create `spec.md` before planning implementation
- resolve blocking clarification inside `spec.md` before treating it as review-ready
- run the explicit requirements review step
- stop when the verdict is `not ready`
- generate `plan.md` before `tasks.md`
- make `plan.md` explicit about domains, integration boundaries, protected behavior, and validation
- let `spec-tasks` stop if the plan is not yet taskable
- implement from `tasks.md`, not from vague chat intent

## What Good Copilot Usage Looks Like

- Copilot reads repo memory before planning, implementation, or review
- Copilot keeps feature-specific details in feature artifacts
- Copilot updates the relevant artifact when scope or status changes
- Copilot treats `Status:` fields in `tasks.md` as authoritative task lifecycle tracking
- Copilot uses prompt files as user-facing entrypoints and agent files as the deeper contract
- Copilot stops on upstream ambiguity instead of silently inventing missing decisions

## Common Failure Modes To Avoid

- writing code before `spec.md`, `plan.md`, and `tasks.md` exist
- creating extra repository-memory files outside the canonical two-file model
- planning from a rejected or weak requirements review
- treating chat history as the source of truth instead of the artifacts
- mixing durable repository knowledge with one-off feature notes

## Minimal Day-To-Day Workflow

If you want the shortest safe flow with Copilot:

1. Create or choose a feature slug.
2. Ask Copilot to create `spec.md`.
3. Resolve any blocking clarification in the spec.
4. Ask Copilot to review requirements.
5. Ask Copilot to create `plan.md`.
6. Ask Copilot to create `tasks.md`.
7. Ask Copilot to implement one task at a time.
8. Ask Copilot to review the delivered work.

## Related Reading

- [Getting Started](getting-started.md)
- [Workflow Example](../WORKFLOW-EXAMPLE.md)
- [Workflows](../workflows/README.md)
- [Commands Reference](../reference/commands.md)
- [Memory System](../memory-system/README.md)
