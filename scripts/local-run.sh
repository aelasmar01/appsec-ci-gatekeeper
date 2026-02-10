#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v act >/dev/null 2>&1; then
  echo "ERROR: 'act' is not installed or not in PATH."
  echo "Install: https://github.com/nektos/act"
  exit 1
fi

EVENT="${1:-pull_request}"
WORKFLOW_FILE=".github/workflows/pr-gate.yml"
PLATFORM_IMAGE="${ACT_PLATFORM_IMAGE:-catthehacker/ubuntu:act-latest}"

echo "Running local workflow with act..."
echo "  event:    $EVENT"
echo "  workflow: $WORKFLOW_FILE"
echo "  image:    $PLATFORM_IMAGE"

act "$EVENT" \
  -W "$WORKFLOW_FILE" \
  -P "ubuntu-latest=$PLATFORM_IMAGE"
