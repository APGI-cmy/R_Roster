# Scope Declaration for PR (Test Evidence-Based Validation)

**Agent**: governance-liaison  
**Date**: 2026-01-19T16:05:00Z  
**PR Title**: [LAYER DOWN] Update CI gates to accept evidence-based agent validation (BL-027/028)  
**Validation Method**: Evidence-Based (BL-027/028)

---

## Purpose

This document provides explicit scope declaration and attestation for evidence-based CI gate validation. It documents all files changed, justifies the use of evidence-based validation, and provides agent attestation that validation is complete.

**Authority**: governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md

---

## Changed Files

### Governance Files

- `governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md` - New policy implementing BL-027/028 evidence-based validation pattern for CI gates
- `governance/onboarding/EVIDENCE_BASED_VALIDATION_ONBOARDING.md` - Onboarding guide for agents using evidence-based validation

### Agent Contracts

*No agent contract files changed*

### Workflows

- `.github/workflows/deprecation-gate.yml` - Added dual-path validation supporting evidence-based method
- `.github/workflows/pre-implementation-review-gate.yml` - Added dual-path validation supporting evidence-based method
- `.github/workflows/yaml-validation.yml` - Added dual-path validation supporting evidence-based method

### Scripts

- `.github/scripts/validate-evidence-based-gate.sh` - New validation script for evidence-based gate validation
- `.github/scripts/determine-validation-path.sh` - New helper script to determine validation path
- `governance-gate-local-validation.sh` - Updated to support evidence-based validation path

### Documentation

- `README.md` - Added documentation about evidence-based validation methods (BL-027/028)

### Templates

- `governance/templates/SCOPE_DECLARATION_TEMPLATE.md` - New template for scope declaration in evidence-based PRs

---

## Scope Summary

**Total Files Changed**: 10  
**Governance Files**: 2  
**Agent Contracts**: 0  
**Workflows**: 3  
**Scripts**: 3  
**Documentation**: 1  
**Templates**: 1  
**Other**: 0

**All Files Documented**: Yes ✓  
**Scope Complete**: Yes ✓

---

## Validation Method Justification

**Why Evidence-Based Validation is Appropriate**:

This PR implements the BL-027/028 evidence-based validation pattern itself, which is a governance and infrastructure change. Evidence-based validation is appropriate because:

1. **Governance Policy Creation**: The new policy document (EVIDENCE_BASED_CI_GATE_VALIDATION.md) contains governance rules and cannot be validated by automated scripts. The policy defines validation criteria but is not itself executable code.

2. **Workflow Configuration Changes**: While the workflow YAML files are executable by CI, the changes made are governance configuration changes (adding evidence-based validation path) rather than application logic. The validation of these changes requires understanding constitutional requirements and governance patterns, which cannot be automated.

3. **Template and Documentation**: The new template (SCOPE_DECLARATION_TEMPLATE.md) and onboarding guide are text documents that define structure and process. They have no executable validation.

4. **Infrastructure Pattern Implementation**: This PR implements a meta-pattern (evidence-based validation) that will be used by future PRs. Testing this PR via evidence-based validation demonstrates the pattern works and provides a reference implementation.

5. **Constitutional Governance Alignment**: The changes implement constitutional requirements from maturion-foreman-governance#981 (BL-027/028). Validation requires manual verification against canonical governance source, which cannot be scripted.

**What Cannot Be Script-Validated**:

- Constitutional alignment with BL-027/028 pattern from governance canon
- Completeness of governance policy documentation
- Appropriateness of template structure and content
- Accuracy of onboarding guidance for agents
- Workflow configuration adherence to governance principles
- Cross-repository pattern consistency with maturion-foreman-governance

**What Evidence Replaces Scripts**:

This SCOPE_DECLARATION and associated PREHANDOVER_PROOF provide:
- Manual verification of all workflow changes against BL-027/028 requirements
- Governance scan confirming constitutional compliance
- Cross-reference validation with maturion-foreman-governance#981
- Template structure verification
- Documentation completeness review
- Local execution testing of validation scripts
- Ripple analysis confirming all required files updated

