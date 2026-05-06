# Client Integrations

The AI Agents Development Kit is "Adapter-Thin." It is designed to work with any AI client that can read files and execute shell commands.

---

## 🔌 Model Context Protocol (MCP)

The kit is compatible with **MCP**, the universal standard for connecting AI agents to tools.

### Using as an MCP Tool
You can expose the kit's skills as MCP tools using a server like `mcp-server-shell`. This allows Cursor or Claude Code to "call" a skill with a specific feature slug.

**Example Configuration (`claude_desktop_config.json`):**
```json
"mcpServers": {
  "devkit": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-shell", "--allow-command", "cat skills/kit-spec/SKILL.md"]
  }
}
```

---

## 🌟 Golden Configurations

### 1. Cursor (.cursorrules)
Cursor is highly effective when the `SKILL.md` instructions are anchored in the `.cursorrules` file.
*   **Setup:** Copy the content of `adapters/AGENTS.example.md` into your `.cursorrules`.
*   **Tip:** Use the `@` symbol to reference specific artifacts (e.g., `@spec.md`) to keep the agent focused.

### 2. Claude Code (CLAUDE.md)
Claude Code uses `CLAUDE.md` to set the project-wide persona.
*   **Setup:** Copy `adapters/CLAUDE.example.md` to the root.
*   **Optimization:** Use the `use subagent` command for the `/kit-research` phase to keep the main chat context clean.

### 3. Gemini CLI (GEMINI.md)
Gemini CLI is the native runtime for this kit.
*   **Setup:** The kit's structure is natively optimized for Gemini's large context window.
*   **Tip:** Use `/kit-verify` to summarize the entire feature state before asking for a final review.

---

## 📏 Entry Point Rules

To keep your integration professional and clean, follow these rules:

1.  **Don't Duplicate:** Never copy-paste the full body of a skill into an adapter. Point to the file in `skills/` instead.
2.  **Stateful Slugs:** Always require a `<slug>` for feature-specific commands to ensure artifacts are stored in the correct directory.
3.  **Verification First:** Every adapter must emphasize that "Done" requires fresh evidence, not just a plausible diff.

---

## 🛠 Discovery Sequence

When an agent initializes in a repo with the kit, it should follow this discovery order:
1.  Read the **Adapter** (`AGENTS.md`, etc.).
2.  Load the **Constitution** (`memories/repo/constitution.md`).
3.  Load the **Knowledge Base** (`memories/repo/project-knowledge-base.md`).
4.  Before running bootstrap, make sure the kit has been copied or vendored there. Note: it does not install `skills/` for you.
Point your agent to `memories/repo/`, `artifacts/features/<slug>/`, and `adapters/GEMINI.example.md` for context.
