Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Path "reports" -Force | Out-Null
@'
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
'@ | Set-Content -Path "reports/report.html"

Write-Host "report placeholder complete -> reports/report.html"
