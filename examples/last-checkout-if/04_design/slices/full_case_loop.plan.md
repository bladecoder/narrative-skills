# Slice Plan: full_case_loop

## Type

Navigation system, locations, dialogues, progression gates, and ending.

## Source Design Records

- `04_design/map.md`
- `04_design/locations.yaml`
- `04_design/dialogue_matrix.md`
- `04_design/progression.yaml`
- `04_design/state_model.md`
- `04_design/critical_path.md`

## Ink Files Expected To Change

- `05_ink/main.ink`
- `05_ink/systems/state.ink`
- `05_ink/systems/navigation.ink`
- `05_ink/locations/living_room.ink`
- `05_ink/locations/bedroom.ink`
- `05_ink/locations/bathroom.ink`
- `05_ink/dialogues/clara.ink`
- `05_ink/dialogues/maeve.ink`
- `05_ink/dialogues/pike.ink`

## Entry And Exit Knots

- Entry: `start`
- Main loop: `apartment_nav`
- Ending: `accuse_clara` diverts to `END` only when all evidence gates are true.

## State Variables Read And Written

- Location state: `visited_living`, `visited_bedroom`, `visited_bathroom`
- Clues: `clue_clara_missing_earring`, `clue_earring_back`, `clue_ligature_mark`, `clue_scarf`, `clue_blackmail_envelope`, `clue_bank_transfer`
- Dialogue and inference: `talked_clara_alibi`, `talked_maeve_body`, `talked_maeve_scarf`, `talked_pike_timing`, `contradicted_clara_presence`, `contradicted_clara_motive`
- Evidence gates: `evidence_who`, `evidence_how`, `evidence_why`, `case_closed`

## Choices Shown To The Player

- Move to or inspect the living room, bedroom, and bathroom.
- Question Clara, Dr. Ibarra, and Officer Pike.
- Review the notebook.
- Accuse Clara.

## Repeat Behavior

Room and dialogue choices are sticky. Already-found clues produce shorter revisit text or disappear while navigation remains available.

## Required Includes

`main.ink` includes all system, location, and dialogue files from `05_ink/`.

## Acceptance Criteria

- The story compiled with `inklecate 05_ink/main.ink`.
- A player could gather who, how, and why in any room order.
- Clara lied when confronted before all evidence was complete.
- Clara confessed only when `evidence_who`, `evidence_how`, and `evidence_why` were true.
- No location or dialogue loop ended without a route back to navigation.

