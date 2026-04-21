---
name: ink-doc
description: Create and edit interactive narrative scripts using the ink scripting language. Use when creating choice-based stories, branching dialogues, interactive fiction, or when the user mentions ink, knots, stitches, weaves, or interactive narratives.
metadata:
  author: rgarcia
  version: "1.0"
  ink-version: "1.0"
---

# Ink Script Creation Skill

This skill helps you create interactive narrative scripts using the **ink** scripting language. Ink is designed for creating branching stories, interactive dialogues, and choice-based narratives.

## When to use this skill

Use this skill when:
- Creating interactive fiction or choice-based stories
- Writing branching dialogue systems for games
- Building narrative-driven content with player choices
- Working with ink scripts (`.ink` files)
- The user mentions: knots, stitches, diverts, weaves, choices, or ink syntax

## How to use this skill

### 1. Understanding the documentation structure

The ink documentation has been split into focused, modular files in the `references/` directory. **Only read the files you need** for the current task to avoid filling the context.

Available reference files:
- `references/introduction.md` - Basic overview of ink
- `references/1-the-basics.md` - Part 1 overview
- `references/1-1-content.md` - Basic content and text
- `references/1-2-choices.md` - Creating player choices
- `references/1-3-knots.md` - Organizing content into knots
- `references/1-4-diverts.md` - Controlling story flow
- `references/1-5-branching-the-flow.md` - Branching techniques
- `references/1-6-includes-and-stitches.md` - Sub-sections and file organization
- `references/1-7-varying-choices.md` - Conditional and sticky choices
- `references/1-8-variable-text.md` - Dynamic text content
- `references/1-9-game-queries-and-functions.md` - Built-in queries
- `references/2-weave.md` - Part 2 overview: Weave syntax
- `references/2-1-gathers.md` - Gather points
- `references/2-2-nested-flow.md` - Nested choices and gathers
- `references/2-3-tracking-a-weave.md` - Labels and flow tracking
- `references/3-variables-and-logic.md` - Part 3 overview
- `references/3-1-global-variables.md` - Global variables
- `references/3-2-logic.md` - Mathematical and logical operations
- `references/3-3-conditional-blocks.md` - If/else structures
- `references/3-4-temporary-variables.md` - Temporary variables
- `references/3-5-functions.md` - Creating functions
- `references/3-6-constants.md` - Defining constants
- `references/3-7-advanced-game-side-logic.md` - External functions
- `references/4-advanced-flow-control.md` - Part 4 overview
- `references/4-1-tunnels.md` - Tunnel syntax for subroutines
- `references/4-2-threads.md` - Threading multiple story sections
- `references/5-advanced-state-tracking.md` - Part 5 overview
- `references/5-1-basic-lists.md` - List basics
- `references/5-2-reusing-lists.md` - Reusing list values
- `references/5-3-list-values.md` - List as numbers
- `references/5-4-multivalued-lists.md` - Lists with multiple values
- `references/5-5-advanced-list-operations.md` - Advanced list operations
- `references/5-6-multi-list-lists.md` - Combining multiple lists
- `references/5-7-long-example-crime-scene.md` - Complete example
- `references/5-8-summary.md` - Lists summary
- `references/6-international-character-support-in-identifiers.md` - Unicode support

### 2. Progressive learning approach

Start simple and add complexity as needed:

1. **For basic stories**: Read only `1-1-content.md`, `1-2-choices.md`, and `1-3-knots.md`
2. **For branching narratives**: Add `1-4-diverts.md` and `1-5-branching-the-flow.md`
3. **For complex flows**: Use weave syntax from `2-1-gathers.md` and `2-2-nested-flow.md`
4. **For state tracking**: Read `3-1-global-variables.md` and `3-2-logic.md`
5. **For advanced features**: Consult Part 4 (tunnels/threads) or Part 5 (lists) as needed

### 3. Creating ink scripts

#### Basic structure
```ink
// Simple linear story
Hello, world!
This is a basic ink script.
-> END
```

#### With choices
```ink
You stand at a crossroads.
* [Go left] -> left_path
* [Go right] -> right_path

=== left_path ===
You head down the left path.
-> END

=== right_path ===
You take the right path.
-> END
```

#### With variables and logic
```ink
VAR health = 100
VAR gold = 50

=== start ===
You have {health} health and {gold} gold.
* {gold >= 30} [Buy a potion (30 gold)]
    ~ gold -= 30
    ~ health += 20
    You feel stronger!
* [Continue] -> next_scene
```

### 4. Best practices

1. **Read only what you need**: Don't load all reference files at once. Check the list above and read only the relevant sections.

2. **Start with examples**: Look at the code examples in the reference files for the feature you need.

3. **Test incrementally**: Build your script step by step, testing each feature as you add it.

4. **Use comments**: Add `//` comments to explain complex logic.

5. **Organize with knots**: Break your story into logical sections using knots (`=== knot_name ===`).

6. **Use meaningful names**: Choose descriptive names for knots, variables, and stitches.

### 5. Common patterns

#### Simple conversation
Read: `1-2-choices.md`, `1-8-variable-text.md`

#### State machine (e.g., door locked/unlocked)
Read: `5-1-basic-lists.md` or `3-1-global-variables.md`

#### Complex branching with rejoining
Read: `2-1-gathers.md`, `2-2-nested-flow.md`

#### Inventory system
Read: `5-4-multivalued-lists.md`

#### Reusable dialogue
Read: `4-1-tunnels.md`

### 6. File organization

For larger projects:
- Use `INCLUDE` to split content across multiple `.ink` files
- Keep related content in the same knot
- Use stitches for sub-sections within a knot
- Reference: `1-6-includes-and-stitches.md`

## Quick reference: Essential syntax

**Content**: Just write text
```ink
This is content that will be displayed.
```

**Choices**: Use `*` for once-only, `+` for sticky (repeatable)
```ink
* [Choice text] Content after choice
+ [Repeatable choice] This can be chosen multiple times
```

**Knots**: Sections of content
```ink
=== knot_name ===
Content here
```

**Diverts**: Flow control
```ink
-> knot_name
-> END
```

**Variables**: Track state
```ink
VAR health = 100
~ health -= 10
{health} // Display variable
```

**Conditionals**: Test conditions
```ink
{health > 50: You feel strong | You feel weak}
* {health > 30} [Fight] -> fight
```

**Comments**: Not displayed
```ink
// Single line comment
/* Multi-line
   comment */
```

## Troubleshooting

If you need help with:
- **Syntax errors**: Check the relevant reference file for correct syntax
- **Flow control**: Review `1-4-diverts.md` and `1-5-branching-the-flow.md`
- **Choices not appearing**: Check conditionals in `1-7-varying-choices.md`
- **Variables not working**: Review `3-1-global-variables.md` and `3-2-logic.md`
- **Complex examples**: Look at `5-7-long-example-crime-scene.md`

## Remember

**Load references on demand** - only read the files you need for the current task. This keeps the context clean and focused.
