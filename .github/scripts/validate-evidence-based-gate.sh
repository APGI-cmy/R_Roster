#!/bin/bash
# Evidence-Based CI Gate Validation Script
# Authority: governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md (BL-027/028)
# Purpose: Validate that evidence-based validation documents are complete and accurate

set -e

echo "=========================================="
echo "Evidence-Based CI Gate Validation (BL-027/028)"
echo "=========================================="
echo "Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo ""

# Track validation status
VALIDATION_PASSED=true
ERRORS=()

# Function to add error
add_error() {
    ERRORS+=("$1")
    VALIDATION_PASSED=false
}

# CHECK 1: SCOPE_DECLARATION.md exists
echo "CHECK 1: SCOPE_DECLARATION.md presence"
if [ -f "SCOPE_DECLARATION.md" ]; then
    echo "✅ SCOPE_DECLARATION.md: PRESENT"
else
    echo "❌ SCOPE_DECLARATION.md: MISSING"
    add_error "SCOPE_DECLARATION.md is required for evidence-based validation"
    echo ""
    echo "Evidence-based validation requires SCOPE_DECLARATION.md"
    echo "Template: governance/templates/SCOPE_DECLARATION_TEMPLATE.md"
    echo ""
    exit 1
fi
echo ""

# CHECK 2: PREHANDOVER_PROOF exists
echo "CHECK 2: PREHANDOVER_PROOF presence"
PREHANDOVER_FILES=$(find . -maxdepth 1 -name "PREHANDOVER_PROOF_*.md" -type f | sort -r | head -1)
if [ -n "$PREHANDOVER_FILES" ]; then
    PREHANDOVER_FILE="$PREHANDOVER_FILES"
    echo "✅ PREHANDOVER_PROOF: PRESENT ($PREHANDOVER_FILE)"
else
    echo "❌ PREHANDOVER_PROOF: MISSING"
    add_error "PREHANDOVER_PROOF_*.md is required for evidence-based validation"
    echo ""
    echo "Evidence-based validation requires PREHANDOVER_PROOF_[timestamp].md"
    echo "Template: governance/templates/PREHANDOVER_PROOF_TEMPLATE.md"
    echo ""
    exit 1
fi
echo ""

# CHECK 3: SCOPE_DECLARATION.md structure
echo "CHECK 3: SCOPE_DECLARATION.md structure"

# Required sections in SCOPE_DECLARATION
REQUIRED_SECTIONS=(
    "Agent"
    "Date"
    "PR Title"
    "Changed Files"
    "Scope Summary"
    "Validation Method Justification"
    "Scope Comparison"
    "Scope Attestation"
    "Agent Signature"
)

MISSING_SECTIONS=()
for section in "${REQUIRED_SECTIONS[@]}"; do
    if ! grep -q "$section" SCOPE_DECLARATION.md; then
        MISSING_SECTIONS+=("$section")
    fi
done

