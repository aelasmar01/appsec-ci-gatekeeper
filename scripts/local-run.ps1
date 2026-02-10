Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$act = Get-Command act -ErrorAction SilentlyContinue
if (-not $act) {
  Write-Error "'act' is not installed or not in PATH. Install from https://github.com/nektos/act"
  exit 1
}

$event = if ($args.Count -gt 0 -and $args[0]) { $args[0] } else { "pull_request" }
$workflowFile = ".github/workflows/pr-gate.yml"
$platformImage = if ($env:ACT_PLATFORM_IMAGE) { $env:ACT_PLATFORM_IMAGE } else { "catthehacker/ubuntu:act-latest" }

Write-Host "Running local workflow with act..."
Write-Host "  event:    $event"
Write-Host "  workflow: $workflowFile"
Write-Host "  image:    $platformImage"

& $act.Source $event -W $workflowFile -P "ubuntu-latest=$platformImage"
