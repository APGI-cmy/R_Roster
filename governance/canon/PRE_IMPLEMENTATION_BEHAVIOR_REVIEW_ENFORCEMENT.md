# Pre-Implementation Behavior Review Protocol Enforcement

**Version**: 1.0.0  
**Date**: 2026-01-14  
**Status**: MANDATORY  
**Authority**: maturion-foreman-governance PR #952  
**Repository**: R_Roster

---

## Purpose

This document establishes enforcement of the Pre-Implementation Behavior Review Protocol for all enhancement and optimization work in the R_Roster repository, ensuring compliance with canonical governance requirements.

---

## Canonical Authority

**Source Protocol**: [PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md)

**Report Template**: [PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md)

**Profile Authority**: [builder.v1.md](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/profiles/builder.v1.md)

---

## Enforcement Scope

### When Protocol Applies (MANDATORY)

The Pre-Implementation Behavior Review Protocol **MUST** be completed for:

1. **Enhancement PRs**: Any PR that adds new features, capabilities, or functionality
2. **Optimization PRs**: Any PR that modifies existing behavior for performance, efficiency, or user experience improvements
3. **Significant Refactoring**: Any PR that changes internal behavior patterns, even if external behavior remains unchanged
4. **Algorithm Changes**: Any PR that modifies core logic or computational approaches

### When Protocol Does NOT Apply (Exemptions)

The protocol is **NOT required** for:

1. **Bug Fixes**: PRs that restore intended behavior without adding enhancements
2. **Governance-Only Changes**: PRs that modify only governance documentation, policies, or agent contracts
3. **Infrastructure/Tooling**: PRs that affect build/CI infrastructure without changing application behavior
4. **Documentation-Only**: PRs that update documentation, comments, or README files without code changes

### Classification Uncertainty

**If uncertain whether protocol applies**: 
- **STOP** and **ESCALATE** to ForemanApp or Governance Liaison
- **DO NOT proceed** without classification confirmation
- Default position: If enhancement-like, protocol applies

---

## The 4-Step Review Process

All enhancement PRs **MUST** complete these four steps **BEFORE** implementation begins:

### Step 1: Baseline Behavior Capture
- Document current system behavior comprehensively
- Record performance metrics, user interactions, edge cases
- Establish measurable baseline for comparison
- Capture evidence: logs, metrics, screenshots, test outputs

### Step 2: Design Alternatives Analysis
- Identify and document at least 2-3 alternative approaches
- Evaluate trade-offs: complexity, performance, maintainability, risk
- Document why alternatives were rejected
- Show consideration of edge cases and failure modes

### Step 3: Risk Assessment Matrix
- Identify potential risks: regression, performance degradation, edge case failures
- Assess probability and impact for each risk
- Document mitigation strategies for high-probability/high-impact risks
- Plan rollback strategy if enhancement fails

### Step 4: Success Criteria Definition
- Define clear, measurable success criteria
- Specify acceptance tests that will validate enhancement
- Define performance thresholds (if applicable)
- Document how success will be measured post-implementation

---

## Required Artifact

### Pre-Implementation Behavior Review Report

**Template**: Use canonical template from maturion-foreman-governance  
**Location**: Must be included in PR (suggested: `docs/pre-implementation-reviews/` or root)  
**Naming**: `pre_implementation_review_[pr_number]_[brief_description].md`

**Required Sections**:
1. Enhancement Context & Motivation
2. Step 1: Baseline Behavior Capture (with evidence)
3. Step 2: Design Alternatives Analysis (minimum 2 alternatives)
4. Step 3: Risk Assessment Matrix (with mitigations)
5. Step 4: Success Criteria Definition (measurable)
6. Review Approval & Sign-off

---

## Enforcement Mechanisms

### PR Checklist Requirement

Builder PR Checklist (BUILDER_PR_CHECKLIST.md) includes:
- [ ] Pre-Implementation Behavior Review completed (if enhancement/optimization)
- [ ] Review report included in PR
- [ ] All 4 steps documented with evidence
- [ ] Success criteria defined and testable

### FM Verification Responsibility

ForemanApp (FM) **MUST**:
1. Verify enhancement/optimization classification is correct
2. Confirm Pre-Implementation Behavior Review report is present
3. Validate all 4 steps are complete with adequate detail
4. Reject PRs missing review or with incomplete steps
5. Escalate classification disputes to Governance Liaison

### CI Gate Integration

