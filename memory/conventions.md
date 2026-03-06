# Coding Conventions

## General Rules

### Naming Conventions
- **Files**: Use snake_case for scripts, kebab-case for documentation
- **Functions**: snake_case for Python/Go, camelCase for JavaScript/TypeScript
- **Constants**: UPPER_SNAKE_CASE
- **Classes/Interfaces**: PascalCase

### Code Style
- Use 2 or 4 spaces for indentation (consistent throughout project)
- No trailing whitespace on any line
- Line length: max 100 characters (prefer 80 for compatibility)
- Comments: Use # for shell/Python, // for JavaScript, /* */ for multi-line

### Commit Messages
```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

## Project-Specific Rules

### File Organization
```
src/
  components/
  utils/
  config/
tests/
docs/
scripts/
```

### Error Handling
- Always check return values
- Log errors with context
- Fail fast with meaningful error messages
- Use specific exceptions/errors rather than generic ones

### Testing
- Test coverage minimum: 80%
- Write tests alongside implementation (TDD encouraged)
- Mock external dependencies
- Test both happy paths and edge cases

## Review Checklist
- [ ] Code follows conventions
- [ ] No console.log/debug statements
- [ ] All functions have docstrings/comments
- [ ] Tests pass locally
- [ ] Commit message follows format
- [ ] No linting errors

## Tools Used
- `pre-commit`: Run before commits
- `lint-staged`: Lint staged files
- `black`: Python code formatting
- `eslint`: JavaScript/TypeScript linting
- `go fmt`: Go formatting

---

## Claude Code Session Patterns

### Memory Updates Pattern

**When to use**: At the end of a session when you've learned something valuable

**Example**:
```markdown
## Session Notes

### Learned Today
- Discovered useful git command: `git log --oneline --graph --all` for visualizing branch history
- Found that Claude Code loads `MEMORY.md` automatically but only reads first 200 lines
- Confirmed that memory files work across workstations via git sync

### Files Updated
- Updated `memory/debugging.md` with new troubleshooting steps
- Added session notes to `MEMORY.md`

### Next Session Plan
- Review `docs/workflow-guide.md` for complete session workflow
- Test the new debugging patterns in next session
```

### Decision Documentation Pattern

**When to use**: When choosing between multiple approaches

**Example**:
```markdown
## Technology Decision: [Topic]

**Decision**: [Choose one approach]
**Rationale**:
- [Reason 1]
- [Reason 2]

**Alternatives Considered**:
- Alternative 1 ❌ (Why it doesn't work)
- Alternative 2 ❌ (Why it doesn't work)

**Status**: Implemented ✓
**Date**: [YYYY-MM-DD]

**Trade-offs**:
- + Advantage 1
- + Advantage 2
- - Disadvantage 1
- - Disadvantage 2
```

---

## Memory File Conventions

### File Structure
- `MEMORY.md` - Main index, auto-loaded by Claude Code
- `memory/conventions.md` - Coding patterns and standards
- `memory/decisions.md` - Architecture decisions and rationale
- `memory/debugging.md` - Common debugging patterns and solutions
- `docs/workflow-guide.md` - Workflow tips and procedures

### Memory File Format

#### For `conventions.md` (Coding Patterns):
```markdown
## [Pattern Name]

**Pattern**: [One-line description]
**When to use**: [Context/situation]
**Why**:
- [Reason 1]
- [Reason 2]

**Example**:
```bash
# Example code or command
# ...
```

**Notes**: [Additional context]
```

#### For `decisions.md` (Architecture Decisions):
```markdown
## [Decision Title]

**Decision**: [Selected option]
**Rationale**:
- [Reason 1]
- [Reason 2]

**Alternatives Considered**:
- Option A ❌ (reason)
- Option B ❌ (reason)

**Status**: Implemented ✓
**Date**: YYYY-MM-DD

**Trade-offs**:
- + [Benefit]
- - [Drawback]
```

#### For `debugging.md` (Bug Patterns):
```markdown
## [Problem Name]

**Problem**: [Description of the issue]
**Frequency**: [How often it occurs]
**Symptoms**: [Observable signs]

**Root Cause**: [Explanation]

**Solution**:
1. [Step 1]
2. [Step 2]

**Prevention**: [How to avoid]
**Related**: [Link to related entry]
```

#### For `MEMORY.md` (Project Overview):
```markdown
## Project Notes

### Current Status
- [Status item 1]
- [Status item 2]

### Active Work
- [Current tasks]

### Team Guidelines
- [Guideline 1]
- [Guideline 2]

## Quick Reference

### Common Commands
```bash
# Command 1
# Command 2
```

### Key Contacts
- [Name]: [Contact info]
```