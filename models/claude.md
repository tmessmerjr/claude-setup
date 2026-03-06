# Project: My Claude Orchestration Setup

## Local Models
- Primary: glm-4.7-flash via Ollama (localhost:11434)
- Fallback: Anthropic API (claude-sonnet-4-6)

## Preferred workflow
- Use subagents for parallel file exploration
- Always commit to a branch before making large changes
```

---

## Phase 3: Parallel Sub-agents (Once Core is Working)

This is where it gets fun. With Ollama's built-in subagent support you just ask for it in natural language:
```
> spawn subagents to explore the auth flow, payment integration, 
  and notification system simultaneously

> create 3 subagents: one audits security, one finds performance 
  bottlenecks, one checks for deprecated dependencies
