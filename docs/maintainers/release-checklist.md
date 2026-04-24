# Release Checklist

## Purpose

Use this checklist before cutting a release of the kit itself.

The goal is not to invent more workflow. The goal is to prove that the shipped workflow is coherent, adoptable, and internally consistent.

## Release Gate

Do not release until all of these are true:

- the current skill set supports the intended workflow without adding sidecar instructions outside `skills/`
- guides, examples, templates, and references describe the same artifact model
- at least one realistic end-to-end feature example works as a release baseline
- the minimum adoption path is documented clearly enough for a new repository to follow

## 1. End-To-End Dry Run

Run one realistic feature through the full shipped flow:

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design        (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
/spec-testing-scenarios
```

Check:

- each step has a clear input artifact and output artifact
- each stop condition routes back to the correct upstream step
- no step depends on hidden maintainer knowledge not written in the kit
- the next step can proceed from the artifact quality produced by the prior one

Record any gap as one of:

- skill contract gap
- template gap
- documentation gap
- example gap

Fix the contract, not just the example.

## 2. Consistency Audit

Check these areas together:

- `skills/*/SKILL.md`
- `skills/*/references/*`
- `docs/reference/*`
- `docs/guides/*`
- `docs/examples/*`
- `README.md`

Verify:

- artifact names match everywhere
- command names match everywhere
- verdict names and task status names match everywhere
- each skill's stop conditions match the upstream/downstream docs
- examples do not describe behavior the skills do not require

If two files disagree, fix both the contract and the explanation if needed.

## 3. Adoption Check

A new user should be able to answer these questions quickly:

- what do I copy into a repository first?
- what folders must exist?
- what file should an agent read first?
- what is the shortest safe command sequence for a new feature?
- what should the agent do when the current phase is blocked?

Verify those answers are clear in:

- `README.md`
- `docs/guides/quick-start.md`
- `docs/guides/bootstrap-adoption.md`
- `docs/guides/client-integration.md`

## 4. Baseline Example Check

Make sure the docs include one concrete baseline example that shows:

- realistic feature scope
- expected artifact flow
- where optional steps are skipped vs required
- what good usage looks like in prompts
- what “done enough to hand off” looks like at each stage

The baseline example should be simple enough to follow but rich enough to exercise design, planning, tasks, implementation, review, and testing-scenario generation.

## 5. Scenario Coverage

Before release, verify the kit reads coherently for:

- a new feature
- a brownfield change
- a bug fix

You do not need a separate release process for each scenario, but the docs should not make any of them feel like a second-class path.

## 6. Maintainer Cleanup

Do one final prose pass for:

- duplicated instructions that drifted over time
- wording that now conflicts with another skill
- examples that imply more capabilities than the kit actually provides
- bloated explanation where a shorter rule would do

Release the sharpest small set of rules that still covers the workflow.

## 7. Release Notes Input

Summarize the release in three groups:

- workflow improvements
- documentation or onboarding improvements
- compatibility or adoption guidance changes

If a change altered expected behavior, name that directly instead of hiding it under “docs.”
