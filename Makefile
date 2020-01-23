.PHONY: help test lint build clean

test: ## Run tests
	cargo test --workspace

lint: ## Run lints
	cargo clippy --all-targets --all-features -- -D warnings \
	&& cargo fmt --all -- --check

build: ## Run build
	cargo build --release --workspace

clean: ## Clean build files
	cargo clean

help: ## Display this help screen
	grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
