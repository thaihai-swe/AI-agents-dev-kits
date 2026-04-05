# FAQ

### Q: Do I need all 10 agents for every change?

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

### Q: When should I run `/analyze`?

Run it when:

- the repo is brownfield
- there is bug or behavior uncertainty
- planning depends on understanding existing code
- you suspect hidden constraints or risks

### Q: When is `/spec-design` necessary?

Use it when the feature changes interfaces, crosses subsystem boundaries, introduces migration or compatibility risk, or has multiple plausible technical approaches.

### Q: What is the difference between `constitution.md` and `project-knowledge-base.md`?

- `constitution.md` is for durable rules
- `project-knowledge-base.md` is for durable descriptive context

### Q: Can I go straight to `/spec-implement`?

Not safely for most non-trivial work. `spec-implement` assumes `spec.md`, `plan.md`, and `tasks.md` already exist and are usable.

### Q: What if the requirements review says the spec is not ready?

Go back to `/spec-requirement`, fix the gaps in `spec.md`, and run `/spec-review-requirements` again.

### Q: What if implementation reveals an upstream mistake?

Pause and fix the right artifact. Do not silently work around a bad spec, bad design, or weak plan.

### Q: Where did the old discovery and archive commands go?

They were part of the retired 13-agent model. In the current workflow:

- discovery is handled by `/analyze`
- durable architecture and pattern knowledge belongs in `/project-knowledge-base`
- durable rules belong in `/constitution`

### Q: Do I need a written `review.md` every time?

No. `spec-review` can return concise findings without creating a durable review artifact unless a written review is useful.

### Q: What is the safest default workflow?

```text
/analyze
/spec-requirement
/spec-review-requirements
/spec-design        (if needed)
/spec-plan
/spec-tasks
/spec-implement
/spec-review
```
