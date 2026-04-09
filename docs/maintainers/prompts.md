# Prompts

## Purpose

Prompt files are the user-facing entry layer for Copilot.

## Relationship To Agents

- prompt files live in `.github/prompts/`
- agent contracts live in `.github/agents/`
- prompts should summarize invocation, inputs, outputs, and stop conditions
- agents should define the deeper behavior contract

## Prompt Design Rules

- keep prompts short and actionable
- point users to the right artifact path
- mention stop conditions explicitly
- do not duplicate the full agent file

## Source Of Truth

If prompt and agent wording drift, the agent contract wins.
