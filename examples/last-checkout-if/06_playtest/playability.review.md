# Playability Review

## Scope

Whole game draft after Ink implementation.

## Compile Check

Passed: `inklecate 05_ink/main.ink`

## Manual Play Check

Passed. A complete route from opening to Clara's confession was played in `inklecate -p 05_ink/main.ink`.

## Findings

No blocking or major playability issues found.

Minor issue found and fixed during review: location revisit text initially reused first-visit copy because it depended on knot read counts inside sticky loops. The location files now use explicit `visited_living`, `visited_bedroom`, and `visited_bathroom` flags.

## Coverage

- All three rooms reachable from the navigation hub.
- All three characters reachable from the navigation hub.
- Required clues are not missable.
- Clara does not confess before all three evidence gates are true.
- Final accusation reaches `END` after who, how, and why are proven.

## Residual Risk

The current draft is intentionally compact. Additional optional red herrings or deeper interrogation branches could improve replay texture, but the core case is playable end to end.

