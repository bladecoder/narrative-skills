# Contributing

Thanks for contributing to `narrative-skills`.

The goal of this repository is to keep the skills practical, file-driven, and predictable for story-development workflows.

## What to contribute

- Improvements to the two public workflow skills or their focused references.
- New references that add a genuinely distinct narrative mode or implementation need.
- Fixes to installation or compatibility issues in [scripts/install-skills.sh](scripts/install-skills.sh).
- Better examples and documentation.

## Contribution guidelines

- Keep file and folder names in English for automation stability.
- Preserve the repository's convention that story content lives in persisted files rather than chat-only state.
- Prefer small, reviewable pull requests with a clear purpose.
- Update documentation when behavior, structure, or installation changes.
- Do not add generated local-install directories such as `.codex/`, `.claude/`, or `.opencode/`.

## Updating a skill

The public surface intentionally contains only `write-fiction` and `write-ink-fiction`. Each directory includes:

- `SKILL.md`
- `agents/openai.yaml` when the skill needs agent configuration

A good change should:

- keep routing and approval boundaries in `SKILL.md`;
- move mode-specific detail into a discoverable reference;
- preserve the shared project and workflow contracts;
- avoid ambiguous instructions that depend on hidden chat context.

Do not add another public skill for a step that can be represented as a mode or milestone of an existing workflow. A third entry point requires a distinct user audience and end-to-end purpose.

## Testing changes

At minimum, verify the installation flow with the local installer script.

Examples:

```bash
scripts/install-skills.sh --target codex --mode symlink --dry-run
scripts/install-skills.sh --target all --mode symlink --in-repo --dry-run
scripts/install-skills.sh --target codex --prune-legacy --dry-run
```

If you change installation behavior, also test a real local install in a disposable directory or with `--in-repo`.

## Pull requests

When opening a pull request, include:

- what changed;
- why the change is needed;
- any repository files or workflows affected;
- how you tested it.

## License

By contributing to this repository, you agree that your contributions will be licensed under the [MIT License](LICENSE).
