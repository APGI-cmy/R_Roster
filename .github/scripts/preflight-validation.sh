#!/bin/bash
# Preflight Validation Script
# Constitutional Requirement: governance-liaison.md § 36-42

set -e

echo "=== PR-GATE PREFLIGHT VALIDATION ==="
echo "This script MUST be run before marking any PR complete"
echo "Constitutional Authority: governance-liaison.md § 36-42"
echo ""

# Check if governance-gate-local-validation.sh exists
if [ ! -f "governance-gate-local-validation.sh" ]; then
  echo "❌ ERROR: governance-gate-local-validation.sh not found"
  echo "   This script must exist in repository root"
  exit 1
fi

# Run all governance gate checks locally
bash governance-gate-local-validation.sh

# If we get here, all checks passed
echo ""
echo "✅ PREFLIGHT VALIDATION: COMPLETE"
echo "✅ CI-Confirmatory-Not-Diagnostic: SATISFIED"
echo ""
echo "Next steps:"
echo "1. Generate PREHANDOVER_PROOF document with .github/scripts/generate-prehandover-proof.sh"
echo "2. Commit PREHANDOVER_PROOF to PR"
echo "3. Mark PR complete with proof attached"
