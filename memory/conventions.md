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