#!/usr/bin/env python3
"""Validate LOCKED section requirements for agent contracts.

Supported protection models:
  - reference-based: registry required, LOCKED sections forbidden
  - hybrid: registry required, LOCKED sections required
  - embedded: LOCKED sections required
"""

from __future__ import annotations

import argparse
import glob
import sys
from pathlib import Path
import re


LOCKED_PATTERN = re.compile(r"<!--\s*LOCKED", re.IGNORECASE)
REGISTRY_PATTERN = re.compile(r"Protection Registry", re.IGNORECASE)
MODEL_PATTERN = re.compile(r"^\s*protection_model:\s*([a-zA-Z-]+)\s*$", re.MULTILINE)


def expand_paths(paths: list[str]) -> list[Path]:
    expanded: list[Path] = []
    for item in paths:
        matches = glob.glob(item)
        if matches:
            expanded.extend(Path(match) for match in matches)
        else:
            expanded.append(Path(item))
    return expanded


def validate_file(path: Path) -> list[str]:
    errors: list[str] = []
    content = path.read_text(encoding="utf-8")

    model_match = MODEL_PATTERN.search(content)
    if not model_match:
        return [f"{path}: missing protection_model declaration"]

    model = model_match.group(1).strip().lower()
    has_locked = bool(LOCKED_PATTERN.search(content))
    has_registry = bool(REGISTRY_PATTERN.search(content))

    if model == "reference-based":
        if has_locked:
            errors.append(f"{path}: reference-based model forbids LOCKED sections")
        if not has_registry:
            errors.append(f"{path}: reference-based model requires Protection Registry")
    elif model == "hybrid":
        if not has_registry:
            errors.append(f"{path}: hybrid model requires Protection Registry")
        if not has_locked:
            errors.append(f"{path}: hybrid model requires LOCKED sections")
    elif model == "embedded":
        if not has_locked:
            errors.append(f"{path}: embedded model requires LOCKED sections")
    else:
        errors.append(f"{path}: unknown protection_model '{model}'")

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description="Check agent contract LOCKED sections.")
    parser.add_argument(
        "paths",
        nargs="*",
        default=[".github/agents/*.md"],
        help="Files or glob patterns to validate",
    )
    args = parser.parse_args()

    targets = [path for path in expand_paths(args.paths) if path.is_file()]
    if not targets:
        print("No files found to validate.", file=sys.stderr)
        return 1

    all_errors: list[str] = []
    for path in targets:
        all_errors.extend(validate_file(path))

    if all_errors:
        for error in all_errors:
            print(f"❌ {error}")
        return 1

    print("✅ LOCKED section validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
