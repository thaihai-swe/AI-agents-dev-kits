# Reference

Quick lookup materials and reference guides for the AI Agents Development Kit.

## Quick Links

### Commands & Operations
- **[Commands](commands.md)** - All 10 commands with usage patterns and examples
- **[Workflow Scenarios](../workflows/README.md)** - Decision rules for different situations
- **[Agent Mapping](../agents/agent-mapping.md)** - How agents depend on each other

### Learning & Understanding
- **[Terminology](terminology.md)** - Definitions of key terms used throughout the framework
- **[FAQ](faq.md)** - Frequently asked questions and practical tips
- **[How It Works](../how%20it%20work.md)** - System architecture and philosophy

### Detailed Documentation
- **[Agents Reference](../agents/AGENTS-REFERENCE.md)** - Complete agent catalog with descriptions
- **[Agent Details](../agents/details/)** - Deep documentation for each agent category
- **[Memory System](../memory-system/README.md)** - How persistent memory works
- **[Quality Gates](../agents/details/quality-knowledge.md)** - Definition of Ready and Done

## How to Use This Section

| Looking For                     | Go To                                                   |
| ------------------------------- | ------------------------------------------------------- |
| What does a command do?         | [Commands](commands.md)                                 |
| What does a term mean?          | [Terminology](terminology.md)                           |
| I have a question               | [FAQ](faq.md)                                           |
| How do I choose a workflow?     | [Workflows](../workflows/README.md)                     |
| Complete agent description      | [Agents Reference](../agents/AGENTS-REFERENCE.md)       |
| How do agents connect?          | [Agent Mapping](../agents/agent-mapping.md)             |
| What's the system architecture? | [How It Works](../how%20it%20work.md)                   |
| Memory best practices           | [Memory System](../memory-system/README.md)             |
| Quality standards               | [Quality Gates](../agents/details/quality-knowledge.md) |

## Workflow Decision Tree

```
Is work:
├─ On a new repository?
│  └─ Use: /constitution + /project-knowledge-base
│     [Foundation & Setup](../agents/details/foundation-setup.md)
├─ An investigation of unclear systems?
│  └─ Use: /analyze
│     [Discovery & Learning](../agents/details/discovery-learning.md)
├─ Defining what to build?
│  └─ Use: /spec-requirement + /spec-review-requirements
│     [Specification & Design](../agents/details/specification-planning.md)
│     Clarification happens inside /spec-requirement before review
├─ Complex/risky that needs technical planning?
│  └─ Add: /spec-design
│     [When Design Is Required](../workflows/README.md#when-design-is-required)
├─ Ready to create execution strategy?
│  └─ Use: /spec-plan + /spec-tasks
│     [Planning & Delivery](../agents/details/specification-planning.md)
│     /spec-plan analyzes boundaries first; /spec-tasks checks taskability
├─ Time to build?
│  └─ Use: /spec-implement
│     [Implementation & Delivery](../agents/details/implementation-delivery.md)
└─ Need to verify completion?
   └─ Use: /spec-review
      [Quality Gates](../agents/details/quality-knowledge.md)
```

## Documentation by Category

### 🏗️ Foundation (Repository Setup)
- [Foundation & Setup guide](../agents/details/foundation-setup.md)
- Commands: `/constitution`, `/project-knowledge-base`

### 🔍 Discovery & Analysis (Understanding)
- [Discovery & Learning guide](../agents/details/discovery-learning.md)
- Command: `/analyze`

### 📋 Specification & Design (Definition)
- [Specification & Design guide](../agents/details/specification-planning.md)
- Commands: `/spec-requirement`, `/spec-review-requirements`, `/spec-design`

### 📊 Planning & Delivery (Execution Strategy)
- [Planning & Delivery found in Specification guide](../agents/details/specification-planning.md)
- Commands: `/spec-plan`, `/spec-tasks`

### 🛠️ Implementation & Quality (Execution & Verification)
- [Implementation & Delivery guide](../agents/details/implementation-delivery.md)
- Commands: `/spec-implement`, `/spec-review`

### ✅ Quality Gates (Consistency)
- [Quality Gates guide](../agents/details/quality-knowledge.md)
- Applies to all phases

## Related Resources

**Getting Started:** [Guides](../guides/)
**Workflow Examples:** [Workflow Example](../WORKFLOW-EXAMPLE.md)
**All Agents:** [Agents Reference](../agents/AGENTS-REFERENCE.md)
**Complete Navigation:** [Documentation Hub](../README.md)
