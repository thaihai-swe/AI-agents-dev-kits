# Plan: Documentation Consolidation

To reduce clutter and improve signal-to-noise ratio, we will consolidate the 15+ files in `docs/` into 8 authoritative guides.

## 1. The Target Structure (Diátaxis)

| Category | Authority File | Files to Merge/Delete |
| :--- | :--- | :--- |
| **Tutorials** | `getting-started.md` | `first-feature.md` (keep for now), delete older onboarding notes. |
| **How-to** | `adoption.md` | Merge `understanding-existing-code.md` and `debugging.md`. |
| **How-to** | `integrations.md` | Keep as-is (already updated). |
| **How-to** | `contributing.md` | Keep as-is (already updated). |
| **Explanation** | **`workflow.md` (Consolidated)** | Merge `visual-workflow.md`, `use-case-workflows.md`, and `examples.md`. |
| **Explanation** | `architecture.md` | Merge `design-principles.md`. |
| **Explanation** | `memory.md` | Already rebuilt (high signal). |
| **Reference** | `reference.md` | Merge `supported-agents.md` and `skill-anatomy.md`. |
| **Reference** | `maintainers.md` | Keep as-is (already updated). |

---

## 2. Execution Steps

### Milestone 1: The "Everything Workflow" Guide
*   **Target:** `docs/workflow.md`
*   **Content:** Mermaid diagram + Phase descriptions + Use-case loops.
*   **Cleanup:** Delete `visual-workflow.md` and `use-case-workflows.md`.

### Milestone 2: The "Technical Authority" Reference
*   **Target:** `docs/reference.md`
*   **Content:** Commands + Artifacts + Verdicts + Agent Capability Matrix + Skill Anatomy.
*   **Cleanup:** Delete `supported-agents.md` and `skill-anatomy.md`.

### Milestone 3: The "Engineering Deep Dive"
*   **Target:** `docs/architecture.md`
*   **Content:** Three-layer model + Design Principles (Artifact-First, Surgicality).
*   **Cleanup:** Delete `design-principles.md`.

### Milestone 4: The "Feature Lifecycle" Guide
*   **Target:** `docs/adoption.md`
*   **Content:** Rollout strategy + Multi-agent rules + Discovery & Debugging path.
*   **Cleanup:** Delete `understanding-existing-code.md` and `debugging.md`.

---

**Outcome:** `docs/` will be reduced from 15 files to 9 clear, high-signal documents.
