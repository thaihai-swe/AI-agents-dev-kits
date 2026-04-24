# Maintainers

## Source Of Truth

The workflow contract lives in:

- `skills/*/SKILL.md`
- `skills/*/references/*`

User-facing docs should explain the workflow, not compete with it.

Current skill surface:

- foundation skills: `constitution`, `project-knowledge-base`
- feature workflow skills: `analyze`, `spec-requirement`, `spec-review-requirements`, `spec-design`, `spec-plan`, `spec-tasks`, `spec-implement`, `spec-review-implementation`, `spec-testing-scenarios`
- helper skills: `memory-promotion`, `task-traceability-audit`

## Release Checklist

Before release:

1. run one realistic end-to-end dry run
2. verify skills, templates, docs, and examples use the same artifact model
3. freeze artifact names, verdict names, and task-state names for the release line
4. check that stop conditions route back to the correct upstream artifact

Release gate:

- the shipped workflow is coherent, adoptable, and internally consistent
- the current skill set supports the intended workflow without sidecar rules outside `skills/`
- the minimum adoption path is clear
- at least one realistic baseline example still teaches the intended model

## Dry Run Report Template

Use this shape when recording a release dry run:

- scenario type and slug
- which commands were used or skipped
- output quality at each stage
- handoff issues
- remaining blockers
- release recommendation

During the dry run, check:

- each step has the inputs it expects
- each stop condition routes back to the correct upstream artifact
- no downstream step depends on hidden maintainer knowledge
- examples and docs do not teach behavior the skills do not require
- helper skills are described accurately and only where they materially help the workflow

## Doc Governance

When skill contracts change, review:

- templates
- examples
- top-level docs
- README links

Avoid:

- duplicated workflow pages
- stale links
- alternate client-specific workflows that contradict the core contract

Do one final prose pass for:

- duplicated instructions
- wording that now conflicts with another skill
- examples that imply more capabilities than the kit actually provides
- bloated explanation where a shorter rule would do

## Customization Rules

Teams may customize:

- adapter wording
- template wording
- repo memory contents

They should not change these without updating the owning skills and docs:

- artifact file names
- verdict names
- task status names
- command-to-skill mappings
- canonical durable memory locations

For memory maintenance rules, use [Memory](memory.md).
