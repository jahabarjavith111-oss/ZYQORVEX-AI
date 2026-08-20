# 🛡️ ZYQORVEX-AI

### *Autonomous DevSecOps & FinOps Guardrails powered by Gemini 3 Flash*

[![Gemini 3 Flash](https://img.shields.io/badge/AI-Gemini%203%20Flash-blueviolet)](https://deepmind.google/technologies/gemini/)
[![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-success)](https://github.com/jahabarjavith111-oss/ZYQORVEX-AI/actions)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

ZYQORVEX-AI is a professional-grade "Living Pipeline" designed to integrate advanced AI reasoning directly into the software development lifecycle. By leveraging Gemini 3 Flash, it acts as an automated, intelligent gatekeeper for Linux Kernel security, Cloud Infrastructure costs, and Kubernetes compliance.

---

## 🚀 Key Value Propositions

* **The Living Pipeline:** Unlike traditional scanners, ZYQORVEX-AI is integrated into GitHub Actions (devsecops-audit.yml). It functions as an active quality gate that can block unsafe or non-compliant merges automatically.
* **Full-Stack Context:** ZYQORVEX-AI bridges the gap between low-level systems (C-based Kernel patches) and high-level business operations (FinOps), providing a unified security posture across different technical domains.
* **Advanced Reasoning:** Built to handle complex tasks that traditional static analysis tools miss, such as identifying logic-based Use-After-Free (UAF) vulnerabilities and detecting massive cost-drifts in infrastructure plans.

---

## 🤖 Generative AI Integration
ZYQORVEX-AI leverages the **Google GenAI SDK** to implement a "Reasoning Path" for security audits:
* **Neural Patch Analysis:** Uses Gemini 3 to perform semantic code reviews of Linux Kernel patches, moving beyond pattern matching to understand memory state logic.
* **Intelligent Cost Synthesis:** Processes raw Terraform plan diffs through a financial reasoning model to detect high-risk resource escalations.
* **Natural Language Policy Mapping:** Translates human security intent into syntactically correct Kubernetes securityContext configurations.

---

## 🧭 Core Modules

### 1. 🐧 Kernel Patch Reviewer (patch_analyzer.py)
**Problem:** Manual review of Linux Kernel memory safety is time-consuming and prone to human error.
**Solution:** Gemini 3 performs a "Deep Reasoning" audit on raw Git diffs to detect critical memory corruption vulnerabilities (UAF, Stale State) in seconds.
**Key Output:** `analysis_results.json`

### 2. 💰 FinOps & Cloud Auditor (cost_auditor.py)
**Problem:** Infrastructure-as-Code (IaC) changes can lead to accidental "Silent Disasters" and massive cloud bill spikes.
**Solution:** Analyzes `terraform plan` output to identify cost anomalies—such as accidental upgrades from `t3.micro` to high-performance GPU instances like `p3.8xlarge`.
**Key Output:** `infrastructure_audit_report.json`

### 3. ☸️ K8s Policy Hardener (k8s_policy_generator.py)
**Problem:** Implementing "Least Privilege" security contexts in Kubernetes is complex and often neglected.
**Solution:** Translates natural language security requirements into production-ready, hardened YAML manifests (Read-only root FS, Non-root user enforcement, and Capability dropping).
**Key Output:** `hardened_deployment.yaml`

---

## 🛠️ Setup & Environment

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/jahabarjavith111-oss/ZYQORVEX-AI.git
   cd ZYQORVEX-AI
   ```
Environment Setup:

```Bash
python3 -m venv venv
source venv/bin/activate
pip install google-genai python-dotenv
```

API Configuration: Create a .env file in the root directory:

```Bash
echo "GEMINI_API_KEY='your_api_key_here'" > .env
```
🏁 Operational Dashboard

To execute the full suite of agents in sequence and generate all security reports:

```Bash
python3 main.py
```
⚖️ License
ZYQORVEX-AI  |  Author: ABDUL JAVID (@jahabarjavith111-oss)  |  Licensed under the Apache License, Version 2.0
