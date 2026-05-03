# Project Knowledge Base

## Purpose

This file stores the durable descriptive knowledge future maintainers and agents should reuse when working on the AI Agents Development Kit.

Use it for stable repository facts, packaging patterns, boundaries between layers, and recurring release watchouts that apply across many future changes.

## How Agents Should Use This File

- Read it after `memories/repo/constitution.md`.
- Prefer it over ad hoc assumptions in chat when deciding where a change belongs.
- Keep feature-local or one-off observations in `artifacts/features/<slug>/` instead of promoting them here.
- Treat the constitution as authoritative if a descriptive note here ever conflicts with a repo-wide rule.

## Source Of Truth Map

- Workflow contract:
  Source of truth: `skills/*/SKILL.md` and `skills/*/references/*`
  Why it matters: workflow semantics, stage ownership, stop conditions, and cross-skill routing start there.

- User-facing workflow explanation:
  Source of truth: `docs/` and `README.md`
  Why it matters: these pages explain the contract for adopters, but should stay subordinate to the skills.

- Thin runtime entrypoints:
  Source of truth: `adapters/` examples and repo entrypoints such as `AGENTS.md`
  Why it matters: adapters should point back to the canonical workflow without creating a second prompt system.

- Durable repository memory:
  Source of truth: `memories/repo/constitution.md` and `memories/repo/project-knowledge-base.md`
  Why it matters: agents are expected to read these files before meaningful workflow work.

- Scaffolding and consistency checks:
  Source of truth: `scripts/bootstrap-kit.sh` and `scripts/check-kit-consistency.sh`
  Why it matters: bootstrap shapes first-run adoption, while the consistency gate protects the release surface.

## Stable Invariants

- Invariant: The kit currently ships 14 skills: 11 core workflow skills, 2 helper skills, and 1 utility skill.
  Why it matters: docs, adapter examples, and release checks should describe the current skill surface accurately.
  Confidence: High
  Provenance: Observed in repo

- Invariant: The canonical working paths are `skills/`, `memories/repo/`, and `artifacts/features/<slug>/`.
  Why it matters: adapters, docs, and bootstrap all depend on those paths staying aligned.
  Confidence: High
  Provenance: Observed in repo

- Invariant: The public user command surface is the slash-alias surface, not the raw internal skill IDs.
  Why it matters: first-run docs should teach commands users invoke, while internal IDs remain maintainer detail.
  Confidence: High
  Provenance: Observed in repo

- Invariant: Claimed runtime support should be backed by checked-in adapter examples under `adapters/`.
  Why it matters: supported-agent docs and release checks should point to concrete repo evidence, not vague promises.
  Confidence: High
  Provenance: Observed in repo

## Decision Heuristics

- Heuristic: If a change affects workflow semantics, edit the owning `SKILL.md` before touching docs or adapters.
  Use when: a request changes stage order, stop conditions, artifact ownership, or helper-skill routing.
  Avoid when: the change is pure prose cleanup with no workflow effect.
  Why it helps: it keeps the workflow contract upstream and prevents docs-first drift.

- Heuristic: If setup language sounds like installation, separate packaging from scaffolding explicitly.
  Use when: editing onboarding, adoption, or bootstrap docs.
  Avoid when: describing behavior inside an already-vendored copy of the kit.
  Why it helps: adopters need to know how `skills/` reaches their repo before bootstrap becomes meaningful.

- Heuristic: Promote only durable release lessons into repo memory; keep individual review threads or one-off cleanup decisions out.
  Use when: a finding affects future maintainers across multiple releases.
  Avoid when: the insight belongs only to one feature artifact or one temporary debugging pass.
  Why it helps: repo memory stays compact and reusable instead of becoming session residue.

## Known Good Patterns

- Pattern: Keep docs task-oriented and thinly mapped to the skill contract.
  Use when: writing onboarding, workflow, debugging, or supported-agent pages.
  Reference: `docs/README.md`, `docs/getting-started.md`, `docs/workflow.md`, `docs/debugging.md`
  Notes: intent-based pages work well as long as they do not invent alternate workflow semantics.

- Pattern: Use one lightweight consistency script to catch contract drift across skills, docs, adapters, memory, and bootstrap.
  Use when: changing release-critical surfaces or preparing a publishable release.
  Reference: `scripts/check-kit-consistency.sh`
  Notes: the script is intentionally small, so maintainers should still run a real dry run for adoption paths.

- Pattern: Keep at least one checked-in helper-skill example alongside the main artifact fixtures.
  Use when: refining helper-skill output shapes or calibrating new maintainers.
  Reference: `artifacts/examples/magic-link-login/memory-promotion-decision.md`, `artifacts/examples/magic-link-login/traceability-audit.md`
  Notes: templates alone are not enough when the output quality bar is subtle.

- Pattern: Keep starter memory templates in skill-owned references and use bootstrap to copy them when needed.
  Use when: setting up another repository that adopts this kit.
  Reference: `skills/constitution/references/constitution-template.md`, `skills/project-knowledge-base/references/project-knowledge-base-template.md`, `scripts/bootstrap-kit.sh`
  Notes: this separates shipped repo-specific memory from starter content for adopters.

