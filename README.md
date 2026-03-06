# Claude Setup

Personal Claude Code orchestration setup with local LLM support via Ollama.

## Stack
- Claude Code - Anthropic's agentic coding tool
- Ollama + glm-4.7-flash - local LLM backend
- GitHub MCP - repo and issue management
- **Memory System** - Cross-workstation context and documentation

## Project Structure

```
claude_setup/
├── MEMORY.md          # Main index - Claude auto-reads this
├── README.md          # This file
├── memory/            # Shared knowledge base
│   ├── conventions.md  # Coding standards
│   ├── decisions.md    # Architecture decisions
│   └── debugging.md    # Debugging patterns
├── docs/              # Detailed documentation
│   └── workflow-guide.md
├── scripts/           # Automation scripts
│   └── sync-memory.sh
└── models/            # Model notes
```
- **Memory System** - Cross-workstation context and documentation

## Project Structure

```
claude_setup/
├── MEMORY.md          # Main index - Claude auto-reads this
├── README.md          # This file
├── memory/            # Shared knowledge base
│   ├── conventions.md  # Coding standards
│   ├── decisions.md    # Architecture decisions
│   └── debugging.md    # Debugging patterns
├── docs/              # Detailed documentation
│   └── workflow-guide.md
├── scripts/           # Automation scripts
│   └── sync-memory.sh
└── models/            # Model notes
```

## New Machine Setup

### Prerequisites
You will need:
- Linux (Ubuntu/Debian)
- GitHub Personal Access Token (classic) with `repo` scope
- Anthropic account (Pro, Max, or Team)

### Install
```bash
# Clone this repo first
git clone https://github.com/tmessmerjr/claude-setup.git ~/claude_setup
cd ~/claude_setup

# Set your GitHub token
echo 'export GITHUB_PAT=your_token_here' >> ~/.bashrc
source ~/.bashrc

# Run setup script
chmod +x scripts/setup_new_machine.sh
./scripts/setup_new_machine.sh
```

### After Install
- `claude-local` - runs Claude Code with local glm-4.7-flash model via Ollama
- `claude-cloud` - runs Claude Code with Anthropic API
- `claude` - default Claude Code

## Daily Workflow

### End of day
```bash
cd ~/claude_setup
git add .
git commit -m "end of day notes"
git push
```

### Start of day
```bash
cd ~/claude_setup
git pull
claude-local
```

## Memory System

This repository includes a structured memory system for cross-workstation collaboration:

- **Auto-loaded context**: Claude Code automatically reads `MEMORY.md`
- **Version-controlled**: All memory files tracked in git
- **Seamless sync**: Use git to share between workstations

### Quick Start
```bash
# Review the shared context
cat MEMORY.md

# Check memory status
./scripts/sync-memory.sh status

# Pull updates
./scripts/sync-memory.sh pull

# Push changes
./scripts/sync-memory.sh push
```

See [`docs/workflow-guide.md`](docs/workflow-guide.md) for detailed workflow information.

## Models
See the `models/` directory for notes on tested models and performance.
