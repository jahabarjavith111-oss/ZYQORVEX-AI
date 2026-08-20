# ZYQORVEX-AI Makefile
# Common development and audit tasks

.PHONY: help install audit-kernel audit-terraform audit-k8s audit-all clean serve lint test tag-release

# Default target
help:
	@echo "ZYQORVEX-AI — Autonomous DevSecOps & FinOps Pipeline"
	@echo ""
	@echo "Available targets:"
	@echo "  install         Install Python dependencies"
	@echo "  audit-kernel    Run kernel patch analysis (requires GEMINI_API_KEY)"
	@echo "  audit-terraform Run Terraform security audit (requires GEMINI_API_KEY)"
	@echo "  audit-k8s       Run K8s policy generation (requires GEMINI_API_KEY)"
	@echo "  audit-all       Run all three audits via main.py (requires GEMINI_API_KEY)"
	@echo "  serve           Start local static file server on port 8000"
	@echo "  lint            Run Python syntax check on all .py files"
	@echo "  clean           Remove generated audit artifacts"
	@echo "  tag-release     Create annotated git tag (usage: make tag-release VERSION=v1.0.1)"
	@echo ""

# Install dependencies
install:
	pip install -r requirements.txt

# Individual audit runs
audit-kernel:
	@test -n "$(GEMINI_API_KEY)" || (echo "ERROR: GEMINI_API_KEY not set" && exit 1)
	python3 patch_analyzer.py

audit-terraform:
	@test -n "$(GEMINI_API_KEY)" || (echo "ERROR: GEMINI_API_KEY not set" && exit 1)
	python3 terraform_auditor.py

audit-k8s:
	@test -n "$(GEMINI_API_KEY)" || (echo "ERROR: GEMINI_API_KEY not set" && exit 1)
	python3 k8s_policy_generator.py

# Run all audits via main orchestrator
audit-all:
	@test -n "$(GEMINI_API_KEY)" || (echo "ERROR: GEMINI_API_KEY not set" && exit 1)
	python3 main.py

# Local static preview server
serve:
	python3 -m http.server 8000

# Python syntax check
lint:
	python3 -m py_compile main.py patch_analyzer.py cost_auditor.py k8s_policy_generator.py terraform_auditor.py

# Clean generated artifacts
clean:
	rm -f analysis_results.json infrastructure_audit_report.json
	rm -f terraform_audit_results.json cost_drift_report.json
	rm -f hardened_deployment.yaml enforcement_policy_summary.txt

# Tag a new release (usage: make tag-release VERSION=v1.0.1)
tag-release:
	@test -n "$(VERSION)" || (echo "Usage: make tag-release VERSION=v1.0.1" && exit 1)
	git tag -a $(VERSION) -m "ZYQORVEX-AI $(VERSION)"
	@echo "Tag $(VERSION) created. Push with: git push origin $(VERSION)"

# Show git status summary
status:
	git status -s
	@echo ""
	git log --oneline -5