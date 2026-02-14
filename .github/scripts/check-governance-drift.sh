#!/bin/bash
# Governance Drift Detection Script
# Authority: GOVERNANCE_ALIGNMENT_MONITORING_PROTOCOL.md
# Purpose: Fast drift detection for pre-commit and CI checks

set -e

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "=========================================="
echo "Governance Drift Detection"
echo "Timestamp: $TIMESTAMP"
echo "=========================================="

DRIFT_DETECTED=false

# Quick integrity checks
echo ""
echo "Checking critical governance files..."

# Check CANON_INVENTORY.json
if [ ! -f "governance/CANON_INVENTORY.json" ]; then
    echo "❌ governance/CANON_INVENTORY.json missing"
    DRIFT_DETECTED=true
elif ! jq empty governance/CANON_INVENTORY.json 2>/dev/null; then
    echo "❌ governance/CANON_INVENTORY.json invalid JSON"
    DRIFT_DETECTED=true
else
    # Check for placeholder hashes
    PLACEHOLDER_COUNT=$(jq '[.canon_files[] | select(.sha256 == "placeholder" or .sha256 == "" or (.sha256 | length) < 64)] | length' governance/CANON_INVENTORY.json 2>/dev/null || echo "0")
    
    if [ "$PLACEHOLDER_COUNT" -gt 0 ]; then
        echo "⚠️  governance/CANON_INVENTORY.json contains $PLACEHOLDER_COUNT placeholder hashes"
        DRIFT_DETECTED=true
    else
        echo "✓ governance/CANON_INVENTORY.json valid"
    fi
fi

# Check TIER_0_CANON_MANIFEST.json
if [ ! -f "governance/TIER_0_CANON_MANIFEST.json" ]; then
    echo "❌ governance/TIER_0_CANON_MANIFEST.json missing"
    DRIFT_DETECTED=true
elif ! jq empty governance/TIER_0_CANON_MANIFEST.json 2>/dev/null; then
    echo "❌ governance/TIER_0_CANON_MANIFEST.json invalid JSON"
    DRIFT_DETECTED=true
else
    echo "✓ governance/TIER_0_CANON_MANIFEST.json valid"
fi

# Check sync_state.json
if [ ! -f ".agent-admin/governance/sync_state.json" ]; then
    echo "⚠️  .agent-admin/governance/sync_state.json missing"
    DRIFT_DETECTED=true
elif ! jq empty .agent-admin/governance/sync_state.json 2>/dev/null; then
    echo "❌ .agent-admin/governance/sync_state.json invalid JSON"
    DRIFT_DETECTED=true
else
    ALIGNMENT_STATE=$(jq -r '.alignment_state // "UNKNOWN"' .agent-admin/governance/sync_state.json)
    
    if [ "$ALIGNMENT_STATE" = "DRIFT_DETECTED" ]; then
        echo "⚠️  Drift previously detected in sync state"
        DRIFT_DETECTED=true
    else
        echo "✓ sync_state.json shows aligned status"
    fi
fi

# Check governance directory structure
if [ ! -d "governance/canon" ]; then
    echo "❌ governance/canon/ directory missing"
    DRIFT_DETECTED=true
else
    CANON_FILE_COUNT=$(find governance/canon -type f -name "*.md" | wc -l)
    if [ "$CANON_FILE_COUNT" -lt 10 ]; then
        echo "⚠️  governance/canon/ has only $CANON_FILE_COUNT canon files (expected >10)"
        DRIFT_DETECTED=true
    else
        echo "✓ governance/canon/ has $CANON_FILE_COUNT canon files"
    fi
fi

echo ""
echo "=========================================="

if [ "$DRIFT_DETECTED" = true ]; then
    echo "❌ DRIFT DETECTED"
    echo "Run: .github/scripts/align-governance.sh"
    echo "drift_detected=true"
    exit 1
else
    echo "✓ NO DRIFT DETECTED"
    echo "drift_detected=false"
    exit 0
fi
