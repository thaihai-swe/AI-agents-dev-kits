# Client Integration Guide

## Purpose

Use this guide when you want to integrate this repository’s `skills/` workflow with GitHub Copilot, Codex, or Claude Code.

As of April 19, 2026, these clients do not all consume the same repository files in the same way. The safest pattern is:

1. keep `skills/` as the canonical source of workflow behavior
2. add thin client-specific adapter files for each tool
3. avoid maintaining separate workflow logic by hand in multiple places

## Recommended Integration Model

Treat the repository like this:

```text
skills/                         # canonical workflow contracts
memories/repo/                 # durable repository memory
artifacts/features/<slug>/     # feature artifacts

# optional client adapters
AGENTS.md
.github/copilot-instructions.md
.github/instructions/*.instructions.md
CLAUDE.md
.claude/commands/*.md
```

## Compatibility Summary

### GitHub Copilot

Best integration pattern:

- use `skills/` as your source material
- add `.github/copilot-instructions.md` for repo-wide guidance
- add `.github/instructions/*.instructions.md` for path-specific rules when needed
- optionally add `AGENTS.md` for agent-style behavior guidance

Use Copilot for:

- chat and code review flows
- repo-wide instruction loading
- path-specific behavior when file scopes differ

Do not assume:

- that Copilot will load `skills/*/SKILL.md` directly as native workflow commands

### Codex

Best integration pattern:

- keep `skills/` as the source of truth
- add `AGENTS.md` at the repo root as the main Codex-facing adapter
- point `AGENTS.md` back to the relevant skills, memory files, and artifact locations

Use Codex for:

- local terminal or IDE pairing
- repo-aware implementation work
- command-style execution from artifact-driven prompts

Do not assume:

- that Codex will automatically discover `skills/` as first-class commands without an adapter layer

### Claude Code

Best integration pattern:

- keep `skills/` as the source of truth
- add `CLAUDE.md` for project memory and high-level repo rules
- add `.claude/commands/*.md` as thin wrappers around the workflow steps

Use Claude Code for:

- project slash commands
- interactive artifact generation
- explicit project-scoped command workflows

Do not assume:

- that Claude Code will interpret the `skills/` folder as slash commands without `.claude/commands/`

## GitHub Copilot Integration

## Files To Add

Recommended adapter files:

```text
.github/copilot-instructions.md
.github/instructions/spec.instructions.md
AGENTS.md
```

## What To Put In `.github/copilot-instructions.md`

Keep this file short and stable.

Recommended contents:

- `skills/` is the canonical workflow contract
- `memories/repo/` is the durable memory location
- `artifacts/features/<slug>/` is the feature work location
- feature work should follow the spec-driven sequence
- Copilot should prefer the relevant skill and current artifacts over chat history

## What To Put In `.github/instructions/*.instructions.md`

Use path-specific instructions only when necessary, for example:

- docs-only behavior
- test or review conventions for certain directories
- generated output rules for a specific folder

Keep these small and file-scoped.

## What To Put In `AGENTS.md`

Use `AGENTS.md` as a bridge file for:

- the workflow sequence
- where memory lives
- where artifacts live
- which skill owns which phase

Do not duplicate full skill bodies here.

## Codex Integration

## Files To Add

Recommended adapter files:

```text
AGENTS.md
```

Optional:

```text
README snippets that point Codex users to skills/
```

## Recommended `AGENTS.md` Shape

Include:

- the repository purpose
- canonical locations:
  - `skills/`
  - `memories/repo/`
  - `artifacts/features/<slug>/`
- the normal workflow order
- a short mapping from command-style steps to skills

Example:

```markdown
# AGENTS.md

Use `skills/` as the canonical workflow contract.

Workflow:
- `/constitution` -> `skills/constitution/SKILL.md`
- `/project-knowledge-base` -> `skills/project-knowledge-base/SKILL.md`
- `/analyze` -> `skills/analyze/SKILL.md`
- `/spec-requirement` -> `skills/spec-requirement/SKILL.md`
- `/spec-review-requirements` -> `skills/spec-review-requirements/SKILL.md`
- `/spec-design` -> `skills/spec-design/SKILL.md`
- `/spec-plan` -> `skills/spec-plan/SKILL.md`
- `/spec-tasks` -> `skills/spec-tasks/SKILL.md`
- `/spec-implement` -> `skills/spec-implement/SKILL.md`
- `/spec-review` -> `skills/spec-review-implementation/SKILL.md`
- `/spec-testing-scenarios` -> `skills/spec-testing-scenarios/SKILL.md`
```

Keep the file short and route detail back to the skills themselves.

## Claude Code Integration

## Files To Add

Recommended adapter files:

```text
CLAUDE.md
.claude/commands/constitution.md
.claude/commands/project-knowledge-base.md
.claude/commands/analyze.md
.claude/commands/spec-requirement.md
.claude/commands/spec-review-requirements.md
.claude/commands/spec-design.md
.claude/commands/spec-plan.md
.claude/commands/spec-tasks.md
.claude/commands/spec-implement.md
.claude/commands/spec-review.md
.claude/commands/spec-testing-scenarios.md
```

## What To Put In `CLAUDE.md`

Keep `CLAUDE.md` focused on:

- repository purpose
- canonical locations
- working style expectations
- the fact that `skills/` is the workflow source of truth

## What To Put In `.claude/commands/*.md`

Make each command file a thin wrapper.

Example:

```markdown
Use the workflow in `skills/spec-plan/SKILL.md`.

Read:
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- the current feature folder under `artifacts/features/<slug>/`

Create or refine:
- `artifacts/features/<slug>/plan.md`
```

The command files should point at the canonical skill, not copy the whole skill body.

## One Source Of Truth Rule

For all three clients:

- keep detailed workflow behavior in `skills/`
- keep client adapters short
- update adapters only when discovery or invocation needs differ
- avoid maintaining three separate workflow systems by hand

## Recommended Integration Sequence

### Minimal Cross-Client Setup

1. keep `skills/`, `memories/repo/`, and `artifacts/features/` as canonical
2. add `AGENTS.md`
3. add `CLAUDE.md` plus `.claude/commands/` if your team uses Claude Code
4. add `.github/copilot-instructions.md` if your team uses GitHub Copilot

### Stronger Team Setup

Add:

- `.github/instructions/*.instructions.md` for Copilot path-specific behavior
- documented ownership rules in `AGENTS.md` or `CLAUDE.md`
- branch or worktree guidance for multi-agent work

## Integration Checklist

- `skills/` remains canonical
- client-specific files are adapters, not competing systems
- `AGENTS.md` points to the skill workflow
- `CLAUDE.md` points to the skill workflow
- `.claude/commands/` wrap the skill workflow instead of copying it
- `.github/copilot-instructions.md` points to the skill workflow instead of redefining it
- memory and artifact paths are consistent in every client adapter

## Read Next

- [Bootstrap And Adoption](bootstrap-adoption.md)
- [Team And Multi-Agent Collaboration](team-collaboration.md)
- [Skill Adoption](skill-adoption.md)
