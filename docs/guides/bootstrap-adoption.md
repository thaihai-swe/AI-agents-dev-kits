# Bootstrap And Adoption

## When To Use This Guide

Use this guide when you want to adopt the kit in a new repository or retrofit it into an existing one.

## Outcome

By the end, the repository should have:

- `skills/`
- `memories/repo/`
- `artifacts/features/`
- enough durable memory to start feature work safely

## Minimum Repository Shape

```text
skills/
memories/
  repo/
artifacts/
  features/
```

## Step 1: Add The Shared Skills

Copy the `skills/` directory into the target repository.

This gives the repository:

- 10 core workflow skills
- 2 helper skills

## Step 2: Create The Core Working Folders

Create these directories if they do not exist:

```text
memories/repo/
artifacts/features/
```

Recommended placeholders:

```text
memories/repo/.gitkeep
artifacts/features/.gitkeep
```

## Step 3: Initialize Durable Memory

Run:

```text
/constitution
/project-knowledge-base
```

Expected outputs:

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Use `constitution` to define durable repo-wide rules.
Use `project-knowledge-base` to capture durable descriptive context.

## Step 4: Start With One Real Feature

Choose a feature slug:

```text
my-first-feature
```

Then follow the normal workflow:

```text
/analyze                    (if needed)
/spec-requirement
/spec-review-requirements
/spec-design                (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

## Adoption Modes

### New Repository

Best for:

- greenfield projects
- internal starter kits
- teams standardizing before delivery begins

Recommended order:

1. add `skills/`
2. create `memories/repo/` and `artifacts/features/`
3. run `constitution`
4. run `project-knowledge-base`
5. start the first real feature

### Existing Repository

Best for:

- brownfield products
- repos with hidden constraints
- teams adding structure without rewriting process overnight

Recommended order:

1. add `skills/`
2. create `memories/repo/` and `artifacts/features/`
3. capture only minimal durable memory first
4. start with a small or well-understood feature
5. grow repo memory as durable knowledge emerges

## What To Avoid During Adoption

- do not try to backfill every past feature into artifacts
- do not dump all architecture notes into `project-knowledge-base.md` on day one
- do not invent parallel memory systems outside `memories/repo/`
- do not skip durable memory entirely if the repo has real constraints

## Adoption Readiness Checklist

- `skills/` is present
- `memories/repo/` exists
- `artifacts/features/` exists
- `constitution.md` exists or has an explicit plan to be created immediately
- `project-knowledge-base.md` exists or has an explicit plan to be created immediately
- the team has chosen one feature slug to test the workflow

## Read Next

- [Quick Start](quick-start.md)
- [Skill Adoption](skill-adoption.md)
- [Full Skill Workflow Example](../examples/full-skill-workflow.md)
