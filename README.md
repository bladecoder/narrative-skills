# Narrative Skills

Two end-to-end skills for agentic fiction workflows with persistent project files and explicit creative approval points.

Author: Rafael García Moreno <bladecoder@gmail.com>

## Skills

- `write-fiction`: manages prose fiction from initialization and story design through chapter drafting, review, continuity, and publication.
- `write-ink-fiction`: manages linear, branching, or exploratory Ink fiction from design through implementation, playtesting, and synchronization.

The detailed operations remain available as internal references, but users no longer need to remember a chain of specialized skill names.

## Everyday usage

```text
Use $write-fiction to start a new fantasy novel in Spanish.
Use $write-fiction status.
Use $write-fiction to continue.
I approve the chapter plan. Continue with $write-fiction.
```

For Ink:

```text
Use $write-ink-fiction to start a branching mystery.
Use $write-ink-fiction status.
Use $write-ink-fiction to continue.
I approve this slice plan. Implement it with $write-ink-fiction.
```

`continue` advances to the next creative milestone. It never counts as approval when a design, plan, draft, or review is awaiting a user decision.

## Project conventions

- The current working directory is the story-project root.
- Shared metadata lives in `story.yaml`.
- Standard filenames, YAML keys, stable IDs, and Ink identifiers remain in English.
- Human-readable content uses `story.language` with normal Unicode.
- Existing narrative and IF project layouts remain supported.

Workflow metadata records a stage and action instead of another skill name:

```yaml
workflow:
  canonical_root: "."
  stage: "chapter"
  active_target: "chapter_03"
  last_completed_action: "draft_and_review_chapter"
  next_action: "await_chapter_decision"
  approval_required: true
```

Projects using the former `next_skill`, `last_completed_skill`, or `last_completed_slice` fields are normalized conservatively on the next mutating invocation. `status` remains read-only.

## Installation

Use [scripts/install-skills.sh](scripts/install-skills.sh) for Codex, Claude Code, OpenCode, or repository-local agents. With no arguments it installs to `.agents/skills` in the current repository.

```bash
scripts/install-skills.sh --target codex --mode symlink
scripts/install-skills.sh --target all --mode copy --in-repo
```

To replace a previous installation of this collection and remove only its retired skill names:

```bash
scripts/install-skills.sh --target codex --force --prune-legacy
```

Use `--dry-run` to inspect installation or cleanup actions first. The installer never prunes unrelated skills.

## Workflows and examples

- [Prose workflow](examples/workflow.md)
- [Ink workflow](examples/if-workflow.md)
- [Complete prose fixture](examples/the-hours-left-over/README.md)
- [Complete Ink fixture](examples/last-checkout-if/README.md)

## License

This repository is licensed under the [MIT License](LICENSE).
