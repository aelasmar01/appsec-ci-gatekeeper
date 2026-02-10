#!/usr/bin/env bash
set -euo pipefail

mkdir -p reports
cat > reports/report.json <<'EOF'
{
  "status": "placeholder",
  "step": "normalize",
  "message": "Normalization logic not implemented yet."
}
EOF

echo "normalize placeholder complete -> reports/report.json"
