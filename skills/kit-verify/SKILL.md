---
name: kit-verify
description: Verify implemented work against the spec and plan. This skill handles implementation review, manual testing guides, and the Spec-Drift Guardian check.
compatibility: Designed for Claude, Codex, and other Agent Skills-compatible tools working in spec-driven repositories that use memories/repo/ and artifacts/features/<slug>/.
metadata:
  author: spec-driven-development-kit
---

# Kit Verify

## Overview

Use this skill to close the loop on a feature.

It handles:
1. **Implementation Review:** Auditing code and evidence against artifacts (`review.md`).
2. **Testing Scenarios:** Creating a manual guide for testers (`testing-scenarios.md`).
3. **Spec-Drift Guardian:** Ensuring the implementation still matches the `spec.md`.

## Read First

- `spec.md`, `plan.md`, `tasks.md`
- The delivered code and test output.
- `references/definition-of-done.md`

## When to Use

- Review delivered implementation against the feature artifacts.
- Audit traceability and validation quality.
- Create a manual testing guide after implementation.

## Workflow

1. **Drift Check:** Verify the implementation hasn't drifted from the approved spec. If it has, stop and return to `kit-spec`.
2. **Review:** Assess requirement coverage and validation quality. Create `review.md`.
3. **Scenarios:** Create `testing-scenarios.md` for human-run validation.

## Stop Conditions

- Required upstream artifacts are missing.
- Implementation has not actually been attempted.
- Validation evidence is too weak or stale.

## Core Rules

- **Evidence over Confidence:** Review fresh evidence, not just the diff.
- **Security Lens:** Always audit auth, permissions, and data handling.
- **Traceability:** Verify `REQ -> AC -> TASK -> validation` is intact.
- **Drift Detection:** If implementation materially diverged from artifacts, call it out.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "The diff looks right, so the review can be light." | Review is about evidence, not plausibility. |
| "Missing verification is just a paperwork issue." | Weak or stale evidence is a real review finding. |

## Red Flags

- The verdict depends on confidence instead of fresh evidence.
- Completed task state contradicts the available validation.

## Verification

Before finalizing the review, verify:
- Each finding points to evidence rather than intuition.
- Requirement coverage and validation quality were checked.
- Task-state accuracy was reviewed.

## Output Rules

- Update only `review.md` and `testing-scenarios.md`.
- Do not rewrite the spec or plan during review.
