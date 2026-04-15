# Contributing

Thanks for contributing to `narrative-skills`.

The goal of this repository is to keep the skills practical, file-driven, and predictable for story-development workflows.

## What to contribute

- New skills that fit the repository's narrative workflow.
- Improvements to existing `SKILL.md` instructions.
- Fixes to installation or compatibility issues in [scripts/install-skills.sh](scripts/install-skills.sh).
- Better examples and documentation.

## Contribution guidelines

- Keep file and folder names in English for automation stability.
- Preserve the repository's convention that story content lives in persisted files rather than chat-only state.
- Prefer small, reviewable pull requests with a clear purpose.
- Update documentation when behavior, structure, or installation changes.
- Do not add generated local-install directories such as `.codex/`, `.claude/`, or `.opencode/`.

## Adding or updating a skill

Each skill should live in its own directory under `skills/` and include:

- `SKILL.md`
- `agents/openai.yaml` when the skill needs agent configuration

A good skill should:

- have a narrow, explicit responsibility;
- describe the files it reads and writes;
- define stable workflow expectations;
- avoid ambiguous instructions that depend on hidden chat context.

## Testing changes

At minimum, verify the installation flow with the local installer script.

Examples:

```bash
scripts/install-skills.sh --target codex --mode symlink --dry-run
scripts/install-skills.sh --target all --mode symlink --in-repo --dry-run
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
