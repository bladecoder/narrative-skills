---
name: if-draft-ink
description: Write or revise Ink source files for an interactive fiction project from a prepared slice plan, using project state, map, dialogue, progression design, and ink-doc syntax guidance.
---

# IF Draft Ink

## Overview

Use this skill to implement a planned slice in `.ink` files. It should preserve existing Ink structure, use the project state model, and consult `ink-doc` only for syntax features needed by the task.

## Files To Read

Always read:

- `story.yaml`
- target `04_design/slices/<slice_id>.plan.md`
- `04_design/state_model.md`
- `04_design/progression.yaml`
- `05_ink/main.ink`

Read according to slice type:

- relevant files under `05_ink/locations/`
- relevant files under `05_ink/dialogues/`
- relevant files under `05_ink/systems/`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- selected `ink-doc` reference files for syntax.

## Files To Write

Write or update only the Ink files named by the slice plan unless a required include is missing:

- `05_ink/main.ink`
- `05_ink/locations/*.ink`
- `05_ink/dialogues/*.ink`
- `05_ink/systems/*.ink`

If the state model must change, stop and update the slice plan or ask for `if-design-progression` rather than silently inventing state.

## Ink Structure

Prefer:

- `main.ink` as the entrypoint and include list;
- `systems/` for state helpers, navigation loops, and shared tunnels;
- `locations/` for location knots and revisits;
- `dialogues/` for character conversations and topic loops.

Use stable English identifiers for Ink knots, stitches, variables, constants, and list items.

## Language Rules

- Write player-facing prose in `story.language`.
- Keep Ink identifiers in English unless the project already established another convention.
- Keep comments brief and only where state or flow is non-obvious.

## Procedure

1. Read the slice plan and confirm the expected files and acceptance criteria.
2. Load only relevant Ink syntax references from `ink-doc`.
3. Inspect existing Ink files before editing.
4. Implement the slice with explicit state reads/writes matching the plan.
5. Ensure choices return to the correct navigation, dialogue, or phase loop.
6. Avoid dead-end diverts unless the slice intentionally ends the story.
7. Recommend `if-playtest-review` after implementation.

## Restrictions

- Do not rewrite unrelated Ink files.
- Do not invent new progression variables outside the plan.
- Do not collapse free exploration into a fixed linear sequence unless the slice plan requires it.
