---
name: manuscript-review
description: Review a partial or full manuscript across multiple chapters once enough draft material exists to judge cumulative structure, pacing, character arcs, thematic coherence, and chapter-to-chapter flow.
---

# Manuscript Review

## Overview

Use this skill to perform an editorial review at manuscript level rather than chapter level. It should evaluate the cumulative reading experience across several chapters, identify systemic problems, and produce a review artifact that helps decide whether to continue drafting, revise specific chapters, or restructure part of the book.

## When To Use

Use this skill when:

- several drafted chapters already exist;
- the project needs a higher-level review than `chapter-review`;
- pacing, escalation, arc progression, or thematic coherence must be assessed across chapters;
- the user wants to know whether the manuscript is accumulating effectively;
- local chapter quality is not enough to determine whether the book is working globally.

Do not use this skill for isolated chapter feedback. Use `chapter-review` for that.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- the chapter range or manuscript scope to review;
- draft chapters in scope;
- chapter reviews and revisions if they affect interpretation;
- outline and chapter list;
- core style and character files;
- continuity and open-loop records when they affect cumulative judgment.

Ask questions only when the manuscript scope or review focus is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- all draft chapters in scope from `05_draft/`
- `02_story/chapter_list.md`

Read these when present and relevant:

- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`
- `01_style/*`
- `03_characters/*`
- `04_outline/*`
- `06_review/chapter_*.review.md`
- `06_review/chapter_*.revision.md`
- `02_story/open_loops.md`
- `02_story/synopsis.md`
- `07_continuity/*`

## Files To Write

Write or update:

- `06_review/manuscript.review.md`

If the project already distinguishes manuscript review snapshots by scope or date, follow that pattern instead of overwriting blindly.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing the manuscript review.
- Keep file and folder names in English.
- Write the review content in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If `story.language` is missing, gather it before writing.
- If the review file uses a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the manuscript material in scope in sequence, not as isolated excerpts.
2. Reconstruct the intended story route from the premise, chapter list, outline, and existing review artifacts.
3. Evaluate the manuscript across cumulative dimensions such as:
   - hook and narrative promise;
   - escalation and pacing;
   - chapter-to-chapter propulsion;
   - coherence of character arcs;
   - thematic reinforcement;
   - exposition management;
   - clarity of stakes;
   - tonal consistency;
   - open-loop handling;
   - structural alignment between draft and outline.
4. Distinguish between:
   - systemic problems affecting many chapters;
   - local problems best fixed chapter by chapter;
   - strengths that should be protected during revision.
5. Prioritize the minimum revision strategy that materially improves the manuscript.
6. Recommend whether the next move should be:
   - keep drafting;
   - rewrite specific chapters;
   - re-plan a section;
   - perform continuity or state sync before proceeding.

## Output Requirements

The manuscript review should include:

1. scope reviewed;
2. overall assessment;
3. what is working at manuscript level;
4. major systemic problems;
5. secondary or local issues;
6. structural and pacing observations;
7. character-arc observations;
8. continuity or coherence risks at manuscript level;
9. prioritized next actions.

The review should favor actionable synthesis over chapter-by-chapter repetition.

## Quality Bar

The resulting review should allow another agent or editor to answer:

- whether the manuscript is accumulating effectively;
- which problems are structural rather than local;
- what strengths should not be damaged by revision;
- what the next highest-leverage intervention is.

## Output

After running the skill, provide:

- a short summary of the manuscript-level verdict;
- the main systemic risks found;
- whether the manuscript should continue drafting or pause for revision;
- the recommended next step.

## Definition Of Done

This skill is done when:

- `06_review/manuscript.review.md` exists and is useful;
- systemic and local issues are clearly separated;
- recommendations are concrete enough to drive the next workflow step;
- the review respects `story.language`;
- the manuscript's global state is clearer than before the review.

## Restrictions

- Do not reduce the review to a pile of chapter summaries.
- Do not rewrite the manuscript here.
- Do not make structure recommendations that contradict the documented project intent without stating the conflict.
- Do not ignore accepted chapter revisions when judging current state.

## Example Invocation

```text
Use $manuscript-review to review the current manuscript across chapters 1 to 8, focusing on escalation, cumulative tension, and whether the protagonist's arc is developing cleanly.
```
