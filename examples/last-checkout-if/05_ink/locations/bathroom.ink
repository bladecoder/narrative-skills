=== bathroom ===
{not visited_bathroom:
The bathroom was all white tile and bad light. Javier Morrow lay half turned beside the tub, one hand open against the floor. Dr. Maeve Ibarra crouched beside him with her gloves already dark at the fingertips.
- else:
The bathroom gave back the same cold light. Javier waited in it with the patience of the dead.
}
~ visited_bathroom = true

+ {not clue_ligature_mark} [Examine Javier's neck with Dr. Ibarra.]
    ~ clue_ligature_mark = true
    Maeve angled the lamp. Under the jaw, almost hidden by shaving shadow, ran a narrow bruised line.

    "Not a fall," she said. "Pressure. Soft material, pulled hard."

    ~ talked_maeve_body = true
    -> bathroom

+ {not clue_earring_back} [Check the basin and drain.]
    ~ clue_earring_back = true
    A pearl earring back glittered in the bend of the basin trap. I lifted it with tweezers and let it rest in an evidence sleeve, tiny as a period at the end of a sentence.
    {clue_clara_missing_earring:
        ~ evidence_who = true
        The missing earring in the living room had just placed Clara where she swore she had never been.
    }
    -> bathroom

+ [Study the staging.]
    The towel on the rail was dry. The bath mat was wet only near Javier's shoulder. Someone had added disorder after the body stopped being able to object.
    -> bathroom

+ [Return to the center of the apartment.] -> apartment_nav
