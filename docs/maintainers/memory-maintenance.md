# Memory Maintenance

## Purpose

This page explains how to maintain durable repository memory.

## Durable Memory Model

Use only:
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

## What Goes Where

Use `constitution.md` for:
- rules
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

## Promotion Rules

Use the `memory-promotion` skill mindset:
- promote only durable findings
- keep feature-specific findings in feature artifacts
- escalate true repo-wide rules into the constitution
- keep feature-local design decisions in `artifacts/features/<slug>/design.md`
- do not create competing durable files such as `AI_CONTRACT.md`, `ARCHITECTURE.md`, `DECISIONS.md`, or `projectmap.md` unless the repository intentionally changes the canonical model

## Source Of Truth

Use `skills/` and the relevant memory-maintenance skills.
