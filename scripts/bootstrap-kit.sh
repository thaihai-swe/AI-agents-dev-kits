#!/usr/bin/env bash

set -euo pipefail

mkdir -p skills memories/repo artifacts/features

if [[ ! -f AGENTS.md ]]; then
  cat > AGENTS.md <<'EOF'
# AGENTS.md

Read this file before working in this repository.

- `skills/` is the workflow source of truth
- use the matching existing skill before freeform work
- durable repo memory lives under `memories/repo/`
- current feature artifacts live under `artifacts/features/<slug>/`
- completion claims require fresh verification evidence
EOF
  echo "Created AGENTS.md"
else
  echo "AGENTS.md already exists"
fi

if [[ ! -f memories/repo/constitution.md ]]; then
  cat > memories/repo/constitution.md <<'EOF'
# Project Constitution

Version: 0.1.0
Last updated: YYYY-MM-DD

## Purpose

Describe the durable repository-wide rules, guardrails, and quality gates for this project.

Use this file for rules that should govern future work across many changes.

## Scope

- repositories, services, or packages in scope
- who should follow these rules
- when this file overrides temporary local guidance

## Core Principles

- CC-001 Principle:
  Why it matters:
- CC-002 Principle:
  Why it matters:
- CC-003 Principle:
  Why it matters:

## Delivery Rules

- CC-101 Rule:
- CC-102 Rule:
- CC-103 Rule:

## Quality And Validation Gates

- CC-201 Gate:
- CC-202 Gate:
- CC-203 Gate:

## Architectural Guardrails

- CC-301 Guardrail:
- CC-302 Guardrail:
- CC-303 Guardrail:

## Brownfield Safety Rules

- CC-401 Safety rule:
- CC-402 Safety rule:
- CC-403 Safety rule:

## AI Agent Operating Rules

- CC-501 Agents must:
- CC-502 Agents must not:
- CC-503 Required artifact usage:

## Amendment Process

- How this document should be updated:
- Who should approve changes:
- When amendments are required:
- Which downstream skills, docs, or scripts should be reviewed after amendment:
EOF
  echo "Created memories/repo/constitution.md"
else
  echo "memories/repo/constitution.md already exists"
fi

if [[ ! -f memories/repo/project-knowledge-base.md ]]; then
  cat > memories/repo/project-knowledge-base.md <<'EOF'
# Project Knowledge Base

## Purpose

Describe the durable descriptive repository knowledge future agents should reuse.

Use this file for stable patterns, boundaries, architecture notes, and brownfield watchouts that are worth carrying across many future changes.

## How Agents Should Use This File

- read it after `memories/repo/constitution.md`
- prefer it over ad hoc assumptions in chat
- keep feature-local notes in `artifacts/features/<slug>/`
- treat the constitution as authoritative if the two files ever conflict

## Source Of Truth Map

- Domain or concern:
  Source of truth:
  Why it matters:

- Domain or concern:
  Source of truth:
  Why it matters:

## Stable Invariants

- Invariant:
  Why it matters:
  Confidence: High | Medium | Low
  Provenance: Observed in repo | Team convention

- Invariant:
  Why it matters:
  Confidence: High | Medium | Low
  Provenance: Observed in repo | Team convention

## Decision Heuristics

- Heuristic:
  Use when:
  Avoid when:
  Why it helps:

- Heuristic:
  Use when:
  Avoid when:
  Why it helps:

## Known Good Patterns

- Pattern:
  Use when:
  Reference:
  Notes:

- Pattern:
  Use when:
  Reference:
  Notes:

## Anti-Patterns And Forbidden Moves

- Anti-pattern:
  Why it is harmful:
  Safer alternative:

- Anti-pattern:
  Why it is harmful:
  Safer alternative:

## Boundaries And Ownership

- Boundary:
  Owned by / primary area:
  Why it matters:
  Integration note:

- Boundary:
  Owned by / primary area:
  Why it matters:
  Integration note:

## Shared Dependencies And Infrastructure

- Dependency or platform:
  Why it matters:
  Watchout:

- Dependency or platform:
  Why it matters:
  Watchout:

## Durable Brownfield Watchouts

- Watchout:
  Use this knowledge when:
  Impact if ignored:

- Watchout:
  Use this knowledge when:
  Impact if ignored:

## Glossary And Naming

- Term:
  Meaning:
  Notes:

- Term:
  Meaning:
  Notes:

## Freshness And Maintenance

- Last major refresh date:
- What kinds of changes should trigger a refresh:
- What does not belong here:

## Promotion Rules

- What belongs here:
- What should stay in feature artifacts under `artifacts/features/<slug>/`:
- What should instead go to `memories/repo/constitution.md`:
- When a finding is durable enough to promote:
- How to record confidence or provenance when evidence is partial:
EOF
  echo "Created memories/repo/project-knowledge-base.md"
else
  echo "memories/repo/project-knowledge-base.md already exists"
fi

echo "Ensured canonical folders:"
echo "- skills/"
echo "- memories/repo/"
echo "- artifacts/features/"
echo
echo "Next steps:"
echo "1. Review and refine memories/repo/constitution.md"
echo "2. Review and refine memories/repo/project-knowledge-base.md"
echo "3. Run /constitution or /project-knowledge-base when those starter files need durable project-specific content"
echo "4. Start one real feature under artifacts/features/<slug>/"
