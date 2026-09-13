# Interactive Design Modes

## Shared Design

Convert the premise into player-facing activity. Define the playable promise, player role, agency boundaries, repeated verbs, opening state, meaningful choices, broad phases, critical path, endings, failure policy, and the minimum state categories required.

Create narrative style and cast foundations before interaction design when they are absent. Character design must include what each interactive character knows, conceals, misunderstands, and can change.

Always maintain `story_beats.md`, `critical_path.md`, and `state_model.md`. Prove that at least one completion route exists without prescribing one order unless linearity is intentional.

## Linear

Use Ink primarily for presentation, pacing, variation, and limited interaction. Keep state minimal. Do not manufacture branches, reusable systems, map files, or progression records when the experience does not need them.

## Branching

Model meaningful choices, branch consequences, reconvergence, persistent variables, route-specific revelations, and ending requirements. Identify combinatorial risk and make important state transitions explicit. Use progression records only when locks and grants are substantial enough to benefit from structured data.

## Exploratory

Design navigable locations, visible connections and gates, revisits, free-order conversations, obstacle requirements and grants, optional routes, and fail-soft recovery.

For each location record stable ID, function, availability, connections, discoveries, revisits, inhabitants, gates, and state changes. For each interactive character record availability, stance, repeatable topics, one-time revelations, topic gates, knowledge limits, and relationship changes. For each obstacle record stable ID, type, requirements, grants, scope, critical-path role, fallback, and status.

Detect circular dependencies, critical clues with no reliable source, unlocks that change nothing, and assumptions about conversation order.

## Approval Boundary

After producing the mode-appropriate design packet, set `stage: design`, `next_action: await_design_approval`, and require approval. Explicit acceptance advances to `stage: slice`, `next_action: plan_slice`, with no active target unless one is evident and unique.

