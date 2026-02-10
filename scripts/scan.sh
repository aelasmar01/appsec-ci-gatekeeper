#!/usr/bin/env bash
set -euo pipefail

mkdir -p results
cat > results/scan.placeholder.json <<'EOF'
{
  "status": "placeholder",
  "step": "scan",
  "message": "Scanner orchestration not implemented yet."
}
EOF

echo "scan placeholder complete -> results/scan.placeholder.json"
