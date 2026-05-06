# Maintainer Guide

This guide is for the core maintainers of the AI Agents Development Kit. It covers repository health, consistency automation, and the release lifecycle.

---

## 🛡 Repository Health: The Consistency Loop

The "Source of Truth" for this kit is distributed across skills, docs, and adapters. To prevent drift, we use `scripts/check-kit-consistency.sh`.

### How it Works
The script uses a Python-based validator to enforce:
1.  **Structural Integrity:** Every `SKILL.md` must have the 10 required sections.
2.  **Link Safety:** All internal file links in skills and docs must resolve.
3.  **Command Alignment:** Command aliases in docs and adapters (e.g., `/kit-spec`) must match the allowed list.
4.  **Snippet Consistency:** Key paths and instructions must be identical across `README.md`, `docs/`, and `adapters/`.

**Rule:** Never merge a PR that fails the consistency check.

---

## 🚀 Release Lifecycle

### 1. Versioning the Constitution
The **Project Constitution** (`memories/repo/constitution.md`) is the highest-level law. 
*   Any change to a `kit-*` skill that alters the workflow "contract" requires a version bump in the Constitution.
*   Use Semantic Versioning (SemVer) for the Constitution.

### 2. The Release Checklist
Before tagging a release:
1.  Run `bash scripts/check-kit-consistency.sh`.
2.  Perform a **Dry Run** of the "First Feature Tutorial" in a clean directory.
3.  Ensure all `adapters/*.example.md` files point to the correct canonical paths.
4.  Verify that the `artifacts/examples/` still reflect the current skill outputs.

---

## 🏗 Bootstrap Logic

The `scripts/bootstrap-kit.sh` script is the first point of contact for new users.
*   **Purpose:** It scaffolds the `memories/repo/` and `artifacts/features/` folders.
*   **Constraint:** It **does not install** the skills. Users must copy/vendor the `skills/` folder manually.
*   **Stubs:** It creates a starter `AGENTS.md` ONLY if no other adapter exists.

When updating bootstrap logic:
*   Ensure it remains non-destructive (don't overwrite existing memory files).
*   Update the "Next Steps" output to reflect the current 7-Skill Model.

---

## 🤝 Community Governance

*   **Discussions:** Use GitHub Discussions for RFCs (Request for Comments) on new skills.
*   **Issues:** Track bugs and technical debt.
*   **Labels:** Use `breaking-change` for any PR that modifies an artifact schema or skill name.
