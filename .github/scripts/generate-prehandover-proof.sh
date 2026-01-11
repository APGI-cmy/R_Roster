#!/bin/bash
# PREHANDOVER_PROOF Generator
# Constitutional Requirement: governance-liaison.md § 42, § 76

set -e

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
OUTPUT_FILE="PREHANDOVER_PROOF_${TIMESTAMP}.md"

echo "=== PREHANDOVER_PROOF GENERATOR ==="
echo "Constitutional Authority: governance-liaison.md § 42, § 76"
echo ""

# Execute validation and capture output
if [ ! -f "governance-gate-local-validation.sh" ]; then
  echo "❌ ERROR: governance-gate-local-validation.sh not found"
  exit 1
fi

echo "Running local validation..."
bash governance-gate-local-validation.sh > /tmp/validation.log 2>&1 || {
  echo "❌ VALIDATION FAILED"
  echo "   Review output and fix issues before generating PREHANDOVER_PROOF"
  cat /tmp/validation.log
  exit 1
}

# Generate proof document
cat > "$OUTPUT_FILE" <<EOFINNER
# PREHANDOVER_PROOF

**Repository**: $(git remote get-url origin 2>/dev/null || echo 'local')
**Branch**: $(git branch --show-current 2>/dev/null || echo 'detached')
**Timestamp**: $TIMESTAMP
**Agent**: governance-liaison

---

## Local Validation Execution

\`\`\`
$(cat /tmp/validation.log)
\`\`\`

---

## Verification

\`\`\`bash
\$ ls -la .architecture .qa governance
$(ls -la .architecture .qa governance 2>&1)
\`\`\`

---

## Attestation

✅ ALL CHECKS: GREEN
✅ HANDOVER AUTHORIZED: $TIMESTAMP

**Constitutional Authority**: governance-liaison.md § 42, § 76
EOFINNER

echo ""
echo "✅ PREHANDOVER_PROOF generated: $OUTPUT_FILE"
echo ""
echo "Next steps:"
echo "1. Review the generated proof document"
echo "2. Commit it to your PR: git add $OUTPUT_FILE"
echo "3. Update PR description with: 'PREHANDOVER_PROOF attached: $OUTPUT_FILE'"
echo "4. Mark PR as ready for review"
