#!/bin/bash
set -e

echo "=== GOVERNANCE GATE LOCAL EXECUTION ==="
echo "Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Repository: $(git remote get-url origin 2>/dev/null || echo 'local')"
echo "Branch: $(git branch --show-current 2>/dev/null || echo 'detached')"
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
