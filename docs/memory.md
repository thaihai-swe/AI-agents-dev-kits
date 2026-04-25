# Memory

## Purpose

This page explains the memory layer for the kit.

The memory model is intentionally small. Durable repository memory should stay compact, reusable, and clearly separate from feature-specific artifacts.

## Canonical Memory Files

Use only:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

## What Goes Where

Use `constitution.md` for:

- durable rules
- guardrails
- required quality expectations
- durable AI operating constraints and non-negotiable automation rules

Use `project-knowledge-base.md` for:

- durable architecture context
- durable project-map summaries
- subsystem boundaries
- integration seams
- recurring patterns
- durable brownfield watchouts
- promoted summaries of repo-wide design decisions

Use feature artifacts for:

- feature-specific findings
- current feature constraints
- feature-local design decisions
- work-in-progress clarification, planning, tasks, and review

## Promotion Rules

Promote a finding into repo memory only when it is:

- durable across future changes
- grounded in repository evidence
- useful to future contributors or agents
- descriptive rather than speculative

Keep these in feature artifacts instead:

- feature-specific analysis
- temporary implementation notes
- one-off debugging sessions
- local design rationale that does not generalize beyond one feature

## What Not To Create

Do not create competing durable memory files such as:

- `AI_CONTRACT.md`
- `ARCHITECTURE.md`
- `DECISIONS.md`
- `projectmap.md`

unless the repository intentionally changes the canonical model.

## How Agents Should Use Memory

The intended discovery order is:

1. read the entrypoint file such as `AGENTS.md` when the client uses one
2. choose the matching skill under `skills/`
3. read `memories/repo/constitution.md`
4. read `memories/repo/project-knowledge-base.md`
5. read the current feature artifact folder under `artifacts/features/<slug>/`

The entrypoint should point the agent to this order instead of duplicating the memory rules.

## Maintenance Rules

- keep durable memory concise
- merge duplicate notes into compact summaries
- remove stale or disproven knowledge
- do not let descriptive memory override the constitution
- use the `memory-promotion` skill mindset when deciding what deserves promotion
