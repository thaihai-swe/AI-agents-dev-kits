# Skills

## Purpose

Skills are the reusable workflow entry layer for the kit.

## Relationship To Artifacts

- skills live in `skills/`
- artifacts live under `artifacts/features/<slug>/`
- `SKILL.md` should summarize invocation, inputs, outputs, and stop conditions
- `references/` should hold heavier structural material when that helps keep `SKILL.md` lean

## Skill Design Rules

- keep skills short and actionable
- point users to the right artifact path
- mention stop conditions explicitly
- do not duplicate large reference material in the main skill body

## Source Of Truth

If skill wording and bundled references drift, fix both so the contract remains coherent.
