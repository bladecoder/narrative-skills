---
name: draft-chapter
description: Write a full chapter draft for a prepared story project by following the persisted chapter plan, style bible, character state, and continuity records rather than improvising from chat context alone.
---

# Draft Chapter

## Overview

Use this skill to write a full chapter draft from the project's persisted materials. It should produce narrative prose that follows the existing plan, voice, POV, emotional state, and continuity constraints closely enough that the chapter can move directly into editorial review.

## When To Use

Use this skill when:

- a chapter already has a usable plan;
- the user wants a full draft rather than more planning;
- style and character guidance exist and are sufficient to write consistently;
- previous chapter state and continuity records are available or manageable;
- the chapter is ready to be written as prose.

Do not use this skill as a substitute for chapter planning when the chapter's objective or beat structure is still unclear.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- target chapter number;
- the chapter plan or equivalent notes;
- style bible;
- relevant character files;
- outline context;
- previous chapter state;
- continuity records when present;
- target length or scope if the user has provided one.

Ask questions only when a missing input would make the draft unreliable, such as an unknown target chapter or absent chapter plan.

## Files To Read

Always read:

- `story.yaml`
- the target chapter planning file if it exists;
- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`

Read these when present and relevant:

- `01_style/taboo_list.md`
- `01_style/lexical_notes.md`
- `02_story/chapter_list.md`
- `03_characters/*`
- `04_outline/*`
- surrounding chapters in `05_draft/`
- `02_story/timeline.md`
- `02_story/open_loops.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

If both `04_outline/chapter_XX.plan.md` and planning notes inside `05_draft/chapter_XX.md` exist, use the most current and project-consistent source.

## Files To Write

Write or update:

- `05_draft/chapter_XX.md`

The output file should contain the chapter text itself. If the project uses lightweight metadata headers, preserve them. Do not intermingle editorial commentary with the narrative body.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before drafting.
- Keep file and folder names in English.
- Write the chapter body in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If `story.language` is missing, gather it before writing.
- If the target draft file is in a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the chapter plan and confirm the chapter's function, POV, beginning, and ending.
2. Read the minimum style material needed to preserve voice, rhythm, POV rules, and taboo constraints.
3. Read the relevant character and continuity context so the draft reflects correct knowledge, injuries, locations, promises, and emotional state.
4. Draft the chapter as complete prose, not a partial scene list.
5. Ensure that each scene advances the planned change in plot, character, information, or tension.
6. Keep exposition subordinate to dramatic movement.
7. End the chapter with momentum, change, consequence, resonance, or unresolved pressure appropriate to the outline.
8. If the chapter plan proves flawed during drafting, make only the minimum necessary adjustment and leave the project files internally consistent.

## Output Requirements

The chapter file should contain:

- a chapter heading or identifier consistent with project convention;
- the full narrative draft;
- optional minimal metadata only if the project already uses it.

The narrative body must not contain:

- editorial notes to the reader;
- TODO markers embedded in the prose;
- explanations of the writing process;
- contradictory fallback inventions added just to fill gaps.

## Quality Bar

The resulting chapter should allow another agent or editor to say:

- the prose matches the project's voice and language;
- the POV and tense are controlled;
- character behavior fits what the story has established;
- the chapter advances the outline rather than stalling it;
- the text is coherent enough to review without first reconstructing intent.

## Output

After running the skill, provide:

- a short summary of the chapter drafted;
- any minimal deviations from the plan that were necessary;
- any continuity risks that should be reviewed next;
- the recommended next step, usually `chapter-review`.

## Definition Of Done

This skill is done when:

- `05_draft/chapter_XX.md` contains a full readable chapter draft;
- the chapter follows the plan, style bible, and continuity constraints closely;
- the file respects `story.language`;
- the draft is coherent enough to pass to review without additional planning.

## Restrictions

- Do not insert editorial commentary into the chapter body.
- Do not rewrite unrelated chapters.
- Do not solve planning holes with deus ex machina or canon-breaking inventions.
- Do not ignore style prohibitions or POV boundaries.

## Example Invocation

```text
Use $draft-chapter to write chapter 7 from the existing plan, keeping the prose tense, contained, and fully aligned with the project's style and continuity.
```
