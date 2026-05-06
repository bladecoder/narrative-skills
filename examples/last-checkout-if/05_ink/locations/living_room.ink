=== living_room ===
{not visited_living:
The living room had been arranged by someone who thought temporary meant innocent. A gray sofa faced a television no one had turned on. The kitchenette ran along one wall: two stools, a short counter, a sink bright with recent wiping.

Clara Voss sat under the lamp with one knee crossed over the other. One pearl earring shone at her left ear. The right ear showed only a small red mark where its twin should have been.
- else:
The living room still smelled of rainwater, gin, and the lemon cleaner somebody had used too late.
}
~ visited_living = true

+ {not clue_clara_missing_earring} [Look more closely at Clara.]
    ~ clue_clara_missing_earring = true
    Her hair was pinned back on one side. The missing right earring was not a fashion choice; the skin there was freshly rubbed, as if the clasp had been torn away.
    {clue_earring_back:
        ~ evidence_who = true
        The little pearl back from the bathroom had just found its owner.
    }
    -> living_room

+ {not clue_scarf} [Search the kitchenette trash.]
    ~ clue_scarf = true
    Beneath coffee pods and a paper sleeve from a bottle of tonic, I found a blue silk scarf twisted into a tight rope. One end was damp. The other carried a faint brown smear that was not makeup.
    {clue_ligature_mark and talked_maeve_body:
        I did not need poetry to see the shape of it. I needed Maeve to make it speak in court.
    }
    -> living_room

+ [Check the counter and sofa.]
    There were two glasses on the counter. Javier's held a thumbprint in condensation. Clara's was dry, lipstick bright on the rim, placed where she could reach it from the sofa.

    The arrangement said she had staged stillness after movement. It did not say enough by itself.
    -> living_room

+ [Return to the center of the apartment.] -> apartment_nav
