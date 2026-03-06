# Claude Code Workflow Guide

## Getting Started

### On a New Workstation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/tmessmerjr/claude-setup.git
   cd claude-setup
   ```

2. **Review the context**:
   - Read `MEMORY.md` for project overview
   - Browse `memory/` for project-specific knowledge
   - Check `docs/` for detailed documentation

3. **Set up local environment**:
   - Install required tools
   - Configure environment variables
   - Run setup scripts if available

4. **Start using**:
   - Claude Code will automatically load context from `MEMORY.md`
   - Use `memory/` files as reference for conventions and decisions
   - Update memory files as you learn more about the project

---

## Daily Workflow

### Morning Routine

1. **Check for updates**:
   ```bash
   git pull
   ```

2. **Review recent changes**:
   ```bash
   git log --oneline -10
   git diff HEAD~1
   ```

3. **Load project context**:
   - Start Claude Code
   - Verify `MEMORY.md` is in working directory
   - Optionally review specific memory files

### During Development

1. **Follow conventions** from `memory/conventions.md`
2. **Check decisions** from `memory/decisions.md` for guidance
3. **Use debugging patterns** from `memory/debugging.md`
4. **Document as you go**:
   - Update memory files with new decisions
   - Add conventions as you discover them
   - Document debugging solutions

### Before Commits

1. **Run checks**:
   ```bash
   # Run tests
   npm test
   pytest

   # Lint code
   npm run lint
   black --check .

   # Format code
   black .
   ```

2. **Update memory**:
   - Document changes made
   - Update conventions if needed
   - Add new decisions

3. **Commit**:
   ```bash
   git add .
   git commit -m "feat: add new feature"
   git push
   ```

---

## Collaborating

### Sharing Changes

1. **Create feature branch**:
   ```bash
   git checkout -b feature/my-feature
   ```

2. **Make changes and commit**:
   ```bash
   git add .
   git commit -m "feat: implement new feature"
   ```

3. **Push and create PR**:
   ```bash
   git push origin feature/my-feature
   ```

4. **Merge after review**

### Handling Conflicts

1. **Pull updates**:
   ```bash
   git pull
   ```

2. **Resolve conflicts manually**:
   - Edit conflicted files
   - Use `git add` when resolved

3. **Complete merge**:
   ```bash
   git commit
   ```

---

## Best Practices

### Memory Management

✓ **Do**:
- Commit important context regularly
- Update `MEMORY.md` with project decisions
- Use consistent formatting
- Keep memory files up to date

✗ **Don't**:
- Accumulate stale information
- Ignore memory updates
- Store session-specific data
- Use memory for temporary notes

### Documentation

✓ **Do**:
- Document decisions with rationale
- Explain "why", not just "what"
- Keep examples minimal and clear
- Link related concepts

✗ **Don't**:
- Write vague or ambiguous docs
- Skip error handling documentation
- Assume readers know everything
- Use jargon without explanation

---

## Advanced Topics

### Auto-Memory Configuration

To enable automatic memory persistence:

1. Create memory directory:
   ```bash
   mkdir -p ~/my-project/memory
   ```

2. Add MEMORY.md:
   ```markdown
   # Project Context
   ## Important Notes
   ...
   ```

3. Claude Code will auto-read on next session

### Custom Scripts

Add your own scripts to `scripts/`:

```bash
#!/bin/bash
# scripts/custom.sh
# Your custom automation here

echo "Running custom task"
```

Make executable:
```bash
chmod +x scripts/custom.sh
```

---

## Troubleshooting

See `memory/debugging.md` for common issues and solutions.

Need help? Check:
- `memory/` for project-specific knowledge
- `docs/` for detailed documentation
- Project repository issues/README

---

## Example Session Flows

### Example 1: Learning New Pattern

**Goal**: Discover and document a useful coding pattern

**Steps**:
1. Work on task with Claude Code
2. Notice repeated approach that works well
3. Create memory entry in `memory/conventions.md`:
   ```markdown
   ## New Pattern: [Name]

   **When to use**: [Context]
   **Example**: [Code example]
   ```
4. Commit with: `git commit -m "docs: add new pattern"`
5. Push to sync across workstations

### Example 2: Making Architecture Decision

**Goal**: Choose between multiple approaches

**Steps**:
1. Identify decision point
2. Document in `memory/decisions.md`:
   ```markdown
   ## Decision: [Topic]

   **Decision**: [Choice]
   **Rationale**: [Why]
   **Alternatives Considered**: [List with reasons they don't work]
   **Status**: [Implemented/Under review]
   **Date**: [YYYY-MM-DD]
   ```
3. Explain reasoning to team if needed
4. Update if approach changes

### Example 3: Saving Bug Solution

**Goal**: Remember solution to recurring problem

**Steps**:
1. Debug the issue following `memory/debugging.md` patterns
2. Document solution in `memory/debugging.md`:
   ```markdown
   ## [Problem Type] Debugging

   **Problem**: [Description]
   **Steps to reproduce**: [1, 2, 3]
   **Diagnosis**: [How you found it]
   **Solution**: [Fix steps]
   ```
3. Test solution works
4. Commit and push
5. Reference in future debugging

### Example 4: Cross-Workstation Setup

**Goal**: Start working on new machine

**Steps**:
```bash
# 1. Clone repository
cd ~
git clone https://github.com/tmessmerjr/claude-setup.git
cd claude-setup

# 2. Verify memory files exist
ls -la memory/
ls -la docs/

# 3. Check for updates
git pull

# 4. Start Claude Code
# (Claude will auto-load MEMORY.md)

# 5. Start working
```

**Verification**:
- `MEMORY.md` content visible in Claude Code
- All memory files present
- Git sync complete

---

## Quick Reference

### Common Commands

```bash
# Update and sync memory
cd ~/claude-setup
git add memory/
git commit -m "update memory"
git push

# Check memory files
ls -la memory/
cat MEMORY.md

# View recent decisions
git log --oneline -- memory/decisions.md

# Search for patterns
grep -r "PATTERN_NAME" memory/
```

---

## Session Management

### Best Practices

1. **Save early, save often**
   - Update relevant memory files when learning something new
   - Commit before ending session
   - Push when working on shared context

2. **Review before starting**
   - Read `MEMORY.md` to get project context
   - Check `memory/decisions.md` for architecture decisions
   - Scan `conventions.md` for coding standards

3. **Document as you go**
   - Save patterns to `conventions.md` when discovered
   - Record decisions in `decisions.md` immediately
   - Add debugging tips to `debugging.md` for recurring issues

### Example Session Flow

```bash
# Start session
cd ~/claude-setup
git pull  # Get latest memory
read MEMORY.md

# Work on task...

# End session
git add memory/
git commit -m "update memory with [topic]"
git push
```

### Session Notes Template

Use this format for important learnings at the end of a session:

```markdown
## Session Notes

### Date: [YYYY-MM-DD]
### Task: [Brief description]

**Key Learnings**:
1. [Discovery 1]
2. [Discovery 2]

**Files Updated**:
- `filename.md`: What changed

**Next Steps**:
- [Action item 1]
- [Action item 2]
```