# Adapter Examples

These are thin entrypoint examples for common agent runtimes.

Use them as patterns, not as a second workflow source of truth.

Rules:

- point the agent back to `skills/`
- point the agent to `memories/repo/` and `artifacts/features/`
- tell the agent to choose the matching skill before freeform work
- keep completion claims tied to fresh verification evidence
- do not duplicate full skill bodies into the adapter

Included examples:

- `AGENTS.example.md`
- `CLAUDE.example.md`
- `copilot-instructions.example.md`
