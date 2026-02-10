# Local Usage

This repository supports both `make` (Unix-like shells) and PowerShell task execution (Windows).

## Prerequisites

- Option A (Unix-like): `make` + `bash`
- Option B (Windows): PowerShell

## Commands (Unix-like)

```bash
make scan
make normalize
make report
make local-run
```

## Commands (PowerShell)

```powershell
.\scripts\task-run.ps1 scan
.\scripts\task-run.ps1 normalize
.\scripts\task-run.ps1 report
.\scripts\task-run.ps1 local-run
```

Each target currently delegates to a script in `scripts/`:

- `scripts/scan.sh`
- `scripts/normalize.sh`
- `scripts/report.sh`
- `scripts/local-run.sh`
- `scripts/scan.ps1`
- `scripts/normalize.ps1`
- `scripts/report.ps1`
- `scripts/local-run.ps1`
- `scripts/task-run.ps1`

These scripts are placeholders in this phase and are expanded in later commits.
