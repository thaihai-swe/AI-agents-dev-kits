# Prompts: Slash Commands & Agent References

This folder contains prompt files that activate specific agents. Each file is a simple agent reference.

## Workflow Prompts

| File                         | Agent            | Command    |
| ---------------------------- | ---------------- | ---------- |
| `spec-requirement.prompt.md` | spec-requirement | `/spec`    |
| `analyze.prompt.md`          | analyze          | `/analyze` |
| `spec-design.prompt.md`      | spec-design      | `/design`  |
| `spec-plan.prompt.md`        | spec-plan        | `/plan`    |
| `spec-tasks.prompt.md`       | spec-tasks       | `/tasks`   |
| `spec-review.prompt.md`      | spec-review      | `/review`  |

## Implementation Prompts

| File                                 | Agent                    | Command               |
| ------------------------------------ | ------------------------ | --------------------- |
| `spec-implement.prompt.md`           | spec-implement           | `/implement`          |
| `spec-review-requirements.prompt.md` | spec-review-requirements | `/requirement-review` |

## Foundation Prompts

| File                               | Agent                  | Command         |
| ---------------------------------- | ---------------------- | --------------- |
| `constitution.prompt.md`           | constitution           | `/constitution` |
| `project-knowledge-base.prompt.md` | project-knowledge-base | `/patterns`     |

## Discovery Prompts

| File                               | Agent                  | Command         |
| ---------------------------------- | ---------------------- | --------------- |
| `discover-legacy-system.prompt.md` | discover-legacy-system | `/discover`     |
| `capture-architecture.prompt.md`   | capture-architecture   | `/architecture` |
| `promote-to-repo-memory.prompt.md` | promote-to-repo-memory | `/archive`      |

## How to Use

Each file contains a single line that references its corresponding agent:

```
agent: 'agent-name'
```

When you use a slash command (e.g., `/spec`), Copilot loads the corresponding prompt file and invokes that agent.

## Adding New Prompts

1. Create `{name}.prompt.md` file
2. Add the line: `agent: 'agent-name'`
3. The agent will be available as a slash command

## More Information

- See `.github/agents/` for agent implementations
- See `.github/specs/templates/` for reusable templates
- See `.github/instructions/memory-bank/` for detailed guidance