Automated workflow validates:
- Enhancement/optimization PRs contain review report
- Report file follows naming convention
- Report includes all required sections
- No merge without review (unless exemption granted)

---

## Exemption Process

### When Exemption May Be Granted

Exemptions are **RARE** and only for:
1. Emergency hotfixes with time-critical deployment needs
2. Trivial enhancements with zero regression risk (FM judgment)
3. Explicit governance-authorized exemptions (Johan approval)

### Exemption Request Process

1. Builder **CANNOT self-exempt** - must request from FM
2. FM evaluates exemption merit against governance requirements
3. FM documents exemption rationale in PR
4. Governance Liaison may challenge exemption if constitutional violation
5. Johan Ras provides final authority for disputed exemptions

**Default**: No exemption without explicit FM approval documented in PR.

---

## Non-Compliance Handling

### Missing Review Report

**Status**: ❌ **PR BLOCKED**

**FM Action**:
1. Reject PR with clear explanation
2. Require builder to complete review before resubmission
3. Do not accept "will do later" or "too late to add"
4. No merge authorization until review present

### Incomplete Review (Partial Steps)

**Status**: 🔄 **CHANGES REQUESTED**

**FM Action**:
1. Identify which steps are incomplete or inadequate
2. Request builder to complete missing sections
3. Verify completeness before acceptance
4. May reject if multiple incomplete attempts

### Classification Dispute

**Status**: ⚠️ **ESCALATION REQUIRED**

**Process**:
1. Builder and FM discuss classification
2. If no agreement: Escalate to Governance Liaison
3. Governance Liaison provides binding classification
4. Review requirement follows classification decision

---

## Training & Awareness

### Builder Onboarding

All builders **MUST**:
1. Read canonical protocol documentation (maturion-foreman-governance)
2. Review onboarding guide (governance/onboarding/)
3. Understand 4-step review process thoroughly
4. Know how to use report template
5. Attest understanding before enhancement assignments

### FM Training

ForemanApp **MUST**:
1. Understand protocol purpose and constitutional authority
2. Know classification criteria for enhancement vs bug fix
3. Be able to evaluate review completeness
4. Exercise rejection authority for non-compliance
5. Escalate appropriately when uncertain

### Governance Liaison Role

Governance Liaison:
1. Monitors enforcement consistency
2. Reviews disputes and provides classification rulings
3. Reports patterns of non-compliance to Johan
4. Proposes governance improvements based on learnings
5. Validates constitutional compliance

---

## Success Metrics

**Compliance Rate**: % of enhancement PRs with complete review reports  
**Target**: 100% (after grace period ending 2026-02-14)

**Rejection Rate**: % of enhancement PRs rejected for missing/incomplete review  
**Target**: <5% (indicates adequate builder understanding)

**Exemption Rate**: % of enhancement PRs granted exemptions  
**Target**: <2% (exemptions should be rare)

**Dispute Rate**: % of classification disputes escalated  
**Target**: <10% (most classifications should be clear)

---

## Grace Period (Onboarding Phase)

**Duration**: 2026-01-14 through 2026-02-14 (30 days)

**During Grace Period**:
- Protocol enforcement begins immediately
- Educational approach: FM provides feedback rather than hard rejection
- Builders allowed to iterate on review quality
- Incomplete reviews trigger coaching, not rejection
- Track compliance patterns for training needs assessment

**Post-Grace Period** (2026-02-15 onward):
- Full enforcement: Missing/incomplete reviews = PR rejection
- No tolerance for skipped reviews without exemption
- Repeat non-compliance escalated to Governance Liaison
- Constitutional violation if pattern of evasion detected

---

## References

**Canonical Documents**:
- maturion-foreman-governance: governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md
- maturion-foreman-governance: governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md
- maturion-foreman-governance: governance/profiles/builder.v1.md

**Local Documents**:
- governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md
- governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md
- governance/templates/pr-checklists/FM_ORCHESTRATION_PR_CHECKLIST.md
- .github/workflows/pre-implementation-review-gate.yml

**Escalation**:
- Classification disputes: Governance Liaison
- Exemption requests: ForemanApp
- Constitutional questions: Johan Ras

---

## Version History

- **v1.0.0** (2026-01-14): Initial enforcement document for R_Roster repository

---

**Document Authority**: Governance Liaison  
**Maintained By**: Governance Liaison  
**Review Frequency**: Quarterly (or as canonical protocol updates)
