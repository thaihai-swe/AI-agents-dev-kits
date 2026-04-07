# Discovery And Learning

The Discovery & Analysis phase investigates unclear systems, risks, and constraints before committing to specification or implementation.

## When Discovery Is Needed

Use `/analyze` when:

- **System is unclear** — The current behavior, integration, or constraints are not well understood
- **Repo is brownfield** — Existing code bases with unclear patterns or hidden dependencies
- **Bug or regression** — Unexpected behavior needs investigation before a fix can be safely designed
- **Evidence before spec** — You need to understand current state before defining what should change
- **Options comparison** — Multiple viable technical approaches exist; you need to understand their feasibility
- **Risk reduction** — Integration or architectural concerns need clarification before planning
- **Feasibility assessment** — A feature idea needs validation against actual system constraints

## When Discovery Is NOT Needed

Skip `/analyze` when:
- Current system behavior is already well known
- The change is localized and low-risk
- Similar work was done recently and knowledge is current
- Investigation would duplicate recent discovery

## `/analyze` Agent

**Purpose:** Conduct a bounded, time-boxed investigation to answer specific questions about current systems, risks, and constraints.

**Process:**
1. Define scope - what specific questions need answering?
2. Investigate the actual codebase
3. Document findings in a bounded artifact
4. Surface risks and blockers
5. Recommend next steps

**Primary output:**
```text
artifacts/features/<slug>/analysis.md
```

**Typical sections in analysis.md:**
- Scope (what questions are we answering?)
- Current State (what IS true now?)
- Key Findings (what did we discover?)
- Risks and Unknowns (what could go wrong?)
- Brownfield Notes (gotchas or patterns observed)
- Technical Options (if multiple approaches exist)
- Recommendations (what should we do next?)
- Dependencies or Blockers (what prevents proceeding?)

## Analysis Discipline

### Good Analysis
✅ Grounded in evidence (quotes actual code)
✅ Time-boxed (clearly defines investigation scope)
✅ Surfaces risks early
✅ Recommends clear next steps
✅ Answers specific questions raised
✅ Preserved in artifact for future reference

### Poor Analysis
❌ Speculative (assumes without checking)
❌ Over-scoped (investigates everything)
❌ Buries findings (hard to extract decisions)
❌ Vague recommendations ("needs more study")
❌ Not connected to spec (analysis → ?)
❌ Lost in chat history (not saved)

## Workflow: Before vs After Analysis

```
Without Analysis (RISKY for brownfield):
/spec-requirement → /spec-review-requirements → /spec-design
(Knowledge gaps emerge during planning → requires rework)

With Analysis (SAFE for brownfield):
/analyze → /spec-requirement → /spec-review-requirements → /spec-design
(Knowledge is grounded before spec; planning is confident)
```

## Discovery Findings → Repo Memory

After `/analyze` completes, review findings:

- **Durable, repo-wide patterns?** → Add to `/project-knowledge-base`
- **New architectural constraints?** → Add to `/project-knowledge-base`
- **Changes to repo policy?** → Update `/constitution`
- **Feature-specific gotchas?** → Reference in `spec.md` or `plan.md`

**Don't promote** temporary findings or feature-specific decisions to repo memory. Keep that separate.

## When Analysis Reveals Blockers

If `/analyze` finds:
- Critical missing information → **Stop and investigate further** before proceeding
- Architectural conflict → **Need `/spec-design`** before planning
- Risk that requires mitigation → **Document in spec/plan** acceptance criteria or validation
- Integration infeasibility → **May need to pivot the feature**

**Don't proceed downstream** with unresolved discoveries.

## Important Shift From Older Model

Older docs split discovery into separate commands:
- `/discover` (exploration)
- `/architecture` capture (architecture decisions)
- `/archive` promotion (memory management)

The current model consolidates those:
- Exploration → Single bounded `/analyze` artifact
- Architecture learning → Goes into `/project-knowledge-base`
- Archive/history → Preserved by timestamping artifacts, no special promotion needed
