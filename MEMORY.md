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

### Session: AI Memory Concepts Discussion (March 2026)
**What was explored**:
- Concept of AI memory systems vs human working memory
- Local AI inference vs human short-term memory retention
- Ongoing context window limitations (tokens, not permanent storage)
- Memory vs Context Window distinction in LLMs
- Human memory patterns: encoding, storage, retrieval vs token attention
- AI can "remember" through session persistence (file storage, database)
- AI memory files: structured (JSON/DB) vs semantic (embedding vectors)

**Key distinctions**:
- Human: Biological brain, permanent memory, no token limit, context is attention
- AI: Computational, temporary context window, permanent storage via files, context is model state

**Memory file formats**:
- Structured: JSON, SQLite, YAML, text files
- Semantic: Vector embeddings, RAG (Retrieval-Augmented Generation)
- Process: Load → Read → Modify → Save → Auto-load on next session

**AI workflow patterns**:
- Always commit memory updates before ending session
- Pull before starting new session on any machine
- CLAUDE.md auto-loaded, MEMORY.md must be manually loaded
- Memory is versioned (treat like code, commit changes)

### Session: AI Memory Concepts Exploration (March 2026)
**Topics discussed**:
- **AI Memory systems**:
  - Working memory: Current conversation context (auto-truncated to ~2000 lines)
  - Auto memory: Persistent directory at ~/.claude/projects/-home-tmessmer-claude-setup/memory/
  - Long-term memory: Version-controlled, cross-machine synced via git
  - Semantic memory organization by topic, not chronology
- **Local AI vs Cloud**:
  - Local: Ollama + glm-4.7-flash (faster, private, but less capable models)
  - Cloud: Anthropic API (higher capability, paid, but less private)
  - Subagents can use different backends than main session

**Key conventions established**:
- MEMORY.md is NOT auto-loaded - must explicitly load with `read MEMORY.md`
- CLAUDE.md is auto-loaded by Claude Code on startup
- Memory files are version controlled via git and synced across machines
- Create separate topic files for detailed notes (e.g., debugging.md)
- Only commit memory updates when knowledge is stable and verified
- Update memory if previous knowledge is proven wrong or changed
