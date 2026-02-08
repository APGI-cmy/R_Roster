#!/bin/bash
# Pre-Flight Check: Verify PREHANDOVER artifacts are complete BEFORE PR creation
# Authority: Lesson Learned LL-001-SCOPE_DECLARATION_COMPLETENESS
# Agent: agent-contract-administrator

set -e

echo "========================================"
echo "Pre-Flight Check: Evidence-Based PR"
echo "========================================"
echo ""

EXIT_STATUS=0

# Check 1: PREHANDOVER_PROOF exists
echo "CHECK 1: PREHANDOVER_PROOF file"
if ls PREHANDOVER_PROOF_*.md 1> /dev/null 2>&1; then
    echo "✅ PREHANDOVER_PROOF found"
else
    echo "❌ PREHANDOVER_PROOF missing"
    EXIT_STATUS=1
fi

# Check 2: SCOPE_DECLARATION.md exists
echo ""
echo "CHECK 2: SCOPE_DECLARATION.md file"
if [ -f "SCOPE_DECLARATION.md" ]; then
    echo "✅ SCOPE_DECLARATION.md found"
else
    echo "❌ SCOPE_DECLARATION.md missing"
    EXIT_STATUS=1
    exit $EXIT_STATUS
fi

# Check 3: Attestation statements
echo ""
echo "CHECK 3: Attestation statements"
ATTEST_COUNT=$(grep -c "I attest" SCOPE_DECLARATION.md || echo "0")
if [ "$ATTEST_COUNT" -ge 3 ]; then
    echo "✅ Attestation statements present ($ATTEST_COUNT found)"
else
    echo "❌ Insufficient attestation statements (found $ATTEST_COUNT, need ≥3)"
    EXIT_STATUS=1
fi

# Check 4: Agent signature
echo ""
echo "CHECK 4: Agent signature"
if grep -q "Agent Signature" SCOPE_DECLARATION.md && grep -q "Signature Statement" SCOPE_DECLARATION.md; then
    echo "✅ Agent signature present"
else
    echo "❌ Agent signature missing or incomplete"
    EXIT_STATUS=1
fi

# Check 5: Justification section
echo ""
echo "CHECK 5: Validation method justification"
if grep -q "Validation Method Justification" SCOPE_DECLARATION.md; then
    echo "✅ Justification section present"
else
    echo "❌ Justification section missing"
    EXIT_STATUS=1
fi

# Check 6: Run official gate validation
echo ""
echo "CHECK 6: Official evidence-based gate validation"
if bash .github/scripts/validate-evidence-based-gate.sh > /dev/null 2>&1; then
    echo "✅ Evidence-based gate validation PASSED"
else
    echo "❌ Evidence-based gate validation FAILED"
    echo "   Run manually: bash .github/scripts/validate-evidence-based-gate.sh"
    EXIT_STATUS=1
fi

echo ""
echo "========================================"
if [ $EXIT_STATUS -eq 0 ]; then
    echo "✅ PRE-FLIGHT CHECK PASSED"
    echo "Safe to create PR"
else
    echo "❌ PRE-FLIGHT CHECK FAILED"
    echo "Fix errors before creating PR"
fi
echo "========================================"

exit $EXIT_STATUS
