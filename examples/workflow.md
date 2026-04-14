# Example Workflow For Creating a Story With N Chapters

This example shows a practical end-to-end workflow for creating a story project with this repository's skills.

The workflow assumes:

- the user wants to build a story project from scratch;
- the story will have `N` chapters;
- the agent will persist work in files instead of relying on chat context alone;
- `02_story/chapter_list.md` is the canonical chapter-level outline before individual chapter plan files are created.

## 1. Initialize the project

The user runs `init-story-project` with the initial briefing.

The user provides:

- provisional title;
- genre and subgenre;
- story language;
- audience;
- estimated length;
- tone;
- narrative voice;
- POV;
- tense;
- premise;
- themes;
- constraints or preferences.

The agent creates or normalizes the base project structure and persists the minimum briefing in files such as:

- `story.yaml`
- `README.md`
- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`
- the canonical folder structure under `01_style/`, `02_story/`, `03_characters/`, `04_outline/`, `05_draft/`, `06_review/`, `07_continuity/`, and `08_exports/`

At the end of this step, the project exists on disk and `story.yaml` becomes the shared source of truth for metadata.

## 2. Review the persisted briefing

The user reviews the files created during initialization.

The user checks:

- whether `story.yaml` reflects the intended language, tone, POV, and workflow state;
- whether the premise in `00_meta/premise.md` is correct;
- whether `00_meta/goals.md` and `00_meta/constraints.md` capture the intended scope and restrictions.

The agent updates those files if the user requests corrections.

This review matters because later skills will read the persisted files, not the earlier chat alone.

## 3. Define the style bible

The user runs `define-style-bible`.

The user provides any missing stylistic preferences, such as:

- prose density;
- rhythm;
- degree of lyricism;
- dialogue preferences;
- taboo elements;
- lexical constraints.

The agent writes or updates the style files in `01_style/`, including:

- `voice.md`
- `prose_rules.md`
- `pov.md`
- `taboo_list.md`
- `lexical_notes.md`

At the end of this step, the project has an explicit writing standard that later drafting and review steps can follow.

## 4. Create the character bible

The user runs `create-character-bible`.

The user provides the known cast or asks the agent to help shape it.

The user should at minimum clarify:

- the protagonist;
- important supporting characters;
- key relationships;
- any critical backstory constraints.

The agent writes or updates the files under `03_characters/`, such as:

- `protagonist.md`
- `supporting_cast.md`
- `relationships.md`

At the end of this step, the story has a stable cast model that the outline and chapter plans can rely on.

## 5. Build the high-level outline

The user runs `generate-high-level-outline`.

The user provides any structural preferences that materially affect the story, such as:

- target chapter count;
- expected ending shape;
- required beats;
- pacing expectations.

The agent writes or updates:

- `04_outline/act_1.md`
- `04_outline/act_2.md`
- `04_outline/act_3.md`
- `02_story/chapter_list.md`

`02_story/chapter_list.md` is the key file at this stage. It gives each chapter a real dramatic job before any chapter-specific plan file exists.

For a project with `N` chapters, `chapter_list.md` should describe chapters `1` through `N`, including:

- chapter number;
- optional working title;
- POV;
- dramatic purpose;
- summary;
- change produced by the chapter.

## 6. Review the chapter list before drafting

The user reviews `02_story/chapter_list.md` and the act files.

The user checks:

- whether each chapter has a meaningful function;
- whether the story escalates properly from beginning to end;
- whether the chapter count still feels right;
- whether any chapter appears redundant, weak, or misplaced.

The agent updates the outline files if the user requests structural changes.

This is the main checkpoint for changing the story shape before the chapter-by-chapter production loop begins.

## 7. Repeat the chapter workflow for each chapter from 1 to N

For each chapter `X`, the user and the agent repeat the same sequence.

### 7.1 Plan chapter X

The user runs `plan-chapter` for chapter `X`.

The user identifies the target chapter and may provide extra guidance for that chapter if needed.

The agent reads the persisted context, especially:

- `story.yaml`
- `02_story/chapter_list.md`
- the act files in `04_outline/`
- relevant character files
- relevant continuity and timeline files
- nearby draft chapters when they exist

The agent then creates or updates the chapter plan, usually in:

- `04_outline/chapter_XX.plan.md`

The chapter plan should make explicit:

- narrative objective;
- point of departure;
- point of arrival;
- POV;
- main conflict;
- beats or scenes;
- emotional progression;
- revealed information;
- continuity watchpoints;
- style reminders.

### 7.2 Review the plan for chapter X

The user reviews the chapter plan before prose drafting starts.

The user checks:

- whether the beginning and ending are correct;
- whether the beats are in the right order;
- whether the chapter does the intended job from `chapter_list.md`;
- whether any important reveal, conflict, or emotional turn is missing.

The agent updates the plan if the user requests changes.

This is the cheapest place to fix structural problems for a chapter.

### 7.3 Draft chapter X

The user runs `draft-chapter` for chapter `X`.

The user may provide target length or any final drafting emphasis for that chapter.

The agent writes or updates:

- `05_draft/chapter_XX.md`

The agent drafts the prose using the chapter plan, style bible, character files, outline, and continuity state as the working context.

### 7.4 Review chapter X

The user runs `chapter-review` for chapter `X`.

The user may specify a review focus, such as tension, clarity, pacing, dialogue, or POV control.

The agent writes or updates:

- `06_review/chapter_XX.review.md`

The review should clarify:

- what works;
- the major problems;
- the secondary problems;
- any detected continuity risks;
- the recommended next action.

### 7.5 Revise chapter X if needed

If the review shows that the chapter is not yet acceptable, the user runs `rewrite-chapter` for chapter `X`.

The agent revises the chapter using the review artifact and the existing project context.

The result should be a chapter that better matches:

- the intended outline;
- the chapter plan;
- the style rules;
- the character logic;
- the continuity constraints.

If the review reveals that the problem is actually structural, the user may return to `plan-chapter` before drafting again.

### 7.6 Sync project state after chapter X is accepted

Once chapter `X` is stable, the user runs the synchronization skills:

- `continuity-check`
- `update-character-state`
- `update-timeline`
- `sync-story-bible`

The agent updates the project state so later chapters inherit correct information.

Depending on what happened in the chapter, the agent may update:

- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`
- `02_story/chapter_list.md`
- `02_story/open_loops.md`
- `02_story/timeline.md`
- `story.yaml`

