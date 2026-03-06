# How to Save Session Information to Memory

This guide shows you how to format different types of session information into the memory files.

## MEMORY.md - Main Index

**Purpose**: Manual context file - load explicitly each session with `read MEMORY.md`. Keep it updated with high-level context.

```markdown
# Project Overview
- Repository: your-org/your-project
- Purpose: Brief description of what this project does
- Platform: Cross-workstation collaboration

## Recent Updates
- [Date] Added new debugging pattern: [brief description]
- [Date] Updated decision on [topic]
- [Date] Created new convention for [pattern]

## Key Contacts
- User: @username
- Project lead: @otheruser
```

---

## conventions.md - Coding Standards

**Purpose**: Document consistent patterns used across the project.

### Format Example:

```markdown
## Pattern: [Pattern Name]

**When to use**: When [condition/context]

**Example**:
```code
function example() {
  // Implementation
}
```

**Why this pattern**: [Rationale]

**Alternatives**: [What else you considered]
```

### Example Entry:

```markdown
## Pattern: API Error Handling

**When to use**: When creating API endpoints that handle errors

**Example**:
```python
def handle_api_error(response):
    if response.status_code == 404:
        raise ResourceNotFoundError(f"Resource not found: {response.url}")
    elif response.status_code == 500:
        logger.error(f"Server error at {response.url}")
        raise InternalServerError("Service unavailable")
    return response.json()
```

**Why this pattern**: Consistent error types make debugging easier and improve API predictability.

**Alternatives**:
- Generic HTTP errors ❌ (too vague)
- Silent failure ❌ (hides problems)
```

---

## decisions.md - Architecture Decisions

**Purpose**: Document important decisions and their rationale.

### Format Example:

```markdown
## Decision: [Decision Name]

**Decision**: [The choice made]

**Rationale**:
- Point 1
- Point 2
- Point 3

**Alternatives Considered**:
- Option A ❌ (Why it didn't work)
- Option B ❌ (Why it didn't work)
- Option C ✅ (Why this was chosen)

**Status**: Implemented ✓ / Deferred / Reconsidered

**Impact**: [How this affects the project]
```

### Example Entry:

```markdown
## Decision: Use PostgreSQL for Data Storage

**Decision**: Store all production data in PostgreSQL

**Rationale**:
- ACID compliance ensures data integrity
- Strong query capabilities for analytics
- Mature ecosystem and tooling
- Good performance for typical workloads

**Alternatives Considered**:
- MySQL ❌ (Less feature-rich)
- MongoDB ❌ (Not suitable for relational data)
- SQLite ❌ (Not suitable for production)

**Status**: Implemented ✓

**Impact**: All services now depend on PostgreSQL. Migration required for onboarding.
```

---

## debugging.md - Common Problems

**Purpose**: Document recurring problems and their solutions.

### Format Example:

```markdown
## Problem: [Clear Problem Description]

**Symptoms**: [What you observe]
**Root Cause**: [Why it happens]

**Solution**:
1. Step 1
2. Step 2
3. Step 3

**Prevention**: [How to avoid this in the future]

**Frequency**: [How often this occurs]
```

### Example Entry:

```markdown
## Problem: Claude Code Loses Context Between Sessions

**Symptoms**: Claude seems to forget about previous sessions, file structure, and context.

**Root Cause**: Claude Code's session-based context doesn't persist automatically across sessions.

**Solution**:
1. Ensure `MEMORY.md` exists in project root
2. Check that memory files are committed to git
3. Verify working directory is correct
4. Check `.claude/settings.json` for configuration issues

**Prevention**:
- Always use `git push` after updating memory files
- Start sessions with: `cd ~/claude_setup` to ensure correct context
- Use `git pull` before starting work on new workstation

**Frequency**: Happens when switching workstations or after long inactivity

**Debug Commands**:
```bash
# Check memory files exist
ls -la memory/

# View MEMORY.md
cat MEMORY.md

# Check git status
git status
```
```

---

## Workflow Example: Saving Session Learning

### Session Events:

1. **Discovered a bug pattern** - File upload fails with 500 error
2. **Found a good coding convention** - Always validate inputs before processing
3. **Made an architecture decision** - Use TypeScript over JavaScript

### How to Save:

#### 1. Debugging.md (Problem-Solution):
```markdown
## Problem: File Upload 500 Error

**Symptoms**: Uploads fail with 500 status after 10 seconds

**Root Cause**: Client disconnects due to timeout before server finishes processing

**Solution**:
1. Implement chunked uploads
2. Add timeout handling on client
3. Implement retry logic for failed chunks
4. Log upload progress to database

**Prevention**: Set client timeout to at least 30 seconds for large files

**Frequency**: High (affects all file uploads)
```

#### 2. conventions.md (Pattern):
```markdown
## Pattern: Input Validation Before Processing

**When to use**: Anywhere user input is accepted

**Example**:
```python
def process_user_input(data):
    # Validate required fields
    if not all(k in data for k in ['id', 'email', 'name']):
        raise ValidationError("Missing required fields")

    # Validate types
    if not isinstance(data['age'], int):
        raise ValidationError("Age must be integer")

    # Validate constraints
    if data['age'] < 18:
        raise ValidationError("Age must be 18+")

    return process(data)
```

**Why this pattern**: Prevents processing invalid data and provides clear error messages.

**Alternatives**:
- Minimal validation ❌ (leads to errors downstream)
- Lax validation ❌ (security risk)
```

#### 3. decisions.md (Decision):
```markdown
## Decision: Use TypeScript for Frontend Development

**Decision**: Switch from JavaScript to TypeScript for all frontend code

**Rationale**:
- Catch type errors at compile time
- Better IDE support and autocomplete
- Clearer code structure and documentation
- Improved maintainability over time

**Alternatives Considered**:
- JavaScript ❌ (no type safety)
- JSDoc only ❌ (manual, error-prone)

**Status**: In Progress

**Impact**: Migration plan required. Breaking changes expected.
```

---

## Commit Workflow:

```bash
# 1. Edit the relevant memory file
nano memory/conventions.md

# 2. Add your entry

# 3. Commit with clear message
git add memory/conventions.md
git commit -m "add input validation pattern to conventions"
git push
```

---

## Quick Reference Table

| File | Content Type | Examples |
|------|--------------|----------|
| `MEMORY.md` | High-level overview | Project status, key contacts, recent changes |
| `conventions.md` | Coding patterns | Naming conventions, error handling, testing strategies |
| `decisions.md` | Architecture choices | Tech stack, design patterns, trade-offs |
| `debugging.md` | Common problems | Bugs, errors, troubleshooting steps |

---

## Best Practices

✅ **Do**:
- Save lessons immediately while they're fresh
- Keep entries concise and actionable
- Include code examples when helpful
- Update related files when patterns change
- Use consistent formatting

❌ **Don't**:
- Save session transcripts (too long)
- Save temporary errors (not recurring)
- Make memory files too detailed (keep it actionable)
- Forget to commit and push (loses context)