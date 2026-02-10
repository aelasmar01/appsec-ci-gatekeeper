# Exceptions and Suppressions

## Purpose

Exceptions provide a governed way to suppress known findings without weakening long-term policy enforcement.

## Required Metadata

Each suppression entry must include:
- `fingerprint`
- `tool`
- `reason`
- `owner`
- `expiry` (ISO date)

## Guardrails

- Suppressions must be time-bound.
- Expired entries should fail policy evaluation or produce a blocking signal based on configured mode.
- Near-expiry entries should generate warnings to prompt review.

## Workflow Concept

1. Engineer identifies finding to suppress.
2. Suppression entry is generated from finding fingerprint.
3. Entry is reviewed and approved by AppSec/code owners.
4. Entry is merged with explicit expiry.
5. Pipeline suppresses only matching finding fingerprints.
6. Expiry triggers review and renewal/removal decision.

## Auditing

The gate should preserve suppression transparency by reporting:
- suppressed finding count
- fingerprints suppressed
- owner and expiry for each applied suppression
