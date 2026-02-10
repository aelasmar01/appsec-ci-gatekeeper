# appsec-ci-gatekeeper

Secure CI/CD control layer demonstrating an AppSec-owned merge gate for pull requests.

## Project Status

Phase 0 foundation initialized.

## Repository Layout

- `.github/workflows/` CI workflow definitions
- `.github/actions/` composite GitHub Actions for scanners
- `policies/` policy and exception configuration
- `scripts/` automation scripts
- `docs/` architecture and usage documentation
- `demo/` intentionally vulnerable sample app and IaC
- `reports/` generated JSON/HTML outputs

## Next Steps

Follow the phased commit roadmap to implement scanners, normalization, policy gate enforcement, and PR feedback.