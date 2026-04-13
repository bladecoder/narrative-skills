---
name: create-character-bible
description: Define the main cast, supporting cast, and dramatic relationships for an initialized story project when character ideas are missing, scattered, or not yet usable for outlining and drafting.
---

# Create Character Bible

## Overview

Use this skill to turn loose character ideas into a working cast bible for fiction writing. The output must be narratively useful: each important character should have a dramatic role, a voice, a conflict, and a relationship to the central story problem.

## When To Use

Use this skill when:

- the project has already been initialized;
- the premise exists but the cast is still vague or fragmented;
- the protagonist, antagonist, or supporting cast need clearer dramatic functions;
- future outlining or drafting would be weak without stronger character definitions;
- the user wants a reusable character bible instead of ad hoc chat context.

Do not use this skill to write scenes or chapters. Its job is to define a cast that can support the story.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- premise and project goals;
- genre and themes;
- any existing style guidance;
- known or proposed characters;
- major relationships or tensions already mentioned by the user.

Ask questions only when a key character function is missing and blocks useful output.

## Files To Read

Always read:

- `story.yaml`
- `00_meta/premise.md`

Read these when present and relevant:

- `00_meta/goals.md`
- `00_meta/constraints.md`
- `01_style/voice.md`
- `01_style/pov.md`
- `02_story/logline.md`
- `02_story/synopsis.md`
- any existing files under `03_characters/`

## Files To Write

Write or update:

- `03_characters/protagonist.md`
- `03_characters/supporting_cast.md`
- `03_characters/relationships.md`

Optionally create additional files such as:

- `03_characters/<character_name>.md`

Only create per-character files for characters who materially matter to the story.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing character files.
- Keep file and folder names in English.
- Write markdown content in the selected story language.
- If `story.language` is missing, gather it before writing.
- If existing character files are in a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the story metadata, premise, and any existing style or story notes.
2. Identify which characters are necessary to sustain the story, not merely decorative.
3. Prioritize dramatic function over exhaustive biography.
4. For each major character, define at least:
   - role in the story;
   - external want;
   - internal need;
   - wound, fear, or contradiction;
   - relationship to the central conflict;
   - expected arc;
   - voice cues;
   - what the character knows and does not know.
5. Map the key emotional and structural relationships among the cast.
6. Keep the cast lean. Merge or remove redundant characters when two roles can be combined.
7. Update existing files carefully instead of replacing useful material wholesale.

## Output Requirements

### `protagonist.md`

At minimum, define:

- core role in the story;
- objective;
- internal conflict;
- contradiction or vulnerability;
- expected transformation;
- voice or speech tendencies;
- limitations in knowledge or perception.

### `supporting_cast.md`

List only the meaningful supporting characters. For each one, capture:

- dramatic role;
- relationship to protagonist;
- source of tension, support, temptation, obstruction, or revelation;
- likely arc or pressure point;
- brief voice cues.

### `relationships.md`

Document the emotionally central relationships and tensions:

- protagonist versus antagonist;
- alliances and fractures;
- hidden loyalties or asymmetries of knowledge;
- relationship dynamics likely to drive scenes and chapter turns.

### Optional Per-Character Files

Create a dedicated file only when a character needs deeper treatment for future drafting or outlining. These files should still stay practical and should not become decorative biographies.

## Quality Bar

The resulting cast bible should enable another agent to answer consistently:

- who this character is in story terms;
- what this character wants;
- what blocks or distorts that desire;
- how this character speaks or presents themselves;
- how this character changes or resists change;
- which relationships create friction, loyalty, betrayal, or emotional charge.

## Output

After running the skill, provide:

- a short summary of the cast created or refined;
- the main dramatic relationships now defined;
- any remaining provisional or unresolved character assumptions;
- the recommended next step, usually `generate-high-level-outline`.

## Definition Of Done

This skill is done when:

- the core cast is documented under `03_characters/`;
- the protagonist and major supporting roles are usable for outlining;
- relationships with real dramatic tension are documented;
- the files respect `story.language`;
- the cast is functional for storytelling rather than ornamental.

## Restrictions

- Do not create a bloated cast without narrative purpose.
- Do not fill files with trivia that does not affect the story.
- Do not contradict the premise, tone, or style bible.
- Do not draft narrative scenes here.

## Example Invocation

```text
Use $create-character-bible to define the protagonist, antagonist, and three supporting characters for this project, with clear emotional tensions and distinct voices.
```
