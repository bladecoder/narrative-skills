---
name: continuity-check
description: Detect continuity problems, canon drift, and unresolved factual inconsistencies across one or more drafted chapters, then update continuity records carefully without inventing certainty where the text is ambiguous.
---

# Continuity Check

## Overview

Use this skill to compare draft text against the project's stored canon and continuity records. It should detect contradictions, separate them from mere ambiguity, and update the continuity files only when the narrative evidence is strong enough to justify doing so.

## When To Use

Use this skill when:

- a new chapter has been drafted;
- important rewrites may have changed canon-relevant facts;
- the user suspects contradictions or canon drift;
- several chapters are accumulating and consistency risk is rising;
- the project needs continuity records updated before more drafting.

Do not use this skill as a substitute for editorial review. Its job is factual and structural consistency across the project.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- the chapter or chapter range to inspect;
- draft chapters in scope;
- continuity YAML files;
- relevant character, location, timeline, or worldbuilding files;
- outline context when unresolved threads or promises matter.

Ask questions only when the review scope or desired update behavior is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- the target chapter or chapters in `05_draft/`

Read these when present and relevant:

- `03_characters/*`
- `02_story/timeline.md`
- `02_story/worldbuilding.md`
- `02_story/open_loops.md`
- `02_story/chapter_list.md`
- `04_outline/*`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

## Files To Write

Write or update as needed:

- `06_review/chapter_XX.review.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

If the continuity check covers several chapters, it may also create or update a broader review note if the project already uses one.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing narrative review notes.
- Keep file and folder names in English.
- Write markdown review notes in the selected story language.
- Keep YAML keys in English.
- If `story.language` is missing, gather it before writing narrative review notes.

## Classification Rules

Every finding should be classified as one of these:

- real contradiction: the text conflicts with established canon or with another chapter;
- ambiguity: the text is unclear, but not conclusively inconsistent;
- new canon fact: the chapter introduces a new fact that should be recorded;
- open thread update: the chapter opens, advances, resolves, or reframes an unresolved thread.

Do not collapse these categories into a single undifferentiated error list.

## Procedure

1. Read the target chapter or chapter range and extract canon-relevant facts.
2. Compare those facts against existing continuity files and relevant story documents.
3. Check for inconsistencies in areas such as:
   - chronology;
   - injuries and physical state;
   - locations and travel logic;
   - character knowledge;
   - world rules;
   - objects and possessions;
   - relationships and loyalties;
   - unresolved promises or threads.
4. Classify each finding as contradiction, ambiguity, new canon fact, or open-thread update.
5. Update continuity YAML files only when the text provides strong enough support.
6. If evidence is weak or conflicting, leave the uncertainty visible instead of hard-coding a false fact.
7. Add a continuity section to the chapter review file when useful and when the project workflow benefits from keeping chapter-specific findings close to the draft.

## Update Rules For Continuity Files

When updating YAML files:

- preserve existing valid data unless the new text clearly supersedes it;
- prefer additive updates over destructive rewrites;
- record uncertainty explicitly when the project already has a pattern for provisional facts;
- avoid inventing normalized data that the story never states.

Typical targets:

- `canon_facts.yaml` for stable factual statements;
- `entities.yaml` for people, organizations, objects, and other named entities;
- `locations.yaml` for place facts and spatial constraints;
- `unresolved_threads.yaml` for open promises, mysteries, and obligations.

## Output Requirements

The output should include:

- scope reviewed;
- contradictions found;
- ambiguities found;
- new canon facts recorded;
- unresolved thread changes;
- recommended corrections or follow-up actions.

If a chapter-specific review file is updated, the continuity findings should be concise and actionable rather than repetitive.

## Quality Bar

The resulting continuity check should allow another agent or editor to answer:

- what facts are now considered stable canon;
- which issues are true contradictions versus just unclear writing;
- what continuity records changed;
- what still needs manual attention before more drafting.

## Output

After running the skill, provide:

- a short summary of the continuity check;
- the main contradictions or ambiguities detected;
- which continuity files were updated;
- the recommended next step, usually a targeted draft fix or the next chapter workflow step.

## Definition Of Done

This skill is done when:

- the requested scope has been checked against stored canon;
- contradictions, ambiguities, and new facts are clearly separated;
- the continuity YAML files are updated where justified;
- any review notes respect `story.language`;
- the project's continuity state is more reliable than before the check.

## Restrictions

- Do not invent facts just to complete YAML entries.
- Do not overwrite established canon without clear textual support.
- Do not treat ambiguity as confirmed contradiction.
- Do not ignore open narrative promises that affect future chapters.

## Example Invocation

```text
Use $continuity-check to review chapters 6 and 7, detect contradictions in timeline and character knowledge, and update the canon files where the text is clear enough.
```
