# Project Contract And Routing

Read this reference for initialization, status detection, metadata migration, or recovery from an inconsistent project.

## Canonical Structure

Use the existing project layout and create only files useful to the project:

```text
story.yaml
README.md
00_meta/       premise, goals, constraints
01_style/      voice, prose rules, POV, taboos, lexical notes
02_story/      logline, synopsis, themes, worldbuilding, timeline, chapter list, open loops
03_characters/ protagonist, supporting cast, relationships
04_outline/    act or structural outlines and chapter plans
05_draft/      manuscript chapters
06_review/     chapter, manuscript, and beta-reader reviews
07_continuity/ canon facts, entities, locations, unresolved threads
08_exports/    export package and distribution files
```

Do not create empty placeholder chapters or review files. Seed only the minimum files needed for the next milestone.

## Metadata

Preserve project, story, and narrative fields already in use. Normalize workflow state to:

```yaml
workflow:
  canonical_root: "."
  initialized_at: ""
  stage: "foundations"
  active_target: null
  last_completed_action: "initialize"
  next_action: "define_foundations"
  approval_required: false
```

Valid prose stages are `foundations`, `outline`, `chapter`, `manuscript`, `export`, and `complete`.

Use only these workflow actions: `initialize`, `define_foundations`, `await_foundations_approval`, `outline_story`, `await_outline_approval`, `plan_chapter`, `await_chapter_plan_approval`, `draft_and_review_chapter`, `await_chapter_decision`, `revise_and_review_chapter`, `accept_and_sync_chapter`, `review_manuscript`, `await_manuscript_decision`, `export_manuscript`, and `complete`.

## Legacy Migration

Recognize and replace old workflow values after confirming them against files:

- `load-story-context` and `init-story-project` -> initialization/current-state routing;
- `define-style-bible` and `create-character-bible` -> foundations;
- `generate-high-level-outline` -> outline;
- `plan-chapter`, `draft-chapter`, `chapter-review`, and `rewrite-chapter` -> the corresponding chapter action;
- `continuity-check`, `update-character-state`, `update-timeline`, and `sync-story-bible` -> accept and synchronize;
- `manuscript-review` and `beta-reader-pass` -> manuscript review;
- `prepare-export` and `build-distribution` -> export.

Remove `workflow.next_skill` and `workflow.last_completed_skill` only after writing their normalized replacements. Preserve `project.status`, `initialized_at`, and unrelated custom fields.

## Status Detection

Use metadata as a hint, then verify relevant artifacts. Prefer the most advanced coherent state, not simply the newest file. A plan without a draft awaits plan approval; a draft without a review needs review; review findings without acceptance await a decision; accepted prose with stale continuity needs synchronization.

For `status`, report discrepancies and the inferred next action without normalizing files.

## Initialization

Collect or infer title, format, genre, language, audience, length, premise, tone, voice, POV, tense, themes, and hard constraints. Language is blocking before writing human-facing templates. Preserve useful notes and mark uncertainty as provisional. Finish with `stage: foundations`, `next_action: define_foundations`, and no pending approval.
