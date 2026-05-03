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
| Gemini CLI | `GEMINI.md` | `GEMINI.md` points to the same canonical workflow and repo memory | adapter-driven |
| Other agent runtimes | repo-specific entrypoint | entrypoint should point to `skills/` and canonical paths | adapter-driven |

For a concise public command and adapter overview, see [Supported Agents](supported-agents.md).

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
GEMINI.md
```

Use [../adapters](../adapters/README.md) for thin starter examples.

Checked-in examples:

- `adapters/AGENTS.example.md`
- `adapters/CLAUDE.example.md`
- `adapters/copilot-instructions.example.md`
- `adapters/GEMINI.example.md`

Before running bootstrap in another repository, make sure the kit has already been copied or vendored there. `scripts/bootstrap-kit.sh` does not install `skills/` for you.

## Entry Point Rules

An entrypoint file should:

- say that `skills/` is the workflow source of truth
- point to `memories/repo/` and `artifacts/features/`
- tell the agent to choose the matching skill before freeform work
- tell the agent that completion claims require fresh verification evidence
- keep any command aliases thin and mapped to existing skills only

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
5. read the current feature artifacts under `artifacts/features/<slug>/`
6. execute one stage at a time

## Intent To Skill Map

Keep adapter wording close to this routing:

- durable repo-wide rules -> `/constitution`
- durable descriptive repo context -> `/project-knowledge-base`
- current-state investigation or bug analysis -> `/analyze`
- define or refine what should change -> `/spec-requirement`
- review spec readiness -> `/spec-review-requirements`
- resolve technical ambiguity -> `/spec-design`
- plan execution -> `/spec-plan`
- break execution into tasks -> `/spec-tasks`
- implement the next bounded task -> `/spec-implement`
- review delivered implementation -> `/spec-review`
- write a manual testing guide -> `/spec-testing-scenarios`
- promote durable findings -> `/memory-promotion`
- audit `REQ -> AC -> TASK -> validation` -> `/task-traceability-audit`

## Packaging Rule

If you package this kit into another repository:

- vendor or copy `skills/` intact
- copy or vendor `scripts/bootstrap-kit.sh` if you want the lightweight scaffolding helper
- keep the canonical `memories/repo/` and `artifacts/features/` paths unless you are intentionally changing the contract
- adapt only the thin client entrypoints
- prefer repository-local copies or vendoring over partial copy-paste into multiple adapter folders

For downstream updates, change these layers together:

- `skills/`
- the chosen adapter example
- any locally copied onboarding docs or reference snippets
- release verification notes

## Lightweight Bootstrap

If you want a small helper instead of manual setup, use:

```text
scripts/bootstrap-kit.sh
```

Its job should stay small:

- create the canonical folder structure when missing
- create starter `memories/repo/constitution.md` and `memories/repo/project-knowledge-base.md` files when missing
- create a thin `AGENTS.md` stub only when no other supported runtime entrypoint exists
- print the next workflow steps

It should not replace the skills, install the kit, or invent a separate setup model.

## What To Check

Before treating an integration as finished, verify:

- the entrypoint points to the canonical workflow
- the client is not taught a competing workflow
- artifact and memory paths are consistent
- the discovery order is explicit
- every claimed runtime still has a checked-in adapter example that matches the docs
