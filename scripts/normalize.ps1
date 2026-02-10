Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Path "reports" -Force | Out-Null
@'
{
  "status": "placeholder",
  "step": "normalize",
  "message": "Normalization logic not implemented yet."
}
'@ | Set-Content -Path "reports/report.json"

Write-Host "normalize placeholder complete -> reports/report.json"
