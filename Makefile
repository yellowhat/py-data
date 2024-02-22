.DEFAULT_GOAL := help
SHELL         := /bin/bash
MAKEFLAGS     += --no-print-directory
MKFILE_DIR    := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
IMAGE         := jupiter:latest

.PHONY: build
build: ## Build container
	@echo "[INFO] Building container image: $(IMAGE)"
	@podman build --tag $(IMAGE) .
	@echo ""

.PHONY: run
run: ## Run container
	$(MAKE) build
	@echo "[INFO] Run container image $(IMAGE) on port 8080"
	podman run \
		--interactive \
		--tty \
		--publish 8080:8080 \
		--volume "${PWD}:/data" \
		--security-opt label=disable \
		--workdir /data \
		$(IMAGE)
	@echo ""

.PHONY: clean
clean: ## Clean cached files
	shopt -s globstar
	rm --recursive --force --verbose \
		**/__pycache__ \
		**/.pytest_cache \
		**/.mypy_cache

.PHONY: help
help: ## Makefile Help Page
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[\/\%a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-21s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST) 2>/dev/null
