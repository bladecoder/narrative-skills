---
name: prepare-export
description: Assemble an export-ready manuscript package from the current project state once the manuscript or chapter set is stable enough to be shared, reviewed externally, or archived as a coherent deliverable.
---

# Prepare Export

## Overview

Use this skill to assemble an export package from the accepted project files. It should gather the current manuscript state, remove internal workflow clutter, and produce clean deliverables under `08_exports/` that are ready for external reading, sharing, or archival.

## When To Use

Use this skill when:

- the project needs a clean manuscript export;
- several chapters are stable enough to share externally;
- the user wants a packaged snapshot of the current story state;
- the manuscript needs a reader-facing artifact instead of a working-repo view.

Do not use this skill while the project is still too volatile to share coherently unless the goal is an explicit snapshot draft.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- stable manuscript scope to export;
- accepted chapter drafts;
- synopsis or logline if a package summary should accompany the manuscript;
- current review state, so only stabilized material is exported.

Ask questions only when the export scope is genuinely unclear and cannot be inferred safely from the project state.

## Files To Read

Always read:

- `story.yaml`
- relevant stable chapters from `05_draft/`

Read these when present and relevant:

- `02_story/chapter_list.md`
- `02_story/synopsis.md`
- `02_story/logline.md`
- `06_review/manuscript.review.md`
- `06_review/beta_reader_pass.md`
- `00_meta/goals.md`
- `references/default_html_style.css`

Do not include internal review artifacts in the exported manuscript body.

## Files To Write

Write or update under `08_exports/`:

- `manuscript_export.md`
- `export_package.md`
- `export_manifest.yaml`
- `dist/style.css` when the export will later be turned into HTML and no project-specific stylesheet already exists

If the project already has a clearer export naming pattern, follow it consistently.

### Expected Export Files

`manuscript_export.md` should contain:

- title;
- optional short front matter if the project already uses it;
- exported chapters in reading order;
- no inline editorial notes, review sections, planning headers, or continuity annotations.

`export_package.md` should contain:

- title and scope of the export;
- short story summary;
- chapter range included;
- current manuscript status;
- optional notes about what kind of draft this is.

`export_manifest.yaml` should contain stable machine-readable metadata, such as:

- `title`
- `language`
- `exported_scope`
- `chapter_count`
- `project_status`
- `generated_from`
- `notes`

If the export is expected to feed a later HTML build, `08_exports/dist/style.css` should provide a sensible default reading stylesheet for the generated HTML. When no project-specific stylesheet is already present and no other stylesheet has been requested, copy the skill resource `references/default_html_style.css` into `08_exports/dist/style.css`.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before writing export content.
- Keep file and folder names in English.
- Write human-readable export content in the selected story language.
- Use correct orthography, accents, and normal Unicode for that language.
- Keep YAML keys in English.
- If `story.language` is missing, gather it before exporting.

## Procedure

1. Determine the stable export scope from accepted chapters and current project status.
2. Read the manuscript material in order and confirm which chapters are appropriate to include.
3. Assemble `manuscript_export.md` from the selected chapters:
   - preserve chapter order;
   - remove internal workflow material;
   - keep only reader-facing text.
4. If the manuscript export keeps a visible `# Title` heading in the body, record that downstream HTML generation must avoid emitting a second visible title block.
   - For HTML built with `pandoc`, prefer using `--metadata pagetitle="..."` instead of `--metadata title="..."` when the body already contains the visible title heading.
   - This HTML-specific precaution is not necessary for EPUB in the same way; EPUB may still use `--metadata title="..."`, and can additionally use `--epub-title-page=false` if the workflow wants metadata without a generated title page.
5. Create `export_package.md` as a short companion document describing what the export contains.
6. Create `export_manifest.yaml` with the core export metadata.
7. If no project-specific stylesheet already exists and HTML output is expected later, create `08_exports/dist/style.css` by copying `references/default_html_style.css`.
8. When the HTML distribution file is later generated, embed the stylesheet into the HTML so the result is a self-contained `.html` file that can be distributed by sending only that file.
8. Preserve the distinction between working files and exported artifacts. This skill packages accepted state; it does not editorialize or revise the manuscript.

## Output Requirements

The export package should make it easy to answer:

- what text is included;
- how complete the exported manuscript is;
- what language it is in;
- what draft state it represents;
- which source files it was assembled from.

## Output

After running the skill, provide:

- a short summary of the export created;
- which chapters or scope were included;
- what files were written under `08_exports/`;
- any important caveats about draft completeness.

## Definition Of Done

This skill is done when:

- `08_exports/` contains a clean manuscript export package;
- the exported manuscript is free of internal workflow noise;
- the export reflects the accepted project state;
- the package respects `story.language`;
- the skill makes clear how downstream HTML should avoid duplicating the visible title;
- a default `08_exports/dist/style.css` exists when HTML export is expected and no custom stylesheet is already present;
- the default stylesheet comes from `references/default_html_style.css` when no other stylesheet was specified;
- another reader can open the export without understanding the internal repo structure.

## Restrictions

- Do not rewrite the manuscript here.
- Do not export rejected or clearly unstable draft material as if it were final.
- Do not embed chapter reviews, revision notes, or continuity logs into the manuscript export.
- Do not invent packaging metadata that the project does not support.
- Do not leave downstream HTML title handling ambiguous if the manuscript body already contains a visible title heading.

## Example Invocation

```text
Use $prepare-export to assemble the current manuscript into a clean export package for external reading.
```
