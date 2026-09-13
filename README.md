# Narrative Skills

Two file-driven agent skills for creating fiction from the first idea to a finished manuscript or playable Ink story.

`narrative-skills` keeps the creative process in the project directory—not only in chat—so an agent can resume work from the actual outline, drafts, reviews, continuity records, and workflow state. Each skill advances one coherent milestone at a time and stops when a creative decision needs your approval.

## Included skills

| Skill | Use it for | Workflow |
| --- | --- | --- |
| [`write-fiction`](skills/write-fiction/SKILL.md) | Novels, novellas, and short stories | Brief, foundations, outline, chapter planning, drafting, revision, continuity, manuscript review, and export |
| [`write-ink-fiction`](skills/write-ink-fiction/SKILL.md) | Linear, branching, or exploratory [Ink](https://www.inklestudios.com/ink/) fiction | Foundations, interaction design, slice planning, Ink implementation, playtesting, synchronization, and whole-game review |

Both skills provide the same small command surface: start a project, check its status, continue to the next milestone, approve pending work, or request a targeted change. The detailed operations live in focused references inside each skill and are loaded only when needed.

## Key principles

- **Persistent projects:** story state and creative artifacts are stored as files that can be reviewed, versioned, and edited directly.
- **Explicit approval:** `continue` never silently approves an outline, plan, draft, design, or review.
- **Safe resumption:** `story.yaml` records the active stage and target, while existing artifacts remain the source of truth for completed work.
- **Focused context:** the agent reads only the files relevant to the current task instead of loading an entire manuscript or game.
- **Stable structure:** paths, metadata keys, IDs, and Ink identifiers stay in English; narrative content uses the language declared by the project.

## Installation

Clone the repository, then install the skills for your agent:

```bash
git clone https://github.com/bladecoder/narrative-skills.git
cd narrative-skills
scripts/install-skills.sh --target codex --mode symlink
```

The installer supports `codex`, `claude-code`, `opencode`, and repository-local `agents` targets. Use `copy` instead of `symlink` when the installed skills must be independent of this checkout:

```bash
scripts/install-skills.sh --target claude-code --target opencode --mode copy
scripts/install-skills.sh --target all --mode symlink
```

To install into a specific project's `.agents/skills` directory, run the installer while that project is the current directory:

```bash
cd /path/to/story-project
/path/to/narrative-skills/scripts/install-skills.sh
```

Existing installations are preserved by default. Preview any operation with `--dry-run`, use `--force` to replace skills with the same names, and add `--prune-legacy` to remove only the retired skills from older versions of this collection.

```bash
scripts/install-skills.sh --target codex --force --prune-legacy --dry-run
```

Run `scripts/install-skills.sh --help` for all targets, directory overrides, and repository-local installation options.

## Quick start

Start a prose project in the directory where you want its files to live:

```text
Use $write-fiction to start a six-chapter science-fiction story in Spanish.
```

Or start an interactive story:

```text
Use $write-ink-fiction to start a branching mystery in English.
```

Then work through the project with natural requests:

```text
Use $write-fiction status.
Use $write-fiction to continue.
I approve the chapter plan. Continue with $write-fiction.
Use $write-fiction to review the dialogue in chapter 4.
```

```text
Use $write-ink-fiction status.
Use $write-ink-fiction to continue.
I approve this slice. Synchronize it with $write-ink-fiction.
Use $write-ink-fiction to diagnose why the second ending is unreachable.
```

At each invocation, the skill reports the current stage, the work completed, any verification performed, whether approval is pending, and the exact next action. A `status` request is always read-only.

## How projects progress

The prose workflow moves through foundations and outline before entering a repeatable plan–draft–review–accept cycle for each chapter. Once the manuscript is complete, it supports editorial review, beta reading, and distribution exports. See the [prose workflow guide](examples/workflow.md) for the full sequence and approval points.

The Ink workflow first identifies whether the experience is linear, branching, or exploratory. It then repeats a plan–implement–playtest–accept cycle for each playable slice. When `inklecate` is available, implementation milestones compile the story; otherwise the skill records that only static verification was possible. See the [Ink workflow guide](examples/if-workflow.md) for details.

## Examples

- [`The Hours Left Over`](examples/the-hours-left-over/README.md) is a complete prose fixture with story foundations, outline, chapter plans, drafts, reviews, continuity records, and Markdown, HTML, EPUB, and PDF exports.
- [`The Last Checkout`](examples/last-checkout-if/README.md) is an exploratory noir mystery implemented in Ink, including its design artifacts, source, route checks, and continuity state.

Each example has its own README with the appropriate reading or build instructions.

## Repository layout

```text
.
├── skills/
│   ├── write-fiction/       # Prose workflow and focused references
│   └── write-ink-fiction/   # Ink workflow, design guidance, and Ink references
├── examples/                # Workflow guides and completed project fixtures
├── scripts/
│   └── install-skills.sh    # Multi-agent installation utility
├── CONTRIBUTING.md
└── LICENSE
```

## Contributing

Contributions are welcome. Before changing a workflow, reference, example, or the installer, read [CONTRIBUTING.md](CONTRIBUTING.md) for the repository conventions and minimum verification steps.

## License

Released under the [MIT License](LICENSE).

Created by Rafael García Moreno.
