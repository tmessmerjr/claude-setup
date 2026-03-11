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
- [x] Install Repertoire Python dependencies (`pip install -e ".[dev,bio]"`)
- [x] Run pytest to verify scaffold
- [x] Test crawler on a small real directory
- [x] Wire up Ollama 70B for directory summarization
- [ ] Add nanopore file format support (.fast5, .pod5, .blow5)
- [x] First end-to-end test: crawl → index → chat

---

## 2026-03-11 — First End-to-End Pipeline (via Claude Code)

### What happened
- Fixed Python 3.10 compat (license format, requires-python, ruff target)
- Installed all dependencies; all 15 scaffold tests passing
- Discovered loki's 145TB RAID6 array (12x 16TB Seagate Exos, `/dev/md0`) — not mounted, no fstab entry
- Mounted RAID at `/data` (64TB used, 75TB free)
- Cloned `brineylab/abutils` to `/data/test_crawl/abutils` as a known-good test dataset
- Wired up Ollama llama3.1:70b for directory summarization (`--summarize` flag)
- Switched embeddings from default MiniLM to nomic-embed-text via Ollama
- Fixed langchain deprecation (langchain-ollama `OllamaLLM`)
- Added informative_score to demote binary/empty dirs in search results
- Tuned crawler for Cell Ranger data: excluded pipeline internals (SC_MULTI_CS, MAKE_FASTQS_CS, Martian fork0/split/join, Illumina cycle dirs) — reduced scab from 2,194 to 218 directories (90% noise reduction)
- Added 10x file types (.cloupe, .mri.tgz, .mtx.gz, .bam.bai)
- Crawled `/data/projects/scab` (178GB, 7 healthy donor PBMC samples) with llama3.2 summaries
- Full RAG pipeline working end-to-end: crawl → summarize → embed → index → retrieve → generate

### Decisions made
- **Python version**: Relaxed to >=3.10 (loki only has 3.10)
- **Summarize model**: llama3.1:70b default, but llama3.2 practical for bulk runs (70b ~45s/dir, 3.2 ~2s/dir)
- **Cell Ranger exclusions**: SC_MULTI_CS alone had 1,679 dirs per sample — all pipeline internals
- **Informative scoring**: Continuous 0.0–1.0 score based on file category ratio, used to rerank search results
- **RAID mount**: `/data` needs fstab entry with `nofail` for boot persistence

### Hardware discoveries
- RAID6 array: 12x 16TB Seagate Exos ST16000NM001G, md0, LVM vg0-data
- 145TB total, 64TB used (46%), ext4
- NVMe boot: 3.6TB Crucial P3 Plus (4% used)

### What's next
- [ ] Add fstab entry for `/data` (needs sudo)
- [ ] Add nanopore file format support (.fast5, .pod5, .blow5)
- [ ] Streamlit chatbot UI testing
- [ ] Crawl more directories on `/data`
- [ ] Incremental crawl support (skip unchanged dirs)
- [ ] Consider batch summarization with llama3.2 for large crawls, 70b for small/targeted

---

<!-- Add new sessions above this line -->
