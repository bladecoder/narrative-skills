=== clara_dialogue ===
Clara looked smaller when I stood near her, but not weaker. There was a difference. Weak people trembled by accident. Clara chose when to tremble.

+ {not talked_clara_alibi} [Ask her to repeat her alibi.]
    ~ talked_clara_alibi = true
    "Javier was drunk," she said. "He went to the bathroom to wash his face. I stayed here. I heard a noise, then I screamed for help."

    "You never went in?"

    "Not until the officer came. I could not bear to look."
    -> clara_dialogue

+ {clue_earring_back and clue_clara_missing_earring and not contradicted_clara_presence} [Confront her with the earring.]
    ~ contradicted_clara_presence = true
    ~ evidence_who = true
    I showed her the evidence sleeve. "This came from the bathroom sink. You're missing its twin."

    Clara touched her bare ear too late.

    "Javier took it," she said. "He was playing with it while we drank. He must have carried it in there."

    It was a lie with fresh paint. I wrote it down anyway.
    -> clara_dialogue

+ {clue_scarf and clue_ligature_mark} [Ask about the blue scarf.]
    "Your scarf was in the trash."

    Clara looked toward the kitchenette and found the distance longer than she expected.

    "Javier spilled gin on it," she said. "I threw it away. It was ruined."

    {evidence_how:
        "Dr. Ibarra says soft material crushed his throat."

        "Then someone else used it." She gave me the answer too fast. "Someone came in while I was crying."
    - else:
        I let the lie sit. Without the medical connection, it was only ugly cloth in a bin.
    }
    -> clara_dialogue

+ {evidence_why and not contradicted_clara_motive} [Ask about Javier's blackmail.]
    ~ contradicted_clara_motive = true
    "He had gallery files with your name on them," I said. "And a message demanding ten thousand more."

    For the first time, Clara forgot to look sad.

    "He was helping me," she said. "I made mistakes. He said he knew a lawyer."

    "Helpful men rarely write deadlines."

    She folded the tissue until it became a hard white square.
    -> clara_dialogue

+ [Watch her without speaking.]
    Silence bothered her more than accusation. She filled it with a small breath, a glance at the bathroom door, a hand drifting to the bare ear and stopping halfway.
    -> clara_dialogue

+ [End the conversation.] -> apartment_nav

