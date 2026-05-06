# Memory

## Purpose

This page explains the memory layer for the kit and how it relates to feature artifacts.

The memory model is intentionally small. Durable repository memory should stay compact, reusable, and clearly separate from feature-specific artifacts.

## Memory Layers

Think about context in four layers:

1. `memories/repo/kit-memory.md`
   Durable repo-wide rules, guardrails, and non-negotiable operating constraints.
2. `memories/repo/kit-memory.md`
   Durable descriptive context: patterns, boundaries, architecture notes, and brownfield watchouts.
3. optional domain specs
   Current-state subsystem descriptions for large repositories.
4. `artifacts/features/<slug>/`
   Change-specific analysis, spec, plan, tasks, review, and testing artifacts.

The first two are canonical repo memory. Domain specs are optional. Feature artifacts are not durable repo memory.

## Canonical Memory Files

Use only:

- `memories/repo/kit-memory.md`
- `memories/repo/kit-memory.md`

These files should ship with starter content when the repository uses `scripts/bootstrap-kit.sh`. They are expected to exist before the first serious feature workflow begins.

In this repository, the checked-in versions of those files should contain real repo-specific memory. Starter template text belongs in the skill-owned reference templates and in bootstrap output for adopters.

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

Use optional domain specs for:

- large repositories with multiple major subsystems
- current-state subsystem behavior that is too detailed for repo-wide memory
- stable subsystem descriptions that many future features will need

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

When the right destination is unclear, use `/kit-memory` instead of guessing.

For calibration, keep one reviewed helper example in the fixture set so maintainers can compare real promotion decisions against the current skill contract.

## What Not To Create

Do not create competing durable memory files such as:

- `AI_CONTRACT.md`
- `ARCHITECTURE.md`
- `DECISIONS.md`
- `projectmap.md`

unless the repository intentionally changes the canonical model.

## Bootstrap And Maintenance

The lightweight bootstrap flow should give a repository these starter files:

- `memories/repo/kit-memory.md`
- `memories/repo/kit-memory.md`

Then the repository owner or maintainer should refine them with `/kit-memory` and `/kit-memory`.

## How Agents Should Use Memory

The intended discovery order is:

1. read the entrypoint file such as `AGENTS.md` when the client uses one
2. choose the matching skill under `skills/`
3. read `memories/repo/kit-memory.md`
4. read `memories/repo/kit-memory.md`
5. read the current feature artifact folder under `artifacts/features/<slug>/`

The entrypoint should point the agent to this order instead of duplicating the memory rules.

## Maintenance Rules

- keep durable memory concise
- merge duplicate notes into compact summaries
- remove stale or disproven knowledge
- do not let descriptive memory override the constitution
- use `/kit-memory` when deciding what deserves promotion
- update repo memory because a durable pattern was discovered, not because chat context might be lost
