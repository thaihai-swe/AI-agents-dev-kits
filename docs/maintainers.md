# Maintainers

## Source Of Truth

The workflow contract lives in:

- `skills/*/SKILL.md`
- `skills/*/references/*`
- `docs/skill-anatomy.md`

User-facing docs should explain the workflow, not compete with it.

Current skill surface:

- foundation skills: `constitution`, `project-knowledge-base`
- feature workflow skills: `analyze`, `spec-requirement`, `spec-review-requirements`, `spec-design`, `spec-plan`, `spec-tasks`, `spec-implement`, `spec-review-implementation`, `spec-testing-scenarios`
- helper skills: `memory-promotion`, `task-traceability-audit`
- utility skills: `refactor-cleaner`

Maintain docs coverage for all four groups. User-facing docs should not make the kit look like it only contains the feature-delivery middle.

## Release Checklist

Before release:

1. run `bash scripts/check-kit-consistency.sh`
2. run one realistic end-to-end dry run from a clean target directory
3. verify skills, templates, docs, examples, adapters, and bootstrap use the same artifact model
4. freeze artifact names, verdict names, and task-state names for the release line
5. check that stop conditions route back to the correct upstream artifact

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
- foundation skills are included wherever the docs describe the full workflow
- bootstrap creates the same baseline files the onboarding docs promise
- the documented install step explains how `skills/` reaches the target repository before bootstrap runs
- bootstrap is described only as scaffolding, not as installation
- the checked-in example artifact fixture still matches the current skill contract

## Adopter Confidence Signals

Before telling users the kit is release-ready, make sure:

- the golden example artifacts still read like outputs the skills would actually produce today
- helper-skill decisions and audits are easy to compare against checked-in examples or templates
- a new maintainer can explain the install step, bootstrap step, and first real feature path without adding unstated rules

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

Each page should have one primary job:

- `getting-started.md`: first successful run
- `supported-agents.md`: adapter model and public command surface
- `debugging.md`: bug-fix and failure-analysis workflow
- `understanding-existing-code.md`: current-state discovery workflow
- `memory.md`: durable repo memory model
- `workflow.md`: stage responsibilities and gates
- `skill-anatomy.md`: required `SKILL.md` structure and maintainer rules
- `adoption.md`: repo rollout and team usage
- `integrations.md`: client entrypoints and packaging
- `examples.md`: copyable scenario flows
- `reference.md`: lookup
- `maintainers.md`: governance and release operation

## Skill And Doc Design Rules

Keep each `SKILL.md` lean and operational.

Each skill should make these elements easy to find:

- overview
- trigger or use-when
- required inputs and preconditions
- stop conditions or move-backward conditions
- the core workflow
- core rules and cross-skill routing
- rationalizations and red flags
- verification
- expected outputs or owned artifacts
- quality checks that prevent weak downstream handoffs

Use `references/` for:

- templates
- checklists
- output shapes
- examples that would otherwise bloat the skill body

Prefer skill-local `skills/*/references/` material. Use top-level `references/` only when multiple existing skills truly depend on the same shared checklist.

Do not turn docs into a second competing source of workflow truth. If a rule belongs to the contract, update the owning skill first and then align the docs.

## Progressive Disclosure

Prefer this information depth:

1. `README.md` for orientation
2. docs pages for workflow explanation and adoption
3. `SKILL.md` for the operational contract
4. `references/` for structural detail and reusable shapes

When a page starts carrying too many secondary concerns, split or trim it before adding more.

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

For client entrypoint and packaging rules, use [Integrations](integrations.md).
