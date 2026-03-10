# Repertoire — Todo

## In Progress
- [ ] Install dependencies on loki and run tests
- [ ] Test crawler on a small real directory

## Up Next
- [ ] Add LLM-powered directory summarizer (use llama3.1:70b via Ollama)
- [ ] Add nanopore formats to parsers (.fast5, .pod5, .blow5)
- [ ] Incremental indexing (detect changes, skip unchanged dirs)
- [ ] First full pipeline test: crawl → index → chat

## Backlog
- [ ] Access control (respect file permissions)
- [ ] Slack integration for team-wide access
- [ ] Auto-tagging (projects, grants, experiments)
- [ ] Usage analytics (what data is searched most)
- [ ] Schedule periodic re-crawls (cron or systemd timer)
- [ ] Add .claudeignore-style file to skip sensitive directories
- [ ] Web UI improvements (file tree browser, search filters)

## Done
- [x] Design architecture (RAG over fine-tuning)
- [x] Build project scaffold (crawler, indexer, RAG engine, chatbot, CLI)
- [x] Push to brineylab/repertoire on GitHub
- [x] Create CLAUDE.md for cross-session context
- [x] Install Ollama + Claude Code on loki
