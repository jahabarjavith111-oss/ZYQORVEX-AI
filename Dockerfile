# ZYQORVEX-AI — Containerized DevSecOps/FinOps Audit Pipeline
# Build: docker build -t zyqorvex-ai .
# Run:   docker run --rm -e GEMINI_API_KEY -v $(pwd):/workspace zyqorvex-ai

FROM python:3.12-slim

WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency manifest first for layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Default entrypoint runs the full audit pipeline
# Requires GEMINI_API_KEY environment variable at runtime
ENTRYPOINT ["python3", "main.py"]

# Alternative: run individual audits
# docker run --rm -e GEMINI_API_KEY -v $(pwd):/workspace zyqorvex-ai python3 patch_analyzer.py
# docker run --rm -e GEMINI_API_KEY -v $(pwd):/workspace zyqorvex-ai python3 cost_auditor.py
# docker run --rm -e GEMINI_API_KEY -v $(pwd):/workspace zyqorvex-ai python3 k8s_policy_generator.py
# docker run --rm -e GEMINI_API_KEY -v $(pwd):/workspace zyqorvex-ai python3 terraform_auditor.py