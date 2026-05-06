=== apartment_nav ===
The apartment waited around me: living room and kitchenette, bedroom, bathroom. Three rooms, one corpse, and one woman who kept her grief too carefully folded.

+ [Search the living room and kitchenette.] -> living_room
+ [Enter the bedroom.] -> bedroom
+ [Enter the bathroom.] -> bathroom
+ [Question Clara Voss.] -> clara_dialogue
+ [Speak with Officer Pike.] -> pike_dialogue
+ [Speak with Dr. Ibarra.] -> maeve_dialogue
+ [Review my notebook.] -> notebook
+ [Accuse Clara Voss.] -> accuse_clara

=== notebook ===
I opened my notebook and took stock.

Who:
{evidence_who:
Clara had been placed in the bathroom by the earring evidence.
- else:
I still needed to place Clara inside the bathroom.
}

How:
{evidence_how:
The scarf and the ligature mark gave me the method.
- else:
I still needed to prove how Javier had died.
}

Why:
{evidence_why:
The blackmail papers gave me Clara's motive.
- else:
I still needed a motive strong enough for murder.
}

The trick in murder was not finding facts. It was making the facts stand close enough together that the lie had nowhere left to breathe.

-> apartment_nav

=== accuse_clara ===
I stood over Clara. She looked up slowly, as if my shadow had taken too much of the room.

{evidence_who and evidence_how and evidence_why:
    ~ case_closed = true
    "You were in the bathroom," I said. "Your earring back was in the basin trap, and you were missing the pearl that matched it."

    Clara's mouth tightened.

    "You strangled Javier with your scarf. Dr. Ibarra found the ligature mark, and the scarf was in the kitchenette trash because you needed it out of sight."

    The tissue tore between her fingers.

    "And he was blackmailing you. Lisbon gallery money, a bank transfer, a deadline. He brought the proof. You brought the scarf."

    For a moment the rain did all the talking.

    "He said he would ruin me," Clara said at last. Her voice had lost the polish. "He laughed when I begged. I only meant to stop him talking."

    "People always say that after they stop someone breathing."

    Pike moved in, cuffs ready. Clara did not fight. The room seemed smaller after the confession, as if the apartment had only been rented for that one lie and now the lease had expired.

    -> END
- else:
    Clara watched me measure the silence.

    {not evidence_who:
    I had not yet proved she entered the bathroom.
    }
    {not evidence_how:
    I had not yet tied the death to a weapon.
    }
    {not evidence_why:
    I had not yet found the motive.
    }

    "Detective," she said, "I know you need someone to blame. But I sat right here. Javier went in alone."

    It was a good lie because it was small. I went back to the rooms and looked for the parts that did not fit.

    -> apartment_nav
}

