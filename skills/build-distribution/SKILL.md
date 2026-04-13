---
name: build-distribution
description: Convert the prepared export package into reader-facing distribution formats such as HTML, EPUB, or PDF once a clean export already exists under 08_exports and the required conversion tools are available.
---

# Build Distribution

## Overview

Use this skill to convert the clean export package into distribution formats for reading or delivery. It should take the prepared export artifacts under `08_exports/`, generate one or more requested output formats, and keep the distribution outputs isolated from the source export files.

## When To Use

Use this skill when:

- `prepare-export` has already produced a clean export package;
- the user wants reader-facing formats such as HTML, EPUB, or PDF;
- the manuscript needs a deliverable format beyond Markdown;
- the project is ready for packaging or external distribution.

Do not use this skill before the export package exists. Build the export first with `prepare-export`.

## Required Inputs

Gather or infer these inputs:

- `story.yaml` metadata;
- current export package under `08_exports/`;
- requested target formats;
- available conversion tools in the environment.

Ask questions only when the target format scope is genuinely unclear and cannot be inferred safely.

## Files To Read

Always read:

- `story.yaml`
- `08_exports/manuscript_export.md`
- `08_exports/export_package.md`
- `08_exports/export_manifest.yaml`

Read these when present and relevant:

- `02_story/logline.md`
- `02_story/synopsis.md`

## Files To Write

Write or update under `08_exports/dist/`:

- `manuscript_export.html` when HTML is requested
- `manuscript_export.epub` when EPUB is requested
- `manuscript_export.pdf` when PDF is requested
- `distribution_manifest.yaml`

If the project already uses a more specific naming convention, follow it consistently.

## Tooling Rules

Preferred backend:

- use `pandoc` when available.

Format support expectations:

- HTML: use `pandoc` when available; if `pandoc` is unavailable, stop and report the missing dependency rather than producing a misleading low-fidelity fake conversion.
- EPUB: requires `pandoc`; if absent, stop and report the missing dependency.
- PDF: requires `pandoc` plus an available PDF engine supported by the environment; if unavailable, stop and report the missing dependency chain clearly.

Do not pretend a distribution was built if the backend is missing.

## Language Rules

This skill depends on `story.yaml` as the source of truth for project metadata.

- Read `story.language` before producing distribution artifacts.
- Keep file and folder names in English.
- Preserve the manuscript content language exactly as exported.
- Keep YAML keys in English.
- If `story.language` is missing, gather it before building the distribution.

## Procedure

1. Verify that `08_exports/` already contains a clean export package.
2. Detect which target formats were requested or implied.
3. Check tool availability before starting conversion.
4. Build outputs into `08_exports/dist/` only, leaving the source export package untouched.
5. Generate `distribution_manifest.yaml` recording:
   - formats requested;
   - formats produced;
   - source export files used;
   - tool backend used;
   - blocked formats and reasons, if any.
6. If a requested format cannot be produced, report it explicitly and avoid creating misleading placeholder binaries.

## Output Requirements

`distribution_manifest.yaml` should capture at minimum:

- `title`
- `language`
- `source_export`
- `requested_formats`
- `produced_formats`
- `backend`
- `blocked_formats`
- `notes`

The distribution stage should make it easy to answer:

- what source export was used;
- which formats were requested;
- which formats were actually built;
- what toolchain produced them;
- why any requested format was skipped.

## Output

After running the skill, provide:

- a short summary of the distribution build;
- which formats were produced;
- which formats were blocked, if any;
- what files were written under `08_exports/dist/`.

## Definition Of Done

This skill is done when:

- the requested build was attempted against the prepared export package;
- successful outputs exist under `08_exports/dist/`;
- blocked formats are explicitly documented rather than silently skipped;
- the distribution manifest records the result clearly;
- no source export files were modified unnecessarily.

## Restrictions

- Do not build directly from raw draft chapters if a prepared export package exists.
- Do not overwrite `08_exports/manuscript_export.md` during distribution.
- Do not claim a format was produced when the converter is missing.
- Do not bundle internal review artifacts into the reader-facing distribution.

## Example Invocation

```text
Use $build-distribution to convert the current export package into HTML and EPUB, and produce PDF too if the required backend is available.
```
