---
name: write-fiction
description: Create and manage prose-fiction projects from initial brief through outlining, chapter drafting, editorial revision, continuity synchronization, manuscript review, and export. Use for novels, novellas, and short stories stored as persistent project files; use write-ink-fiction instead for Ink projects.
---

# Write Fiction

Manage the whole prose-fiction workflow through one entry point. Inspect the project before choosing an action; the user should not need to remember a chain of skills.

## Commands

Interpret these intents even when phrased naturally:

- `start`: initialize or normalize a project.
- `status`: report current state without writing files.
- `continue`: perform the next safe action up to the next creative approval boundary.
- a targeted request: work on the named chapter, artifact, review concern, or export.
- `approve` or an unambiguous equivalent: accept the pending artifact and perform its associated synchronization.

Never treat `continue` as approval when `workflow.approval_required` is true. Report what is awaiting approval and invite either explicit acceptance or concrete corrections.

## Routing

1. Read `story.yaml` and inspect the smallest relevant set of project files.
2. If this is an old project, normalize workflow metadata using [references/project-contract.md](references/project-contract.md).
3. Infer the real state from artifacts when metadata is missing or stale. Do not overwrite creative work merely to match metadata.
4. Route to one reference only, adding another only when the requested milestone genuinely spans both:
   - initialization, context, status, and migration: [references/project-contract.md](references/project-contract.md)
   - style, cast, and outline: [references/foundations-and-outline.md](references/foundations-and-outline.md)
   - chapter planning, drafting, revision, acceptance, and synchronization: [references/chapter-cycle.md](references/chapter-cycle.md)
   - manuscript review, beta reading, export, and distribution: [references/manuscript-and-export.md](references/manuscript-and-export.md)

## Milestone Policy

By default, one invocation completes one coherent milestone:

1. initialize the project;
2. prepare style and cast foundations;
3. create the story outline;
4. prepare a chapter plan;
5. draft and editorially review the chapter;
6. revise and review again;
7. accept and synchronize the chapter;
8. review the manuscript through editorial and beta-reader lenses;
9. prepare exports and requested distribution formats.

Stop after foundations, outline, a chapter plan, a reviewed draft, or manuscript review so the user can make the meaningful creative decision. Mechanical checks and related state updates belong inside the milestone and should not become separate user-facing commands.

## Shared Rules

- `story.yaml` is the metadata source of truth; manuscript text is the source of truth for what actually occurs.
- Keep standard paths, filenames, YAML keys, and stable identifiers in English.
- Write human-facing project content in `story.language` with normal Unicode and correct orthography.
- Preserve existing meaningful content and distinguish confirmed, provisional, ambiguous, and superseded information.
- Load only files relevant to the current target. Do not ingest the entire manuscript for a narrow chapter task.
- Ask only for missing information that blocks the selected milestone or would materially change it.
- Never invent approval, canon, or resolved continuity.

## Response Contract

After every invocation, state concisely:

- current stage and active target;
- what was created, changed, or checked;
- whether approval is required;
- the exact next action in plain language.

For `status`, make no project changes.