At the end of this step, chapter `X` is part of the stable project state and chapter `X + 1` can be planned from persisted context instead of memory.

## 8. Continue until chapter N is complete

The user repeats the chapter workflow until all chapters from `1` to `N` have been planned, drafted, reviewed, revised when necessary, and synchronized back into the project files.

In practice, the stable production loop is:

1. `plan-chapter`
2. user review of the plan
3. `draft-chapter`
4. `chapter-review`
5. optional `rewrite-chapter`
6. `continuity-check`
7. `update-character-state`
8. `update-timeline`
9. `sync-story-bible`

## 9. Run manuscript-level and export steps if needed

After all chapters are complete, the user may continue with later-stage skills such as:

- `manuscript-review`
- `beta-reader-pass`
- `prepare-export`
- `build-distribution`

The agent then works from the accumulated project files rather than isolated chapter drafts.

## Practical ownership summary

The user is mainly responsible for:

- setting the creative direction;
- validating key story decisions;
- approving or correcting persisted project state;
- deciding when a chapter is good enough to move forward.

The agent is mainly responsible for:

- creating and updating the project files;
- translating the user's intent into structured artifacts;
- keeping chapter plans, drafts, reviews, and continuity records aligned;
- making the story state reusable across the whole project.

## Core idea

The workflow works best when the user and the agent treat the repository files as the real project memory.

The agent should not rely on temporary chat context when the information should live in:

- `story.yaml`
- `01_style/`
- `02_story/chapter_list.md`
- `03_characters/`
- `04_outline/`
- `05_draft/`
- `06_review/`
- `07_continuity/`

That file-based approach is what allows a long story with `N` chapters to remain coherent over time.
