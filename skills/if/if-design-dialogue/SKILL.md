---
name: if-design-dialogue
description: Design free-order character conversations for an Ink interactive fiction project, including dialogue topics, availability, knowledge gates, relationship state, and revelations.
---

# IF Design Dialogue

## Overview

Use this skill to design the conversation layer of an exploratory Ink game. Conversations should work in player-chosen order, react to discovered knowledge, and avoid breaking continuity when topics are encountered early, late, or repeatedly.

## Files To Read

Always read:

- `story.yaml`
- `03_characters/protagonist.md`
- `03_characters/supporting_cast.md`
- `04_design/story_beats.md`
- `04_design/state_model.md`

Read when relevant:

- `03_characters/relationships.md`
- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/progression.yaml`
- `07_continuity/*`

## Files To Write

Write or update:

- `04_design/dialogue_matrix.md`
- `04_design/state_model.md` when new conversation state is needed.

Optionally update:

- `03_characters/relationships.md` when interaction design clarifies relationships.

## Dialogue Model

For each important character, define:

- stable `id`;
- where and when they can appear;
- default conversational stance;
- repeatable small talk or inspection loop;
- one-time topic revelations;
- topics gated by knowledge, inventory, skills, location, or prior dialogue;
- relationship or trust changes;
- what the character knows, conceals, misunderstands, or refuses to discuss.

## Language Rules

Write project prose in `story.language`. Keep filenames, IDs, and YAML keys in English.

## Procedure

1. Identify which characters need interactive dialogue rather than static prose.
2. Define topic groups and their dependencies.
3. Ensure every critical clue has a reliable route and every optional clue has a purpose.
4. Add repeatable dialogue patterns that acknowledge prior visits without bloating state.
5. Mark topics that should become unavailable, altered, or newly available after state changes.
6. Keep implementation-ready notes without drafting full Ink dialogue unless requested through `if-draft-ink`.

## Output

Provide:

- dialogue matrix summary;
- key topic gates and revelations;
- character availability rules;
- state additions;
- recommended next step, usually `if-design-progression`.

## Restrictions

- Do not write final Ink dialogue here.
- Do not make critical knowledge missable without an alternate route.
- Do not assume a fixed player conversation order.
