# Ink Slice Cycle

A slice is one bounded location, dialogue, branch, obstacle, navigation feature, state system, phase transition, ending, or similarly cohesive unit.

## Plan

Resolve a requested slice or propose the smallest next critical-path unit. If several candidates are equally plausible, ask. Write `04_design/slices/<slice_id>.plan.md` using an English `snake_case` ID.

Record slice type, source design records, Ink files to change, entry and exit flow, variables read and written, player choices, revisit behavior, includes or tunnels, and observable acceptance criteria. Do not write Ink yet. Set `active_target`, `next_action: await_slice_plan_approval`, and require approval.

## Implement And Playtest

After approval, edit only the planned Ink files and required includes. Use `main.ink` as entrypoint; split large projects by functional responsibility. Do not invent variables outside the plan: revise the plan and state model first when new state is necessary.

Consult [ink/index.md](ink/index.md) only for syntax topics used by the slice. Ensure all non-ending diverts reconnect intentionally.

If `inklecate` is available, compile the entrypoint and fix in-scope syntax or flow errors. Otherwise perform static syntax review and say compilation was unavailable. Build or update `06_playtest/route_matrix.md` and `06_playtest/playability.review.md` for the slice, checking reachability, gates, repeated choices, dead ends, ending access, circular dependencies, and model/code state mismatches.

Classify findings as blocking, major, minor, or polish. Finish at `next_action: await_slice_decision` with approval required.

## Revise

Apply requested corrections, compile again when possible, and repeat focused playtesting. Stay at the decision boundary until the user explicitly accepts the slice. Do not mark a finding resolved unless implementation or tests demonstrate it.

## Accept And Synchronize

On explicit acceptance, update design reality, progression, state model, critical path, route matrix, continuity records, and workflow metadata in the same milestone. Preserve confirmed design unless implementation clearly supersedes it, and keep uncertainty provisional.

Then set `approval_required: false`, clear the active target, and choose `plan_slice` for the next incomplete unit or `review_whole_game` when the designed experience is implemented.

## Whole-Game Review

Compile the full entrypoint when possible and exercise critical, alternate, revisit, and ending routes appropriate to the mode. Review pacing, player comprehension, state coverage, unavailable content, premature endings, and cumulative narrative coherence. Write the results without silently rewriting accepted Ink. Finish with `stage: playtest`, `next_action: await_whole_game_decision`, and `approval_required: true`. Explicit acceptance sets `stage: complete`, `next_action: complete`, and `approval_required: false`; requested changes return to the relevant design or slice milestone.
