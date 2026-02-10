# CI Gate Architecture

## Goal

`appsec-ci-gatekeeper` provides an AppSec-owned control layer in CI/CD that evaluates pull requests using multiple security signals and enforces merge policy with clear developer feedback.

## High-Level Flow

1. PR or manual workflow trigger starts pipeline.
2. Scanner stage runs:
   - SAST (`semgrep`)
   - SCA + SBOM (`trivy`)
   - Secrets (`gitleaks`)
   - IaC (`checkov`)
3. Raw outputs are collected as JSON artifacts.
4. Normalization layer maps tool-specific formats into a single findings schema.
5. Policy engine evaluates normalized findings and license rules.
6. Exception layer suppresses approved findings using governed baseline entries.
7. Reporting layer generates machine-readable and human-readable outputs.
8. PR comment stage posts a single consolidated comment with status, rationale, and fix guidance.

## Composite Action Pattern

Each scanner is implemented as an isolated composite GitHub Action under `.github/actions/` with explicit version pinning and deterministic output locations.

Benefits:
- Scanner logic is modular and reusable.
- CI workflow stays readable.
- Tool-specific upgrades are isolated per action.

## Normalization Layer

The normalizer converts heterogeneous scanner outputs into a unified schema to make policy logic tool-agnostic.

Planned schema fields include:
- `tool`
- `severity`
- `rule_id`
- `location`
- `package`
- `message`
- `fix_guidance`
- `references`
- `fingerprint`

This enables:
- Consistent thresholds across tools
- Stable suppression matching
- Single JSON/HTML reporting pipeline

## Baseline and Exception Model

A baseline file supports temporary suppression for known findings with required governance fields:
- `fingerprint`
- `tool`
- `reason`
- `owner`
- `expiry`

Policy evaluation accounts for:
- active suppressions
- expired suppressions
- warnings for near-expiry entries

## Policy Enforcement Model

Gate decisions are based on:
- severity thresholds (global and tool-specific)
- license allow/deny rules evaluated from SBOM
- suppression state and expiry validity

Outputs include a decision artifact (pass/fail + rationale), and CI fails with a non-zero exit code when blocking criteria are met.

## Output Contracts

Planned outputs:
- Raw scanner JSON files in `results/`
- Unified findings JSON report
- HTML report for reviewer readability
- Policy decision JSON with explicit fail reasons
- Consolidated PR comment body
