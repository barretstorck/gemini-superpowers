# Gemini Superpowers

**Gemini Superpowers** is a comprehensive extension for the Gemini CLI that equips your AI agent with advanced software engineering capabilities.

Ported from the original [Superpowers](https://github.com/obra/superpowers) project, this extension transforms Gemini from a standard chat interface into a rigorous, autonomous, and methodologically sound developer partner. It achieves this by injecting proven workflows, strict protocols, and specialized knowledge directly into the agent's context.

## 🚀 Features

This extension enhances Gemini through three main components:

### 1. 🧠 Skills
Skills are specialized instructional modules that "teach" the agent how to perform complex tasks reliably. Unlike simple prompts, skills are rigorous, tested protocols that the agent follows to avoid common pitfalls.

**Core Skill Categories:**

*   **Planning & Strategy**
    *   `brainstorming`: Structured creative thinking and option analysis.
    *   `writing-plans` & `executing-plans`: converting vague requests into step-by-step implementation guides.
*   **Development Methodology**
    *   `test-driven-development`: Enforces the Red-Green-Refactor cycle.
    *   `subagent-driven-development`: Orchestrates complex tasks by delegating to specialized sub-agents.
    *   `systematic-debugging`: Scientific method applied to bug fixing (root cause analysis).
    *   `finishing-a-development-branch`: A checklist for ensuring code is truly "done".
*   **Quality Assurance**
    *   `code-reviewer`: Expert guidelines for reviewing code style, security, and performance.
    *   `verification-before-completion`: Prevents "hallucinated" success by enforcing final checks.
*   **Meta-Skills**
    *   `writing-skills`: A TDD framework for creating *new* skills (yes, the agent can write its own upgrades).
    *   `using-superpowers`: The entry point that teaches the agent how to use this very system.

### 2. ⚡ Commands
Shortcut commands that streamline high-frequency actions. Instead of typing long prompts, use these triggers:

*   `/brainstorm`: Initiates a structured brainstorming session.
*   `/write-plan`: Generates a detailed implementation plan for a feature.
*   `/execute-plan`: Kicks off the execution of a plan, typically involving sub-agents.

### 3. 🎣 Hooks
Hooks allow the extension to intervene at specific points in the CLI lifecycle.

*   **Session Start**: Automatically injects the `using-superpowers` context when you start a new session. This ensures the agent is immediately aware of its capabilities and doesn't need to be "reminded" to be smart.

## 📦 Installation

To use these superpowers with your local Gemini CLI, link the current directory as an extension:

```bash
gemini extensions link .
```

## 🛠 Usage

Once installed, the extension works seamlessly in the background:

1.  **Automatic Activation**: When you start a session, the **SessionStart** hook primes the agent.
2.  **Context-Aware Skills**: The agent's system prompt is updated to know *about* its skills. When you ask for tasks like "debug this" or "write a plan," the agent will know to activate the relevant skill (e.g., `systematic-debugging` or `writing-plans`) to guide its behavior.
3.  **Manual Commands**: You can explicitly trigger workflows using the defined commands (e.g., typing `/brainstorm` in the chat).

## 🏗 Extending & Contributing

The unique philosophy of this project is that **documentation is treated like code**.

*   **TDD for Docs**: We use a "Test-Driven Documentation" approach. Before writing a new skill, we first create a "pressure test" scenario where the standard agent fails. We then write the skill to fix that failure.
*   **How to add a skill**: Read `skills/writing-skills/SKILL.md`. It contains the complete guide on how to author, test, and add new skills to the system.

## 📂 Project Structure

*   `skills/`: The knowledge base. Each subdirectory contains a `SKILL.md` file.
*   `commands/`: TOML definitions for CLI shortcuts.
*   `hooks/`: Shell scripts triggered by CLI events.
*   `.gemini/`: Local configuration and overrides.
*   `GEMINI.md`: Comprehensive context documentation for the agent itself.