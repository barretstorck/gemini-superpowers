# Gemini Superpowers Project Context

## Overview
This repository hosts the **Gemini Superpowers** extension, a port of the [Superpowers](https://github.com/obra/superpowers) project for the Gemini CLI. It enhances the Gemini agent with advanced **Skills**, **Commands**, and **Hooks** to improve reasoning, planning, and code execution.

## Directory Structure

*   **`skills/`**: Contains the definitions of advanced capabilities (skills).
    *   Each skill is in its own subdirectory (e.g., `skills/writing-skills/`).
    *   **`SKILL.md`**: The required main documentation file for a skill.
    *   **Supporting files**: Scripts, templates, or extra documentation (e.g., `render-graphs.js`).
*   **`commands/`**: Contains TOML files defining shortcut commands (e.g., `execute-plan.toml`).
*   **`hooks/`**: Scripts triggered by Gemini CLI lifecycle events (e.g., `session-start.sh`).
*   **`.gemini/`**: Local configuration and overrides (e.g., local skills or commands).
*   **`gemini-extension.json`**: The main configuration file for the extension, defining metadata and hooks.

## Key Components

### 1. Skills
Skills are reference guides that teach the agent specific workflows or patterns.
*   **Location:** `skills/<skill-name>/SKILL.md`
*   **Philosophy:** Skills are created using a **Test-Driven Development (TDD)** approach for documentation (RED-GREEN-REFACTOR).
    *   **RED:** Verify the agent fails/struggles without the skill.
    *   **GREEN:** Write the minimal `SKILL.md` to fix the behavior.
    *   **REFACTOR:** Refine and bulletproof against loopholes.
*   **Structure:**
    *   **Frontmatter:** YAML with `name` and `description` (critical for discovery).
    *   **Content:** Overview, When to Use, Core Pattern, and Examples.
*   **Reference:** See `skills/writing-skills/SKILL.md` for the authoritative guide on creating skills.

### 2. Commands
Commands are shortcuts that execute specific prompts or actions.
*   **Location:** `commands/<command-name>.toml`
*   **Format:**
    ```toml
    description = "Brief description of what the command does"
    prompt = """
    The specific instructions or prompt to execute.
    """
    ```

### 3. Hooks
Hooks allow dynamic context injection at specific times.
*   **Current Hook:** `SessionStart` -> `hooks/session-start.sh`
*   **Function:** Injects the `using-superpowers` skill content into the context at the start of every session, ensuring the agent knows how to access its new capabilities.

## Development Workflow

### Installation
To test or use the extension locally, link it to your Gemini CLI:
```bash
gemini extensions link .
```

### Creating a New Skill
1.  **Plan:** Identify a recurring problem or pattern.
2.  **Test (Red):** Create a "pressure scenario" (test case) where the agent fails without the skill.
3.  **Write (Green):** Create `skills/<new-skill>/SKILL.md` following the TDD guidelines.
4.  **Verify:** Run the scenario again to ensure the agent succeeds.
5.  **Refactor:** Polish the documentation and add edge cases.

### Creating a New Command
1.  Create a new `.toml` file in `commands/`.
2.  Define the `description` and `prompt`.
3.  The command will be available as `/ <filename-without-extension>`.

## Guidelines
*   **Token Efficiency:** Keep skills concise. Use `activate_skill` to load specialized knowledge only when needed.
*   **Discovery:** Write clear `description` fields in `SKILL.md` frontmatter starting with "Use when..." so the agent knows when to load the skill.
*   **Testing:** **"No skill without a failing test first."** All skills must be verified against actual agent behavior.
