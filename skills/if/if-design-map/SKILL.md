---
name: if-design-map
description: Design the explorable two-dimensional map for an Ink interactive fiction project, including locations, connections, gates, revisits, and spatial unlocks.
---

# IF Design Map

## Overview

Use this skill to design or refine the spatial layer of a free-exploration Ink game. The map should support meaningful revisits, visible blockers, state-driven unlocks, and clear relationships between locations.

## Files To Read

Always read:

- `story.yaml`
- `04_design/story_beats.md`
- `04_design/critical_path.md`
- `04_design/state_model.md`

Read when relevant:

- `00_meta/*`
- `02_story/worldbuilding.md`
- `03_characters/*`
- `04_design/locations.yaml`
- `04_design/progression.yaml`
- `07_continuity/locations.yaml`

## Files To Write

Write or update:

- `04_design/map.md`
- `04_design/locations.yaml`
- `07_continuity/locations.yaml` when stable canon location facts emerge.

## Location Model

For each meaningful location, define:

- stable `id`;
- display name;
- narrative function;
- initial availability;
- connections;
- visible exits and blocked exits;
- discoveries available on first visit and revisit;
- characters who may appear there;
- obstacles or unlocks connected to the location;
- state changes the location can grant.

## Language Rules

Use English keys and filenames. Write human-readable values in `story.language`.

## Procedure

1. Identify only locations that create action, discovery, pressure, or choice.
2. Create a navigable topology with clear start location and revisitable hubs when useful.
3. Mark gates and locked routes without solving progression details prematurely.
4. Ensure each unlock changes reachable space, available dialogue, or player knowledge.
5. Keep optional locations useful but not required for basic completion unless documented as critical path.
6. Update `locations.yaml` as structured source of truth.

## Output

Provide:

- map summary;
- location list and major connections;
- gated areas and unlock dependencies;
- recommended next step, usually `if-design-dialogue` or `if-design-progression`.

## Restrictions

- Do not draft Ink location files here.
- Do not create decorative locations that have no gameplay or narrative function.
- Do not hide critical path requirements only in prose; record them structurally.
