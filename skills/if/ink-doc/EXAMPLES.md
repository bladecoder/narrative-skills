# Example Usage

This file demonstrates how an agent would use the ink-skill.

## Scenario 1: Creating a simple branching story

**User request**: "Create a simple ink story where the player meets a guard and can choose to bribe or fight them"

**Agent workflow**:

1. Activates `ink-skill`
2. Reads `SKILL.md` to understand the structure
3. Identifies needed references:
   - `references/1-2-choices.md` (for basic choices)
   - `references/1-3-knots.md` (for organizing sections)
   - `references/1-4-diverts.md` (for flow control)
4. Creates the ink script:

```ink
=== meet_guard ===
You approach the city gate. A guard blocks your path.
"Halt! What's your business here?"

* [Offer a bribe]
    -> bribe_guard
* [Attack the guard]
    -> fight_guard
* [Turn back]
    You decide this isn't worth the trouble and walk away.
    -> END

=== bribe_guard ===
You slip some coins into the guard's palm.
"Ah, a generous traveler. Pass, friend."
You enter the city without trouble.
-> END

=== fight_guard ===
You draw your weapon. The guard looks alarmed.
"So that's how it is!"
The fight is brief but brutal. You manage to overcome the guard.
Breathing heavily, you step through the gate.
-> END
```

**Context used**: Only 3 reference files (~200 lines) instead of the entire documentation (~3400 lines)

---

## Scenario 2: Adding variable tracking

**User request**: "Add health tracking to the previous example"

**Agent workflow**:

1. Already has `ink-skill` active
2. Reads only:
   - `references/3-1-global-variables.md` (for VAR syntax)
   - `references/3-3-conditional-blocks.md` (for health checks)
3. Enhances the script:

```ink
VAR health = 100
VAR gold = 50

=== meet_guard ===
You have {health} health and {gold} gold.

You approach the city gate. A guard blocks your path.
"Halt! What's your business here?"

* {gold >= 30} [Offer a bribe (30 gold)]
    -> bribe_guard
* {health > 50} [Attack the guard]
    -> fight_guard
* [Turn back]
    -> END

=== bribe_guard ===
~ gold -= 30
You slip some coins into the guard's palm.
"Ah, a generous traveler. Pass, friend."
-> city_entrance

=== fight_guard ===
~ health -= 30
You draw your weapon and fight!
{health > 0:
    You win, but you're wounded.
    -> city_entrance
- else:
    You fall to the ground, defeated.
    -> END
}

=== city_entrance ===
You enter the city with {health} health remaining.
-> END
```

**Additional context**: Only 2 more reference files (~230 lines)

---

## Scenario 3: Complex interactive dialogue

**User request**: "Create a detective interrogation with multiple suspects and evidence tracking"

**Agent workflow**:

1. Reads:
   - `references/2-1-gathers.md` (for conversation loops)
   - `references/5-4-multivalued-lists.md` (for evidence tracking)
   - `references/1-7-varying-choices.md` (for conditional choices)

2. Creates sophisticated script using lists and weave patterns

**Context efficiency**: Loads ~600 lines of relevant documentation instead of all 3400+ lines

---

## Key Benefits

1. **Efficient context usage**: Only loads needed documentation
2. **Progressive complexity**: Start simple, add features as needed
3. **Quick reference**: Clear list of available reference files in SKILL.md
4. **Focused learning**: Agent learns only what's needed for current task
