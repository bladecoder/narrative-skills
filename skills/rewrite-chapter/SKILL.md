---
name: rewrite-chapter
description: Revise an existing chapter draft using its review feedback, style bible, chapter plan, and continuity constraints when the chapter needs a real rewrite instead of a fresh draft or a high-level plan.
---

# Rewrite Chapter

## Overview

Use this skill to rewrite a drafted chapter after editorial feedback. It should produce a stronger chapter draft while leaving a separate revision artifact that explains which review findings were applied, deferred, or left unresolved.

## When To Use

Use this skill when:

- a chapter draft already exists;
- a chapter review identifies issues that require rewriting rather than minor line edits;
- the chapter needs to absorb feedback without re-planning the whole manuscript;
- the user wants a revised chapter plus a traceable record of changes.

Do not use this skill to create a first draft from scratch. Use `draft-chapter` for that.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- target chapter number;
- existing chapter draft;
- chapter review;
- chapter plan or outline context;
- style and continuity constraints;
- adjacent chapter context only when needed for transitions.

Ask questions only when the target chapter or review scope is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- `05_draft/chapter_XX.md`
- `06_review/chapter_XX.review.md`
- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`

Read these when present and relevant:

- `01_style/taboo_list.md`
- `01_style/lexical_notes.md`
- `04_outline/chapter_XX.plan.md`
- `02_story/chapter_list.md`
- relevant files under `03_characters/`
- adjacent chapters in `05_draft/`
- `07_continuity/*`

## Files To Write

Write or update:

- `05_draft/chapter_XX.md`
- `06_review/chapter_XX.revision.md`

The revision note must remain separate from the chapter body.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before rewriting.
- Keep file and folder names in English.
- Write the chapter body and revision note in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If `story.language` is missing, gather it before writing.
- If the target files use a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the current chapter and its review completely before rewriting.
2. Classify the review findings into:
   - must apply now;
   - can defer safely;
   - conflicts with canon, outline, or other accepted constraints.
3. Read the minimum surrounding context needed to preserve continuity and chapter-to-chapter flow.
4. Rewrite the chapter so that the accepted feedback is reflected in the narrative itself, not in commentary.
5. Preserve the project voice, POV, tense, and canon boundaries.
6. If a review point would require changing the story beyond the chapter's remit, defer it explicitly instead of improvising a larger fix.
7. Write a revision artifact that records what changed.

## Output Requirements

### Revised Chapter

`05_draft/chapter_XX.md` should contain only:

- chapter heading or identifier consistent with project convention;
- the revised narrative text;
- optional minimal metadata only if already used by the project.

### Revision Artifact

`06_review/chapter_XX.revision.md` should include:

- short summary of the revision pass;
- review findings applied;
- findings deferred;
- findings rejected due to conflict with canon or structure;
- continuity or structural risks that remain;
- recommended next skill.

## Quality Bar

The revised chapter should make it clear that:

- the key review issues were addressed inside the prose;
- the chapter remains aligned with style and continuity;
- no hidden structural rewrite happened without being documented;
- another agent can continue from the new state without ambiguity.

## Output

After running the skill, provide:

- a short summary of the rewrite;
- the most important changes applied;
- any findings explicitly deferred;
- the recommended next step, usually `continuity-check` or `update-character-state`.

## Definition Of Done

This skill is done when:

- the chapter draft has been revised;
- a separate revision note exists;
- the rewrite respects `story.language`;
- the rewritten chapter is cleaner without breaking canon or outline;
- deferred issues are explicit rather than silently ignored.

## Restrictions

- Do not place editorial notes inside the chapter body.
- Do not turn a chapter rewrite into a full-book rewrite.
- Do not resolve review comments by inventing canon-breaking shortcuts.
- Do not discard the existing draft's useful material without reason.

## Example Invocation

```text
Use $rewrite-chapter to revise chapter 2 from its review feedback, preserving the current tone and continuity while tightening the scene logic.
```
