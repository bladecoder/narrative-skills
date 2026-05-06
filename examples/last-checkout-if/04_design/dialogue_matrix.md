# Dialogue Matrix

## Clara Voss

- Location: living room.
- Stance: tearful, controlled, adaptive.
- Default topic: she claimed Javier went to the bathroom alone while she stayed on the sofa.
- Gated topic, earring: unlocked by `clue_earring_back` and `clue_clara_missing_earring`; she claimed Javier had teased her and taken the earring earlier.
- Gated topic, scarf: unlocked by `clue_scarf` and `clue_ligature_mark`; she claimed Javier used the scarf after spilling gin.
- Gated topic, blackmail: unlocked by `clue_blackmail_envelope` and `clue_bank_transfer`; she claimed Javier was helping her repay a debt.
- Final accusation: requires `evidence_who`, `evidence_how`, and `evidence_why`; she confessed.

## Dr. Maeve Ibarra

- Location: bathroom.
- Stance: precise and practical.
- Topics: cause of death, ligature mark, whether the scarf could be the weapon.
- Grants: `clue_ligature_mark`, `talked_maeve_scarf`, `evidence_how` when scarf is known.

## Officer Ben Pike

- Location: living room.
- Stance: procedural, slightly nervous.
- Topics: door and neighbors, timing, Clara's initial statement.
- Grants: `talked_pike_timing`; supports the contradiction that no one else entered.

