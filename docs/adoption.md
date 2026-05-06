# Adoption Guide

This guide covers how to bring the AI Agents Development Kit into your project, from individual use to full-team coordination.

---

## 🚀 Rollout Strategy

### 1. The "Solo" Pilot (Low Risk)
To install, copy or vendor the kit so the target repository contains `skills/`. Note that `bootstrap-kit.sh` does not install the skill kit.
*   **Goal:** Calibrate the skills to your project's specific language and patterns.
*   **Artifacts:** Keep the artifacts in a feature branch; don't merge them until the team is ready.

### 2. The "Team" Expansion (Medium Risk)
Introduce the kit to a small squad (3-5 people). 
*   **Goal:** Establish the **Project Constitution** and common **Task Boundaries**.
*   **Artifacts:** Merge artifacts into the `main` branch under `artifacts/features/` to create a shared project history.

### 3. Full Production (Standard)
Enforce the SDD workflow for all features and bug fixes.
*   **Goal:** Zero-drift between specs and code.
*   **Artifacts:** Use the artifacts as the primary input for code reviews.

---

## 🤝 Multi-Agent Coordination (The "No-Race" Rules)

When multiple AI agents work in the same repository, you must prevent "Context Collision."

1.  **Phase Locking:** Only one agent should edit the `spec.md` or `plan.md` at a time. Once a phase is "Locked" (e.g., Spec is ready), other agents can safely read it.
2.  **Task Ownership:** Assign specific Task IDs from `tasks.md` to different agents.
3.  **Branch Isolation:** Each agent should work in its own feature branch. Reintegrate into a shared feature branch only after `kit-verify` passes.
4.  **Shared Memory:** Always run `/kit-memory` to update the Knowledge Base after an agent discovers a new architectural pattern. This ensures other agents "learn" from the change instantly.

---

## 🏗 Adoption in Brownfield Projects

Adopting in a legacy codebase requires surgical focus.

*   **Don't Backfill:** Do not try to write specs for old code. Only write artifacts for the *new* changes you are making.
*   **The "Analysis First" Rule:** In brownfield, always start with `/kit-research`. Legacy code often has hidden side effects that must be documented in `analysis.md` before a spec can be authored.
*   **Gradual Memory:** Don't try to write a 10-page Knowledge Base on day one. Add one pattern at a time as you encounter them.

---

## 🛑 Common Adoption Pitfalls

*   **Pitfall:** "The overhead is too high for small fixes."
    *   **Solution:** Use the **Fast-Track Profile** (Skip `analysis.md` and `design.md`; go straight to `spec.md` -> `tasks.md`).
*   **Pitfall:** "Agents are ignoring the skills."
    *   **Solution:** Tighten your `AGENTS.md` adapter. Make the "Skill-First" rule the very first line.
*   **Pitfall:** "Artifacts are drifting from the code."
    *   **Solution:** Run `/kit-verify` as a mandatory CI gate or pre-commit hook.

---

## 🔍 Discovery & Debugging Path

When working in established projects, understanding the current state is the first step toward a safe change.

### 1. Understanding Existing Code
Use `/kit-research` to map subsystems or risky boundaries before proposing a change.
*   **Analysis Artifact:** Produces `analysis.md` which documents scope, current behavior, system maps, and risks.
*   **Promotion:** If a finding is durable (e.g., "all APIs use this specific auth middleware"), use `/kit-memory` to promote it to the **Knowledge Base**.

### 2. The Debugging Stance
The kit treats bugs as a discovery problem. **Understand the failure before proposing the repair.**
*   **The Goal of Research:** Prove the reported symptom, identify the expected behavior, and find the first boundary where they diverge.
*   **Evidence-Based Repair:** Only move to `/kit-spec` once the root-cause hypothesis is supported by evidence.
*   **Verification:** `/kit-verify` must explicitly prove the fix addresses the root cause rather than just masking the symptom.

### 3. Recommended Flow for Bugs
`kit-research` (Analyze) → `kit-spec` (Repair Scope) → `kit-plan` (Repair Path) → `kit-implement` → `kit-verify`.
*   *Tip:* Skip `kit-plan` only for very simple, obvious fixes.
