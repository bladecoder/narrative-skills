---
name: plan-chapter
description: Prepare a detailed operational plan for a specific chapter once the project already has enough outline, character, style, and continuity context to support disciplined drafting.
---

# Plan Chapter

## Overview

Use this skill to translate the high-level outline into a chapter-ready plan. It should define the chapter's narrative job, scene beats, emotional movement, and continuity risks clearly enough that another agent can draft the chapter without reinterpreting the whole novel.

## When To Use

Use this skill when:

- the project already has a usable outline;
- the user wants to prepare a specific chapter before drafting;
- a chapter needs tighter scene logic, emotional arc, or continuity grounding;
- the agent must convert chapter intent into concrete beats;
- a draft is likely to drift unless the chapter is planned more rigorously.

Do not use this skill to write the full chapter unless the user explicitly asks for drafting instead.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- the target chapter number;
- the high-level outline and chapter list;
- relevant character and relationship files;
- style bible and POV constraints;
- previous chapter drafts or summaries when they affect state;
- continuity records if they exist.

Ask questions only when the target chapter or its intended function is genuinely unclear.

## Files To Read

Always read:

- `story.yaml`
- `02_story/chapter_list.md`

Read these when present and relevant:

- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`
- `03_characters/*`
- `04_outline/act_1.md`
- `04_outline/act_2.md`
- `04_outline/act_3.md`
- relevant previous chapters in `05_draft/`
- `02_story/timeline.md`
- `02_story/open_loops.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

## Files To Write

Prefer writing or updating one of these:

- `04_outline/chapter_XX.plan.md`
- `05_draft/chapter_XX.md`

Preferred convention:

- if a separate plan file exists or the project favors clear separation, use `04_outline/chapter_XX.plan.md`;
- if the project keeps planning notes at the top of the draft file, update `05_draft/chapter_XX.md` with a clear planning section and no prose draft yet.

Be consistent with existing project convention when one already exists.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing planning files.
- Keep file and folder names in English.
- Write markdown content in the selected story language.
- If `story.language` is missing, gather it before writing.
- If the relevant planning file is in a different language than `story.language`, flag the mismatch and resolve it deliberately.

## Procedure

1. Read the chapter list and locate the target chapter's intended role.
2. Read the minimum surrounding context needed to understand:
   - where the chapter begins;
   - where it must end;
   - what the characters know and feel at this point;
   - which continuity constraints apply.
3. Define the chapter's core narrative job:
   - plot advancement;
   - character development;
   - revelation;
   - reversal;
   - escalation.
4. Choose the chapter POV and verify it matches the style and outline rules.
5. Break the chapter into scenes or beats with clear causal progression.
6. Track the chapter's emotional movement and end-state change.
7. Note any continuity risks, timeline dependencies, or unresolved threads affected by this chapter.
8. Leave a drafting checklist that reduces the chance of drifting from style or canon.

## Output Requirements

The chapter plan must include at minimum:

- chapter identifier;
- narrative objective;
- point of departure;
- point of arrival;
- chapter POV;
- main conflict;
- scene or beat list in sequence;
- emotional progression;
- new information revealed;
- continuity risks or watchpoints;
- style reminders specific to this chapter.

## Quality Bar

The chapter plan should enable another agent to answer consistently:

- why this chapter exists;
- what must happen and what must not happen;
- how the chapter should escalate or turn;
- which character state changes matter;
- what continuity hazards need attention while drafting.

## Output

After running the skill, provide:

- a short summary of the chapter plan created or updated;
- the chapter's core dramatic function;
- the main continuity or structural risks detected;
- the recommended next step, usually `draft-chapter`.

## Definition Of Done

This skill is done when:

- a usable chapter plan exists in the project files;
- the plan is specific enough to draft from directly;
- style, POV, and continuity constraints are reflected in the plan;
- the plan respects `story.language`;
- the chapter's beginning, ending, and change are explicit.

## Restrictions

- Do not draft the full narrative chapter here unless explicitly asked.
- Do not ignore previous chapter state.
- Do not introduce large outline changes silently.
- Do not leave the plan so vague that drafting would require re-planning the chapter.

## Example Invocation

```text
Use $plan-chapter to prepare chapter 7 as a tense confrontation chapter, with a clear beat structure, one POV, and explicit continuity watchpoints.
```
