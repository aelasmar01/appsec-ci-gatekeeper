SHELL := /usr/bin/env bash
.DEFAULT_GOAL := help

.PHONY: help scan normalize report local-run

help:
	@echo "Available targets:"
	@echo "  make scan       - run scanner stage placeholder"
	@echo "  make normalize  - run normalization stage placeholder"
	@echo "  make report     - run report stage placeholder"
	@echo "  make local-run  - run workflow locally (placeholder)"

scan:
	@bash scripts/scan.sh

normalize:
	@bash scripts/normalize.sh

report:
	@bash scripts/report.sh

local-run:
	@bash scripts/local-run.sh
