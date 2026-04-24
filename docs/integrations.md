# Integrations

## Purpose

This page explains how to connect the kit to common AI coding clients without forking the workflow.

The rule is simple:

- keep `skills/` as the canonical workflow contract
- keep `memories/repo/` and `artifacts/features/` as canonical context locations
- keep client adapter files thin

## Integration Matrix

| Client | Primary entrypoint | How skills are discovered | Native vs adapter |
|---|---|---|---|
| Codex | `AGENTS.md` | `AGENTS.md` points to `skills/`, repo memory, and feature artifacts | adapter-driven |
| Claude Code | `CLAUDE.md` and optional `.claude/commands/*` | `CLAUDE.md` sets context, command files wrap matching skills | adapter-driven |
| GitHub Copilot | `.github/copilot-instructions.md` and optional `.github/instructions/*` | repo instructions point back to the canonical workflow | adapter-driven |
| Other agent runtimes | repo-specific entrypoint | entrypoint should point to `skills/` and canonical paths | adapter-driven |

## Minimal Setup

Keep these as canonical:

```text
skills/
memories/repo/
artifacts/features/
```

Add the client entrypoint your runtime expects, for example:

```text
AGENTS.md
CLAUDE.md
.github/copilot-instructions.md
```

## Entry Point Rules

An entrypoint file should:

- say that `skills/` is the workflow source of truth
- point to `memories/repo/` and `artifacts/features/`
- tell the agent to choose the matching skill before freeform work
- tell the agent that completion claims require fresh verification evidence

An entrypoint file should not:

- duplicate the full skill bodies
- invent a separate workflow order
- rename artifacts without changing the owning skills and docs

## Discovery Order

The expected discovery path is:

1. read the client entrypoint
2. choose the matching skill in `skills/`
3. read `memories/repo/constitution.md`
4. read `memories/repo/project-knowledge-base.md`
5. read the current feature artifacts
6. execute one stage at a time

## Packaging Rule

If you package this kit into another repository:

- vendor or copy `skills/` intact
- keep the canonical `memories/repo/` and `artifacts/features/` paths unless you are intentionally changing the contract
- adapt only the thin client entrypoints
- prefer repository-local copies or vendoring over partial copy-paste into multiple adapter folders

## Lightweight Bootstrap

If you want a small helper instead of manual setup, use:

```text
scripts/bootstrap-kit.sh
```

Its job should stay small:

- create the canonical folder structure when missing
- create a thin `AGENTS.md` stub when missing
- print the next workflow steps

It should not replace the skills or invent a separate setup model.

## What To Check

Before treating an integration as finished, verify:

- the entrypoint points to the canonical workflow
- the client is not taught a competing workflow
- artifact and memory paths are consistent
- the discovery order is explicit
