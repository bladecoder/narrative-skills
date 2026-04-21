---
name: if-playtest-review
description: Review an Ink interactive fiction project or slice for playability, route coverage, dead ends, impossible locks, repeated-choice behavior, pacing, and state consistency.
---

# IF Playtest Review

## Overview

Use this skill after Ink source exists. It evaluates whether the player can navigate, converse, unlock progress, revisit content, and complete the intended path without contradictions or impossible state dependencies.

## Files To Read

Always read:

- `story.yaml`
- `04_design/state_model.md`
- `04_design/progression.yaml`
- `05_ink/main.ink`

Read when relevant:

- target slice plan under `04_design/slices/`
- relevant `05_ink/locations/*`
- relevant `05_ink/dialogues/*`
- relevant `05_ink/systems/*`
- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/critical_path.md`
- existing `06_playtest/*`

## Files To Write

Write or update:

- `06_playtest/route_matrix.md`
- `06_playtest/playability.review.md`

Optionally add slice-specific review notes under `06_playtest/` if the project already uses that convention.

## Review Dimensions

Check:

- start-to-completion route;
- location reachability;
- character availability;
- critical clue availability;
- inventory, knowledge, skill, and relationship gates;
- circular dependencies;
- repeated choices and revisits;
- accidental one-way exits;
- unavailable endings or premature endings;
- state names used in Ink but absent from the model;
- state names in the model but unused in Ink.

## Optional Compile Check

If an Ink compiler such as `inklecate` is available, run it only as a verification step. If it is unavailable, state that syntax was reviewed statically.

## Language Rules

Write review notes in `story.language`. Keep filenames and structured keys in English.

## Procedure

1. Identify the scope: whole project or specific slice.
2. Build a route matrix covering critical path and likely optional orders.
3. Compare required states in progression design against states granted in Ink.
4. Classify findings as blocking, major, minor, or polish.
5. Write concrete fixes, naming files and knots when possible.
6. Recommend `if-draft-ink`, `if-design-progression`, or `if-sync-state` depending on the result.

## Restrictions

- Do not rewrite Ink source here unless explicitly asked.
- Do not treat every optional missed line as a blocking playability defect.
- Do not ignore soft locks caused by dialogue order.
