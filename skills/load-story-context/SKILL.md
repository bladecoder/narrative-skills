---
name: load-story-context
description: Read, validate, and normalize the shared metadata and core project context for the current story workspace before other story-writing skills run, especially when files are incomplete, inconsistent, or partially missing.
---

# Load Story Context

## Overview

Use this skill to load the current story project as a coherent working context. It should inspect `story.yaml`, normalize essential metadata, identify missing or inconsistent files, and summarize the minimum reliable context that downstream skills should use.

## When To Use

Use this skill when:

- the current directory is expected to be a story project;
- `story.yaml` exists but may be incomplete or inconsistent;
- multiple project files exist and the agent needs a clean shared context before planning, drafting, or reviewing;
- the user wants to audit project readiness;
- a downstream skill would otherwise need to re-discover basic metadata from scratch.

This skill is especially useful before `define-style-bible`, `create-character-bible`, `generate-high-level-outline`, `plan-chapter`, `draft-chapter`, `chapter-review`, or `continuity-check`.

## Required Inputs

Gather or infer these inputs:

- `story.yaml`;
- root project files and folders;
- key story files that help confirm current state;
- existing workflow status if present.

Ask questions only when essential metadata is missing and cannot be inferred safely.

## Files To Read

Always read:

- `story.yaml` when present;
- `README.md` when present.

Read these when present and useful for state detection:

- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`
- `01_style/*`
- `02_story/*`
- `03_characters/*`
- `04_outline/*`
- `05_draft/*`
- `06_review/*`
- `07_continuity/*`

Do not load everything blindly if only a narrow downstream task needs a smaller slice. Prefer a targeted scan after validating the shared metadata.

## Files To Write

Write or update only when useful:

- `story.yaml`
- optionally `README.md` if the project summary is clearly stale and the workflow calls for a refresh

This skill should be conservative. Its main output is normalized metadata and a reliable context summary, not broad content generation.

## Metadata Contract

Treat `story.yaml` as the project's source of truth for shared metadata. At minimum, preserve or normalize:

```yaml
project:
  title: ""
  format: "novel"
  status: ""

story:
  genre: ""
  subgenre: ""
  language: ""
  audience: ""
  estimated_length: ""
  premise_status: ""

narrative:
  tone: ""
  voice: ""
  pov: ""
  tense: ""

workflow:
  canonical_root: "."
  initialized_at: ""
  next_skill: ""
```

Normalization rules:

- YAML keys remain in English;
- missing required sections should be created if enough evidence exists to do so safely;
- existing values should be preserved unless clearly invalid or contradicted by stronger project evidence;
- `story.language` is mandatory for content-writing skills and should be treated as blocking when absent;
- human-readable content and free-text metadata values should use correct orthography and normal Unicode for the selected language;
- `workflow.canonical_root` should remain `"."` for this repository convention.

## Procedure

1. Inspect the current directory and confirm whether it resembles a story project.
2. Read `story.yaml` and validate that required top-level sections exist.
3. Detect missing, empty, contradictory, or stale metadata.
4. Cross-check metadata against obvious evidence from core files such as premise, style, outline, or draft files.
5. Normalize `story.yaml` conservatively:
   - add missing sections or keys;
   - preserve valid existing values;
   - mark uncertain fields as provisional through adjacent status fields or explicit notes when the project pattern supports that.
6. Identify workflow readiness:
   - initialized only;
   - style defined;
   - cast defined;
   - outline ready;
   - chapter planning in progress;
   - drafting underway;
   - review artifacts present;
   - continuity tracking present.
7. Produce a short context summary that downstream skills can rely on.

## Output Requirements

The output should summarize:

- whether the current directory is a valid story project;
- current metadata reliability;
- selected story language;
- current workflow stage;
- missing or inconsistent core files;
- recommended next skill.

If `story.yaml` was changed, state what was normalized.

## Quality Bar

The resulting context load should allow another skill to answer:

- what project it is working on;
- which language to write in;
- what stage the project is in;
- which files are authoritative;
- what important context is still missing.

## Output

After running the skill, provide:

- a short project status summary;
- normalized metadata fields, if any;
- the most important missing or inconsistent items;
- the recommended next step.

## Definition Of Done

This skill is done when:

- the current project has a usable `story.yaml`;
- required shared metadata is present or clearly flagged as missing;
- the current workflow stage is understandable;
- downstream skills can proceed with less ambiguity than before.

## Restrictions

- Do not rewrite creative content just to make metadata look tidy.
- Do not invent missing facts without evidence.
- Do not silently change the project's selected language.
- Do not treat every missing optional file as a blocker.

## Example Invocation

```text
Use $load-story-context to inspect the current story project, normalize story.yaml, and tell me which skill should run next.
```
