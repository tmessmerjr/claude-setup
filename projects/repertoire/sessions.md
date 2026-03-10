# Repertoire — Session Log

## 2026-03-10 — Initial Setup (via Claude.ai)

### What happened
- Designed Repertoire: AI-powered data catalog for the Briney Lab's 80TB+ local filesystem (400TB total across lab)
- Chose RAG architecture over fine-tuning — cheaper, faster, easier to update
- Built full project scaffold: crawler, indexer, RAG engine, Streamlit chatbot, CLI
- Pushed to https://github.com/brineylab/repertoire (private)
- Resolved GitHub auth issues (fine-grained token → classic token with `repo` + `workflow` scopes)
- Installed Ollama + Claude Code on loki workstation

### Decisions made
- **Name**: "Repertoire" — double meaning with antibody repertoires
- **Architecture**: RAG (not fine-tuning) using ChromaDB + LangChain + Ollama
- **Repo location**: brineylab org (not personal), private repo
- **LLM**: llama3.1:70b via Ollama — loki has 2x RTX A6000 (98GB VRAM total)
- **Embedding model**: nomic-embed-text via Ollama
- **Org**: Kept claude-setup separate from project repos for history/context

### Hardware (loki)
- 2x NVIDIA RTX A6000 (48GB VRAM each)
- Dorado basecall server running (nanopore sequencing active)
- ~80TB local data to index

### What's next
- [ ] Install Repertoire Python dependencies (`pip install -e ".[dev,bio]"`)
- [ ] Run pytest to verify scaffold
- [ ] Test crawler on a small real directory
- [ ] Wire up Ollama 70B for directory summarization
- [ ] Add nanopore file format support (.fast5, .pod5, .blow5)
- [ ] First end-to-end test: crawl → index → chat

---

<!-- Add new sessions above this line -->
