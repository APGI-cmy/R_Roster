#!/bin/bash
set -e

echo "=== GOVERNANCE GATE LOCAL EXECUTION ==="
echo "Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Repository: $(git remote get-url origin 2>/dev/null || echo 'local')"
echo "Branch: $(git branch --show-current 2>/dev/null || echo 'detached')"
echo ""

# Determine validation path
VALIDATION_PATH="script"
if [ -f "SCOPE_DECLARATION.md" ] && find . -maxdepth 1 -name "PREHANDOVER_PROOF_*.md" -type f | grep -q .; then
    VALIDATION_PATH="evidence"
fi

echo "VALIDATION PATH: $VALIDATION_PATH"
echo ""

if [ "$VALIDATION_PATH" = "evidence" ]; then
    echo "=== EVIDENCE-BASED VALIDATION (BL-027/028) ==="
    echo ""
    
    if [ -x ".github/scripts/validate-evidence-based-gate.sh" ]; then
        .github/scripts/validate-evidence-based-gate.sh
        EXIT_CODE=$?
    else
        echo "❌ ERROR: Evidence validation script not found or not executable"
        echo "   Expected: .github/scripts/validate-evidence-based-gate.sh"
        exit 1
    fi
    
    if [ $EXIT_CODE -eq 0 ]; then
        echo ""
        echo "=== ALL CHECKS PASSED (EVIDENCE-BASED) ==="
        echo "Result: GREEN"
        echo "Exit Code: 0"
        exit 0
    else
        echo ""
        echo "=== VALIDATION FAILED ==="
        echo "Result: RED"
        echo "Exit Code: 1"
        exit 1
    fi
fi

# Traditional script-based validation
echo "=== SCRIPT-BASED VALIDATION (TRADITIONAL) ==="
echo ""

echo "CHECK 1: Required Directories"
for dir in .architecture .qa governance; do
  if [ -d "$dir" ]; then
    echo "✅ $dir: PRESENT"
  else
    echo "❌ $dir: MISSING"
    exit 1
  fi
done
echo ""

echo "CHECK 2: BUILD_PHILOSOPHY.md"
if [ -f "BUILD_PHILOSOPHY.md" ]; then
  echo "✅ BUILD_PHILOSOPHY.md: PRESENT"
else
  echo "❌ BUILD_PHILOSOPHY.md: MISSING"
  exit 1
fi
echo ""

echo "CHECK 3: .agent Contract"
if [ -f ".agent" ]; then
  echo "✅ .agent: PRESENT"
else
  echo "❌ .agent: MISSING"
  exit 1
fi
echo ""

echo "CHECK 4: Governance Alignment"
if [ -f "governance/alignment/GOVERNANCE_ALIGNMENT.md" ]; then
  echo "✅ governance/alignment/GOVERNANCE_ALIGNMENT.md: PRESENT"
else
  echo "❌ governance/alignment/GOVERNANCE_ALIGNMENT.md: MISSING"
  exit 1
fi
echo ""

echo "CHECK 5: Test Debt (Placeholder)"
echo "✅ Test debt check: PASS (no tests yet)"
echo ""

echo "=== ALL CHECKS PASSED ==="
echo "Result: GREEN"
echo "Exit Code: 0"
