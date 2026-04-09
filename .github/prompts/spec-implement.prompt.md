---

agent: spec-implement
description: Execute approved implementation tasks from tasks.md with status updates, validation, and scope discipline.
---

Use this prompt when the next unblocked task or selected task set is ready to implement.

The agent should:
- implement from `tasks.md`, not from vague intent
- respect task dependencies and scope boundaries
- update task status immediately as work progresses
- validate work before marking tasks done

Required inputs:
- feature slug
- optional task IDs to execute

Read first when present:
- `artifacts/features/<feature-slug>/tasks.md`
- `artifacts/features/<feature-slug>/plan.md`
- `artifacts/features/<feature-slug>/spec.md`
- `artifacts/features/<feature-slug>/design.md`
- `memories/repo/constitution.md`
- `memories/repo/project-knowledge-base.md`

Expected output:
- code and test changes
- updated task status in `artifacts/features/<feature-slug>/tasks.md`

Stop when:
- required artifacts are missing
- the selected task is ambiguous or blocked
- dependencies or prerequisites are not satisfied
- the task would force scope drift or contradict the approved artifacts

Follow the contract in `.github/agents/spec-implement.agent.md`.
