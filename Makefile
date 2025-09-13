# Makefile for jqwiz

.PHONY: test fmt lint ci fix fmt-rust fix-rust format-check format-fix

test:
	cargo test --all

fmt-rust:
	cargo fmt --all -- --check

fix-rust:
	cargo fix --allow-dirty --allow-staged
	cargo fmt --all

fmt: fmt-rust
	npm run format:check

fix: fix-rust
	npm run format

lint:
	cargo clippy --all -- -D warnings

ci: fmt lint test
	@echo "All checks passed."
