---
name: define-style-bible
description: Build the prose and voice bible for an existing story project after initialization, using the persisted brief and shared metadata to create actionable style rules for future planning, drafting, and review.
---

# Define Style Bible

## Overview

Use this skill to convert a story brief into an operational style bible. It should turn vague preferences into specific prose rules that later skills can follow and evaluate consistently, always respecting the selected story language stored in `story.yaml`.

## When To Use

Use this skill when:

- the current directory already contains an initialized or mostly initialized story project;
- the project has a premise but no usable prose rules yet;
- the voice is still vague or inconsistent;
- the user wants to formalize narrative style before outlining or drafting;
- several early notes exist and need to be consolidated into stable writing rules.

Do not use this skill as a substitute for chapter drafting. Its job is to define the writing system, not produce scenes.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- premise and goals;
- genre and audience;
- tone and narrative distance;
- POV and tense;
- stylistic references to emulate loosely or avoid;
- preferred density, rhythm, dialogue balance, and level of lyricism;
- explicit taboo patterns or constraints.

Ask questions only when a missing preference would materially weaken the style rules.

## Files To Read

Always read:

- `story.yaml`
- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`

Read additional notes if they exist and are relevant:

- `README.md`
- `02_story/logline.md`
- any user-provided notes on tone, references, or examples.

## Files To Write

Write or update:

- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`
- `01_style/taboo_list.md`
- `01_style/lexical_notes.md`

## Language Rules

This skill depends on `story.yaml` as the source of truth for language metadata.

- Read `story.story.language` before writing style files.
- Keep filenames in English.
- Write the markdown content in the selected story language.
- If `story.story.language` is missing, stop and gather it before writing.
- If existing style files are in a different language than `story.story.language`, flag the mismatch and resolve it deliberately instead of mixing languages silently.

## Procedure

1. Read the shared metadata and confirm the story language, audience, tone, POV, and tense.
2. Extract concrete style signals from the brief and any user notes.
3. Convert fuzzy preferences into observable, testable writing rules.
4. Define the narrative voice in terms another agent can apply while drafting.
5. Specify POV handling, tense, narrative distance, and mental-access boundaries.
6. Build a taboo list of stylistic moves, cliches, and recurring mistakes to avoid.
7. Document lexical and register decisions that affect word choice.
8. Update files without erasing useful existing decisions unless the new instruction clearly supersedes them.

## File Requirements

### `voice.md`

Describe:

- baseline tone;
- prose texture;
- narrative distance;
- ideal rhythm;
- level of explicitness;
- balance among description, action, and dialogue.

### `prose_rules.md`

Create actionable rules such as:

- do;
- avoid;
- prefer;
- do not overuse.

Rules must be concrete enough to support later chapter review.

### `pov.md`

Clarify:

- primary POV;
- whether POV shifts are allowed;
- how shifts are marked;
- tense;
- limits of interior access.

### `taboo_list.md`

List prohibited or restricted patterns, such as:

- cliches;
- filler phrasing;
- heavy-handed exposition;
- redundant emotional explanation;
- stylistic tics the project should avoid.

### `lexical_notes.md`

Capture:

- vocabulary register;
- acceptable or rejected technicality level;
- regionalisms;
- preferred recurring semantic fields;
- words or expressions to seek out or avoid.

## Output

After running the skill, provide:

- a short summary of the style bible created or updated;
- the main stylistic decisions that now govern the project;
- any unresolved inputs that remain provisional;
- the recommended next step, usually `create-character-bible` or `generate-high-level-outline`.

## Definition Of Done

This skill is done when:

- the five files under `01_style/` exist and contain useful guidance;
- the rules are specific enough for another agent to draft with consistency;
- the style files respect the selected story language;
- ambiguities have been either resolved or clearly marked as provisional.

## Restrictions

- Do not imitate living or copyrighted authors closely.
- Do not write empty guidance such as "make it sound good."
- Do not draft full narrative chapters here.
- Do not ignore project metadata in `story.yaml`.

## Example Invocation

```text
Use $define-style-bible to define a restrained, elegant, low-adjective prose style for this project, with medium-length sentences, controlled dialogue, and little ornamental language.
```
