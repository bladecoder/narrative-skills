---
name: update-timeline
description: Synchronize timeline and dated continuity facts after a chapter or rewrite becomes stable, so chronology, event order, and location-bound facts remain aligned with the actual draft text.
---

# Update Timeline

## Overview

Use this skill to keep the project's chronology aligned with the manuscript. It should update the timeline and related factual continuity records once a chapter's events are stable enough to treat as reference.

## When To Use

Use this skill when:

- a chapter draft or rewrite is stable;
- the chapter adds, moves, clarifies, or resolves dated events;
- chronology risks drifting across chapters;
- location movement or event sequencing needs to be persisted for later planning.

Do not use this skill to infer a timeline that the story has not actually established.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- chapter or chapter range in scope;
- current `02_story/timeline.md`;
- relevant continuity YAML files;
- location or worldbuilding files if the chapter fixes travel or place facts.

Ask questions only when the scope or temporal frame is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- target chapter or chapters in `05_draft/`
- `02_story/timeline.md`

Read these when present and relevant:

- `06_review/chapter_XX.review.md`
- `06_review/chapter_XX.revision.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/locations.yaml`
- `02_story/chapter_list.md`
- `02_story/worldbuilding.md`
- `04_outline/*`

## Files To Write

Write or update:

- `02_story/timeline.md`
- `07_continuity/canon_facts.yaml`

Update `07_continuity/locations.yaml` only when the chapter establishes new location facts, movement constraints, or presence facts worth preserving.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before updating markdown timeline notes.
- Keep file and folder names in English.
- Write `timeline.md` in the selected story language.
- Keep YAML keys in English.
- Preserve the current language convention of YAML values when the project already uses one consistently.

## Procedure

1. Read the stabilized chapter and extract events with chronological value.
2. Compare those events against the current timeline and canon facts.
3. Add or adjust entries only where the draft provides clear evidence.
4. Preserve the project's existing timeline granularity:
   - day-based if the project uses days;
   - scene-based if the project uses finer markers;
   - historical bullets where only backstory chronology exists.
5. Update `canon_facts.yaml` for stable dated or ordered facts that later skills will need.
6. Update `locations.yaml` only if the chapter fixes a location fact that later chapters could otherwise contradict.
7. Avoid duplicating the same fact in multiple files unless each file serves a distinct workflow purpose.

## Output Requirements

The update should make it easy to answer:

- when the latest chapter events occur;
- what changed in the chronology;
- which facts are newly stable enough to treat as canon;
- whether any temporal ambiguities remain unresolved.

## Output

After running the skill, provide:

- a short summary of the timeline changes;
- the most important new or revised dated facts;
- any chronology ambiguities intentionally left open;
- the recommended next step, usually `sync-story-bible`.

## Definition Of Done

This skill is done when:

- `02_story/timeline.md` reflects the latest stable draft state;
- `canon_facts.yaml` contains the new dated or ordered facts that matter;
- any location updates were applied only where justified;
- the chronology is clearer than before the update.

## Restrictions

- Do not invent dates or ordering that the text does not support.
- Do not rewrite the whole timeline format unless the project explicitly changes convention.
- Do not duplicate every scene beat as a timeline fact.
- Do not promote speculative inference to canon.

## Example Invocation

```text
Use $update-timeline to synchronize the timeline and dated canon after the revised chapter 2 becomes stable.
```
