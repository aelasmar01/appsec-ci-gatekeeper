#!/usr/bin/env bash
set -euo pipefail

mkdir -p reports
cat > reports/report.html <<'EOF'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>appsec-ci-gatekeeper placeholder report</title>
</head>
<body>
  <h1>Placeholder Report</h1>
  <p>HTML reporting is not implemented yet.</p>
</body>
</html>
EOF

echo "report placeholder complete -> reports/report.html"
