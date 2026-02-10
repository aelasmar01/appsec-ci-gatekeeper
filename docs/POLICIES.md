# Policy Model

## Objectives

Policies define merge-gate behavior so AppSec can enforce consistent risk tolerances while still providing actionable guidance to developers.

## Policy Inputs

- Normalized findings report (unified schema)
- SBOM (CycloneDX JSON)
- Exception baseline entries
- Policy configuration files (`policies/`)

## Initial Policy Categories

1. Severity thresholds
2. License allow/deny evaluation
3. Exception validity checks (owner + expiry)

## Severity Policy Concept

Severity policy supports:
- Global threshold (example: block `high` and `critical`)
- Optional per-tool overrides
- Optional caps for count-based conditions

Expected behavior:
- Violations produce a failed gate decision.
- Decision includes exact findings and rationale.

## License Policy Concept

License policy reads SBOM components and evaluates against:
- allow list
- deny list

Expected behavior:
- Denied licenses fail the gate.
- Decision includes impacted package names and remediation direction.

## Decision Artifact

Policy evaluator should emit a structured decision JSON with:
- `status` (`pass` or `fail`)
- `summary` (counts by severity/tool)
- `reasons` (array of explicit policy violations)
- `suppressed` (count/details where applicable)
- `timestamp`

## Logging Expectations

Pipeline logs should show:
- policy files used
- thresholds resolved
- suppression counts
- final decision and why
