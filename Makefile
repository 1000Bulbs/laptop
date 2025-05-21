# Makefile
.DEFAULT_GOAL := help

.PHONY: install-hooks lint uninstall-hooks help

install-hooks:  ## Install all tools and register pre-commit Git hook
	brew install pre-commit shellcheck yamllint  markdownlint-cli2
	pre-commit install

lint:  ## Run all checks (shellcheck, yamllint, and markdownlint-cli2)
	pre-commit run --all-files

uninstall-hooks:  ## Uninstall pre-commit hook from .git/hooks
	pre-commit uninstall

help:  ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-20s %s\n", $$1, $$2}'
