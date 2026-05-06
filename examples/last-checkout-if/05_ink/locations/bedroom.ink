=== bedroom ===
{not visited_bedroom:
The bedroom was narrow, white, and impersonal. Javier's overnight bag sat open on the bed. A shirt hung from one drawer like a man trying to climb out.
- else:
The bedroom had not changed. Cheap rooms rarely did; they only became less convincing.
}
~ visited_bedroom = true

+ {not clue_blackmail_envelope} [Search Javier's overnight bag.]
    ~ clue_blackmail_envelope = true
    In the inside pocket I found a brown envelope marked with Clara's name. It held photocopies from a Lisbon gallery account: transfers, missing donations, a signature that looked too much like hers.
    {clue_bank_transfer:
        ~ evidence_why = true
        The papers and the transfer gave the motive a spine.
    }
    -> bedroom

+ {not clue_bank_transfer} [Check the phone on the nightstand.]
    ~ clue_bank_transfer = true
    Javier's phone was unlocked by whatever arrogance had killed him. The last message was ready but unsent: "Tonight. Ten thousand more, or I take the gallery file to police."
    {clue_blackmail_envelope:
        ~ evidence_why = true
        Blackmail had stepped out of suggestion and into evidence.
    }
    -> bedroom

+ [Inspect the room for signs of struggle.]
    The bedspread was smooth. The lamp was upright. If Javier had fought, he had done it elsewhere, close enough to water and tile for someone to sell the wrong story.
    -> bedroom

+ [Return to the center of the apartment.] -> apartment_nav