if [ ${#MISSING_SECTIONS[@]} -eq 0 ]; then
    echo "✅ SCOPE_DECLARATION.md structure: COMPLETE"
else
    echo "❌ SCOPE_DECLARATION.md structure: INCOMPLETE"
    echo "   Missing sections:"
    for section in "${MISSING_SECTIONS[@]}"; do
        echo "     - $section"
    done
    add_error "SCOPE_DECLARATION.md is missing required sections"
fi
echo ""

# CHECK 4: Template placeholders not replaced
echo "CHECK 4: SCOPE_DECLARATION.md template completion"
# Look for template-style placeholders, excluding checkboxes and common patterns in titles
PLACEHOLDERS=$(grep -oE '\[[A-Z][A-Za-z-]+\]' SCOPE_DECLARATION.md | grep -v '^\[LAYER\]\|^\[x\]\|^\[X\]' | head -5)
if [ -z "$PLACEHOLDERS" ]; then
    echo "✅ SCOPE_DECLARATION.md: NO TEMPLATE PLACEHOLDERS"
else
    echo "⚠️  SCOPE_DECLARATION.md: CONTAINS PLACEHOLDERS (possible incomplete)"
    echo "   Found placeholders (showing first 5):"
    echo "$PLACEHOLDERS" | while read -r line; do
        echo "     $line"
    done
    # Warning only, not a hard failure
fi
echo ""

# CHECK 5: PREHANDOVER_PROOF structure
echo "CHECK 5: PREHANDOVER_PROOF structure"

# Required sections in PREHANDOVER_PROOF
PREHANDOVER_REQUIRED=(
    "Agent"
    "Date"
    "validation"
    "Attestation"
)

MISSING_PREHANDOVER=()
for section in "${PREHANDOVER_REQUIRED[@]}"; do
    if ! grep -qi "$section" "$PREHANDOVER_FILE"; then
        MISSING_PREHANDOVER+=("$section")
    fi
done

if [ ${#MISSING_PREHANDOVER[@]} -eq 0 ]; then
    echo "✅ PREHANDOVER_PROOF structure: COMPLETE"
else
    echo "❌ PREHANDOVER_PROOF structure: INCOMPLETE"
    echo "   Missing sections:"
    for section in "${MISSING_PREHANDOVER[@]}"; do
        echo "     - $section"
    done
    add_error "PREHANDOVER_PROOF is missing required sections"
fi
echo ""

# CHECK 6: Scope comparison validation
echo "CHECK 6: Scope comparison (git diff vs documented)"

# Get actual changed files from git
if git rev-parse --git-dir > /dev/null 2>&1; then
    # Determine base branch
    BASE_BRANCH="${GITHUB_BASE_REF:-main}"
    
    # Try to fetch base branch if in CI
    if [ -n "$GITHUB_BASE_REF" ]; then
        git fetch origin "$BASE_BRANCH" --depth=1 2>/dev/null || true
    fi
    
    # Get list of changed files
    if git rev-parse origin/"$BASE_BRANCH" > /dev/null 2>&1; then
        GIT_CHANGED_FILES=$(git diff --name-only origin/"$BASE_BRANCH"...HEAD | sort)
        GIT_FILE_COUNT=$(echo "$GIT_CHANGED_FILES" | grep -c . || echo "0")
    else
        # Fallback: compare with HEAD~1
        GIT_CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD | sort)
        GIT_FILE_COUNT=$(echo "$GIT_CHANGED_FILES" | grep -c . || echo "0")
    fi
    
    echo "   Git changed files: $GIT_FILE_COUNT"
    
    # Extract documented files from SCOPE_DECLARATION
    # This is approximate - looks for lines with file paths
    DOCUMENTED_FILES=$(grep -oE '`[^`]+\.(md|yml|yaml|sh|py|js|ts|json|txt)`' SCOPE_DECLARATION.md | tr -d '`' | sort | uniq)
    DOC_FILE_COUNT=$(echo "$DOCUMENTED_FILES" | grep -c . || echo "0")
    
    echo "   Documented files: $DOC_FILE_COUNT"
    
    # Check if counts are similar (within 20% tolerance for extraction accuracy)
    if [ "$GIT_FILE_COUNT" -gt 0 ]; then
        DIFF=$((GIT_FILE_COUNT - DOC_FILE_COUNT))
        DIFF=${DIFF#-}  # absolute value
        TOLERANCE=$((GIT_FILE_COUNT / 5))  # 20% tolerance
        
        if [ "$DIFF" -le "$TOLERANCE" ]; then
            echo "✅ Scope comparison: REASONABLE MATCH"
            echo "   (Exact validation requires human review of SCOPE_DECLARATION)"
        else
            echo "⚠️  Scope comparison: SIGNIFICANT DISCREPANCY"
            echo "   Git shows $GIT_FILE_COUNT files, documented shows $DOC_FILE_COUNT"
            echo "   Human reviewer should verify scope completeness"
            # Warning only, not a hard failure
        fi
    else
        echo "⚠️  Scope comparison: SKIPPED (unable to determine git diff)"
    fi
else
    echo "⚠️  Scope comparison: SKIPPED (not in git repository)"
fi
echo ""

# CHECK 7: Attestation signatures present
echo "CHECK 7: Attestation signatures"

ATTESTATIONS_FOUND=0

if grep -qi "I attest" SCOPE_DECLARATION.md; then
    echo "✅ SCOPE_DECLARATION.md: Attestation statement found"
    ATTESTATIONS_FOUND=$((ATTESTATIONS_FOUND + 1))
else
    echo "❌ SCOPE_DECLARATION.md: Missing attestation statement"
    add_error "SCOPE_DECLARATION.md must include 'I attest' statement"
fi

if grep -qi "Signed" SCOPE_DECLARATION.md; then
    echo "✅ SCOPE_DECLARATION.md: Signature found"
    ATTESTATIONS_FOUND=$((ATTESTATIONS_FOUND + 1))
else
    echo "❌ SCOPE_DECLARATION.md: Missing signature"
    add_error "SCOPE_DECLARATION.md must include agent signature"
fi

if [ "$ATTESTATIONS_FOUND" -eq 2 ]; then
    echo "✅ Attestations: COMPLETE"
else
    echo "❌ Attestations: INCOMPLETE ($ATTESTATIONS_FOUND/2)"
fi
echo ""

# CHECK 8: Validation method justification
echo "CHECK 8: Validation method justification"

if grep -qi "Why Evidence-Based Validation is Appropriate" SCOPE_DECLARATION.md; then
    # Check if justification section has meaningful content (more than just the heading)
    JUSTIFICATION_LINES=$(sed -n '/Why Evidence-Based Validation is Appropriate/,/##/p' SCOPE_DECLARATION.md | grep -v "^#" | grep -v "^$" | wc -l)
    
    if [ "$JUSTIFICATION_LINES" -gt 2 ]; then
        echo "✅ Justification: PRESENT AND SUBSTANTIVE"
    else
        echo "⚠️  Justification: PRESENT BUT MAY BE TOO BRIEF"
        echo "   Provide detailed explanation for using evidence-based validation"
    fi
else
    echo "❌ Justification: MISSING"
    add_error "Must justify why evidence-based validation is appropriate"
fi
echo ""

# FINAL RESULT
echo "=========================================="
echo "Validation Summary"
echo "=========================================="

if [ "$VALIDATION_PASSED" = true ]; then
    echo "✅ Evidence-Based Validation: PASSED"
    echo ""
    echo "All required documents are present and complete."
    echo "Human reviewer should verify:"
    echo "  - Scope accuracy and completeness"
    echo "  - Validation evidence quality in PREHANDOVER_PROOF"
    echo "  - Appropriateness of evidence-based validation method"
    echo ""
    exit 0
else
    echo "❌ Evidence-Based Validation: FAILED"
    echo ""
    echo "Errors found:"
    for error in "${ERRORS[@]}"; do
        echo "  ❌ $error"
    done
    echo ""
    echo "Fix all errors and retry validation."
    echo ""
    echo "Resources:"
    echo "  - Policy: governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md"
    echo "  - SCOPE_DECLARATION template: governance/templates/SCOPE_DECLARATION_TEMPLATE.md"
    echo "  - PREHANDOVER_PROOF template: governance/templates/PREHANDOVER_PROOF_TEMPLATE.md"
    echo ""
    exit 1
fi
