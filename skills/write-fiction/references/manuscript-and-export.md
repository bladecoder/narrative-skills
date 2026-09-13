# Manuscript Review And Export

## Manuscript Review Milestone

Review the accepted partial or full manuscript through two distinct lenses while retaining separate artifacts:

- `06_review/manuscript.review.md`: structure, pacing, arcs, causality, thematic coherence, continuity, opening, ending, and revision priorities;
- `06_review/beta_reader_pass.md`: engagement, confusion, emotional investment, expectation, payoff, memorable moments, and likely reader drop-off.

Evaluate cumulative effects that chapter reviews cannot see. Do not rewrite prose during this milestone. Set `stage: manuscript`, `next_action: await_manuscript_decision`, and `approval_required: true`. Explicit acceptance advances to `stage: export`, `next_action: export_manuscript`, and `approval_required: false`; requested changes return to the affected outline or chapter milestone.

## Export Milestone

After acceptance, determine the accepted chapter set and assemble a clean reader-facing manuscript under `08_exports/`. Exclude plans, internal notes, reviews, and rejected variants. Record ordering, included sources, title metadata, status, and generation date in an export manifest.

Generate requested HTML, EPUB, or PDF formats when a suitable backend is available. Use `../assets/default_html_style.css` as the default HTML styling source unless the project defines its own. Validate generated files and report missing conversion tools without treating the clean manuscript package as failed.

Never silently fall back to a lower-fidelity format. Finish with `stage: complete`, `next_action: complete`, and `approval_required: false` only when the requested deliverables have been produced or their unavailable backends have been clearly reported.
