---
name: if-init-project
description: Create or normalize the canonical project structure for an Ink interactive fiction story with free map exploration and free-order character conversations.
---

# IF Init Project

## Overview

Use this skill to initialize the current directory as an Ink interactive fiction project. It extends the traditional narrative project contract with design files for locations, dialogue, progression, state, Ink source, and playtest review.

## Required Inputs

Collect or infer:

- provisional title;
- story language;
- genre, tone, audience, POV, and tense;
- premise and playable fantasy;
- expected scope;
- free exploration constraints;
- known locations, characters, obstacles, inventory, knowledge, or skills.

Ask only for missing information that blocks initialization, especially `story.language`.

## Files To Create Or Update

Create or normalize:

```text
README.md
story.yaml

00_meta/
01_style/
02_story/
03_characters/

04_design/
  map.md
  locations.yaml
  dialogue_matrix.md
  progression.yaml
  state_model.md
  story_beats.md
  critical_path.md
  slices/

05_ink/
  main.ink
  locations/
  dialogues/
  systems/

06_playtest/
  route_matrix.md
  playability.review.md

07_continuity/
  canon_facts.yaml
  entities.yaml
  locations.yaml
  unresolved_threads.yaml

08_exports/
```

## Metadata Contract

Persist this minimum contract in `story.yaml`:

```yaml
project:
  title: ""
  format: "interactive_fiction_ink"
  status: "initialized"
story:
  genre: ""
  subgenre: ""
  language: ""
  audience: ""
  estimated_length: ""
  premise_status: "provisional"
narrative:
  tone: ""
  voice: ""
  pov: ""
  tense: ""
interactive:
  engine: "ink"
  entrypoint: "05_ink/main.ink"
  navigation_model: "free_2d_map"
  conversation_model: "free_order_dialogues"
workflow:
  canonical_root: "."
  initialized_at: ""
  next_skill: "if-design-structure"
```

## Language Rules

- Skill text, folder names, filenames, and YAML keys stay in English.
- Human-readable project content is written in `story.language`.
- Use normal Unicode and correct orthography for the selected language.

## Procedure

1. Inspect the current directory and preserve useful existing material.
2. Create missing folders and files from the canonical IF structure.
3. Initialize `story.yaml` without overwriting confirmed metadata.
4. Seed design files with concise operational prompts in `story.language`.
5. Seed YAML files as valid structured empty data where no facts are known.
6. Create `05_ink/main.ink` as a minimal entrypoint with includes/placeholders only if no Ink source exists.
7. Recommend `if-design-structure` next.

## Restrictions

- Do not draft a full game here.
- Do not invent confirmed locations, characters, objects, or unlocks.
- Do not rename canonical files away from English names.
