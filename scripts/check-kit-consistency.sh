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
    root / "skills/constitution/references/constitution-template.md",
    root / "skills/project-knowledge-base/references/project-knowledge-base-template.md",
    root / "skills/memory-promotion/references/decision-template.md",
    root / "skills/task-traceability-audit/references/audit-template.md",
    root / "artifacts/examples/README.md",
    root / "artifacts/examples/magic-link-login/analysis.md",
    root / "artifacts/examples/magic-link-login/spec.md",
    root / "artifacts/examples/magic-link-login/requirements-review.md",
    root / "artifacts/examples/magic-link-login/design.md",
    root / "artifacts/examples/magic-link-login/plan.md",
    root / "artifacts/examples/magic-link-login/tasks.md",
    root / "artifacts/examples/magic-link-login/review.md",
    root / "artifacts/examples/magic-link-login/testing-scenarios.md",
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
    "docs/integrations.md": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
        "artifacts/features/<slug>/",
    ],
    "docs/reference.md": [
        "/spec-review",
        "/memory-promotion",
        "/task-traceability-audit",
    ],
    "adapters/AGENTS.example.md": [
        "memories/repo/constitution.md",
        "memories/repo/project-knowledge-base.md",
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
    root / "adapters/AGENTS.example.md",
    root / "adapters/CLAUDE.example.md",
    root / "adapters/copilot-instructions.example.md",
    root / "docs/skill-anatomy.md",
]

allowed_commands = {
    "/constitution",
    "/project-knowledge-base",
    "/analyze",
    "/spec-requirement",
    "/spec-review-requirements",
    "/spec-design",
    "/spec-plan",
    "/spec-tasks",
    "/spec-implement",
    "/spec-review",
    "/spec-testing-scenarios",
    "/memory-promotion",
    "/task-traceability-audit",
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
