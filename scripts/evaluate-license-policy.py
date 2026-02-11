#!/usr/bin/env python3
"""Stub license policy evaluator.

This script is intentionally non-blocking in this commit. It logs policy
inputs and basic SBOM metadata so wiring can be validated before enforcement
logic is added.
"""

from __future__ import annotations

import argparse
import json
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as fh:
        return json.load(fh)


def safe_component_count(sbom_path: Path) -> int | None:
    if not sbom_path.exists():
        return None
    try:
        sbom = load_json(sbom_path)
    except Exception:
        return None
    components = sbom.get("components")
    if isinstance(components, list):
        return len(components)
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description="Stub license policy evaluator.")
    parser.add_argument(
        "--sbom",
        default="results/sbom.cdx.json",
        help="Path to CycloneDX SBOM JSON.",
    )
    parser.add_argument(
        "--allow",
        default="policies/license/allow.json",
        help="Path to allowed license policy JSON.",
    )
    parser.add_argument(
        "--deny",
        default="policies/license/deny.json",
        help="Path to denied license policy JSON.",
    )
    parser.add_argument(
        "--output",
        default="reports/license-policy.stub.json",
        help="Output path for stub evaluator result JSON.",
    )
    args = parser.parse_args()

    sbom_path = Path(args.sbom)
    allow_path = Path(args.allow)
    deny_path = Path(args.deny)
    output_path = Path(args.output)

    allow_data = load_json(allow_path) if allow_path.exists() else {}
    deny_data = load_json(deny_path) if deny_path.exists() else {}
    allow_licenses = allow_data.get("allowed_licenses", [])
    deny_licenses = deny_data.get("denied_licenses", [])

    result = {
        "status": "stub",
        "decision": "not_enforced",
        "message": "License policy evaluator is a stub in this commit.",
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "inputs": {
            "sbom": str(sbom_path),
            "allow": str(allow_path),
            "deny": str(deny_path),
            "sbom_exists": sbom_path.exists(),
            "allow_exists": allow_path.exists(),
            "deny_exists": deny_path.exists(),
        },
        "summary": {
            "allow_count": len(allow_licenses) if isinstance(allow_licenses, list) else 0,
            "deny_count": len(deny_licenses) if isinstance(deny_licenses, list) else 0,
            "sbom_component_count": safe_component_count(sbom_path),
        },
    }

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", encoding="utf-8") as fh:
        json.dump(result, fh, indent=2)
        fh.write("\n")

    print("[license-policy-stub] completed")
    print(f"[license-policy-stub] sbom: {sbom_path}")
    print(f"[license-policy-stub] allow: {allow_path}")
    print(f"[license-policy-stub] deny: {deny_path}")
    print(f"[license-policy-stub] output: {output_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
