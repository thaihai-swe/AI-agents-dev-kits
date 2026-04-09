# Project Memory System

This folder stores durable repository memory and supporting session context for the AI Dev Kit.

## Canonical Repository Memory

The current kit uses a two-file durable memory model under `memories/repo/`:

- `constitution.md` - Repository-wide rules, guardrails, and non-negotiables
- `project-knowledge-base.md` - Durable descriptive repository knowledge, patterns, boundaries, and reusable context

In the current model, durable brownfield watchouts, architecture notes, and integration guidance are consolidated into `project-knowledge-base.md` instead of being split across separate repository-memory files.

## What Goes Where

### `repo/constitution.md`

Use this file for normative repository rules such as:

- testing expectations
- security and compliance rules
- migration and rollback requirements
- review and release guardrails
- AI operating constraints that should always apply

Update it rarely and deliberately.

### `repo/project-knowledge-base.md`

Use this file for durable facts and reusable repository context such as:

- subsystem boundaries
- recurring implementation patterns
- stable integration seams
- brownfield watchouts that future work should know
- architectural context grounded in repository evidence
- stable testing patterns

Update it whenever durable knowledge emerges from real work.

### `session/`

Use this area for per-conversation or temporary working context when needed. Do not treat it as durable repository memory.

### `user/`

Use this area for user-specific preferences or collaboration notes when needed. Do not treat it as repository-wide source of truth.

## How To Use Memory

### New Repository Setup

1. Create `repo/constitution.md`
2. Create `repo/project-knowledge-base.md`

### Brownfield Or Risky Work

1. Run `/analyze` to establish current-state facts for the feature
2. Keep feature-specific findings in `artifacts/features/<slug>/analysis.md`
3. Promote only durable findings into `repo/project-knowledge-base.md`
4. Promote only true repository-wide rules into `repo/constitution.md`

### Ongoing Maintenance

- remove stale or disproven durable knowledge
- merge duplicate notes into concise summaries
- prefer grounded patterns over historical storytelling
- keep feature-specific details in feature artifacts, not repo memory

## What To Read Before Feature Work

Before planning, implementation, or review, read:

```bash
cat repo/constitution.md
cat repo/project-knowledge-base.md
```

For ongoing feature work, also read the current artifact set under `artifacts/features/<slug>/`.

## Promotion Rules

Promote a finding into repo memory only when it is:

- durable across multiple future changes
- grounded in repository evidence
- useful to future contributors or agents
- descriptive rather than speculative

If it is feature-specific, temporary, or uncertain, keep it in the feature artifacts instead.

## File Format

Both durable memory files can stay simple and readable. A typical entry can include:

```markdown
## Topic

**What**: Description
**Why**: Why it matters
**How**: How future work should account for it
**References**: Relevant files or artifacts
```

## Best Practices

- read memory before planning or implementation
- keep repository memory compact
- update durable knowledge as the repo changes
- avoid duplicating the same idea across multiple files
- do not let descriptive memory override the constitution

For the current repository-memory contract, also see [`memories/repo/README.md`](repo/README.md) and [`docs/memory-system/README.md`](../docs/memory-system/README.md).
