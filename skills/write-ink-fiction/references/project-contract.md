# Ink Project Contract And Routing

## Common Structure

Use the shared narrative folders `00_meta/` through `03_characters/`, then create only mode-relevant IF artifacts:

```text
04_design/
  story_beats.md
  critical_path.md
  state_model.md
  slices/
05_ink/
  main.ink
06_playtest/
07_continuity/
```

Exploratory projects may additionally use `map.md`, `locations.yaml`, `dialogue_matrix.md`, and `progression.yaml`, plus `locations/`, `dialogues/`, and `systems/` under `05_ink/`. Linear and ordinary branching projects should not receive empty exploratory scaffolding.

## Metadata

Preserve shared metadata and use:

```yaml
project:
  format: "interactive_fiction_ink"
interactive:
  engine: "ink"
  entrypoint: "05_ink/main.ink"
  structure: "branching"
workflow:
  canonical_root: "."
  initialized_at: ""
  stage: "foundations"
  active_target: null
  last_completed_action: "initialize"
  next_action: "define_foundations"
  approval_required: false
```

Valid stages are `foundations`, `design`, `slice`, `playtest`, and `complete`. Valid structures are `linear`, `branching`, and `exploratory`. Preserve existing `navigation_model` and `conversation_model` for exploratory projects.

Use only these workflow actions: `initialize`, `define_foundations`, `await_foundations_approval`, `design_experience`, `await_design_approval`, `plan_slice`, `await_slice_plan_approval`, `implement_and_playtest_slice`, `await_slice_decision`, `revise_and_playtest_slice`, `accept_and_sync_slice`, `review_whole_game`, `await_whole_game_decision`, and `complete`.

## Legacy Migration

Map old actions after checking actual files:

- `if-load-context` and `if-init-project` -> initialization/current-state routing;
- shared style and character skill names -> foundations;
- `if-design-structure`, `if-design-map`, `if-design-dialogue`, and `if-design-progression` -> design;
- `if-plan-ink-slice` -> plan slice;
- `if-draft-ink` -> implement slice;
- `if-playtest-review` -> playtest or pending slice decision;
- `if-sync-state` -> accept and synchronize;
- `ink-doc` is syntax guidance, not workflow state.

Convert `last_completed_skill`, `last_completed_slice`, and `next_skill` into `last_completed_action`, `active_target`, and `next_action`; remove legacy keys only after successful normalization. Infer `interactive.structure: exploratory` for existing projects that declare `free_2d_map` or `free_order_dialogues`.

## Initialization And Status

Collect or infer the narrative brief, intended player experience, interaction structure, scope, agency boundaries, ending shape, failure policy, and hard constraints. Language is required before creating human-facing content. Create a minimal `main.ink`, not a fabricated game.

For `status`, compare metadata, design files, Ink source, and playtest records but do not write. A design or plan awaiting approval must remain pending even if later files happen to exist.
