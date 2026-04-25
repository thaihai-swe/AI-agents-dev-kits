# Use Case Workflows

This page shows common entry paths through the kit.

## Repository Start Paths

```mermaid
flowchart LR
    Start([Choose repository situation])
    NewRepo[New project]
    ExistingRepo[Existing project]
    Constitution[constitution]
    PKB[project-knowledge-base]
    Analyze[analyze]
    FirstFeature[First bounded feature]

    Start --> NewRepo
    Start --> ExistingRepo

    NewRepo --> Constitution --> PKB --> FirstFeature
    ExistingRepo --> Analyze --> PKB
    ExistingRepo -.->|rules missing| Constitution
    PKB --> FirstFeature

    classDef start fill:#fff6e8,stroke:#c98a2b,color:#4f3306,stroke-width:1px;
    classDef flow fill:#eef6ff,stroke:#4a7bd1,color:#0f2547,stroke-width:1px;

    class Start,FirstFeature start;
    class NewRepo,ExistingRepo,Constitution,PKB,Analyze flow;
```

## Feature Delivery Paths

```mermaid
flowchart TD
    Feature([Choose change type])
    NewFeature[New feature]
    Brownfield[Brownfield feature]
    BugFix[Bug fix]
    TinyChange[Tiny change]

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

    Feature --> NewFeature --> Analyze
    Feature --> Brownfield --> Analyze
    Feature --> BugFix --> Analyze
    Feature --> TinyChange --> Spec

    Analyze --> Spec
    Spec --> ReqReview
    ReqReview -->|ready| Plan
    ReqReview -->|design needed| Design
    ReqReview -.->|not ready| Spec
    Design --> Plan
    Plan --> Tasks
    Tasks -.-> Audit
    Audit -.->|gaps found| Tasks
    Tasks --> Implement
    Implement --> Review
    Review -.->|changes required| Implement
    Review -.->|upstream issue| Plan
    Review --> Testing
    Analyze -.-> Promote
    Review -.-> Promote
    Design -.-> Promote

    classDef start fill:#fff6e8,stroke:#c98a2b,color:#4f3306,stroke-width:1px;
    classDef workflow fill:#f3efff,stroke:#7b5cd6,color:#26174a,stroke-width:1px;
    classDef helper fill:#eefbf2,stroke:#2f8f5b,color:#163a22,stroke-width:1px;

    class Feature,NewFeature,Brownfield,BugFix,TinyChange start;
    class Analyze,Spec,ReqReview,Design,Plan,Tasks,Implement,Review,Testing workflow;
    class Audit,Promote helper;
```

## Quick Reading Guide

- use the first diagram when deciding how to bootstrap the kit in a repository
- use the second diagram when deciding how much workflow a specific change needs
- `memory-promotion` appears only when a local finding becomes durable repo knowledge
- `task-traceability-audit` is a quality check around task decomposition, not a mandatory step for every tiny change
