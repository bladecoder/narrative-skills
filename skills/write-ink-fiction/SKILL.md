---
name: write-ink-fiction
description: Create and manage Ink interactive-fiction projects from premise and interaction design through slice planning, Ink implementation, playtesting, state synchronization, and whole-game review. Supports linear, branching, and exploratory structures; use write-fiction for prose-only manuscripts.
---

# Write Ink Fiction

Manage an Ink project through one entry point. Detect its structure and current state before choosing work; load only the design and syntax guidance needed for the current milestone.

## Commands

Interpret natural equivalents of:

- `start`: initialize or normalize an Ink project.
- `status`: report state without writing files.
- `continue`: perform the next safe action up to the next creative approval boundary.
- a targeted request: work on a named design concern, slice, knot, dialogue, route, or defect.
- `approve`: accept the pending design or slice and perform its associated state transition.

Never cross a pending approval boundary on `continue` alone.

## Routing

1. Read `story.yaml`, `05_ink/main.ink` when present, and the smallest relevant artifact set.
2. Normalize legacy workflow metadata using [references/project-contract.md](references/project-contract.md).
3. Determine `interactive.structure`: `linear`, `branching`, or `exploratory`. Ask only if existing evidence cannot distinguish modes and the choice affects the design.
4. Load references selectively:
   - project, status, migration, and common structure: [references/project-contract.md](references/project-contract.md)
   - playable structure and mode-specific design: [references/design-modes.md](references/design-modes.md)
   - slice planning, implementation, playtest, acceptance, and synchronization: [references/slice-cycle.md](references/slice-cycle.md)
   - Ink syntax: start at [references/ink/index.md](references/ink/index.md) and read only the named language topics needed.

## Milestone Policy

One default invocation completes one coherent milestone:

1. initialize the project;
2. create narrative foundations;
3. design the interactive experience appropriate to its mode;
4. plan one implementation slice;
5. implement and playtest the slice;
6. revise and playtest again;
7. accept and synchronize the slice;
8. review the whole playable project.

Stop for approval after foundations, interaction design, a slice plan, a reviewed implementation, or whole-game review. Compilation, focused route checks, and mechanical consistency checks belong inside implementation milestones.

## Shared Rules

- `story.yaml` is the metadata source of truth; implemented Ink is the source of truth for actual runtime behavior.
- Keep filenames, YAML keys, stable IDs, and Ink identifiers in English unless the project already has a consistent identifier convention.
- Write player-facing prose and human-facing project documentation in `story.language`.
- Preserve meaningful existing content. Never invent acceptance, canon, state variables, or resolved playtest findings.
- Do not force map, inventory, or free-order dialogue machinery onto linear or ordinary branching work.
- Do not make critical progress impossible or silently collapse intended player agency.

## Response Contract

Report current stage and active slice, work completed, verification performed, pending approval, and the exact next action. `status` must not modify the project.

