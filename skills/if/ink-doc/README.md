# Ink Script Creation Skill

An Agent Skill for creating interactive narrative scripts using the **ink** scripting language.

## What is this skill?

This skill enables AI agents to create, edit, and understand ink scripts - a powerful scripting language designed for interactive fiction, branching dialogues, and choice-based narratives.

## Structure

```
ink-skill/
├── SKILL.md              # Main skill instructions
└── references/           # Modular ink documentation (36 files)
    ├── introduction.md
    ├── 1-*.md           # Part 1: The Basics
    ├── 2-*.md           # Part 2: Weave
    ├── 3-*.md           # Part 3: Variables and Logic
    ├── 4-*.md           # Part 4: Advanced Flow Control
    ├── 5-*.md           # Part 5: Advanced State Tracking
    └── 6-*.md           # Part 6: International Character Support
```

## Key Features

- **Progressive disclosure**: Documentation is split into 36 focused files that can be loaded on-demand
- **Comprehensive coverage**: Covers all ink features from basics to advanced topics
- **Practical examples**: Each reference file includes working code examples
- **Context-efficient**: Only load the documentation you need for the current task

## Usage

When an agent activates this skill, it can:
1. Read the main `SKILL.md` for overview and guidance
2. Load specific reference files as needed (e.g., only `1-2-choices.md` for choice syntax)
3. Create ink scripts progressively, consulting documentation only when needed

## Reference Files Organization

### Part 1: The Basics (10 files)
Core concepts for getting started with ink

### Part 2: Weave (4 files)
Advanced flow control using gathers and nested structures

### Part 3: Variables and Logic (8 files)
State management, variables, functions, and logic

### Part 4: Advanced Flow Control (3 files)
Tunnels and threads for complex narrative structures

### Part 5: Advanced State Tracking (9 files)
List system for sophisticated state management

### Part 6: International Support (1 file)
Unicode character support in identifiers

## Documentation Source

The reference documentation is the official ink language documentation, split into modular files for efficient context usage.

## License

See the main project license for details.
