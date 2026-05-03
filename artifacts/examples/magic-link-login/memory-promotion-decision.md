# Memory Promotion Decision

## Metadata

- Feature or investigation slug: `magic-link-login`
- Source artifact: `artifacts/examples/magic-link-login/analysis.md`
- Reviewer: Maintainer example
- Date: 2026-05-01

## Candidate Finding

- Summary: Magic-link issuance, verification, and session creation share one auth service seam that should stay central rather than being duplicated in controllers or email adapters.
- Why it might matter again: Future auth changes will likely touch the same seam and need the same boundary knowledge.

## Evidence

- Repository evidence: The analysis and design fixtures both route issuance and verification through the auth service while keeping email delivery and session persistence as downstream concerns.
- Scope of evidence: Login request path, verification path, and session creation path.
- What is still uncertain: Whether a legacy admin-only sign-in endpoint still bypasses the normal auth service in production.

## Classification

- Decision: promote to `project-knowledge-base.md`
- Knowledge type: descriptive pattern
- Durability signal: The same service seam controls multiple auth paths and is likely to matter beyond this feature.

## Reason

- Why this destination fits: The finding is stable architectural context future auth work should reuse.
- Why the other destinations do not: It is not a repo-wide rule, and it is too reusable to stay trapped in one feature artifact.

## Follow-Up

- Owning next skill: `/project-knowledge-base`
- Concrete next action: Add one short auth-boundary note describing the service seam and the remaining uncertainty about the legacy admin endpoint.
