---
name: beta-reader-pass
description: Simulate a beta-reader style pass over a partial or full manuscript once enough draft material exists to judge reader engagement, confusion, emotional investment, payoff, and perceived pacing.
---

# Beta Reader Pass

## Overview

Use this skill to assess the manuscript from a reader-experience perspective rather than a strictly editorial or structural one. It should capture where a plausible engaged reader gets hooked, confused, impatient, emotionally invested, or disappointed, and leave a review artifact that complements rather than duplicates `manuscript-review`.

## When To Use

Use this skill when:

- several drafted chapters already exist;
- the project needs feedback on readability and reader response, not only craft logic;
- the user wants to know where the manuscript feels slow, gripping, opaque, moving, or frustrating;
- the manuscript has enough continuity to simulate a real reading experience.

Do not use this skill as a replacement for `chapter-review` or `manuscript-review`. It should add reader-level perception, not replace editorial analysis.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- the manuscript scope to read;
- draft chapters in scope;
- high-level story intent from premise or synopsis;
- manuscript-level review if it exists, to avoid redundant conclusions while still keeping a reader lens.

Ask questions only when the reading scope or target audience is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- all draft chapters in scope from `05_draft/`

Read these when present and relevant:

- `00_meta/premise.md`
- `00_meta/goals.md`
- `02_story/synopsis.md`
- `02_story/chapter_list.md`
- `06_review/manuscript.review.md`
- `06_review/chapter_*.review.md`

Do not over-read internal planning files unless needed to understand intended audience or promise. This is a reader-experience pass, not a planning audit.

## Files To Write

Write or update:

- `06_review/beta_reader_pass.md`

If the project already uses a different naming convention for external-reader style notes, follow it consistently.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing the beta-reader report.
- Keep file and folder names in English.
- Write the report in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If `story.language` is missing, gather it before writing.
- If the report file uses a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Reader Lens

This skill should emulate an attentive beta reader, not a line editor or theorist.

Prioritize questions like:

- Did the opening make me want to continue?
- Where did I feel most engaged?
- Where did I feel distance, drag, or confusion?
- Which characters did I care about and why?
- Which mysteries felt intriguing versus merely withheld?
- Which moments felt satisfying or underpowered?
- Would I keep reading, and what would I most want next?

## Procedure

1. Read the manuscript material in order as a reader would.
2. Track reader-response signals such as:
   - immediate hook;
   - momentum;
   - curiosity;
   - confusion;
   - emotional investment;
   - trust in the narrative;
   - payoff expectation.
3. Note where reader confusion is productive mystery versus unhelpful opacity.
4. Identify which scenes, characters, or threads generate the strongest pull.
5. Identify where pace sags, repetition accumulates, or stakes feel abstract.
6. Write findings in a voice appropriate to a serious beta-reading pass: concrete, experiential, and still useful to revise from.

## Output Requirements

The beta-reader report should include:

1. scope read;
2. overall reading experience;
3. what made the reader want to continue;
4. where attention or trust weakened;
5. which characters or relationships felt most compelling;
6. where confusion felt useful versus frustrating;
7. where pacing felt strong or slow;
8. what the reader most wants next;
9. prioritized takeaways for revision.

The report should be grounded in reading experience, not only in craft terminology.

## Quality Bar

The resulting report should allow the author or another agent to answer:

- what the manuscript feels like to read right now;
- where interest rises or drops;
- which mysteries are working;
- which elements create emotional traction;
- what would most improve reader experience next.

## Output

After running the skill, provide:

- a short summary of the reader-response verdict;
- the top engagement and confusion findings;
- whether the manuscript feels compelling enough to continue as-is;
- the recommended next step.

## Definition Of Done

This skill is done when:

- `06_review/beta_reader_pass.md` exists and is useful;
- the report reflects a reader-response lens rather than duplicating editorial review;
- productive mystery and frustrating confusion are clearly separated;
- the report respects `story.language`;
- the team can act on the reading-experience findings.

## Restrictions

- Do not turn this into a chapter-by-chapter craft report.
- Do not rewrite the manuscript here.
- Do not pretend to be a generic market authority; stay grounded in the text and likely reader response.
- Do not ignore the intended audience when judging readability or payoff.

## Example Invocation

```text
Use $beta-reader-pass to read the current manuscript as an engaged first-time reader and report where curiosity, confusion, and emotional investment are strongest or weakest.
```
