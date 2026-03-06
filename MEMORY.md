# Claude Setup - Shared Context

## Project Overview
- Repository: tmessmerjr/claude-setup
- Purpose: Shared context and documentation for Claude Code workflow
- Platform: Cross-workstation collaboration

## Quick Start
1. Clone this repository: `git clone https://github.com/tmessmerjr/claude-setup.git`
2. Review `memory/` directory for project-specific context
3. Check `docs/` for detailed documentation
4. Use `scripts/sync-memory.sh` to keep local and remote in sync

## Project Structure
```
claude-setup/
├── MEMORY.md          # Main index - Claude auto-reads this
├── README.md          # Project overview
├── memory/            # Shared knowledge base (project-specific)
│   ├── conventions.md  # Coding standards and conventions
│   ├── decisions.md    # Architecture decisions and rationale
│   └── debugging.md    # Common debugging patterns
├── docs/              # Detailed documentation
│   ├── workflow-guide.md
│   └── api-design.md
└── scripts/           # Automation scripts
    └── sync-memory.sh
```

## Key Principles
- **Memory is versioned**: Treat important context as code
- **Auto-loaded context**: Claude reads `MEMORY.md` automatically
- **Cross-workstation sync**: Use git to share between machines
- **Scalable structure**: Organize by topic, not by date

## Team Notes
- Always commit memory updates to GitHub
- Update `MEMORY.md` when making significant project decisions
- Keep memory files markdown-formatted for easy editing
- Use consistent formatting across all memory files

## Related Resources
- Claude Code documentation: https://docs.anthropic.com/claude-code
- MCP servers: Configured for GitHub and local tools
- Auto-memory: Manual setup via `memory/` directory