---
name: if-sync-state
description: Synchronize accepted Ink interactive fiction changes back into design, progression, continuity, playtest records, and workflow metadata.
---

# IF Sync State

## Overview

Use this skill after Ink implementation or review changes have stabilized. It updates design and continuity records so later IF work does not rely on stale plans or chat memory.

## Files To Read

Always read:

- `story.yaml`
- changed or target `05_ink/*` files;
- relevant `04_design/*` files.

Read when relevant:

- `06_playtest/route_matrix.md`
- `06_playtest/playability.review.md`
- `07_continuity/*`
- `03_characters/*`

## Files To Write

Update as justified:

- `story.yaml`
- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/progression.yaml`
- `04_design/state_model.md`
- `04_design/critical_path.md`
- `06_playtest/route_matrix.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

## Sync Rules

- Preserve confirmed design facts unless Ink clearly supersedes them.
- Record implementation reality when it differs from old plans.
- Keep uncertain facts marked provisional.
- Do not promote draft-only text into canon unless it is accepted or stable.
- Keep `workflow.next_skill` actionable.

## Language Rules

Use English keys and filenames. Write human-readable values in `story.language`.

## Procedure

1. Identify the accepted Ink or review changes in scope.
2. Extract new or changed facts about locations, characters, obstacles, state, and progression.
3. Update structured design files additively where possible.
4. Update continuity records only when evidence is stable.
5. Refresh workflow metadata and recommend the next IF skill.

## Output

Provide:

- files synchronized;
- new or changed progression/state facts;
- continuity updates;
- remaining discrepancies;
- recommended next step.

## Restrictions

- Do not rewrite playable Ink here.
- Do not erase useful design history without clear replacement.
- Do not mark unresolved playtest findings as solved unless the files prove it.
