# Route Matrix

## Scope

Whole playable draft, `full_case_loop`.

## Critical Completion Route Tested

1. Living room: observe Clara's missing earring.
2. Living room: find the blue scarf in the kitchenette trash.
3. Bedroom: find the blackmail envelope.
4. Bedroom: read Javier's unsent blackmail message.
5. Bathroom: confirm the ligature mark.
6. Bathroom: find the earring back in the basin trap.
7. Dr. Ibarra: show the scarf and confirm the method.
8. Clara: confront her with the earring, scarf, and blackmail; she lies each time.
9. Accuse Clara: confession reached.

## Evidence Routes

| Evidence | Required states | Verified source |
| --- | --- | --- |
| Who | `clue_clara_missing_earring`, `clue_earring_back` | Living room and bathroom |
| How | `clue_scarf`, `clue_ligature_mark`, `talked_maeve_scarf` | Living room, bathroom, Dr. Ibarra |
| Why | `clue_blackmail_envelope`, `clue_bank_transfer` | Bedroom |

## Alternate Orders

- Who evidence can be assembled by finding the earring back before or after observing Clara's missing earring.
- Why evidence can be assembled by finding the phone before or after the envelope.
- How evidence requires both the scarf and ligature mark before Dr. Ibarra's confirmation appears.

## Ending Gate

`accuse_clara` returns to investigation unless `evidence_who`, `evidence_how`, and `evidence_why` are all true.

