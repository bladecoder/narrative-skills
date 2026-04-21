---
name: if-design-progression
description: Model obstacles, locks, keys, knowledge, inventory, protagonist skills, and unlock conditions for an Ink interactive fiction project.
---

# IF Design Progression

## Overview

Use this skill to make the game progression playable. It turns map and dialogue ideas into explicit obstacles, requirements, grants, and completion paths so the player can explore freely without impossible locks or accidental linearity.

## Files To Read

Always read:

- `story.yaml`
- `04_design/story_beats.md`
- `04_design/critical_path.md`
- `04_design/state_model.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`

Read when relevant:

- `03_characters/*`
- `04_design/progression.yaml`
- `07_continuity/*`

## Files To Write

Write or update:

- `04_design/progression.yaml`
- `04_design/critical_path.md`
- `04_design/state_model.md`

## Progression Model

Use stable IDs and structured records. Each obstacle should capture:

- `id`;
- `type` such as `knowledge`, `inventory`, `skill`, `relationship`, `location`, or `world_state`;
- `description`;
- `requires`;
- `grants`;
- `location_scope`;
- `character_scope`;
- `critical_path`;
- `fallback_route`;
- `status`.

## Language Rules

Keep IDs, filenames, and YAML keys in English. Write human-readable values in `story.language`.

## Procedure

1. Extract all implied blockers from map, dialogue, and critical path files.
2. Convert each blocker into explicit requirements and grants.
3. Verify that critical path progress can be achieved through at least one understandable route.
4. Add alternate routes for critical knowledge when the design calls for open exploration.
5. Identify soft locks, circular dependencies, and unlocks that do not change play.
6. Update the state model with the minimum variables needed for Ink implementation.

## Output

Provide:

- progression summary;
- critical path requirements;
- optional unlocks;
- detected dependency risks;
- recommended next step, usually `if-plan-ink-slice`.

## Restrictions

- Do not write Ink source here.
- Do not leave dependencies only in prose.
- Do not create a required clue or item with no obtainable source.
