#!/bin/bash
# Governance Alignment Script
# Authority: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md, GOVERNANCE_ALIGNMENT_MONITORING_PROTOCOL.md
# Purpose: Detect governance drift and execute alignment with canonical source

set -e

CANONICAL_SOURCE="APGI-cmy/maturion-foreman-governance"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "=========================================="
echo "Governance Alignment Script"
echo "Timestamp: $TIMESTAMP"
echo "=========================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository"
    exit 1
fi

# Ensure required directories exist
mkdir -p .agent-admin/governance
mkdir -p .agent-admin/evidence/governance-liaison

echo ""
echo "Step 1: Validate local governance structure"
echo "=========================================="

DRIFT_DETECTED=false
MISSING_FILES=()
VALIDATION_ERRORS=()

# Check for critical governance files
REQUIRED_FILES=(
    "governance/CANON_INVENTORY.json"
    "governance/TIER_0_CANON_MANIFEST.json"
    ".agent-admin/governance/sync_state.json"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ Missing: $file"
        MISSING_FILES+=("$file")
        DRIFT_DETECTED=true
    else
        echo "✓ Found: $file"
    fi
done

echo ""
echo "Step 2: Check CANON_INVENTORY integrity"
echo "=========================================="

if [ -f "governance/CANON_INVENTORY.json" ]; then
    # Validate JSON structure
    if ! jq empty governance/CANON_INVENTORY.json 2>/dev/null; then
        echo "❌ CANON_INVENTORY.json is not valid JSON"
        VALIDATION_ERRORS+=("CANON_INVENTORY.json: Invalid JSON")
        DRIFT_DETECTED=true
    else
        echo "✓ CANON_INVENTORY.json is valid JSON"
        
        # Check for placeholder hashes
        PLACEHOLDER_COUNT=$(jq '[.canon_files[] | select(.sha256 == "placeholder" or .sha256 == "" or (.sha256 | length) < 64)] | length' governance/CANON_INVENTORY.json)
        
        if [ "$PLACEHOLDER_COUNT" -gt 0 ]; then
            echo "⚠️  Found $PLACEHOLDER_COUNT placeholder hashes in CANON_INVENTORY.json"
            VALIDATION_ERRORS+=("CANON_INVENTORY.json: Contains placeholder hashes")
            DRIFT_DETECTED=true
        else
            echo "✓ No placeholder hashes detected"
        fi
    fi
fi

echo ""
echo "Step 3: Verify governance directory structure"
echo "=========================================="

GOVERNANCE_DIRS=(
    "governance/canon"
    "governance/agent"
    "governance/schemas"
    ".agent-admin/governance"
)

for dir in "${GOVERNANCE_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "⚠️  Directory missing: $dir"
        mkdir -p "$dir"
        echo "   Created: $dir"
    else
        echo "✓ Directory exists: $dir"
    fi
done

echo ""
echo "Step 4: Check sync state status"
echo "=========================================="

SYNC_STATE=".agent-admin/governance/sync_state.json"

if [ -f "$SYNC_STATE" ]; then
    LAST_SYNC=$(jq -r '.last_sync // "never"' "$SYNC_STATE")
    ALIGNMENT_STATE=$(jq -r '.alignment_state // "UNKNOWN"' "$SYNC_STATE")
    
    echo "Last sync: $LAST_SYNC"
    echo "Alignment state: $ALIGNMENT_STATE"
    
    # Check if drift was previously detected
    if [ "$ALIGNMENT_STATE" = "DRIFT_DETECTED" ]; then
        echo "⚠️  Previous drift state detected"
        DRIFT_DETECTED=true
    fi
    
    # Check if last sync is too old (>24 hours)
    if [ "$LAST_SYNC" != "never" ]; then
        LAST_SYNC_EPOCH=$(date -d "$LAST_SYNC" +%s 2>/dev/null || echo 0)
        CURRENT_EPOCH=$(date +%s)
        HOURS_SINCE_SYNC=$(( (CURRENT_EPOCH - LAST_SYNC_EPOCH) / 3600 ))
        
        if [ $HOURS_SINCE_SYNC -gt 24 ]; then
            echo "⚠️  Last sync was $HOURS_SINCE_SYNC hours ago (>24h threshold)"
            DRIFT_DETECTED=true
        else
            echo "✓ Last sync within 24-hour window"
        fi
    fi
else
    echo "⚠️  No sync state found - first-time setup"
    DRIFT_DETECTED=true
fi

echo ""
echo "Step 5: Summary"
echo "=========================================="

if [ "$DRIFT_DETECTED" = true ]; then
    echo "❌ DRIFT DETECTED"
    echo ""
    
    if [ ${#MISSING_FILES[@]} -gt 0 ]; then
        echo "Missing files:"
        for file in "${MISSING_FILES[@]}"; do
            echo "  - $file"
        done
    fi
    
    if [ ${#VALIDATION_ERRORS[@]} -gt 0 ]; then
        echo "Validation errors:"
        for error in "${VALIDATION_ERRORS[@]}"; do
            echo "  - $error"
        done
    fi
    
    echo ""
    echo "RECOMMENDED ACTION:"
    echo "  1. Review canonical governance source"
    echo "  2. Execute layer-down from: $CANONICAL_SOURCE"
    echo "  3. Update local CANON_INVENTORY.json"
    echo "  4. Validate alignment"
    echo "  5. Create alignment PR"
    
    # ✅ NEW: Check for existing open governance alignment PR
    echo ""
    echo "Step 5a: Check for existing governance alignment PR"
    echo "=========================================="
    
    # Check if gh CLI is available
    if command -v gh &> /dev/null; then
        # Check for open PR from governance-alignment-auto branch
        EXISTING_PR=$(gh pr list --head governance-alignment-auto --state open --json number --jq '.[0].number' 2>/dev/null || echo "")
        
        if [ -n "$EXISTING_PR" ]; then
            echo "⚠️  Open governance alignment PR already exists: #$EXISTING_PR"
            echo "   Skipping PR creation to prevent duplicates"
            echo "   Existing PR will be updated by subsequent commits"
            echo "has_existing_pr=true" >> /tmp/alignment_state.txt
        else
            echo "✓ No existing open governance alignment PR"
            echo "has_existing_pr=false" >> /tmp/alignment_state.txt
        fi
    else
        echo "⚠️  gh CLI not available, cannot check for existing PRs"
        echo "has_existing_pr=unknown" >> /tmp/alignment_state.txt
    fi
else
    echo "✓ NO DRIFT DETECTED"
    echo "Local governance is aligned with requirements"
fi

echo ""
echo "Step 6: Update sync state"
echo "=========================================="

# Update sync state with current check results
if [ -f "$SYNC_STATE" ]; then
    jq --arg ts "$TIMESTAMP" \
       --arg state "$([ "$DRIFT_DETECTED" = true ] && echo 'DRIFT_DETECTED' || echo 'ALIGNED')" \
       --argjson drift "$([ "$DRIFT_DETECTED" = true ] && echo 'true' || echo 'false')" \
       '.last_sync = $ts | .alignment_state = $state | .drift_detected = $drift' \
       "$SYNC_STATE" > "${SYNC_STATE}.tmp" && mv "${SYNC_STATE}.tmp" "$SYNC_STATE"
else
    cat > "$SYNC_STATE" <<EOF
{
  "timestamp": "$TIMESTAMP",
  "alignment_state": "$([ "$DRIFT_DETECTED" = true ] && echo 'DRIFT_DETECTED' || echo 'ALIGNED')",
  "last_sync": "$TIMESTAMP",
  "canonical_source": "$CANONICAL_SOURCE",
  "drift_detected": $([ "$DRIFT_DETECTED" = true ] && echo 'true' || echo 'false'),
  "notes": "Alignment check executed"
}
EOF
fi

echo "Sync state updated: $SYNC_STATE"
cat "$SYNC_STATE"

echo ""
echo "Step 7: Create evidence artifacts"
echo "=========================================="

EVIDENCE_TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
EVIDENCE_DIR=".agent-admin/evidence/governance-liaison/alignment-${EVIDENCE_TIMESTAMP}"

mkdir -p "$EVIDENCE_DIR"

# Create evidence log
cat > "$EVIDENCE_DIR/evidence-log.json" <<EOF
{
  "session_type": "governance_alignment",
  "timestamp": "$EVIDENCE_TIMESTAMP",
  "drift_detected": $([ "$DRIFT_DETECTED" = true ] && echo 'true' || echo 'false'),
  "missing_files_count": ${#MISSING_FILES[@]},
  "validation_errors_count": ${#VALIDATION_ERRORS[@]},
  "alignment_status": "$([ "$DRIFT_DETECTED" = true ] && echo 'DRIFT_DETECTED' || echo 'ALIGNED')",
  "canonical_source": "$CANONICAL_SOURCE"
}
EOF

# Create detailed findings file
cat > "$EVIDENCE_DIR/alignment-findings.md" <<EOF
# Governance Alignment Findings

**Timestamp**: $TIMESTAMP  
**Canonical Source**: $CANONICAL_SOURCE

## Summary
- **Drift Detected**: $([ "$DRIFT_DETECTED" = true ] && echo 'YES' || echo 'NO')
- **Missing Files**: ${#MISSING_FILES[@]}
- **Validation Errors**: ${#VALIDATION_ERRORS[@]}

## Missing Files
$(if [ ${#MISSING_FILES[@]} -gt 0 ]; then
    for file in "${MISSING_FILES[@]}"; do
        echo "- $file"
    done
else
    echo "None"
fi)

## Validation Errors
$(if [ ${#VALIDATION_ERRORS[@]} -gt 0 ]; then
    for error in "${VALIDATION_ERRORS[@]}"; do
        echo "- $error"
    done
else
    echo "None"
fi)

## Recommendation
$(if [ "$DRIFT_DETECTED" = true ]; then
    echo "Execute layer-down from canonical governance repository to restore alignment."
else
    echo "No action required. Governance is aligned."
fi)

---
Generated by: align-governance.sh  
Authority: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md
EOF

echo "Evidence created at: $EVIDENCE_DIR"
ls -la "$EVIDENCE_DIR/"

echo ""
echo "=========================================="
echo "Alignment check complete"
echo "Drift detected: $([ "$DRIFT_DETECTED" = true ] && echo 'YES' || echo 'NO')"
echo "=========================================="

# Exit with appropriate code
if [ "$DRIFT_DETECTED" = true ]; then
    exit 1
else
    exit 0
fi
