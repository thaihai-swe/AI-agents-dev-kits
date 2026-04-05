# Discovery And Learning

The current workflow uses a single bounded discovery command: `/analyze`.

## `/analyze`

Use it when:

- the current system is unclear
- the repo is brownfield
- there is bug or regression uncertainty
- you need evidence before writing a spec
- you want to compare options before committing to a design

## Output

Default feature output:

```text
artifacts/features/<slug>/analysis.md
```

Typical sections:

- scope
- current state
- findings
- risks and unknowns
- brownfield notes
- options
- recommendation

## Important Shift

Older docs split discovery across separate commands for exploration, architecture capture, and archive promotion. The current model keeps discovery bounded in `analysis.md`, then promotes only durable information into repo memory when appropriate.
