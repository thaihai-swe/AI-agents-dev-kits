# Contributor Guide

Thank you for wanting to extend the AI Agents Development Kit! This project thrives on standardized, high-quality engineering skills and templates.

---

## 🏗 What Can You Contribute?

1.  **Core Skills:** Refine existing `kit-*` skills or propose a new cross-cutting skill.
2.  **Reference Templates:** Improve the Markdown structures in `skills/*/references/`.
3.  **Example Fixtures:** Add new "golden" examples under `artifacts/examples/` to teach agents new patterns.
4.  **Adapters:** Improve or add new thin client entrypoints under `adapters/`.

---

## 🛠 Adding a New Skill

All skills must follow the **[Skill Anatomy](skill-anatomy.md)**.

1.  **Create the directory:** `skills/kit-<name>/`.
2.  **Author `SKILL.md`:** Follow the 10 required sections (Overview, When to Use, etc.).
3.  **Bundle References:** Put templates or checklists in `skills/kit-<name>/references/`.
4.  **Register:** Add the skill to the list in `README.md` and `docs/reference.md`.
5.  **Validate:** Run `bash scripts/check-kit-consistency.sh`.

### Skill Design Rules
*   **Idempotency:** A skill must be safe to run multiple times on the same artifact.
*   **Decoupled:** Skills should not know which AI client is running them.
*   **Surgical:** Skills should focus on one phase of the SDD lifecycle.

---

## 📝 Updating Templates

Templates live in `skills/*/references/`. 
*   When updating a template, ensure it is still "Agent-Friendly" (uses clear headers and bullet points).
*   Avoid conversational filler in templates.
*   **Verification:** Update any corresponding examples in `artifacts/examples/` to reflect the new template structure.

---

## 🧪 Adding Example Fixtures

Example fixtures are "golden" outputs that show agents what high-quality work looks like.

1.  Create a new folder in `artifacts/examples/<slug>/`.
2.  Populate it with a full set of artifacts (`analysis.md`, `spec.md`, `plan.md`, `tasks.md`, `review.md`).
3.  Ensure the artifacts follow the latest `kit-*` workflow.
4.  Update the consistency script (`scripts/check-kit-consistency.sh`) to include your new files in the `example_fixture_checks`.

---

## 🚦 Pull Request Process

1.  **Research First:** If you're proposing a major architectural change, open a Discussion first.
2.  **Surgical PRs:** Keep PRs focused. Don't mix a skill update with a documentation typo fix.
3.  **Consistency Check:** Your PR **must** pass `bash scripts/check-kit-consistency.sh`.
4.  **Documentation:** If you change a skill, you must update the corresponding docs in `docs/`.
