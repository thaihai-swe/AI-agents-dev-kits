# Visual Workflow

This diagram shows the artifact-first workflow, including foundation skills, helper skills, and the main backward loops.

```mermaid
flowchart TD
    Start([Request or change])

    Constitution[constitution]
    PKB[project-knowledge-base]
    Analyze[analyze]
    Spec[spec-requirement]
    ReqReview[spec-review-requirements]
    Design[spec-design]
    Plan[spec-plan]
    Tasks[spec-tasks]
    Audit[task-traceability-audit]
    Implement[spec-implement]
    Review[spec-review-implementation]
    Testing[spec-testing-scenarios]
    Promote[memory-promotion]
    Done([Ready to merge or hand off])

    Start --> Constitution
    Constitution --> PKB
    PKB --> Analyze
    PKB --> Spec
    Analyze --> Spec
    Spec --> ReqReview
    ReqReview -->|ready| Plan
    ReqReview -->|design needed| Design
    ReqReview -.->|not ready| Spec
    Design --> Plan
    Design -.-> Promote
    Plan --> Tasks
    Tasks -.-> Audit
    Audit -.->|gaps found| Tasks
    Tasks --> Implement
    Implement --> Review
    Implement -.-> Promote
    Review -->|approved| Testing
    Review -->|approved with follow-ups| Testing
    Review -.->|changes required| Implement
    Review -.->|task state or traceability issue| Tasks
    Review -.->|upstream artifact issue| Plan
    Testing --> Done
    Analyze -.-> Promote
    Review -.-> Promote

    classDef foundation fill:#eef6ff,stroke:#4a7bd1,color:#0f2547,stroke-width:1px;
    classDef workflow fill:#f3efff,stroke:#7b5cd6,color:#26174a,stroke-width:1px;
    classDef helper fill:#eefbf2,stroke:#2f8f5b,color:#163a22,stroke-width:1px;
    classDef outcome fill:#fff6e8,stroke:#c98a2b,color:#4f3306,stroke-width:1px;

    class Constitution,PKB foundation;
    class Analyze,Spec,ReqReview,Design,Plan,Tasks,Implement,Review,Testing workflow;
    class Audit,Promote helper;
    class Start,Done outcome;
```

## Reading The Diagram

- solid arrows show the normal forward path
- dotted arrows show helper usage or backward movement when the current stage is blocked
- `constitution` and `project-knowledge-base` are foundation skills, not per-feature middle steps
- `memory-promotion` can happen after analysis, design, implementation, or review when a finding becomes durable repo memory
- `task-traceability-audit` is a helper check around task quality, not a replacement for planning or implementation
