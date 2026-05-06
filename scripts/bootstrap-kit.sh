#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p skills memories/repo artifacts/features
has_runtime_entrypoint=false

if [[ -f AGENTS.md || -f CLAUDE.md || -f GEMINI.md || -f .github/copilot-instructions.md ]]; then
  has_runtime_entrypoint=true
fi

if [[ "$has_runtime_entrypoint" == false ]]; then
  cat > AGENTS.md <<'EOF'
# AGENTS.md

Read this file before working in this repository.

- `skills/` is the workflow source of truth
- use the matching existing skill before freeform work
- durable repo memory lives under `memories/repo/`
- current feature artifacts live under `artifacts/features/<slug>/`
- completion claims require fresh verification evidence
EOF
  echo "Created AGENTS.md"
else
  echo "Runtime entrypoint already exists; skipped AGENTS.md stub"
fi

if [[ ! -f memories/repo/constitution.md ]]; then
  cp "$ROOT_DIR/skills/kit-memory/references/constitution-template.md" memories/repo/constitution.md
  echo "Created memories/repo/constitution.md"
else
  echo "memories/repo/constitution.md already exists"
fi

if [[ ! -f memories/repo/project-knowledge-base.md ]]; then
  cp "$ROOT_DIR/skills/kit-memory/references/project-knowledge-base-template.md" memories/repo/project-knowledge-base.md
  echo "Created memories/repo/project-knowledge-base.md"
else
  echo "memories/repo/project-knowledge-base.md already exists"
fi

echo "Ensured canonical folders:"
echo "- skills/"
echo "- memories/repo/"
echo "- artifacts/features/"
echo
echo "This script scaffolds folders, starter memory files, and a thin AGENTS stub."
echo "It does not install the skill kit into another repository."
echo "It only creates AGENTS.md when no other supported runtime entrypoint exists."
echo
echo "Next steps:"
echo "1. Copy or vendor the kit so the target repository has the real skills under skills/"
echo "2. Review and refine memories/repo/constitution.md"
echo "3. Review and refine memories/repo/project-knowledge-base.md"
echo "4. Run /kit-memory when those starter files need durable project-specific content"
echo "5. Start one real feature under artifacts/features/<slug>/"
