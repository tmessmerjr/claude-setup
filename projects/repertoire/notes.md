# Repertoire — Notes

## Lab Context
- Briney Lab @ Scripps Research — antibody repertoires, HIV vaccine design, computational immunology
- ~80TB local on loki, ~400TB total across lab
- Active nanopore sequencing (Dorado basecall server running on GPU 0)
- Key lab tools: BALM (antibody language models), clonify, AbLMs
- Lab GitHub: https://github.com/brineylab (29+ repos)

## Data Types on the Drives
- Raw sequencing: FASTQ, FASTA, FAST5, POD5, BLOW5
- Processed: CSV, TSV, Parquet, HDF5
- Structures: PDB, CIF
- Models: PyTorch .pt/.pth, SafeTensors
- Analysis: Jupyter notebooks (.ipynb)
- Pipelines: Snakemake, Nextflow
- Documents: Markdown, PDFs

## Architecture Notes
- RAG not fine-tuning — 80TB is metadata, not training data
- Crawler reads headers only, never loads full files into memory
- ChromaDB for vector store (lightweight, local, no server needed)
- LangChain for LLM orchestration
- Streamlit for quick chatbot UI (can upgrade later)
- llama3.1:70b fits across both A6000s for high quality summaries

## GitHub Access
- Repo: brineylab/repertoire (private)
- Auth: classic PAT with repo + workflow scopes
- tmessmerjr has admin access via brineylab org ownership
- Credentials cached via `git config --global credential.helper store`
