# Local Usage

This repository supports both CI-stage placeholder scripts and a one-command local workflow run using `act`.

## Prerequisites

- Docker running locally
- `act` installed and available in PATH
- Optional: `make` + `bash` for stage-level script calls

Install details:
- `act`: `https://github.com/nektos/act`

## One-Click Local Workflow

```bash
make local-run
```

```powershell
.\scripts\local-run.ps1
```

Optional event override:

```bash
bash scripts/local-run.sh workflow_dispatch
```

```powershell
.\scripts\local-run.ps1 workflow_dispatch
```

Optional custom runner image:

```bash
ACT_PLATFORM_IMAGE=catthehacker/ubuntu:act-latest bash scripts/local-run.sh
```

```powershell
$env:ACT_PLATFORM_IMAGE="catthehacker/ubuntu:act-latest"
.\scripts\local-run.ps1
```

## Stage-Level Commands

Unix-like:

```bash
make scan
make normalize
make report
```

Windows PowerShell:

```powershell
.\scripts\task-run.ps1 scan
.\scripts\task-run.ps1 normalize
.\scripts\task-run.ps1 report
.\scripts\task-run.ps1 local-run
```

Both `scripts/local-run.sh` and `scripts/local-run.ps1` execute the same workflow via `act`.
