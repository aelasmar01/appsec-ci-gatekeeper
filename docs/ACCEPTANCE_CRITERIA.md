# Acceptance Criteria

## Scope

This document defines success criteria for the CI gate across scanning, reporting, policy enforcement, and PR feedback.

## Trigger Behavior

- Workflow triggers on `pull_request`.
- Workflow also supports manual execution via `workflow_dispatch`.

## Required Security Stages

Pipeline must include these stages:
- SAST scan
- Dependency/vulnerability scan
- License evaluation input generation (via SBOM)
- Secrets detection
- IaC misconfiguration scan

## Required Outputs

The pipeline must produce:
- Raw scanner JSON artifacts
- CycloneDX SBOM JSON
- Unified findings report JSON
- Human-readable HTML report
- Policy decision JSON

## Pass/Fail Semantics

- Gate passes when no unsuppressed policy violations are present.
- Gate fails when severity/license policies are violated by unsuppressed findings.
- Gate fails or warns for expired/near-expiry suppressions according to configured enforcement mode.

## PR Comment Behavior

- A single consolidated bot comment is posted per PR run.
- Comment includes:
  - pass/fail status
  - severity summary
  - top findings with fix guidance
  - report artifact reference
  - suppression instructions
- Existing bot comment should be updated in-place on subsequent runs.

## Demo Expectations

The demo app should reliably produce findings that exercise:
- SAST detection
- vulnerable dependency
- secret detection
- IaC misconfiguration
- license policy edge case

The walkthrough should show:
- failing gate on initial PR
- generated JSON and HTML outputs
- fix cycle leading to pass
