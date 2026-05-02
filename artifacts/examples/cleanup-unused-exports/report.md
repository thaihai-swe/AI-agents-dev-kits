# Refactor Cleaner Report

## Scope

Assess whether a small set of suspected unused exports and stale helper files can be removed safely.

## Candidate Classification

- Safe:
  - private helper with no repository references
  - unused re-export removed from a local barrel file
- Careful:
  - cross-module export referenced by string-based lookup in config
- Risky:
  - file reachable through framework auto-discovery

## Evidence

- direct `rg` reference search
- import/export graph inspection
- existing lint and test commands

## Recommended Action

- Remove only the `Safe` candidates in the first batch.
- Leave `Careful` and `Risky` candidates untouched until stronger proof exists.

## Validation

- rerun the smallest relevant lint or test command after each bounded removal batch
- confirm no public or extension-facing behavior changed
