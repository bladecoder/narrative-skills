=== pike_dialogue ===
Officer Pike stood near the door with his notebook open and his face set in the brave expression of a man hoping procedure could hold the world together.

+ {not talked_pike_timing} [Ask about the timing.]
    ~ talked_pike_timing = true
    "Neighbor downstairs heard a thump at 12:18," Pike said. "Call came in at 12:21. I arrived at 12:28. The chain was not on, no sign of forced entry."

    "Anyone leave?"

    "No one I saw. Hall camera is dead, because of course it is."
    -> pike_dialogue

+ [Ask about Clara's first statement.]
    "She said she sat on the sofa the whole time," Pike said. "Said he went to the bathroom alone. She was very clear about not touching anything."

    People who were very clear before they had been accused always interested me.
    -> pike_dialogue

+ [Ask about other suspects.]
    Pike shook his head. "No forced entry, no open window, no extra glass, no neighbor saw another visitor. If someone else did it, they came through a wall."

    I had yet to arrest a wall.
    -> pike_dialogue

+ [Let Pike keep the door.] -> apartment_nav

