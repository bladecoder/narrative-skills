---
name: generate-high-level-outline
description: Build the story's high-level structure, act progression, and chapter map for an initialized project once the premise, style, and core cast are defined well enough to support a real narrative plan.
---

# Generate High-Level Outline

## Overview

Use this skill to convert premise, cast, and story intent into a workable narrative structure. It should define act-level progression and a chapter map that creates real movement in plot, character, and revelation rather than a decorative list of chapter titles.

## When To Use

Use this skill when:

- the project has been initialized;
- the premise is clear enough to support a structure;
- style and character work already exist or are sufficient to proceed;
- the user wants a map of the story before drafting chapters;
- the current story notes are too loose to support disciplined chapter planning.

Do not use this skill when the premise and cast are still too undefined to structure meaningfully. In that case, finish the missing upstream work first.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- premise and themes;
- genre and expected scope;
- style guidance that affects pacing or emphasis;
- character bible;
- target length or rough chapter count if known;
- any structural preferences or mandatory beats provided by the user.

Ask questions only when the missing structural preference materially changes the outline.

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
- `02_story/themes.md`
- all relevant files under `03_characters/`
- any existing files under `04_outline/`

## Files To Write

Write or update:

- `04_outline/act_1.md`
- `04_outline/act_2.md`
- `04_outline/act_3.md`
- `02_story/chapter_list.md`

Optionally update:

- `02_story/synopsis.md`
- `02_story/logline.md`
- `02_story/themes.md`

Only revise these optional story files when the new outline materially clarifies them.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing outline files.
- Keep file and folder names in English.
- Write markdown content in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If `story.language` is missing, gather it before writing.
- If existing outline files use a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the premise, cast, goals, and relevant style guidance.
2. Translate the premise into a central conflict with escalating pressure.
3. Define the narrative promise of the opening and the destination of the ending.
4. Place the major structural beats, including:
   - opening hook;
   - inciting incident;
   - first major turn;
   - midpoint shift;
   - crisis;
   - climax;
   - resolution.
5. Distribute these beats across three acts in a way that matches the intended scope and genre.
6. Create a provisional chapter map where each chapter changes something meaningful:
   - conflict state;
   - character state;
   - knowledge state;
   - relational state;
   - stakes.
7. Remove filler chapters and merge redundant beats.
8. Update existing outline files carefully instead of discarding useful work without reason.

## Output Requirements

### `chapter_list.md`

For each chapter, include at minimum:

- chapter number;
- optional working title;
- POV;
- dramatic purpose;
- 3-6 lines of summary;
- the change the chapter produces.

The chapter list must be operational. If a chapter does not cause a real shift, revise or remove it.

### `act_1.md`, `act_2.md`, `act_3.md`

Each act file should define:

- function of the act;
- dominant tension;
- key structural beats;
- protagonist pressure and transformation path;
- major reversals or revelations expected in that act.

### Optional Story File Updates

If the outline clarifies the project substantially, tighten:

- `02_story/logline.md` into a more precise story promise;
- `02_story/synopsis.md` into a concise end-to-end summary;
- `02_story/themes.md` into a cleaner thematic frame.

## Quality Bar

The resulting outline should allow another agent to answer consistently:

- what the story is building toward;
- why each act exists;
- what each chapter does beyond "something happens";
- where character and plot progression reinforce each other;
- which unresolved tensions are intentionally carried forward.

## Output

After running the skill, provide:

- a short summary of the structure created or refined;
- the main act turns and chapter-count logic;
- any unresolved structural assumptions;
- the recommended next step, usually `plan-chapter`.

## Definition Of Done

This skill is done when:

- the three act files exist and are useful;
- `02_story/chapter_list.md` exists and gives each chapter a real dramatic job;
- the outline respects the premise, cast, and style guidance;
- the files respect `story.language`;
- the structure is strong enough to support chapter planning without improvising the whole novel.

## Restrictions

- Do not generate a hollow chapter list with no progression.
- Do not resolve major conflicts too early without reason.
- Do not inflate chapter count just to hit an arbitrary length.
- Do not draft full chapters here.

## Example Invocation

```text
Use $generate-high-level-outline to build an 18-chapter three-act outline for this project, balancing plot escalation with character change.
```
