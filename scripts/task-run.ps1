param(
  [Parameter(Mandatory = $true)]
  [ValidateSet("scan", "normalize", "report", "local-run", "all")]
  [string]$Task
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

switch ($Task) {
  "scan" { & "$scriptRoot/scan.ps1" }
  "normalize" { & "$scriptRoot/normalize.ps1" }
  "report" { & "$scriptRoot/report.ps1" }
  "local-run" { & "$scriptRoot/local-run.ps1" }
  "all" {
    & "$scriptRoot/scan.ps1"
    & "$scriptRoot/normalize.ps1"
    & "$scriptRoot/report.ps1"
    & "$scriptRoot/local-run.ps1"
  }
}
