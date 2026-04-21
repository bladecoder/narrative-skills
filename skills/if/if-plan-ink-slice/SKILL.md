---
name: if-plan-ink-slice
description: Plan a single implementable Ink slice, such as one location, character dialogue, obstacle, system, or progression beat, before writing or revising Ink source files.
---

# IF Plan Ink Slice

## Overview

Use this skill to prepare one bounded unit of Ink implementation. The slice plan should be specific enough that `if-draft-ink` can write code without re-solving map, dialogue, or progression design.

## Slice Types

Supported slice types:

- location;
- dialogue;
- obstacle;
- navigation system;
- inventory, knowledge, or skill system;
- phase transition;
- ending or major branch.

## Files To Read

Always read:

- `story.yaml`
- `04_design/state_model.md`
- `04_design/progression.yaml`

Read according to slice type:

- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/story_beats.md`
- `04_design/critical_path.md`
- relevant `05_ink/*`
- `ink-doc` references only when Ink syntax decisions are needed.

## Files To Write

Write or update one plan file under:

```text
04_design/slices/<slice_id>.plan.md
```

Use English filenames and stable `snake_case` slice IDs.

## Plan Requirements

Each slice plan must define:

- slice ID and type;
- source design records involved;
- Ink files expected to change;
- entry and exit knots or stitches;
- state variables read and written;
- choices shown to the player;
- repeat behavior on revisit;
- required includes or tunnels;
- acceptance criteria.

## Language Rules

Write project content in `story.language`. Keep filenames, IDs, and Ink identifiers in English unless the project already uses another stable convention.

## Procedure

1. Locate the target design item and confirm its role.
2. Read only the Ink and design files needed for this slice.
3. Define the player-facing interaction and state transitions.
4. Decide how the slice reconnects to navigation or dialogue loops.
5. Record implementation constraints and acceptance checks.
6. Recommend `if-draft-ink`.

## Restrictions

- Do not write Ink source here.
- Do not plan multiple unrelated slices in one file.
- Do not introduce new state without adding it to the plan and state model.
