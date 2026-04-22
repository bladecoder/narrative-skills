# Example Workflow For Creating an Ink Interactive Fiction Story

This example shows a practical end-to-end workflow for creating an exploratory interactive fiction project with this repository's Ink IF skills.

The workflow assumes:

- the user wants to build an Ink interactive fiction project from scratch;
- the game uses free two-dimensional map exploration;
- the player can talk to characters in a flexible order;
- locations, characters, topics, objects, knowledge, and protagonist skills unlock over time;
- the agent persists design and implementation work in files instead of relying on chat context alone;
- `04_design/` is the canonical design layer before Ink files are drafted.

## 1. Initialize the IF project

The user runs `if-init-project` with the initial briefing.

The user provides:

- provisional title;
- genre and subgenre;
- story language;
- audience;
- estimated scope;
- tone;
- narrative voice;
- POV;
- tense;
- playable premise;
- themes;
- constraints or preferences;
- any known locations, characters, obstacles, inventory, knowledge, or protagonist skills.

The agent creates or normalizes the base project structure and persists the minimum briefing in files such as:

- `story.yaml`
- `README.md`
- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`
- the traditional narrative folders under `01_style/`, `02_story/`, and `03_characters/`
- the IF design folders and files under `04_design/`
- the Ink source folder under `05_ink/`
- the playtest folder under `06_playtest/`
- continuity files under `07_continuity/`

At the end of this step, `story.yaml` should identify the project as `interactive_fiction_ink`, with `interactive.engine` set to `ink` and `interactive.entrypoint` set to `05_ink/main.ink`.

## 2. Review the persisted briefing

The user reviews the files created during initialization.

The user checks:

- whether `story.yaml` reflects the intended language, tone, POV, and workflow state;
- whether `00_meta/premise.md` captures the playable premise, not only the literary premise;
- whether `00_meta/goals.md` captures the expected player experience;
- whether `00_meta/constraints.md` captures hard restrictions, such as no combat, no fail states, or no timed puzzles.

The agent updates those files if the user requests corrections.

This review matters because later IF skills will read the persisted files, not the earlier chat alone.

## 3. Define style and cast

The user can reuse the traditional narrative skills before designing the interactive layer.

The usual sequence is:

1. `define-style-bible`
2. `create-character-bible`

The agent writes or updates files such as:

- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`
- `03_characters/protagonist.md`
- `03_characters/supporting_cast.md`
- `03_characters/relationships.md`

At the end of this step, the project has prose rules and a cast model that the IF design skills can rely on.

## 4. Design the playable structure

The user runs `if-design-structure`.

The user provides or confirms:

- the main playable fantasy;
- what the player repeatedly does;
- the rough beginning and ending;
- the intended openness of exploration;
- whether the game should have fail states, soft failure, or only delayed progress;
- any required structural beats.

The agent writes or updates:

- `04_design/story_beats.md`
- `04_design/critical_path.md`
- `04_design/state_model.md`

This step defines the core loop and the broad phase structure. It should prove that the game can work as interactive fiction before detailed map or dialogue work starts.

## 5. Design the map

The user runs `if-design-map`.

The user may provide:

- known locations;
- desired spatial layout;
- locations that must begin locked;
- locations that should become important on revisit;
- atmosphere and worldbuilding constraints.

The agent writes or updates:

- `04_design/map.md`
- `04_design/locations.yaml`
- optionally `07_continuity/locations.yaml`

The map design should describe:

- the starting location;
- major locations;
- connections;
- blocked exits;
- location unlocks;
- discoveries on first visit;
- changes on revisit;
- characters who may appear in each location.

At the end of this step, the project has a navigable spatial model, even if no Ink location code has been written yet.

## 6. Design the dialogue layer

The user runs `if-design-dialogue`.

The user may provide:

- characters the player can talk to;
- what each character knows;
- secrets or lies;
- relationship changes;
- topics that should unlock through exploration;
- topics that should repeat safely.

The agent writes or updates:

- `04_design/dialogue_matrix.md`
- optionally `04_design/state_model.md`
- optionally `03_characters/relationships.md`

The dialogue matrix should clarify:

- where and when characters appear;
- default conversational stance;
- repeatable topics;
- one-time revelations;
- knowledge-gated topics;
- inventory-gated topics;
- relationship or trust changes;
- topics that change after the player resolves obstacles.

At the end of this step, conversations can be planned without assuming a fixed player order.

## 7. Design progression and unlocks

The user runs `if-design-progression`.

The user provides or confirms:

- which obstacles are mandatory;
- which obstacles are optional;
- what counts as knowledge;
- what counts as inventory;
- whether the protagonist can gain skills;
- whether alternate solutions are allowed.

The agent writes or updates:

- `04_design/progression.yaml`
- `04_design/critical_path.md`
- `04_design/state_model.md`

`progression.yaml` is the key file at this stage. It should make locks and unlocks explicit instead of leaving them hidden in prose.

For each obstacle, it should define:

- stable ID;
- obstacle type;
- requirements;
- grants;
- location scope;
- character scope;
- whether it is critical path;
- fallback route;
- status.

## 8. Review the design before writing Ink

The user reviews the files under `04_design/`.

The user checks:

- whether the map is interesting to explore;
- whether the dialogue topics create real investigation or discovery;
- whether the critical path is understandable;
- whether any required clue, object, or skill has no source;
- whether any locked location or topic is decorative rather than meaningful;
- whether the game still fits the intended tone and scope.

The agent updates design files if the user requests changes.