## Anti-Patterns And Forbidden Moves

- Anti-pattern: Treating bootstrap as if it installs the kit.
  Why it is harmful: adopters can end up with empty folders and documented commands they cannot actually run.
  Safer alternative: tell users to copy or vendor the kit first, then use bootstrap only for local scaffolding.

- Anti-pattern: Letting docs or adapters teach a different workflow order than the skills.
  Why it is harmful: agents receive contradictory instructions and drift away from the artifact-first contract.
  Safer alternative: update the owning skill first, then align downstream prose and adapters in the same change.

- Anti-pattern: Shipping placeholder repo memory as canonical memory for this repository.
  Why it is harmful: agents are told to trust files that contain no real project guidance.
  Safer alternative: keep starter placeholders in templates only and keep checked-in repo memory concrete.

## Boundaries And Ownership

- Boundary: `skills/` and skill-local `references/`
  Owned by / primary area: workflow contract
  Why it matters: these files define what each stage owns, what it must read, and when it must stop.
  Integration note: docs, adapters, and scripts should reflect this layer, not replace it.

- Boundary: `docs/` and `README.md`
  Owned by / primary area: user-facing explanation and adoption guidance
  Why it matters: this layer is where adopters learn the workflow and setup path.
  Integration note: keep public command language on slash aliases and keep setup instructions consistent with bootstrap and packaging.

- Boundary: `adapters/` and repo entrypoint files
  Owned by / primary area: client-specific entrypoints
  Why it matters: runtimes need thin wrappers that point back to the canonical workflow.
  Integration note: adapter wording may vary by client, but the workflow order and canonical paths must not.

- Boundary: `scripts/`
  Owned by / primary area: scaffolding and validation
  Why it matters: these scripts shape first-run behavior and release confidence.
  Integration note: if script behavior changes, onboarding docs and repo memory usually need review in the same change.

## Shared Dependencies And Infrastructure

- Dependency or platform: Bash
  Why it matters: both bootstrap and release checks are shell entrypoints.
  Watchout: keep scripts portable and non-interactive.

- Dependency or platform: Python 3
  Why it matters: `scripts/check-kit-consistency.sh` uses an embedded Python validator for path and text checks.
  Watchout: avoid expanding the release gate into a heavyweight toolchain.

- Dependency or platform: `rg`
  Why it matters: repository review and maintenance guidance assumes fast text search for validation and drift detection.
  Watchout: docs should not assume more tooling than the repo actually needs to function.

## Durable Brownfield Watchouts

- Watchout: user-facing docs naturally drift toward internal skill IDs over time, especially around `/spec-review`.
  Use this knowledge when: editing README, onboarding docs, supported-agent docs, or adapter examples.
  Impact if ignored: the public command surface becomes inconsistent and first-run guidance gets harder to trust.

- Watchout: memory files, bootstrap output, and docs can drift independently because they are maintained in different directories.
  Use this knowledge when: changing onboarding, repo memory, or validation scripts.
  Impact if ignored: agents may be told to read canonical memory that is missing, stale, or still placeholder-only.

- Watchout: a dry run inside the current repo can hide packaging problems that appear only in a clean target directory.
  Use this knowledge when: preparing a release or changing bootstrap/install language.
  Impact if ignored: maintainers may ship a setup path that sounds coherent but fails for new adopters.

## Glossary And Naming

- Term: public command surface
  Meaning: the documented slash-alias commands users are expected to invoke
  Notes: keep this layer stable in user-facing docs.

- Term: internal skill ID
  Meaning: the raw skill directory or skill name such as `spec-review-implementation`
  Notes: maintainer detail unless explicit mapping is needed.

- Term: repo memory
  Meaning: durable repository-wide context under `memories/repo/`
  Notes: distinct from change-specific feature artifacts.

- Term: bootstrap
  Meaning: local scaffolding of folders, starter memory, and a thin adapter stub
  Notes: not the packaging or installation step.

## Freshness And Maintenance

- Last major refresh date: 2026-05-01
- Refresh this file when skill ownership changes, bootstrap/setup behavior changes, release checks change, or recurring release lessons become durable.
- Do not put one-off feature notes, temporary review comments, or chat-only reasoning here.

## Promotion Rules

- What belongs here: stable repository facts, cross-cutting packaging patterns, ownership boundaries, release watchouts, and reusable setup knowledge.
- What should stay in feature artifacts under `artifacts/features/<slug>/`: feature-local specs, implementation details, temporary analysis, and one-off review findings.
- What should instead go to `memories/repo/constitution.md`: repo-wide rules, quality gates, command-surface mandates, and non-negotiable agent behavior.
- A finding is durable enough to promote when it will still help future maintainers on unrelated changes and is grounded in repository evidence.
- When evidence is partial, label the source clearly in prose instead of inventing false certainty.
