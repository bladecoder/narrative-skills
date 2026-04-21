---
name: if-load-context
description: Read, validate, and summarize the shared project context for an Ink interactive fiction workspace before map, dialogue, progression, drafting, or playtest skills run.
---

# IF Load Context

## Overview

Use this skill to load the current workspace as an Ink interactive fiction project. It should validate `story.yaml`, identify the current IF workflow stage, and summarize the reliable design, state, and source files that downstream IF skills should use.

## When To Use

Use this skill when:

- the current directory is expected to contain an Ink IF project;
- `story.yaml` or IF design files may be incomplete;
- another IF skill needs grounded context before making changes;
- the user asks for project readiness, status, or next step.

## Files To Read

Always read `story.yaml` and `README.md` when present.

Read these when present and relevant:

- `00_meta/*`
- `01_style/*`
- `02_story/*`
- `03_characters/*`
- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/progression.yaml`
- `04_design/state_model.md`
- `04_design/story_beats.md`
- `04_design/critical_path.md`
- `05_ink/main.ink`
- `05_ink/locations/*`
- `05_ink/dialogues/*`
- `05_ink/systems/*`
- `06_playtest/*`
- `07_continuity/*`

## Metadata Contract

Treat `story.yaml` as the source of truth. For IF projects, preserve or normalize these fields when enough evidence exists:

```yaml
project:
  format: "interactive_fiction_ink"
interactive:
  engine: "ink"
  entrypoint: "05_ink/main.ink"
  navigation_model: "free_2d_map"
  conversation_model: "free_order_dialogues"
workflow:
  next_skill: ""
```

## Language Rules

- Skill instructions and canonical filenames stay in English.
- YAML keys stay in English.
- Human-readable project content must be written in `story.language`.
- If `story.language` is missing, treat it as blocking for content-writing skills.

## Procedure

1. Confirm whether the workspace is initialized as an IF Ink project.
2. Validate shared metadata, especially `project.format`, `interactive.engine`, `story.language`, and `workflow.next_skill`.
3. Identify which IF artifacts exist and which are still missing.
4. Cross-check obvious consistency between design files and Ink source files.
5. Report the reliable context, missing blockers, and recommended next IF skill.

## Output

Provide:

- project validity and workflow stage;
- selected story language;
- current map, dialogue, progression, and Ink source status;
- missing or inconsistent files;
- recommended next skill.

## Restrictions

- Do not rewrite creative content just to tidy context.
- Do not invent missing design facts.
- Do not treat optional incomplete files as blockers unless a downstream skill needs them.
