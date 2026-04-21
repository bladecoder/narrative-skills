---
name: if-design-structure
description: Define the playable structure of an Ink interactive fiction story, including core loop, free map exploration, free-order conversations, phases, and player progression promise.
---

# IF Design Structure

## Overview

Use this skill to turn a premise into a playable IF design before detailed map, dialogue, progression, or Ink drafting work. It defines what the player repeatedly does, what changes as they explore, and how narrative pressure survives non-linear order.

## Files To Read

Always read:

- `story.yaml`
- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`

Read when present:

- `01_style/*`
- `02_story/logline.md`
- `02_story/themes.md`
- `02_story/worldbuilding.md`
- `03_characters/*`
- existing `04_design/*`

## Files To Write

Write or update:

- `04_design/story_beats.md`
- `04_design/critical_path.md`
- `04_design/state_model.md`

Optionally refine:

- `02_story/logline.md`
- `02_story/synopsis.md`

## Design Requirements

Define:

- playable promise;
- player role and agency boundaries;
- core loop;
- starting state;
- broad phases or acts;
- critical path through the mystery, quest, or central problem;
- optional exploration content principles;
- how map exploration and conversation exploration reinforce each other;
- fail-soft policy for missed content and repeated visits.

## Language Rules

Write project content in `story.language`. Keep filenames and YAML keys in English.

## Procedure

1. Identify the central dramatic problem and convert it into player-facing activity.
2. Define the core loop as repeated verbs, not abstract themes.
3. Establish the opening playable state and what the player can freely inspect.
4. Define phase changes caused by knowledge, inventory, skills, relationships, or obstacle resolution.
5. Create a critical path that proves the game can be completed without prescribing one exact player order.
6. Record state categories needed later by map, dialogue, progression, and Ink systems.

## Output

Summarize:

- core loop;
- phase structure;
- critical path;
- state categories introduced;
- recommended next skills, usually `if-design-map` and `if-design-dialogue`.

## Restrictions

- Do not write Ink source here.
- Do not over-specify individual dialogue lines.
- Do not create a purely linear chapter outline.
