# Makefile for jqwiz

.PHONY: test fmt lint ci fix

test:
	cargo test --all

fmt:
	cargo fmt --all -- --check

lint:
	cargo clippy --all -- -D warnings

fix:
	cargo fix --allow-dirty --allow-staged
	cargo fmt --all

ci: fmt lint test
	@echo "All checks passed."
