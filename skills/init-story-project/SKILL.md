---
name: init-story-project
description: Create or normalize a story project repository when a fiction project does not exist yet, is incomplete, or needs to be aligned to the canonical folder structure and shared metadata contract.
---

# Init Story Project

## Overview

Use this skill to initialize the current working directory as the canonical workspace for a novel, short story, or similar fiction project. It collects the minimum briefing, persists it in project files, and establishes the shared metadata contract that later skills must read, including the selected story language.

## When To Use

Use this skill when:

- there is no story project yet;
- the repository has partial notes but no normalized structure;
- essential files such as `story.yaml` or `README.md` are missing;
- the user wants to start a new fiction project from scratch;
- the user wants to normalize an existing project before planning or drafting.

Do not use this skill to write chapters or define detailed style rules. Its job is initialization and normalization.

## Required Inputs

Collect or infer these fields whenever possible:

- provisional title;
- genre and subgenre;
- story language;
- target audience;
- estimated length;
- overall tone;
- narrative voice;
- POV;
- tense;
- premise in 1-3 paragraphs;
- core themes;
- explicit constraints or preferences.

Ask only for information that is truly missing and blocks initialization.

## Files To Read

Inspect these if they exist:

- repository root files and folders;
- `story.yaml`;
- `README.md`;
- any existing markdown, text, or YAML notes relevant to the project.

## Files To Create Or Update

Create or complete this canonical structure in the current directory:

```text
README.md
story.yaml

00_meta/
  premise.md
  goals.md
  constraints.md

01_style/
  voice.md
  prose_rules.md
  pov.md
  taboo_list.md
  lexical_notes.md

02_story/
  logline.md
  synopsis.md
  themes.md
  worldbuilding.md
  timeline.md
  chapter_list.md
  open_loops.md

03_characters/
  protagonist.md
  supporting_cast.md
  relationships.md

04_outline/
  act_1.md
  act_2.md
  act_3.md
  scene_cards/

05_draft/
  chapter_01.md
  chapter_02.md

06_review/
  chapter_01.review.md
  chapter_02.review.md
  manuscript.review.md

07_continuity/
  canon_facts.yaml
  entities.yaml
  locations.yaml
  unresolved_threads.yaml

08_exports/
```

## Shared Metadata Contract

All future story-writing skills must read `story.yaml` before making assumptions about language, POV, tone, or workflow state.

Use stable English keys in `story.yaml`. Store free-text values in the selected story language where appropriate. At minimum, persist:

```yaml
project:
  title: ""
  format: "novel"
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

workflow:
  canonical_root: "."
  initialized_at: ""
  next_skill: "define-style-bible"
```

Rules for language handling:

- folder names and standard file names stay in English;
- YAML keys stay in English;
- markdown content must be written in the selected `story.language`;
- if the language is unknown, ask for it before writing content templates;
- later skills must treat `story.language` as mandatory shared metadata.

## Procedure

1. Inspect the current directory and detect whether it already contains a story project structure.
2. Reuse existing material instead of starting over when usable notes are already present.
3. Determine missing critical metadata. Ask only the minimum blocking questions.
4. Create any missing folders and files from the canonical structure.
5. Create or update `story.yaml` with the shared metadata contract.
6. Create `README.md` with a short workflow overview and recommended next step.
7. Seed the markdown files with minimal, useful placeholders in the selected story language.
8. Mark uncertain values as provisional instead of inventing them as facts.
9. Never overwrite substantial existing content without a concrete reason.

## Content Requirements

When creating template content:

- keep filenames fixed in English;
- write headings, instructions, and placeholder text in the selected story language;
- prefer short operational prompts over empty files;
- make templates specific enough that the next skill can continue immediately.

At minimum:

- `00_meta/premise.md` should capture the premise already known;
- `00_meta/goals.md` should capture audience, scope, and project goals;
- `00_meta/constraints.md` should capture hard restrictions and explicit preferences;
- `02_story/logline.md` and `02_story/themes.md` should get brief starter placeholders if the data exists;
- continuity YAML files can start as valid empty structures rather than verbose prose.

## Output

After running the skill, provide:

- a short summary of what was created or normalized;
- the key files initialized or updated;
- any metadata still provisional;
- the recommended next step: `define-style-bible`.

## Definition Of Done

This skill is done when:

- the canonical project structure exists in the current directory;
- `story.yaml` exists and includes the selected story language;
- `README.md` exists;
- essential markdown and YAML files exist;
- the minimum briefing has been persisted to files;
- no existing meaningful content was destroyed.

## Restrictions

- Do not start drafting chapters here.
- Do not fabricate confirmed facts when the user has not provided them.
- Do not rename the canonical files away from their English names.
- Do not write template content in the wrong language once `story.language` is known.

## Example Invocation

```text
Use $init-story-project to initialize a dark fantasy novel project. The story should be written in Spanish, with third-person limited POV, a restrained tone, and a sober narrative voice.
```