This is the cheapest place to fix structural problems before Ink implementation begins.

## 9. Repeat the Ink slice workflow

The game is then built slice by slice.

A slice can be:

- one location;
- one character dialogue;
- one obstacle;
- a navigation loop;
- an inventory, knowledge, or skill system;
- a phase transition;
- an ending.

For each slice `slice_id`, the user and the agent repeat the same sequence.

### 9.1 Plan the Ink slice

The user runs `if-plan-ink-slice`.

The user identifies the slice to implement, such as:

- `train_station_location`;
- `mara_dialogue`;
- `locked_archive_obstacle`;
- `knowledge_tracking_system`;
- `act_2_unlock_transition`.

The agent reads the relevant project context, especially:

- `story.yaml`
- `04_design/state_model.md`
- `04_design/progression.yaml`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- existing Ink files under `05_ink/`

The agent writes a slice plan under:

- `04_design/slices/<slice_id>.plan.md`

The slice plan should make explicit:

- Ink files expected to change;
- entry and exit knots or stitches;
- state variables read and written;
- choices shown to the player;
- repeat behavior on revisit;
- required includes or tunnels;
- acceptance criteria.

### 9.2 Review the slice plan

The user reviews the slice plan before Ink drafting starts.

The user checks:

- whether the slice covers the intended gameplay;
- whether its state changes match `progression.yaml`;
- whether repeated visits and repeated conversations behave correctly;
- whether the slice reconnects to the navigation or dialogue loop;
- whether the slice is small enough to implement safely.

The agent updates the plan if the user requests changes.

### 9.3 Draft or revise the Ink slice

The user runs `if-draft-ink`.

The agent reads the slice plan and the relevant Ink syntax references through `ink-doc` when needed.

The agent writes or updates files such as:

- `05_ink/main.ink`
- `05_ink/systems/*.ink`
- `05_ink/locations/*.ink`
- `05_ink/dialogues/*.ink`

The agent should preserve the free exploration model. A location or dialogue slice should normally return to the appropriate navigation or conversation loop unless it intentionally ends the story.

### 9.4 Review playability for the slice

The user runs `if-playtest-review`.

The user may specify the scope, such as:

- the whole project so far;
- only the current slice;
- only critical path reachability;
- only dialogue order and repeated choices.

The agent writes or updates:

- `06_playtest/route_matrix.md`
- `06_playtest/playability.review.md`

The review should detect:

- unreachable locations;
- unavailable characters;
- required clues with no route;
- circular dependencies;
- dead-end diverts;
- accidental one-way exits;
- repeated choices that behave incorrectly;
- state variables used in Ink but absent from the state model;
- state variables defined in the design but unused in Ink.

If an Ink compiler such as `inklecate` is available, the agent may use it as an additional verification step. If not, the review can still perform static playability analysis.

### 9.5 Fix the slice if needed

If the review finds blocking or major problems, the user usually returns to one of these skills:

- `if-draft-ink`, when the design is sound but the Ink implementation is wrong;
- `if-plan-ink-slice`, when the slice plan missed required behavior;
- `if-design-progression`, when the lock and unlock model is flawed;
- `if-design-map`, when the spatial structure creates a reachability problem;
- `if-design-dialogue`, when conversation order creates contradictions or soft locks.

The agent then updates the relevant files and the user reruns `if-playtest-review`.

### 9.6 Sync accepted slice state

Once the slice is stable, the user runs `if-sync-state`.

The agent synchronizes accepted implementation facts back into project files such as:

- `story.yaml`
- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/progression.yaml`
- `04_design/state_model.md`
- `04_design/critical_path.md`
- `06_playtest/route_matrix.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

At the end of this step, the accepted slice becomes part of stable project state and the next slice can be planned from persisted context instead of memory.

## 10. Continue until the IF is playable end to end

The user repeats the slice workflow until the game has:

- a working start;
- a navigable map;
- core conversations;
- required obstacles;
- critical path unlocks;
- at least one complete route to an ending;
- review coverage for likely player orders.

In practice, the stable production loop is:

1. `if-plan-ink-slice`
2. user review of the slice plan
3. `if-draft-ink`
4. `if-playtest-review`
5. targeted fix if needed
6. `if-sync-state`

## 11. Run broader review and export steps if needed

After the IF is playable end to end, the user may run broader review passes.

Useful skills include:

- `if-playtest-review`, for whole-game route and state coverage;
- `continuity-check`, for factual continuity across prose and Ink;
- `beta-reader-pass`, for simulated player experience feedback;
- `prepare-export`, if the project has a reader-facing export process;
- `build-distribution`, if the project has a compatible build backend.

The agent should work from the accumulated project files rather than isolated Ink snippets.

## Practical ownership summary

The user is mainly responsible for:

- setting the creative and playable direction;
- validating map, dialogue, and progression decisions;
- approving or correcting persisted project state;
- deciding when a slice is good enough to move forward.

The agent is mainly responsible for:

- creating and updating the project files;
- translating user intent into structured IF design artifacts;
- keeping design files, Ink files, playtest notes, and continuity records aligned;
- checking route coverage and state consistency;
- making the project state reusable across the whole IF.

## Core idea

The workflow works best when the user and the agent treat the repository files as the real project memory.

The agent should not rely on temporary chat context when the information should live in:

- `story.yaml`
- `01_style/`
- `03_characters/`
- `04_design/`
- `05_ink/`
- `06_playtest/`
- `07_continuity/`

That file-based approach is what allows a non-linear Ink story to remain coherent while the player can explore locations and conversations in many possible orders.
