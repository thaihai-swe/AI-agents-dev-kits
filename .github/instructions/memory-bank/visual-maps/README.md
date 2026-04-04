# Visual Mode Maps: Your Workflow Guide

Welcome! These visual flowcharts show how to navigate through feature development using mode-based workflows.

---

## Quick Navigation

### 🤔 "I don't know what to do"
→ Start here: **[mode-discovery.md](mode-discovery.md)**

This flowchart helps you choose which mode to enter based on what you're working on.

---

## The 5 Modes

### 1. 🔍 [ANALYZE Mode](workflow-analyze.md)
**When**: You need to investigate, research, or understand a problem

**Duration**: 30 min to 2 hours

**What happens**:
- Systematic investigation into problem/bug/requirement
- 4-phase process: DISCOVER → ANALYZE → SYNTHESIZE → DOCUMENT
- Creates analysis document in `artifacts/analytics/`

**Next step**: Usually REQUIREMENT or PLAN mode

**Use if**:
- ✅ Bug needs root cause investigation
- ✅ Requirements are vague
- ✅ Need to research alternatives
- ✅ Exploring new ideas

---

### 2. 🎨 [DESIGN Mode](workflow-design.md)
**When**: You have approved spec and need design decisions

**Duration**: 1-8 hours (depends on complexity)

**What happens**:
- Explore 2-4 design options per component
- Analyze trade-offs and pros/cons
- Document recommended decisions
- Creates `design.md`

**Next step**: PLAN mode

**Use if**:
- ✅ Complex feature with architectural choices
- ✅ Want to see multiple design approaches
- ✅ Team needs to align on approach

---

### 3. 📊 [PLAN Mode](workflow-plan.md)
**When**: Spec approved, ready to plan how to build it

**Duration**: 1-2 hours

**What happens**:
- Create implementation strategy
- Break down into phases (if complex)
- Map dependencies
- Identify risks
- Creates `plan.md`

**Next step**: TASKS mode

**Use if**:
- ✅ Ready to break work into pieces
- ✅ Need to understand sequencing
- ✅ Planning for team handoff

---

### 4. ⚒️ [IMPLEMENT Mode](workflow-implement.md)
**When**: Tasks defined, ready to code

**Duration**: 4 hours to 2+ weeks (varies)

**What happens**:
- Write code following plan
- Maintain test coverage
- Verify acceptance criteria
- Creates working feature

**Next step**: REFLECT mode

**Use if**:
- ✅ All decisions made
- ✅ Tasks defined
- ✅ Ready to write code

---

### 5. 🤔 [REFLECT Mode](workflow-reflect.md)
**When**: Feature complete, tests passing

**Duration**: 30-60 minutes (reflection) + 15 min (archiving)

**What happens**:
- Review what went well
- Document challenges and lessons
- Create reflection document
- Archive feature and knowledge
- Creates `reflection.md` + archive

**Next step**: Back to mode-discovery for next feature

**Use if**:
- ✅ Feature complete and tested
- ✅ Want to capture lessons
- ✅ Ready to close out work

---

## Complexity Levels

All modes adapt based on complexity:

| Level | Type                | Time       | Mode Depth    |
| ----- | ------------------- | ---------- | ------------- |
| **1** | Quick fix           | 1-4 hrs    | Minimal       |
| **2** | Simple enhancement  | 4-12 hrs   | Basic         |
| **3** | Complex feature     | 2-5 days   | Comprehensive |
| **4** | System/architecture | 1-4+ weeks | Deep          |

---

## Choose Your Path

### "I have a bug to fix"
```
mode-discovery (Choose ANALYZE)
  ↓
workflow-analyze (Investigate)
  ↓
workflow-plan (Quick plan)
  ↓
workflow-implement (Code fix)
  ↓
workflow-reflect (Quick retrospective)
```

### "I have a feature request"
```
mode-discovery (Choose REQUIREMENT/DESIGN)
  ↓
(Write spec - not shown in flowcharts)
  ↓
workflow-design (Plan approach)
  ↓
workflow-plan (Architecture + sequencing)
  ↓
workflow-implement (Build it)
  ↓
workflow-reflect (Learn from it)
```

### "I'm ready to code but don't have a plan"
```
mode-discovery (Choose PLAN)
  ↓
workflow-plan (Create plan)
  ↓
(Break into tasks)
  ↓
workflow-implement (Code)
  ↓
workflow-reflect (Retrospective)
```

---

## Quick Reference: When to Skip Modes

### Skip ANALYZE if:
- ❌ Bug is obvious and reproducible
- ❌ Clear what to build
- ❌ Time-critical

