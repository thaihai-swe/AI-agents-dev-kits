#!/usr/bin/env bash

set -euo pipefail

mkdir -p skills memories/repo artifacts/features

if [[ ! -f AGENTS.md ]]; then
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
  echo "AGENTS.md already exists"
fi

echo "Ensured canonical folders:"
echo "- skills/"
echo "- memories/repo/"
echo "- artifacts/features/"
echo
echo "Next steps:"
echo "1. Run /constitution if durable repo rules do not exist yet"
echo "2. Run /project-knowledge-base if durable repo context does not exist yet"
echo "3. Start one real feature under artifacts/features/<slug>/"