---

## Scope Comparison

### Git Diff Files

```
.github/scripts/determine-validation-path.sh
.github/scripts/validate-evidence-based-gate.sh
.github/workflows/deprecation-gate.yml
.github/workflows/pre-implementation-review-gate.yml
.github/workflows/yaml-validation.yml
README.md
governance-gate-local-validation.sh
governance/onboarding/EVIDENCE_BASED_VALIDATION_ONBOARDING.md
governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md
governance/templates/SCOPE_DECLARATION_TEMPLATE.md
```

### Documented Files

```
.github/scripts/determine-validation-path.sh
.github/scripts/validate-evidence-based-gate.sh
.github/workflows/deprecation-gate.yml
.github/workflows/pre-implementation-review-gate.yml
.github/workflows/yaml-validation.yml
README.md
governance-gate-local-validation.sh
governance/onboarding/EVIDENCE_BASED_VALIDATION_ONBOARDING.md
governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md
governance/templates/SCOPE_DECLARATION_TEMPLATE.md
```

### Comparison Result

**Files in Git Diff**: 10  
**Files in Documentation**: 10  
**Match**: Yes ✓

**Discrepancies**: None

---

## Validation Evidence Reference

**PREHANDOVER_PROOF File**: `PREHANDOVER_PROOF_2026-01-19T16:05:00Z.md`

**Validation Steps Documented in PREHANDOVER_PROOF**:
1. Manual review of all governance policy and onboarding documentation
2. Cross-reference validation with maturion-foreman-governance#981 (BL-027/028)
3. Workflow YAML syntax validation
4. Local execution testing of validation scripts
5. Constitutional compliance verification
6. Template completeness and structure review
7. Documentation accuracy verification
8. Ripple analysis confirming all required files updated

**All Validation Steps Complete**: Yes ✓

---

## Scope Attestation

### Completeness Attestation

I attest that:
- [✓] All files changed in this PR are documented in the "Changed Files" section above
- [✓] The scope is complete and no files were omitted from documentation
- [✓] No files were changed outside of the documented scope
- [✓] The git diff comparison confirms scope accuracy
- [✓] All changes serve the stated purpose of this PR

### Validation Method Attestation

I attest that:
- [✓] Evidence-based validation is appropriate for this work (see justification)
- [✓] Traditional script validation would be insufficient or impossible for this work
- [✓] Complete validation evidence is provided in PREHANDOVER_PROOF
- [✓] All validation steps have been performed and documented
- [✓] All validation results are PASS/GREEN

### Quality Attestation

I attest that:
- [✓] All changes follow governance policy and constitutional requirements
- [✓] All changes are aligned with canonical governance source (maturion-foreman-governance#981)
- [✓] All documentation is accurate and complete
- [✓] All ripple effects have been identified and addressed
- [✓] This PR is ready for merge subject to human review

---

## Agent Signature

**Agent Identity**: governance-liaison  
**Contract File**: `.github/agents/governance-liaison.md`  
**Date**: 2026-01-19T16:05:00Z

**Signature Statement**:

I, governance-liaison, attest that all information in this SCOPE_DECLARATION.md is accurate and complete. I have performed all validation steps documented in PREHANDOVER_PROOF and confirmed that this PR meets all governance requirements. I authorize handover of this PR to human reviewers for final approval.

**Signed**: governance-liaison  
**Timestamp**: 2026-01-19T16:05:00Z

---

## Reviewer Checklist

*For human reviewers of evidence-based PRs*

- [ ] SCOPE_DECLARATION.md is present and complete
- [ ] PREHANDOVER_PROOF is present with attestation section
- [ ] All changed files are documented in scope declaration
- [ ] Git diff matches documented scope (no discrepancies)
- [ ] Justification for evidence-based validation is valid
- [ ] Agent attestations are present and properly signed
- [ ] All validation evidence is provided in PREHANDOVER_PROOF
- [ ] Changes align with PR title and description
- [ ] No concerns about scope or validation quality

**Reviewer**: [reviewer-name]  
**Date**: [date]  
**Approval**: Approved ✓ / Changes Requested ✗
