# Terminology

## Agent

A workflow contract stored in `.github/agents/*.agent.md`.

## Prompt

A user-facing invocation file stored in `.github/prompts/*.prompt.md`.

## Repo Memory

Durable shared context stored under `memories/repo/`.

## Constitution

The normative repo-memory file. It stores durable rules and guardrails.

## Project Knowledge Base

The descriptive repo-memory file. It stores durable architecture and integration context.

## Feature Artifact

A per-feature document under `artifacts/features/<slug>/`.

## Specification

The statement of what should change and why, including clarification outcomes and any remaining non-blocking open questions. Stored as `spec.md`.

## Requirements Review

The readiness judgment for the spec. Stored as `requirements-review.md`.

## Design

Technical clarification used when planning depends on it. Stored as `design.md`.

## Plan

The execution strategy for a feature. It covers pre-plan analysis, sequencing, dependencies, validation, protected behavior, and risk handling. Stored as `plan.md`.

## Tasks

The bounded execution units derived from the plan, with explicit validation and traceability coverage. Stored as `tasks.md`.

## Review

The implementation verification step that checks delivered work against approved artifacts.

## Taskability

The quality of a plan being decomposable into bounded, reviewable, validation-backed tasks without forcing the implementer to invent missing strategy.