### Skip DESIGN if:
- ❌ Feature is simple
- ❌ Design is obvious
- ❌ Established patterns apply

### Skip PLAN if:
- ❌ Single file change
- ❌ Obvious implementation order
- ❌ Very simple fix

### Never Skip IMPLEMENT

### Never Skip REFLECT
(Or at least do quick 15-min version)

---

## Reading the Flowcharts

### Flow Elements

```
[Rectangle] = Action or state
           ↓
        (Diamond) = Decision point
        Yes ↙ ↘ No
      Diamond   Diamond = Options
```

### Using Mermaid Diagrams

Each flowchart is a Mermaid diagram showing:
- **Entry point** (Start node)
- **Process steps** (What you do)
- **Decision points** (Where you choose)
- **Validation gates** (Quality checkpoints)
- **Exit point** (Next mode)

---

## How This Kit Works

### Your Workflow

```
Start new feature
     ↓
mode-discovery.md ← "What am I working on?"
     ↓
Choose appropriate mode(s)
     ↓
workflow-X.md ← Follow the flowchart
     ↓
Execute mode (using agents)
     ↓
Next mode
     ↓
Repeat until complete
```

### Key Principles

1. **Visual guidance**: Each mode has a flowchart showing exact steps
2. **Adaptive**: Modes adjust based on complexity level
3. **Traceable**: Every step connects to deliverables
4. **Reflective**: Always end with retrospective
5. **Documented**: Archive everything for organizational learning

---

## Quick Mode Lookup

| If you're working on... | Start here                              | Use mode(s)                |
| ----------------------- | --------------------------------------- | -------------------------- |
| Bug report              | [mode-discovery](mode-discovery.md)     | ANALYZE + PLAN + IMPLEMENT |
| Feature request         | [mode-discovery](mode-discovery.md)     | DESIGN + PLAN + IMPLEMENT  |
| Performance issue       | [workflow-analyze](workflow-analyze.md) | ANALYZE + PLAN             |
| Architecture redesign   | [workflow-design](workflow-design.md)   | DESIGN + PLAN              |
| Implementing a spec     | [workflow-plan](workflow-plan.md)       | PLAN + IMPLEMENT           |
| Finishing a feature     | [workflow-reflect](workflow-reflect.md) | REFLECT                    |
| Not sure                | [mode-discovery](mode-discovery.md)     | Starts with decision tree  |

---

## File Structure

```
visual-maps/
├── README.md (you are here)
├── mode-discovery.md          ← START HERE for most people
├── workflow-analyze.md        ← Debug/research workflow
├── workflow-design.md         ← Architecture/design workflow
├── workflow-plan.md           ← Implementation planning
├── workflow-implement.md      ← Building/coding
└── workflow-reflect.md        ← Retrospective & closure
```

---

## Tips for Using These Flowcharts

### 1. **Follow the Flow**
Start at "START" node, follow arrows, answer decision questions

### 2. **When You're Stuck**
- Reread current step/node
- Check decision diamond to see if you're ready
- If not ready, return to earlier step

### 3. **Customize for Your Complexity**
Simple bugs = move quickly through flowchart
Complex systems = spend more time in each node

### 4. **Use Checkboxes**
Each mode includes a completion checklist
- Complete with yellow highlights = not ready
- Complete with green = ready for next mode

### 5. **Ask for Help**
If flowchart doesn't match your situation, check [mode-discovery.md](mode-discovery.md)
It has a decision matrix to figure out where you should be

---

## Next Steps

1. **New to this kit?** Start with [mode-discovery.md](mode-discovery.md)
2. **Have a bug?** Go to [workflow-analyze.md](workflow-analyze.md)
3. **Ready to code?** Go to [workflow-plan.md](workflow-plan.md)
4. **Just finished?** Go to [workflow-reflect.md](workflow-reflect.md)

---

## Related Documentation

- **Main docs**: See [README.md](../../README.md) for kit overview
- **Usage guide**: See [USAGE-GUIDE.md](../../USAGE-GUIDE.md) for detailed workflows
- **Agents ref**: See [AGENTS-REFERENCE.md](../AGENTS-REFERENCE.md) for agent details
- **Memory system**: See [MEMORY-SYSTEM.md](../MEMORY-SYSTEM.md) for knowledge persistence

---

## Questions?

- **"Which mode should I use?"** → [mode-discovery.md](mode-discovery.md)
- **"What's the step-by-step?"** → Check the mode's flowchart
- **"What's the output?"** → Check "Output" section in mode flowchart
- **"What's next?"** → Follow the "Next mode" arrow

---

**Last Updated**: April 4, 2026
**Version**: 1.0 - Mode-Based Visual Workflow System
