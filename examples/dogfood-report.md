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

Extended fixture update created to exercise the post-review loop:

- `rewrite-chapter`
- `update-character-state`
- `update-timeline`
- `sync-story-bible`
- `manuscript-review`
- `beta-reader-pass`
- `prepare-export`
- `build-distribution`

## What was produced

- Full root project structure
- Shared metadata in `story.yaml`
- Style bible in Spanish with English filenames
- Cast bible
- Three-act outline and chapter map
- Two chapter plans
- Two chapter drafts, with chapter 2 revised
- Two chapter reviews plus one manuscript-level review
- One beta-reader style pass
- One export package under `08_exports/`
- One revision artifact
- Continuity YAML files updated from draft evidence
- Character state, chapter status, open loops, and timeline synchronized

## Observed strengths

- The shared language contract is workable in practice.
- The file naming convention remains script-friendly.
- The workflow from outline to chapter review is coherent and traceable.
- `load-story-context` fills the gap of checking readiness before downstream work.
- The post-review loop is now explicit and persisted rather than implied.
- The repo now has both chapter-level and manuscript-level editorial checkpoints.
- The repo now also has a reader-experience checkpoint distinct from editorial review.
- The repo now covers export packaging as a final workflow stage.
- The repo now defines a distribution stage for HTML, EPUB, and PDF generation.

## Gaps noticed

- The continuity YAML schema is intentionally light, but could be standardized further if automation increases.
- Export format variants are still minimal and could be expanded later if multiple target formats are needed.
- Distribution backends are not installed in this environment, so the new skill is implemented but not dogfooded end-to-end here.
