.PHONY: setup init build server dev update update_submodule update_mod help

help:
	@echo "Available commands:"
	@echo "  make setup          - Initialize submodules (run after git clone)"
	@echo "  make init           - Alias for setup"
	@echo "  make build          - Build static site"
	@echo "  make server         - Run local development server with drafts"
	@echo "  make dev            - Alias for server"
	@echo "  make update         - Update theme and modules"
	@echo "  make update_submodule - Update git submodule"
	@echo "  make update_mod     - Update hugo modules"

setup:
	@echo "==> Initializing git submodules..."
	git submodule update --init --recursive
	@echo "✓ Submodules initialized"

init: setup

build:
	@echo "==> Building static site..."
	hugo
	@echo "✓ Build complete. Output in ./public/"

server:
	hugo server -D

dev: server

update: update_submodule update_mod

update_submodule:
	@echo "==> Update HUGO theme(git submodule)"
	git submodule update --rebase --remote

update_mod:
	@echo "==> Update HUGO theme(hugo module)"
	hugo mod get -u
