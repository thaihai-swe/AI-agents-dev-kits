# Technical Reference

This page provides a searchable directory of commands, artifacts, and standards used in the AI Agents Development Kit.

---

## 🛠 Commands & Aliases

| Command | Internal Skill | Primary Artifact | Purpose |
| :--- | :--- | :--- | :--- |
| **`/kit-memory`** | `kit-memory` | `constitution.md` | Manage durable rules and facts. |
| **`/kit-research`** | `kit-research` | `analysis.md` | Investigate current behavior or bugs. |
| **`/kit-spec`** | `kit-spec` | `spec.md` | Define What & Why (Socratic Wave). |
| **`/kit-adr`** | `kit-adr` | `adr-log.md` | Record architectural decisions and trade-offs. |
| **`/kit-plan`** | `kit-plan` | `tasks.md` | Design approach and task breakdown. |
| **`/kit-implement`** | `kit-implement` | N/A | Surgical coding and validation. |
| **`/kit-verify`** | `kit-verify` | `review.md` | Implementation audit and drift check. |
| **`/kit-cleanup`** | `kit-cleanup` | N/A | Surgical refactoring and debt removal. |

---

## 📄 Artifact Schemas

| Artifact | Location | Ownership | Role |
| :--- | :--- | :--- | :--- |
| **`constitution.md`** | `memories/repo/` | `kit-memory` | Normative rules and guardrails. |
| **`project-knowledge-base.md`** | `memories/repo/` | `kit-memory` | Descriptive architecture and patterns. |
| **`adr-log.md`** | `memories/repo/` | `kit-adr` | Central log of all architecture decisions. |
| **`analysis.md`** | `artifacts/features/<slug>/` | `kit-research` | Discovery findings. |
| **`spec.md`** | `artifacts/features/<slug>/` | `kit-spec` | Functional requirements (Source of Truth). |
| **`design.md`** | `artifacts/features/<slug>/` | `kit-plan` | Technical architecture decisions. |
| **`plan.md`** | `artifacts/features/<slug>/` | `kit-plan` | Staged implementation strategy. |
| **`tasks.md`** | `artifacts/features/<slug>/` | `kit-plan` | Atomic, traceable work units. |
| **`review.md`** | `artifacts/features/<slug>/` | `kit-verify` | Verification evidence and audit findings. |

---

## 🚦 State & Verdict Names

### Task Status (`tasks.md`)
*   `Not Started`: Default state.
*   `In Progress`: Actively being implemented.
*   `Blocked`: Dependent on another task or external input.
*   `Done`: Code written, tests passed, evidence provided.

### Review Verdicts (`review.md`)
*   `Approved`: Implementation fully meets artifacts.
*   `Changes Required`: Significant drift or failing validation.

### Requirements Verdicts (`requirements-review.md`)
*   `Ready`: Spec is complete and testable.
*   `Not Ready`: Ambiguity remains; iterate on `spec.md`.

---

## 🤖 Agent Capability Matrix

The kit is adapter-driven. Each environment uses a thin entrypoint pointing back to the core logic in `skills/`.

| Client | Discovery Path | Optimized For |
| :--- | :--- | :--- |
| **Gemini CLI** | `GEMINI.md` | Large context windows & native tool-calling. |
| **Claude Code** | `CLAUDE.md` | Command-line execution & sub-agent orchestration. |
| **Cursor** | `.cursorrules` | Real-time code indexing & `@artifact` referencing. |
| **GitHub Copilot** | `.github/instructions.md` | IDE-integrated chat and file-anchored context. |

---

## 🏛 Skill Anatomy Standard

To maintain high agentic reliability, every `SKILL.md` must follow this 10-section structure:

1.  **Overview**: Boundary and non-goals.
2.  **When to Use**: Trigger conditions and routing.
3.  **Read First**: Mandatory context paths.
4.  **Workflow**: Ordered, imperative steps.
5.  **Stop Conditions**: Escalation gates.
6.  **Core Rules**: Non-negotiable constraints.
7.  **Common Rationalizations**: Prevention of anti-patterns.
8.  **Red Flags**: Observable signs of failure.
9.  **Verification**: Evidence-based completion criteria.
10. **Output Rules**: File mutation boundaries.

---

## 🏗 Directory Structure

```text
/
├── AGENTS.md           # Client Adapter
├── skills/             # Core Logic (The "Contracts")
│   └── kit-<name>/
│       ├── SKILL.md
│       └── references/ # Templates
├── memories/repo/      # Durable Global Memory
├── artifacts/          # Feature-Specific State
│   ├── features/
│   │   └── <slug>/     # Active Work
│   └── examples/       # Golden Fixtures
└── docs/               # Technical Documentation
```
