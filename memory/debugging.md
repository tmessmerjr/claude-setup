# Common Debugging Patterns

## Claude Code Specific

### Session Issues
**Problem**: Claude Code loses context between sessions
**Solution**:
1. Ensure `MEMORY.md` exists in project root
2. Check that memory files are committed to git
3. Verify working directory is correct
4. Check `.claude/settings.json` for configuration issues

**Debug Command**:
```bash
# Check memory files
ls -la memory/

# View MEMORY.md
cat MEMORY.md

# Check git status
git status
```

### Tool Not Found
**Problem**: "Command not found" for tools
**Solution**:
1. Check PATH environment variable
2. Verify tool is installed
3. Check MCP configuration
4. Restart Claude Code session

---

## General Debugging Principles

### 1. Isolate the Problem
- Create minimal reproduction case
- Remove variables one at a time
- Test in isolation

### 2. Log Everything
- Use verbose flags on commands
- Enable debug logs when available
- Save output to files for analysis

### 3. Check the Basics First
- Are files where expected?
- Are permissions correct?
- Is the environment variable set?
- Is the service running?

### 4. Use Proper Tools
- `strace`: Trace system calls
- `tcpdump`: Network traffic
- `lsof`: Open files and connections
- `ps aux`: Running processes

---

## Common Issues and Solutions

### File Permission Errors
```bash
# Fix permissions
chmod +x script.sh
chown user:group file.md

# Check current permissions
ls -la
```

### Git Conflicts
```bash
# View conflicts
git diff

# Accept current changes
git checkout --ours file.md

# Accept incoming changes
git checkout --theirs file.md

# Resolve manually
# git add resolved_file.md
```

### Environment Variables
```bash
# Check if set
echo $VAR_NAME

# List all
env | grep VAR

# Unset if needed
unset VAR_NAME
```

---

## Debugging Workflow

1. **Reproduce**: Confirm the issue
2. **Isolate**: Narrow down to specific component
3. **Investigate**: Gather diagnostic information
4. **Hypothesize**: Propose root cause
5. **Test**: Verify hypothesis
6. **Fix**: Implement solution
7. **Document**: Record lesson learned

---

## Useful Commands

### System Info
```bash
# OS and version
uname -a

# Disk space
df -h

# Memory usage
free -h

# CPU info
lscpu
```

### File System
```bash
# Find files by name
find . -name "*.md"

# Count files by type
find . -type f | wc -l

# Check disk usage
du -sh *
```

### Process Management
```bash
# List processes
ps aux

# Find process by name
ps aux | grep process

# Kill process
kill -9 PID
```

---

## Error Messages Decoded

| Error | Likely Cause | Solution |
|-------|-------------|----------|
| "Permission denied" | Insufficient rights | Check and fix permissions |
| "File not found" | Path incorrect | Verify path, use absolute paths |
| "Connection refused" | Service not running | Start service, check firewall |
| "Timeout" | Network slowness | Check connection, retry |
| "404 Not Found" | Resource missing | Check URL, verify existence |