# Chapter Cycle

## Plan

Choose the active chapter from an explicit request or the first unfinished entry in `chapter_list.md`. If several plausible targets exist, ask rather than guessing.

Write `04_outline/chapter_XX.plan.md` with objective, start and end state, POV, conflict, scene beats, emotional progression, revelations, open-loop movement, continuity watchpoints, and relevant style reminders. Do not draft prose. Set `next_action: await_chapter_plan_approval` and require approval.

## Draft And Review

After explicit plan approval, draft `05_draft/chapter_XX.md` from persisted project context. Preserve approved structural intent while allowing local prose decisions. Then immediately create or refresh `06_review/chapter_XX.review.md`.

Review narrative function, scene mechanics, pacing, POV, voice, dialogue, emotional logic, character consistency, and continuity risk. Separate blocking, major, minor, and polish findings; identify strengths and give actionable revisions. Set `next_action: await_chapter_decision` and require an explicit accept or correction request.

## Revise And Review

Revise from the approved plan, current chapter, and concrete review feedback. Preserve traceability with `06_review/chapter_XX.revision.md` when the project already uses revision artifacts or the rewrite is substantial. Re-run the editorial review and return to `await_chapter_decision`.

If the problem is structural, revise the chapter plan first. Never conceal an unresolved blocking defect by marking the chapter accepted.

## Accept And Synchronize

Only explicit acceptance promotes draft facts to stable project state. In the same milestone:

- check the accepted chapter for contradictions and ambiguous claims;
- update canon facts, entities, locations, and unresolved threads;
- persist changed character goals, knowledge, relationships, location, condition, and emotional state;
- update chronology and dated facts;
- update chapter status, synopsis-level state, chapter list, and open loops.

Prefer additive updates, record uncertainty, and do not create false precision. If synchronization exposes a contradiction that changes the accepted meaning, stop and present it instead of resolving it creatively without permission.

Finish with `approval_required: false`. Target the next unfinished chapter with `next_action: plan_chapter`; if none remains, set `stage: manuscript`, clear `active_target`, and set `next_action: review_manuscript`.
