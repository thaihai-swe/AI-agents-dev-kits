# First Feature Tutorial

This tutorial will guide you through building your first feature using the 7-Skill workflow. We will build a simple "Weather CLI" to demonstrate the **Spec-Anchored** process.

---

## Prerequisites
1.  A repository with the kit installed (`skills/` folder present).
2.  `scripts/bootstrap-kit.sh` has been run.
3.  An AI agent (e.g., Gemini CLI, Claude Code, or Cursor) ready.

---

## Step 1: Research & Discovery
If you don't know how to start, begin with research.
> **Prompt:** "Run /kit-research to investigate how to build a basic CLI in this repo's language."

**Outcome:** The agent creates `artifacts/features/weather-cli/analysis.md` with findings about libraries (e.g., `commander` or `argparse`).

---

## Step 2: The Socratic Spec
Now we define the "What & Why."
> **Prompt:** "Run /kit-spec for the feature 'weather-cli'. Ask me 5 clarifying questions before drafting the spec."

**The Socratic Wave:**
The agent asks:
1. "Which weather API should we use?"
2. "Should it support Celsius, Fahrenheit, or both?"
... (and so on)

**Outcome:** Once you answer, the agent writes `spec.md` and `requirements-review.md`.

---

## Step 3: Engineering the Plan
Now we define the "How."
> **Prompt:** "Run /kit-plan. Break the work into 4 atomic tasks."

**Outcome:** The agent writes `design.md`, `plan.md`, and `tasks.md`. It also performs **Automated Traceability** to ensure every requirement is covered.

---

## Step 4: Surgical Implementation
We execute the tasks one by one.
> **Prompt:** "Run /kit-implement for Task ID 1."

**The Loop:**
1. Agent marks Task 1 as `In Progress`.
2. Agent writes the code.
3. Agent runs a test.
4. Agent marks Task 1 as `Done`.

---

## Step 5: The Drift Guardian (Verify)
Finally, we close the loop.
> **Prompt:** "Run /kit-verify. Check for any Spec-Drift."

**The Verification:**
The agent compares the code against the `spec.md`. If you added an extra feature (like "Weather Forecast") that wasn't in the spec, the **Drift Guardian** will catch it and ask you to either remove the code or update the spec.

**Outcome:** `review.md` is generated with an `Approved` verdict.

---

## 🎉 Congratulations!
You've just delivered a feature using a professional, spec-driven engineering workflow.
