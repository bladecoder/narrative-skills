# Dogfood report

## Scope

Fixture project created at `examples/ashes-under-the-tide/` to exercise the full MVP:

- `load-story-context`
- `init-story-project`
- `define-style-bible`
- `create-character-bible`
- `generate-high-level-outline`
- `plan-chapter`
- `draft-chapter`
- `chapter-review`
- `continuity-check`

## What was produced

- Full root project structure
- Shared metadata in `story.yaml`
- Style bible in Spanish with English filenames
- Cast bible
- Three-act outline and chapter map
- Two chapter plans
- Two chapter drafts
- Two chapter reviews plus manuscript status note
- Continuity YAML files updated from draft evidence

## Observed strengths

- The shared language contract is workable in practice.
- The file naming convention remains script-friendly.
- The workflow from outline to chapter review is coherent and traceable.
- `load-story-context` fills the gap of checking readiness before downstream work.

## Gaps noticed

- No dedicated skill yet for revising a chapter after review.
- No dedicated skill yet for manuscript-level synthesis once many chapters exist.
- The continuity YAML schema is intentionally light, but could be standardized further if automation increases.
