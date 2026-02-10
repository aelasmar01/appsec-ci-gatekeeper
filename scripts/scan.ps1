Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Path "results" -Force | Out-Null
@'
{
  "status": "placeholder",
  "step": "scan",
  "message": "Scanner orchestration not implemented yet."
}
'@ | Set-Content -Path "results/scan.placeholder.json"

Write-Host "scan placeholder complete -> results/scan.placeholder.json"
