# Claude Setup - Shared Context

## Important: How Memory Works
- **CLAUDE.md is auto-loaded** by Claude Code on every session startup
- **MEMORY.md is NOT auto-loaded** - manually load it by telling Claude: `read MEMORY.md and continue from where we left off`
- Memory files are version controlled via git and synced across machines

## Project Overview
- Repository: tmessmerjr/claude-setup
- Purpose: Shared context and documentation for Claude Code workflow
- Platform: Cross-workstation (home + work Linux machines)

## Project Structure
```
claude-setup/
├── CLAUDE.md          # Auto-loaded by Claude Code on startup
├── MEMORY.md          # Manual context - load explicitly each session
├── README.md          # Project overview and setup instructions
├── memory/            # Shared knowledge base
│   ├── conventions.md  # Coding standards and conventions
│   ├── decisions.md    # Architecture decisions and rationale
│   └── debugging.md    # Common debugging patterns
├── docs/              # Detailed documentation
│   └── workflow-guide.md
└── scripts/           # Automation scripts
    ├── claude_local.sh
    ├── claude_cloud.sh
    └── setup_new_machine.sh
```

## Key Principles
- Memory is versioned - treat context as code
- Always commit memory updates before ending a session
- Pull before starting a new session on any machine
- Only CLAUDE.md is auto-read - everything else is manual

## Session Notes

### Session: Initial Setup (March 2026)
**What was built**:
- Claude Code installed with native installer
- Ollama + glm-4.7-flash running locally
- GitHub MCP connected
- Repo pushed to GitHub
- Local/cloud aliases set up in ~/.bashrc

**Key learnings**:
- claude-local routes to Ollama, claude routes to Anthropic API
- /model command only switches between models on same backend
- Two terminals recommended for switching between local and cloud
- MEMORY.md must be loaded manually, CLAUDE.md is automatic

**Next steps**:
- Set up work machine using setup_new_machine.sh
- Experiment with subagents using cloud models
