# FAQ

### Q: Do I need every workflow skill for every change?

No. Small changes often use:

```text
/spec-requirement
/spec-review-requirements
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```

Use `/analyze` and `/spec-design` when the current system or technical approach is unclear.
Stay in `/spec-requirement` when the product intent itself is still ambiguous.

### Q: When should I run `/analyze`?

Run it when:
- the repo is brownfield
- there is bug or behavior uncertainty
- planning depends on understanding existing code
- you suspect hidden constraints or risks

### Q: What if the requirements review says the spec is not ready?

Go back to `/spec-requirement`, fix the gaps in `spec.md`, and run `/spec-review-requirements` again.

### Q: Where should clarification happen?

Inside `/spec-requirement`. That skill owns clarification during spec authoring. `spec-review-requirements` should stay a judge, not silently rewrite the spec.

### Q: Is `/spec-review` the same as `spec-review-implementation`?

Yes. `/spec-review` is the command-style workflow step, and `spec-review-implementation` is the portable skill that performs that review.

### Q: Can I go straight to `/spec-implement`?

Not safely for most non-trivial work. `spec-implement` assumes `spec.md`, `plan.md`, and `tasks.md` already exist and are usable.

### Q: Where do I learn the workflow?

Start with:
- [Overview](../explanation/overview.md)
- [Quick Start](../guides/quick-start.md)
- [Canonical Feature Example](../examples/canonical-feature.md)
