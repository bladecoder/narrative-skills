---
name: sync-story-bible
description: Synchronize story-level planning files and workflow metadata after chapter revisions and continuity updates, so chapter status, open loops, and project-level summaries stay aligned with the actual manuscript state.
---

# Sync Story Bible

## Overview

Use this skill to keep the story bible aligned with the latest accepted chapter state. It should synchronize chapter statuses, open loops, workflow metadata, and other story-level files after revisions and continuity updates have already settled the local chapter changes.

## When To Use

Use this skill when:

- a chapter has been drafted, reviewed, revised, and stabilized;
- the story-level files lag behind the actual manuscript state;
- chapter status tracking needs to be updated;
- open loops or synopsis-level summaries need to reflect accepted changes.

Do not use this skill to rewrite chapters or redefine the style bible.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- latest stable chapter artifacts;
- chapter list and open loops;
- relevant review and continuity artifacts;
- synopsis or higher-level story files if the accepted change propagates upward.

Ask questions only when the affected chapter scope is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- `02_story/chapter_list.md`
- `02_story/open_loops.md`

Read these when present and relevant:

- target chapter files in `05_draft/`
- `06_review/chapter_XX.review.md`
- `06_review/chapter_XX.revision.md`
- `07_continuity/*`
- `02_story/synopsis.md`
- `02_story/logline.md`
- `04_outline/*`

## Files To Write

Write or update as needed:

- `02_story/chapter_list.md`
- `02_story/open_loops.md`
- `story.yaml`

Optionally update:

- `02_story/synopsis.md`
- `02_story/logline.md`

Only update synopsis or logline when accepted chapter changes materially alter the story-level understanding.

## Chapter Status Convention

`02_story/chapter_list.md` may include an optional status field per chapter:

- `planned`
- `drafted`
- `reviewed`
- `revised`

If the project already uses another clear status convention, preserve it rather than forcing a rewrite.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before updating markdown story files.
- Keep file and folder names in English.
- Write markdown content in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- Keep YAML keys in English.
- Preserve the established value-language pattern in `story.yaml` unless a deliberate migration is requested.

## Procedure

1. Read the latest stable chapter artifacts and determine what is now accepted state.
2. Update the chapter entry in `02_story/chapter_list.md` so its summary and status match the accepted draft state.
3. Update `02_story/open_loops.md`:
   - add newly opened threads;
   - advance threads touched by the chapter;
   - mark threads resolved only when the draft actually resolves them.
4. Update `story.yaml` workflow metadata so `project.status` and `workflow.next_skill` reflect the current state.
5. Update synopsis or logline only if the accepted changes materially alter the higher-level story promise or route.
6. Avoid broad rewrites. This skill should consolidate accepted changes, not reopen creative decisions.

## Output Requirements

The sync should make it easy to answer:

- which chapters are only planned, drafted, reviewed, or revised;
- which open loops remain active;
- what the next workflow step is;
- whether any higher-level summary changed.

## Output

After running the skill, provide:

- a short summary of the synchronized files;
- the chapter status changes applied;
- open loops added, advanced, or resolved;
- the recommended next step, usually `plan-chapter` for the next chapter.

## Definition Of Done

This skill is done when:

- chapter-level accepted changes are reflected in story-level files;
- `story.yaml` points to the correct next workflow step;
- `open_loops.md` and chapter statuses are current;
- no unnecessary story-level rewrites were introduced.

## Restrictions

- Do not rewrite the manuscript here.
- Do not modify the style bible or character bible unless explicitly asked.
- Do not mark a thread resolved if the text only suggests resolution.
- Do not promote unaccepted review ideas into the official story bible.

## Example Invocation

```text
Use $sync-story-bible to update chapter status, open loops, and workflow metadata after the chapter 2 revision and continuity sync.
```
