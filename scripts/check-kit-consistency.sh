#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

python3 - "$ROOT_DIR" <<'PY'
from pathlib import Path
import re
import sys

root = Path(sys.argv[1])
errors: list[str] = []

required_sections = [
    "Overview",
    "When to Use",
    "Read First",
    "Workflow",
    "Stop Conditions",
    "Core Rules",
    "Common Rationalizations",
    "Red Flags",
    "Verification",
    "Output Rules",
]

required_files = [
    root / "memories/repo/constitution.md",
    root / "memories/repo/project-knowledge-base.md",
    root / "docs/skill-anatomy.md",
    root / "adapters/GEMINI.example.md",
    root / "skills/kit-memory/references/constitution-template.md",
    root / "skills/kit-memory/references/project-knowledge-base-template.md",
    root / "skills/kit-memory/references/decision-template.md",
    root / "skills/kit-memory/references/example-decision.md",
    root / "skills/kit-plan/references/audit-template.md",
    root / "skills/kit-plan/references/example-audit.md",
    root / "skills/kit-research/references/debugging-checklist.md",
    root / "artifacts/examples/README.md",
    root / "artifacts/examples/magic-link-login/analysis.md",
    root / "artifacts/examples/magic-link-login/spec.md",
    root / "artifacts/examples/magic-link-login/requirements-review.md",
    root / "artifacts/examples/magic-link-login/design.md",
    root / "artifacts/examples/magic-link-login/plan.md",
    root / "artifacts/examples/magic-link-login/tasks.md",
    root / "artifacts/examples/magic-link-login/review.md",
    root / "artifacts/examples/magic-link-login/testing-scenarios.md",
    root / "artifacts/examples/magic-link-login/memory-promotion-decision.md",
    root / "artifacts/examples/magic-link-login/traceability-audit.md",
    root / "artifacts/examples/auth-timeout-bug/analysis.md",
    root / "artifacts/examples/auth-timeout-bug/spec.md",
    root / "artifacts/examples/auth-timeout-bug/plan.md",
    root / "artifacts/examples/auth-timeout-bug/tasks.md",
    root / "artifacts/examples/auth-timeout-bug/review.md",
    root / "artifacts/examples/legacy-account-audit-event/analysis.md",
    root / "artifacts/examples/legacy-account-audit-event/spec.md",
    root / "artifacts/examples/legacy-account-audit-event/design.md",
    root / "artifacts/examples/legacy-account-audit-event/plan.md",
    root / "artifacts/examples/legacy-account-audit-event/tasks.md",
    root / "artifacts/examples/cleanup-unused-exports/report.md",
    root / "artifacts/examples/cleanup-unused-exports/validation-notes.md",
]

for path in required_files:
    if not path.exists():
        errors.append(f"missing required file: {path.relative_to(root)}")

for skill_path in sorted((root / "skills").glob("*/SKILL.md")):
    text = skill_path.read_text()
    for section in required_sections:
        if not re.search(rf"^## {re.escape(section)}\s*$", text, re.MULTILINE):
            errors.append(f"{skill_path.relative_to(root)} missing section: {section}")

    for rel_target in re.findall(r"\]\(([^)]+)\)", text):
        if "://" in rel_target or rel_target.startswith("#"):
            continue
        target = (skill_path.parent / rel_target).resolve()
        if not target.exists():
            errors.append(
                f"{skill_path.relative_to(root)} references missing file: {rel_target}"
            )

canonical_checks = {
    "README.md": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
        "artifacts/features/<slug>/",
    ],
    "docs/getting-started.md": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
        "scripts/bootstrap-kit.sh",
    ],
    "docs/supported-agents.md": [
        "adapters/AGENTS.example.md",
        "adapters/CLAUDE.example.md",
        "adapters/copilot-instructions.example.md",
        "adapters/GEMINI.example.md",
    ],
    "docs/integrations.md": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
        "artifacts/features/<slug>/",
        "adapters/GEMINI.example.md",
    ],
    "docs/reference.md": [
        "/kit-verify",
        "/kit-memory",
        "/kit-plan",
    ],
    "adapters/AGENTS.example.md": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
    ],
    "adapters/CLAUDE.example.md": [
        "skills/",
        "memories/repo/",
        "artifacts/features/<slug>/",
    ],
    "adapters/copilot-instructions.example.md": [
        "skills/",
        "memories/repo/",
        "artifacts/features/<slug>/",
    ],
    "adapters/GEMINI.example.md": [
        "skills/",
        "memories/repo/",
        "artifacts/features/<slug>/",
    ],
    "scripts/bootstrap-kit.sh": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
        "does not install the skill kit",
    ],
}

for rel_path, snippets in canonical_checks.items():
    text = (root / rel_path).read_text()
    for snippet in snippets:
        if snippet not in text:
            errors.append(f"{rel_path} missing canonical snippet: {snippet}")

packaging_and_bootstrap_checks = {
    "README.md": [
        r"copy or vendor",
        r"does not copy `skills/`",
    ],
    "docs/getting-started.md": [
        r"copy .*`skills/`",
        r"does not install skills",
    ],
    "docs/adoption.md": [
        r"copy or vendor the kit",
        r"does not install the skill kit",
    ],
    "docs/integrations.md": [
        r"copied or vendored",
        r"does not install `skills/`",
    ],
    "docs/reference.md": [
        r"does not install `skills/`",
    ],
}

