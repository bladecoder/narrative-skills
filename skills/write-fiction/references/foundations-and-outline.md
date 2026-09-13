# Foundations And Outline

## Foundations Milestone

Read metadata, premise, goals, constraints, and any useful existing notes. Produce a coherent style and cast foundation in one milestone.

Style files should make voice, prose texture, rhythm, POV, tense, narrative distance, lexical register, and prohibited patterns observable enough to guide drafting and review. Do not closely imitate living authors.

Character files should prioritize dramatic function over biography. For each important character capture desire, need, fear, contradiction, pressure point, voice, arc direction, knowledge limits, and consequential relationships. Create individual character files only when they add real value.

After writing foundations set `stage: foundations`, `next_action: await_foundations_approval`, and `approval_required: true`. Explicit acceptance advances to `stage: outline` and `next_action: outline_story`.

## Outline Milestone

Turn the premise, cast, themes, constraints, and style into a causal story structure. Choose an appropriate structure rather than forcing three acts, while preserving existing act files if the project uses them.

Maintain `02_story/chapter_list.md` as the canonical chapter-level map. Each planned chapter needs a stable number, optional title, POV, dramatic purpose, core conflict, summary, and the meaningful change it produces. The outline must escalate, distribute information deliberately, develop arcs, and lead to the intended ending without drafting full scenes.

After writing the outline set `stage: outline`, `next_action: await_outline_approval`, and `approval_required: true`. Explicit acceptance advances to the first unfinished chapter with `stage: chapter`, `active_target: chapter_XX`, `next_action: plan_chapter`, and `approval_required: false`.

If feedback changes foundations or structure, update affected artifacts and remain at the corresponding approval boundary.

