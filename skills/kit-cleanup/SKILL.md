---
name: kit-cleanup
description: Perform surgical refactoring, dead-code removal, or orphan cleanup across the repository. Use when technical debt has been identified and needs removal without introducing new features or behavioral changes.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools.
metadata:
  author: spec-driven-development-kit
---

# Kit Cleanup

## Overview

Use this skill to perform surgical refactoring and cleanup. It is a utility skill for maintaining repository health.

## Read First

- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`
- Files being cleaned up and their callers.

## When to Use

- Removing unused imports, variables, or functions.
- Consolidating duplicate logic that has no architectural impact.
- Aligning minor style inconsistencies.

## Workflow

1. **Identification:** Identify the cleanup target (dead code, style drift).
2. **Execution:** Apply surgical changes.
3. **Verification:** Run tests and linters to ensure no behavior changed.

## Stop Conditions

- The change requires a behavior modification (use `kit-spec` instead).
- The cleanup target is too broad for a single surgical session.

## Core Rules

- **Surgical changes only.** Do not refactor adjacent code.
- **No behavior changes.**
- **Verify after cleanup.** Run tests to ensure no regressions.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "I'll just fix this logic while I'm cleaning up." | Cleanup should never change behavior. |

## Red Flags

- The change includes logic modifications.
- Unrelated files are touched during the cleanup.

## Verification

Before finalizing the cleanup, verify:
- Behavior remains identical.
- All tests pass.
- No new linting or type-checking errors were introduced.

## Output Rules

- Apply only the minimum changes needed for cleanup.
- Do not update feature artifacts.
