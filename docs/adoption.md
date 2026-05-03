# Adoption

## Outcome

By the end of adoption, a repository should have:

- `skills/`
- `memories/repo/`
- `artifacts/features/`
- one client entrypoint file such as `AGENTS.md` when the client needs one

## First File To Add

If your client uses a repo entrypoint file, add the matching runtime entrypoint first.

Keep it thin:

- point to `skills/` as the workflow source of truth
- point to `memories/repo/` and `artifacts/features/`
- tell the agent to choose the matching existing skill before freeform work
- tell the agent that completion claims require fresh verification evidence

Do not duplicate full skill bodies in the adapter.

For meaningful feature work, the adapter should push the agent toward this order:

1. read the entrypoint
2. choose the matching skill
3. read repo memory
4. read current feature artifacts
5. update one artifact or execute one bounded task

## Intended Discovery Path

The expected discovery sequence is:

1. read `AGENTS.md` or the equivalent adapter when present
2. choose the matching skill in `skills/`
3. read repo memory and current feature artifacts
4. execute one stage at a time
5. move backward when the current stage is blocked

## New Repository Adoption

Recommended order:

1. copy or vendor the kit so the target repository contains `skills/`
2. copy the matching adapter example from `adapters/` into the runtime entrypoint your client expects
3. run `scripts/bootstrap-kit.sh` to scaffold canonical folders and starter memory files
4. if no runtime entrypoint existed yet, keep or replace the thin `AGENTS.md` stub with the runtime-specific entrypoint you chose
5. review the starter `memories/repo/constitution.md` and `memories/repo/project-knowledge-base.md` files
6. run `/constitution`
7. run `/project-knowledge-base`
8. start one real feature

Checked-in adapter examples:

- `adapters/AGENTS.example.md`
- `adapters/CLAUDE.example.md`
- `adapters/copilot-instructions.example.md`
- `adapters/GEMINI.example.md`

## Existing Repository Adoption

Recommended order:

1. copy or vendor the kit so the target repository contains `skills/`
2. add the matching thin client adapter from `adapters/`
3. create `memories/repo/` and `artifacts/features/`, or run `scripts/bootstrap-kit.sh`
4. capture only minimal durable memory first
5. start with a small or well-understood feature
6. grow repo memory as durable knowledge emerges

Bootstrap is scaffolding only. It does not install the skill kit into another repository.

Use helper skills during adoption when needed:

- `/memory-promotion` to decide whether a discovery should become durable repo memory
- `/task-traceability-audit` to validate that task generation stays trustworthy during early adoption

## Integration Hand-Off

After the repository is bootstrapped:

1. make sure the client entrypoint is in place
2. verify the entrypoint points back to `skills/`
3. verify memory and artifact paths are canonical
4. run one bounded feature through the workflow

For client-specific details, use [Integrations](integrations.md).

## Downstream Update Pattern

When a downstream repository updates its vendored copy of this kit:

1. update `skills/`, scripts, docs you rely on, and the chosen adapter example together
2. keep downstream repo memory files project-specific instead of overwriting them with upstream starter text
3. rerun bootstrap only if canonical folders or starter files are genuinely missing
4. rerun the downstream dry run on one bounded feature before broad rollout

Do not mix kit-version updates with unrelated workflow customization.

## Good First Feature

Choose something that is:

- real
- bounded
- reviewable
- not a sweeping migration

Good candidates:

- a small product feature
- a bounded brownfield improvement
- a bug fix with clear reproduction

## Customization Rules

Safe customization:

- adapter wording
- repository-specific repo memory contents
- template wording and examples

Unsafe customization unless you also update the owning skills and docs:

- artifact names
- verdict names
- task status names
- command-to-skill mappings
- canonical memory locations

Safe packaging pattern:

- keep `skills/` intact
- adapt only entrypoint files and repo-specific memory contents

## Team And Multi-Agent Rule

When multiple people or agents work in the same repo:

- stabilize upstream artifacts first
- treat `spec.md`, `requirements-review.md`, `design.md`, `plan.md`, and `tasks.md` as shared truth
- serialize edits to shared planning artifacts
- parallelize only bounded implementation tasks with clear file boundaries
- assign one owner per parallel task batch
- avoid shared-write implementation batches when a simpler boundary exists
- do not mark tasks done without validation evidence
- use `/task-traceability-audit` when split ownership makes coverage less obvious
- reintegrate by re-running review and relevant validation after parallel work lands

## What To Avoid

- do not backfill every past feature into artifacts
- do not create competing memory systems outside `memories/repo/`
- do not teach different workflow orders to different clients unless invocation mechanics truly require it
- do not fork the workflow by changing templates only
