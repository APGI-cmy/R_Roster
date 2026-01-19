#!/bin/bash
# Determine CI Validation Path
# Authority: governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md (BL-027/028)
# Purpose: Determine whether to use script-based or evidence-based validation

set -e

echo "=========================================="
echo "CI Validation Path Determination"
echo "=========================================="
echo "Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo ""

# Check for evidence-based validation documents
HAS_SCOPE_DECLARATION=false
HAS_PREHANDOVER_PROOF=false

if [ -f "SCOPE_DECLARATION.md" ]; then
    HAS_SCOPE_DECLARATION=true
    echo "✓ SCOPE_DECLARATION.md found"
fi

if find . -maxdepth 1 -name "PREHANDOVER_PROOF_*.md" -type f | grep -q .; then
    HAS_PREHANDOVER_PROOF=true
    echo "✓ PREHANDOVER_PROOF_*.md found"
fi

echo ""

# Determine validation path
if [ "$HAS_SCOPE_DECLARATION" = true ] && [ "$HAS_PREHANDOVER_PROOF" = true ]; then
    echo "=========================================="
    echo "VALIDATION PATH: Evidence-Based (BL-027/028)"
    echo "=========================================="
    echo ""
    echo "Both SCOPE_DECLARATION.md and PREHANDOVER_PROOF are present."
    echo "Using evidence-based validation per BL-027/028 pattern."
    echo ""
    echo "Evidence validation will check:"
    echo "  ✓ Document structure and completeness"
    echo "  ✓ Agent attestations"
    echo "  ✓ Scope comparison (git diff vs documented)"
    echo "  ✓ Validation method justification"
    echo ""
    echo "path=evidence"
    
elif [ "$HAS_SCOPE_DECLARATION" = true ] || [ "$HAS_PREHANDOVER_PROOF" = true ]; then
    echo "=========================================="
    echo "VALIDATION PATH: Incomplete Evidence"
    echo "=========================================="
    echo ""
    echo "⚠️  WARNING: Partial evidence-based validation detected"
    echo ""
    
    if [ "$HAS_SCOPE_DECLARATION" = true ]; then
        echo "   Found: SCOPE_DECLARATION.md"
        echo "   Missing: PREHANDOVER_PROOF_*.md"
    else
        echo "   Found: PREHANDOVER_PROOF_*.md"
        echo "   Missing: SCOPE_DECLARATION.md"
    fi
    
    echo ""
    echo "For evidence-based validation (BL-027/028), BOTH documents are required:"
    echo "  - SCOPE_DECLARATION.md"
    echo "  - PREHANDOVER_PROOF_[timestamp].md"
    echo ""
    echo "Falling back to script-based validation."
    echo ""
    echo "path=script"
    
else
    echo "=========================================="
    echo "VALIDATION PATH: Script-Based (Traditional)"
    echo "=========================================="
    echo ""
    echo "No evidence-based validation documents found."
    echo "Using traditional script-based validation."
    echo ""
    echo "Script validation will execute:"
    echo "  ✓ Local validation scripts"
    echo "  ✓ Test suites (if present)"
    echo "  ✓ Linters and code quality checks"
    echo "  ✓ Governance gate validation"
    echo ""
    echo "path=script"
fi

echo ""
echo "=========================================="
