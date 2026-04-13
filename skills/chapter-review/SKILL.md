---
name: chapter-review
description: Review a drafted chapter for narrative, stylistic, and structural problems once a chapter exists and the project has enough persisted context to judge it against the intended outline, voice, and character logic.
---

# Chapter Review

## Overview

Use this skill to perform an editorial review of a drafted chapter and leave actionable feedback in the project files. The review should distinguish major problems from minor adjustments and make it clear what to fix next instead of offering vague aesthetic commentary.

## When To Use

Use this skill when:

- a chapter draft already exists;
- the user wants feedback before moving to the next chapter;
- the draft needs evaluation for clarity, tension, pacing, voice, dialogue, or structure;
- the agent needs a written review artifact rather than informal chat feedback;
- the project is iterating chapter by chapter with review checkpoints.

Do not use this skill to write the chapter itself. Its job is evaluation and prioritization.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- the target chapter draft;
- relevant style files;
- chapter plan or outline context;
- nearby chapter context when transitions matter;
- character files when voice or behavior need verification.

Ask questions only when the target chapter or desired review focus is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- `05_draft/chapter_XX.md`

Read these when present and relevant:

- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`
- `01_style/taboo_list.md`
- `01_style/lexical_notes.md`
- `02_story/chapter_list.md`
- `04_outline/chapter_XX.plan.md`
- `04_outline/*`
- adjacent chapters in `05_draft/`
- `03_characters/*`
- `02_story/open_loops.md`

## Files To Write

Write or update:

- `06_review/chapter_XX.review.md`

If the project already uses a slightly different filename pattern for chapter reviews, follow the existing convention rather than forcing a new one.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing the review file.
- Keep file and folder names in English.
- Write the review content in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If `story.language` is missing, gather it before writing.
- If the review file uses a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the draft chapter completely before judging details.
2. Read the minimum relevant project context so the review reflects intended style, structure, and character logic.
3. Evaluate the chapter across the dimensions that matter most:
   - clarity;
   - tension and momentum;
   - plot progression;
   - character coherence;
   - voice and prose control;
   - dialogue effectiveness;
   - exposition load;
   - ending impact;
   - alignment with outline and plan.
4. Separate major narrative or structural issues from smaller polish issues.
5. Identify continuity risks when they surface, but keep the chapter review focused on editorial usefulness.
6. Write recommendations that are concrete, prioritized, and non-contradictory.

## Output Requirements

The review should include these sections:

1. brief chapter summary;
2. what works;
3. major problems;
4. secondary problems;
5. detected continuity risks;
6. prioritized recommendations;
7. recommended next action.

The review must make clear which issues are blocking and which are optional improvements.

## Quality Bar

The resulting review should allow another agent or author to answer:

- what is already working in this chapter;
- what the biggest problems are;
- why those problems matter;
- what changes should happen first;
- whether the chapter is ready to continue, revise, or re-plan.

## Output

After running the skill, provide:

- a short summary of the review created;
- the top one to three issues found;
- whether the chapter should be revised, re-planned, or can proceed with minor fixes;
- the recommended next step, usually `continuity-check` or a targeted rewrite.

## Definition Of Done

This skill is done when:

- `06_review/chapter_XX.review.md` exists and is usable;
- the review clearly prioritizes major versus minor issues;
- recommendations are concrete enough to act on;
- the review respects `story.language`;
- the chapter's status is clearer than before the review.

## Restrictions

- Do not limit the review to generic praise.
- Do not propose mutually contradictory fixes.
- Do not rewrite the whole chapter unless explicitly asked.
- Do not ignore the project's style and outline when evaluating the draft.

## Example Invocation

```text
Use $chapter-review to review chapter 7 with focus on tension, clarity, POV control, and the effectiveness of its closing beat.
```