for rel_path, patterns in packaging_and_bootstrap_checks.items():
    text = (root / rel_path).read_text()
    for pattern in patterns:
        if not re.search(pattern, text, re.IGNORECASE):
            errors.append(
                f"{rel_path} missing packaging/bootstrap guidance matching: {pattern}"
            )

placeholder_checks = {
    "memories/repo/constitution.md": [
        r"Last updated: YYYY-MM-DD",
        r"^- CC-001 Principle:$",
        r"^- repositories, services, or packages in scope$",
        r"^- who should follow these rules$",
    ],
    "memories/repo/project-knowledge-base.md": [
        r"^- Domain or concern:$",
        r"Confidence: High \| Medium \| Low",
        r"Provenance: Observed in repo \| Team convention",
        r"^- What belongs here:$",
    ],
}

for rel_path, patterns in placeholder_checks.items():
    text = (root / rel_path).read_text()
    for pattern in patterns:
        if re.search(pattern, text, re.MULTILINE):
            errors.append(f"{rel_path} still contains starter placeholder pattern: {pattern}")

example_fixture_checks = {
    "artifacts/examples/magic-link-login/analysis.md": [
        "## Scope",
        "## Findings",
        "## Recommendation",
    ],
    "artifacts/examples/magic-link-login/spec.md": [
        "## Functional Requirements",
        "### REQ-001",
        "## Acceptance Criteria",
        "AC-001",
    ],
    "artifacts/examples/magic-link-login/requirements-review.md": [
        "Verdict:",
        "## Blocking Issues",
        "## Recommendation",
    ],
    "artifacts/examples/magic-link-login/design.md": [
        "## Proposed Architecture",
        "## Design Decisions And Tradeoffs",
    ],
    "artifacts/examples/magic-link-login/plan.md": [
        "## Implementation Phases",
        "## Traceability Matrix",
    ],
    "artifacts/examples/magic-link-login/tasks.md": [
        "Status: Not Started",
        "Linked requirement(s):",
        "Validation note:",
    ],
    "artifacts/examples/magic-link-login/review.md": [
        "Verdict:",
        "## Evidence Checked",
        "## Recommendation",
    ],
    "artifacts/examples/magic-link-login/testing-scenarios.md": [
        "## Scenario Matrix",
        "## Happy Path Scenarios",
        "## Regression Checks",
    ],
    "artifacts/examples/magic-link-login/memory-promotion-decision.md": [
        "## Candidate Finding",
        "## Classification",
        "Decision: promote to `project-knowledge-base.md`",
    ],
    "artifacts/examples/magic-link-login/traceability-audit.md": [
        "## Coverage Summary",
        "Overall status: partial",
        "## Gaps",
    ],
    "artifacts/examples/auth-timeout-bug/analysis.md": [
        "## Scope",
        "## Findings",
        "## Recommendation",
    ],
    "artifacts/examples/auth-timeout-bug/spec.md": [
        "### REQ-001",
        "## Acceptance Criteria",
    ],
    "artifacts/examples/auth-timeout-bug/tasks.md": [
        "Status: Not Started",
        "Validation note:",
    ],
    "artifacts/examples/auth-timeout-bug/review.md": [
        "Verdict:",
        "## Evidence Checked",
    ],
    "artifacts/examples/legacy-account-audit-event/analysis.md": [
        "## Findings",
        "## Recommendation",
    ],
    "artifacts/examples/legacy-account-audit-event/design.md": [
        "## Proposed Architecture",
        "## Brownfield Integration Notes",
    ],
    "artifacts/examples/legacy-account-audit-event/tasks.md": [
        "Status: Not Started",
        "Validation note:",
    ],
    "artifacts/examples/cleanup-unused-exports/report.md": [
        "## Candidate Classification",
        "## Recommended Action",
        "## Validation",
    ],
    "artifacts/examples/cleanup-unused-exports/validation-notes.md": [
        "## Removed In First Safe Batch",
        "## Retained Pending Stronger Proof",
    ],
}

for rel_path, snippets in example_fixture_checks.items():
    text = (root / rel_path).read_text()
    for snippet in snippets:
        if snippet not in text:
            errors.append(f"{rel_path} missing example fixture snippet: {snippet}")

command_sources = [
    root / "README.md",
    root / "AGENTS.md",
    root / "docs/getting-started.md",
    root / "docs/workflow.md",
    root / "docs/reference.md",
    root / "docs/examples.md",
    root / "docs/integrations.md",
    root / "docs/supported-agents.md",
    root / "adapters/AGENTS.example.md",
    root / "adapters/CLAUDE.example.md",
    root / "adapters/copilot-instructions.example.md",
    root / "adapters/GEMINI.example.md",
    root / "docs/skill-anatomy.md",
]

allowed_commands = {
    "/kit-memory",
    "/kit-research",
    "/kit-spec",
    "/kit-plan",
    "/kit-implement",
    "/kit-verify",
    "/kit-cleanup",
}

for path in command_sources:
    text = path.read_text()
    for command in re.findall(r"(?<![A-Za-z0-9_.-])(/[a-z][a-z-]*)(?=\s|`|$)", text):
        if command not in allowed_commands:
            errors.append(
                f"{path.relative_to(root)} contains undocumented or invalid command: {command}"
            )

if errors:
    for err in errors:
        print(f"ERROR: {err}")
    sys.exit(1)

print("Kit consistency checks passed.")
PY
