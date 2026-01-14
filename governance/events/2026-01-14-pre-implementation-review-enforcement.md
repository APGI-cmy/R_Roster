# FM Visibility Event: Pre-Implementation Behavior Review Protocol Enforcement

**Date**: 2026-01-14  
**Event Type**: Governance Layer-Down (Canonical → R_Roster)  
**Severity**: HIGH (Constitutional Requirement)  
**Authority**: maturion-foreman-governance PR #952  
**Status**: ACTIVE - Enforcement begins immediately with grace period

---

## Summary

The Pre-Implementation Behavior Review Protocol has been **canonized** in maturion-foreman-governance (PR #952) and is now being enforced in R_Roster. This protocol requires all enhancement and optimization PRs to complete a **4-step pre-implementation review** before code implementation begins.

**Key Change**: Builders must now complete pre-implementation behavior review for all enhancement PRs.

---

## What Changed

### For Builders

**NEW REQUIREMENT**: Enhancement/optimization PRs MUST include:
1. Pre-implementation behavior review report
2. All 4 review steps complete:
   - Step 1: Baseline Behavior Capture (with evidence)
   - Step 2: Design Alternatives Analysis (minimum 2 alternatives)
   - Step 3: Risk Assessment Matrix (with mitigations)
   - Step 4: Success Criteria Definition (measurable)

**File Location**: Include `pre_implementation_review_[description].md` in PR

**When Required**:
- ✅ New features, optimizations, behavior changes, significant refactoring
- ❌ Bug fixes, governance-only changes, documentation-only, infrastructure

**Builder Checklist Updated**: `governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md` (v2.1.0)

### For ForemanApp

**NEW RESPONSIBILITY**: FM must verify pre-implementation review compliance:

1. **Classification**: Determine if PR is enhancement (requires review) vs bug fix/governance
2. **Verification**: If enhancement, verify review report present and complete
3. **Rejection**: Reject enhancement PRs missing review (unless exemption granted)
4. **Exemption Authority**: FM may grant rare exemptions with documented justification

**FM Checklist Updated**: `governance/templates/pr-checklists/FM_ORCHESTRATION_PR_CHECKLIST.md` (v2.1.0)

### For All Agents

**CI Automation**: New workflow `.github/workflows/pre-implementation-review-gate.yml` automatically:
- Classifies PRs (enhancement vs bug fix vs governance)
- Checks for review report presence
- Validates report completeness (all 4 steps)
- Provides clear feedback with references

---

## Implementation Details

### Documents Created

1. **Enforcement Policy**: `governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md`
   - Defines when protocol applies
   - Documents exemption process
   - Establishes enforcement mechanisms

2. **Onboarding Guide**: `governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md`
   - Comprehensive training for builders
   - Step-by-step review process
   - Examples, templates, FAQ

3. **Updated Checklists**:
   - BUILDER_PR_CHECKLIST.md v2.0.0 → v2.1.0
   - FM_ORCHESTRATION_PR_CHECKLIST.md v2.0.0 → v2.1.0

4. **CI Workflow**: `.github/workflows/pre-implementation-review-gate.yml`

5. **README Updated**: Developer guide section added

### Grace Period (Educational Phase)

**Duration**: 2026-01-14 through 2026-02-14 (30 days)

**During Grace Period**:
- Protocol enforcement **begins immediately**
- Educational approach: FM provides feedback, not hard rejection
- Builders allowed to iterate on review quality
- Incomplete reviews trigger coaching, not PR rejection
- CI workflow issues **warnings** (not failures)

**After Grace Period** (2026-02-15+):
- **Full enforcement**: Missing/incomplete reviews = PR rejection
- No tolerance for skipped reviews without exemption
- CI workflow **fails** PRs missing reviews
- Repeat non-compliance escalated to Governance Liaison

---

## FM Action Items

### Immediate (This Week)

1. **Read Onboarding Guide**: `governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md`
2. **Review Enforcement Policy**: `governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md`
3. **Understand Classification Criteria**: Enhancement vs bug fix vs governance
4. **Familiarize with Review Template**: [Canonical Template](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md)

### Ongoing

1. **Classify PRs**: Determine if enhancement (requires review) or not
2. **Verify Reviews**: For enhancement PRs, check review report present and complete
3. **Exercise Rejection**: Reject enhancement PRs missing review during grace period with coaching
4. **Grant Exemptions Sparingly**: Only for emergency hotfixes, trivial changes, or Johan approval
5. **Escalate Classification Disputes**: To Governance Liaison for binding decision

### Builder Coordination

1. **Communicate Change**: Inform builders of new requirement at wave kickoff
2. **Provide Training**: Direct builders to onboarding guide
3. **Answer Questions**: Help builders understand when review required
4. **Review Examples**: During grace period, provide feedback on review quality

---

## Classification Guide for FM

### Enhancement (REQUIRES REVIEW)

Characteristics:
- Adds new functionality not previously present
- Improves existing behavior (performance, UX, efficiency)
- Changes how features work (even if "internal")
- Modifies algorithms or core logic

**Examples**:
- "Add teacher availability filter"
- "Optimize roster generation algorithm"
- "Improve absence tracking workflow"
- "Refactor scheduler for better performance"

**PR Keywords**: "add", "new feature", "enhance", "improve", "optimize", "refactor behavior"

### Bug Fix (NO REVIEW NEEDED)

Characteristics:
- Restores intended behavior that was broken
- Fixes errors, crashes, or incorrect outputs
- No new functionality added

**Examples**:
- "Fix off-by-one error in date calculation"
- "Correct teacher name display issue"
- "Fix crash when loading empty roster"

**PR Keywords**: "fix bug", "bugfix", "hotfix", "fix error", "correct issue"

### Governance/Docs (NO REVIEW NEEDED)

Characteristics:
- Updates governance policies, documentation, README
- No application code changes
- Infrastructure/tooling without behavior impact

**Examples**:
- "Update README with setup instructions"
- "Add governance policy document"
- "Update CI workflow configuration"

**PR Keywords**: "governance", "policy", "documentation", "docs:", "readme"

### Uncertain Classification

**If uncertain**:
1. **STOP** - Do not accept or reject PR yet
2. **DISCUSS** with builder - gather context
3. **ESCALATE** to Governance Liaison if still unclear
4. **DEFAULT**: If enhancement-like, require review

---

## Exemption Process

### When Exemptions Are Appropriate (RARE)

1. **Emergency Hotfixes**: Time-critical fixes with zero regression risk
2. **Trivial Enhancements**: Extremely simple changes (FM judgment, must document)
3. **Governance-Authorized**: Explicit approval from Johan

### How to Grant Exemption

1. **Builder Requests**: Builder explains why review not needed
2. **FM Evaluates**: Assess merit against governance requirements
3. **FM Documents**: Post exemption rationale in PR comments
4. **Apply Label**: Add `pre-impl-review-exempt` label to PR
5. **Governance May Challenge**: Governance Liaison can challenge exemption if constitutional violation

**Template for FM Exemption**:
```markdown
## Pre-Implementation Review Exemption GRANTED

**Reason**: [Emergency hotfix / Trivial change / Other]

**Justification**: [Explain why safe to skip review]

**Risk Assessment**: [Why zero/minimal regression risk]

**Approved By**: ForemanApp
**Date**: [YYYY-MM-DD]
```

**Default**: NO exemption without explicit FM approval documented in PR.

---

## Escalation Paths

### Classification Disputes

**Scenario**: Builder disagrees with FM's enhancement classification

**Process**:
1. Builder and FM discuss context and characteristics
2. If no agreement: FM escalates to Governance Liaison
3. Governance Liaison provides **binding classification**
4. Review requirement follows classification decision

### Exemption Challenges

**Scenario**: Governance Liaison believes FM exemption is improper

**Process**:
1. Governance Liaison documents constitutional concern
2. FM and Governance Liaison discuss
3. If no resolution: Escalate to Johan Ras (final authority)
4. Johan's decision is binding

### Pattern Non-Compliance

**Scenario**: Builder repeatedly submits enhancement PRs without review

**Process**:
1. FM documents pattern (dates, PRs, rejection history)
2. FM escalates to Governance Liaison
3. Governance Liaison investigates
4. Governance Liaison escalates to Johan if intentional evasion suspected
5. Constitutional violation consequences determined by Johan

---

## Adjustment Considerations

### For FM

**New Time Requirement**: Verifying pre-implementation reviews adds 10-20 minutes per enhancement PR
- Classification: 2-5 minutes
- Review verification: 5-10 minutes
- Feedback/coaching (grace period): 5-10 minutes

**Delegation**: FM may request CodexAdvisor assistance for technical review quality assessment

### For Builders

**New Time Requirement**: Creating pre-implementation review adds 4-8 hours per enhancement
- Step 1 (Baseline): 1-2 hours
- Step 2 (Alternatives): 2-3 hours
- Step 3 (Risk Assessment): 1-2 hours
- Step 4 (Success Criteria): 1-2 hours

**Wave Planning Impact**: Account for review time in enhancement estimates

### Grace Period Flexibility

During grace period (through 2026-02-14):
- FM provides **coaching** not rejection for incomplete reviews
- Builders allowed to iterate on review quality
- Focus on learning the process
- Build muscle memory for post-grace-period enforcement

---

## Success Metrics (Monitored by Governance Liaison)

**Compliance Rate**: % enhancement PRs with complete review reports
- **Target**: 100% (after grace period)

**Rejection Rate**: % enhancement PRs rejected for missing/incomplete review
- **Target**: <5% (indicates adequate builder understanding)

**Exemption Rate**: % enhancement PRs granted exemptions
- **Target**: <2% (exemptions should be rare)

**Dispute Rate**: % classification disputes escalated
- **Target**: <10% (most classifications should be clear)

---

## Constitutional Authority

**Source**: maturion-foreman-governance PR #952 - Pre-Implementation Behavior Review Protocol canonization

**Governance Tier**: Tier-0 equivalent enforcement (constitutional requirement for builder profile compliance)

**Non-Waivable**: FM cannot waive pre-implementation review for enhancements (exemptions ≠ waivers)

**Escalation**: Constitutional questions → Governance Liaison → Johan Ras

---

## Questions & Support

### For Builders

**Classification questions**: Ask ForemanApp or Governance Liaison  
**Technical questions**: Ask CodexAdvisor  
**Onboarding help**: Read `governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md`

### For ForemanApp

**Classification disputes**: Escalate to Governance Liaison  
**Exemption challenges**: Discuss with Governance Liaison  
**Constitutional questions**: Escalate to Governance Liaison or Johan  
**Review quality assessment**: Request CodexAdvisor assistance

### For Governance Liaison

**Non-compliance patterns**: Report to Johan  
**Constitutional conflicts**: Escalate to Johan  
**Canonical updates**: Monitor maturion-foreman-governance for protocol changes

---

## Acknowledgment

**ForemanApp**: Please acknowledge receipt of this visibility event by:
1. Confirming you've read the onboarding guide and enforcement policy
2. Confirming you understand new classification and verification responsibilities
3. Noting any questions or concerns

**Governance Liaison**: Standing by for FM questions, classification disputes, or exemption challenges.

---

**Event Status**: ACTIVE  
**Next Review**: 2026-02-14 (end of grace period)  
**Maintained By**: Governance Liaison  
**Questions**: Escalate per paths above
