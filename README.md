# appsec-ci-gatekeeper

Secure CI/CD control layer demonstrating an AppSec-owned merge gate for pull requests.

## Project Status

foundation initialized.

## Repository Layout

- `.github/workflows/` CI workflow definitions
- `.github/actions/` composite GitHub Actions for scanners
- `policies/` policy and exception configuration
- `scripts/` automation scripts
- `docs/` architecture and usage documentation
- `demo/` intentionally vulnerable sample app and IaC
- `reports/` generated JSON/HTML outputs

## Task Runner

Use `make` targets to run pipeline stages:

- `make scan`
- `make normalize`
- `make report`
- `make local-run`

Each command calls a matching script under `scripts/`.

On Windows, use PowerShell task execution:

- `.\scripts\task-run.ps1 scan`
- `.\scripts\task-run.ps1 normalize`
- `.\scripts\task-run.ps1 report`
- `.\scripts\task-run.ps1 local-run`

## Next Steps

Implement scanners, normalization, policy gate enforcement, and PR feedback.
