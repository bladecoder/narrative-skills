---
name: update-character-state
description: Persist dynamic post-chapter character state into continuity records after a stable draft or rewrite, so later chapters rely on current goals, locations, knowledge, and emotional conditions instead of stale assumptions.
---

# Update Character State

## Overview

Use this skill to update the continuity record for character state after a chapter becomes stable enough to trust. It should capture dynamic, story-relevant state changes without duplicating the full character bible.

## When To Use

Use this skill when:

- a chapter draft or rewrite has settled enough to become reference material;
- character goals, knowledge, location, wounds, or emotional state have changed;
- future chapters risk using stale character assumptions;
- the continuity layer needs to reflect recent narrative developments.

Do not use this skill to write or redesign character biographies. Use `create-character-bible` for foundational character design.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- the chapter or chapter range being stabilized;
- current character bible files;
- `07_continuity/entities.yaml`;
- review and continuity notes if they affect state certainty.

Ask questions only when the scope of the update is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- target chapter or chapters in `05_draft/`
- `07_continuity/entities.yaml`

Read these when present and relevant:

- `03_characters/*`
- `06_review/chapter_XX.review.md`
- `06_review/chapter_XX.revision.md`
- `06_review/manuscript.review.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/unresolved_threads.yaml`

## Files To Write

Write or update:

- `07_continuity/entities.yaml`

## State Schema

For materially active characters, `entities.yaml` should support these dynamic fields in addition to any existing static fields:

- `status`
- `current_location`
- `current_goal`
- `emotional_state`
- `last_updated_in`
- `knowledge_changes`

Use short, operational values. Preserve any existing fields that the project already uses.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before interpreting project content.
- Keep YAML keys in English.
- Write human-readable YAML values in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- If the project already uses another explicit continuity-value convention, preserve it consistently instead of mixing styles.

## Procedure

1. Read the stabilized chapter and extract character changes that are explicit on the page.
2. Compare those changes with the existing character-state entries.
3. Update only the fields that changed materially:
   - where the character is;
   - what the character wants now;
   - what emotional condition dominates;
   - what the character newly knows or stops believing;
   - whether the character is missing, injured, dead, exposed, hiding, or otherwise status-shifted.
4. Preserve static identity information from earlier character files.
5. Do not guess future development from foreshadowing alone.
6. If a change is ambiguous, keep the entry conservative and let `continuity-check` or later chapters resolve it.

## Output Requirements

The update should make it easy to answer for each major active character:

- where they are now;
- what they are trying to do now;
- what emotional state they carry into the next chapter;
- what they newly know or still do not know;
- which chapter last established that state.

## Output

After running the skill, provide:

- a short summary of which characters were updated;
- the most important state changes recorded;
- any ambiguous state changes intentionally left unresolved;
- the recommended next step, usually `update-timeline` or `sync-story-bible`.

## Definition Of Done

This skill is done when:

- `07_continuity/entities.yaml` reflects the latest stable chapter state;
- dynamic state is clearly separated from static character-bible content;
- ambiguous facts were not over-asserted;
- later drafting can rely on the updated state with less guesswork.

## Restrictions

- Do not rewrite the character bible files unless explicitly asked.
- Do not record future assumptions as current fact.
- Do not erase useful existing fields just to enforce a smaller schema.
- Do not update character state from rejected or unimplemented review feedback.

## Example Invocation

```text
Use $update-character-state to persist the post-revision state of the main cast after chapter 2.
```
