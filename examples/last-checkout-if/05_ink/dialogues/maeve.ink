=== maeve_dialogue ===
Dr. Maeve Ibarra did not look up until she had finished bagging a trace sample. Maeve believed the dead deserved complete sentences.

+ {not talked_maeve_body} [Ask for the first medical read.]
    ~ talked_maeve_body = true
    ~ clue_ligature_mark = true
    "He was not killed by the fall," she said. "There is a ligature mark under the jaw. Soft material. Narrow pull. Strong pressure."

    "Could he do it to himself?"

    "Not from that angle, and not with those bruises."
    -> maeve_dialogue

+ {clue_scarf and clue_ligature_mark and not talked_maeve_scarf} [Show her the scarf from the trash.]
    ~ talked_maeve_scarf = true
    ~ evidence_how = true
    Maeve took the scarf without drama. She matched its width with the mark on Javier's throat and gave me the look she used when uncertainty had run out of room.

    "This could have done it," she said. "If the lab gives me skin cells or fibers, I will say it louder."

    The method was no longer a shadow.
    -> maeve_dialogue

+ {not clue_scarf} [Ask what kind of weapon to look for.]
    "Soft," Maeve said. "A towel, scarf, belt, maybe a cord wrapped in fabric. Something that could vanish into domestic clutter."

    In a rented apartment, domestic clutter came prearranged.
    -> maeve_dialogue

+ [Ask whether the scene fits an accident.]
    "No," Maeve said. "The body was moved. The wet marks are too selective, and the towel is dry where it should not be. Someone wanted a fall. They did not earn one."
    -> maeve_dialogue

+ [Leave Maeve to the body.] -> apartment_nav

