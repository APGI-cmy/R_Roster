# Builder Training and Attestation: Test Execution Protocol & BL-026

**Repository**: R_Roster  
**Training Date**: 2026-01-13  
**Authority**: Governance Liaison + FM  
**Status**: REQUIRED

---

## Training Scope

This document tracks synchronous training and attestation for ALL builder agents on:

1. **Agent Test Execution Protocol** (CI-Confirmatory-Not-Diagnostic)
2. **BL-026 (T0-015)**: Automated Deprecation Detection Constitutional Rule

**Constitutional Status**: Both protocols are Tier-0 constitutional requirements. Violations = catastrophic, requiring immediate work stoppage.

---

## Training Materials

### Required Reading

All builders MUST read and understand:

1. **Agent Test Execution Protocol**
   - Location: `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md`
   - Key Concept: CI is confirmatory, not diagnostic
   - Core Requirement: Local validation before PR submission
   - Evidence: PREHANDOVER_PROOF required for every PR

2. **BL-026: Automated Deprecation Detection**
   - Learning: `governance/learnings/BL-026-deprecation-detection.md`
   - Policy: `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md`
   - Onboarding: `governance/onboarding/DEPRECATION_GATE_ONBOARDING.md`
   - Key Concept: Zero deprecated API usage (constitutional)
   - Core Requirement: Pre-commit and CI gate enforcement

3. **PREHANDOVER_PROOF Template**
   - Location: `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`
   - Key Sections: Test Execution Validation, Deprecation Detection
   - Requirement: Must include actual command outputs and exit codes

### Training Session Content

**Session Duration**: 45-60 minutes  
**Format**: Synchronous (all builders + FM + Governance)

**Agenda**:

1. **Introduction** (5 min)
   - Why these protocols matter
   - Constitutional status and consequences
   - Connection to build-to-green philosophy

2. **Agent Test Execution Protocol** (20 min)
   - Core principle: CI is confirmatory, not diagnostic
   - Anti-pattern: Relying on CI to discover failures
   - Correct pattern: Local validation with evidence
   - PREHANDOVER_PROOF requirements
   - Exception process (rare, requires Johan Ras approval)
   - Consequences of violation

3. **BL-026: Automated Deprecation Detection** (15 min)
   - Why deprecation matters (security, stability, future-proofing)
   - Pre-commit hook enforcement
   - CI gate enforcement
   - Exception process (documented, approved, whitelisted)
   - Quarterly review requirements
   - How to handle violations (fix or request exception)

4. **Practical Examples** (10 min)
   - Walk through example PREHANDOVER_PROOF
   - Demonstrate local test execution
   - Show deprecation detection in action
   - Q&A on edge cases

5. **Attestation Process** (5 min)
   - Review attestation requirements
   - Sign-off process
   - Recording in this document

6. **Q&A and Clarification** (5-10 min)

---

## Attestation Requirements

Each builder must attest to understanding and commitment to:

### Test Execution Protocol Attestation

I, [BUILDER_NAME], hereby attest that I:

- [ ] Have read and understand `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md`
- [ ] Understand that CI is confirmatory, not diagnostic
- [ ] Will execute ALL tests locally before every commit
- [ ] Will generate PREHANDOVER_PROOF with full evidence before every PR
- [ ] Will NOT submit PRs that rely on CI to discover failures
- [ ] Understand that violations result in work stoppage and contract review
- [ ] Know the exception process requires Johan Ras approval
- [ ] Will maintain this discipline for all work in this repository

**Signature**: [NAME]  
**Date**: [YYYY-MM-DD]  
**Builder ID**: [builder-id]

### BL-026 Deprecation Detection Attestation

I, [BUILDER_NAME], hereby attest that I:

- [ ] Have read and understand `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md`
- [ ] Have read and understand `governance/learnings/BL-026-deprecation-detection.md`
- [ ] Understand BL-026 is a Tier-0 constitutional rule (non-waivable)
- [ ] Will install and use pre-commit hooks for all work
- [ ] Will ensure zero deprecated API usage in all code
- [ ] Will NOT bypass or disable deprecation checks
- [ ] Know the exception process requires FM/Johan Ras approval with whitelist entry
- [ ] Understand that violations = catastrophic, requiring immediate remediation
- [ ] Will proactively update deprecated APIs during refactoring

**Signature**: [NAME]  
**Date**: [YYYY-MM-DD]  
**Builder ID**: [builder-id]

---

## Builder Attestation Status

### API Builder (api-builder)

**Test Execution Protocol**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**BL-026 Deprecation Detection**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**Status**: [PENDING | COMPLETE | BLOCKED]  
**Notes**: _____________

---

### Integration Builder (integration-builder)

**Test Execution Protocol**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**BL-026 Deprecation Detection**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**Status**: [PENDING | COMPLETE | BLOCKED]  
**Notes**: _____________

---

### QA Builder (qa-builder)

**Test Execution Protocol**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**BL-026 Deprecation Detection**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**Status**: [PENDING | COMPLETE | BLOCKED]  
**Notes**: _____________

---

### Schema Builder (schema-builder)

**Test Execution Protocol**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**BL-026 Deprecation Detection**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**Status**: [PENDING | COMPLETE | BLOCKED]  
**Notes**: _____________

---

### UI Builder (ui-builder)

**Test Execution Protocol**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**BL-026 Deprecation Detection**:
- [ ] Training completed
- [ ] Attestation signed
- [ ] Date: _____________
- [ ] Signature: _____________

**Status**: [PENDING | COMPLETE | BLOCKED]  
**Notes**: _____________

---

## Foreman Agent Awareness

**ForemanApp Agent**:
- [ ] Protocol awareness training completed
- [ ] Enforcement responsibility acknowledged
- [ ] Date: _____________
- [ ] Signature: _____________

**FM Responsibilities**:
- Monitor PREHANDOVER_PROOF compliance in PRs
- Block PRs without proper evidence
- Enforce protocol violations
- Escalate pattern violations to Johan Ras

---

## Training Completion Criteria

**Training is COMPLETE when**:

- [ ] All builders have attended synchronous training session
- [ ] All builders have signed both attestations
- [ ] Foreman has acknowledged enforcement responsibilities
- [ ] This document is fully filled out and committed
- [ ] First 5 PRs demonstrate 100% protocol compliance

**Training is BLOCKED if**:

- ❌ Any builder unable to attest (requires remediation)
- ❌ Fundamental misunderstanding of constitutional requirements
- ❌ Resistance to protocol requirements

**Escalation**: Blocked training requires escalation to Johan Ras.

---

## Post-Training Enforcement

### First 5 PRs: Validation Period

The first 5 PRs after training completion will be subject to enhanced scrutiny:

1. **PREHANDOVER_PROOF Completeness**: Verify all sections filled
2. **Test Evidence Quality**: Check actual outputs, exit codes
3. **Deprecation Compliance**: Verify zero violations
4. **Local Validation**: Confirm tests were run locally before PR
5. **FM Review**: Detailed review by Foreman before merge

**Success Criterion**: 5/5 PRs demonstrate full protocol compliance

**Failure Response**: Additional training, pattern analysis, potential contract review

### Ongoing Monitoring

After validation period:

- **Random Audits**: Periodic PREHANDOVER_PROOF quality checks
- **Violation Tracking**: Log all protocol violations by builder
- **Quarterly Review**: Analyze compliance trends
- **Continuous Improvement**: Update training based on patterns

---

## Exception Handling

### Builder Unable to Attest

If a builder cannot attest due to genuine concerns:

1. **Document Concern**: What specific requirement is unclear/concerning?
2. **Clarification Session**: 1-on-1 with Governance Liaison
3. **Resolution**: Address misunderstanding or escalate to Johan Ras
4. **Re-attempt**: Builder retries attestation after clarification

**Do NOT**: Pressure builders to attest without understanding.

### Builder Refuses to Attest

If a builder refuses after clarification:

1. **Document Refusal**: Capture reason and context
2. **Escalate Immediately**: To Johan Ras with full details
3. **Block Work Assignment**: Builder cannot receive tasks until resolved
4. **Contract Review**: May result in contract termination

**Rationale**: Constitutional requirements are non-negotiable.

---

## Training Artifacts

### Supporting Materials

Create and maintain:

1. **Slide Deck**: Training presentation (if applicable)
2. **Example PRs**: Links to exemplary PREHANDOVER_PROOF
3. **Common Questions**: FAQ based on training Q&A
4. **Quick Reference**: One-page checklist for builders

Location: `governance/onboarding/training-materials/`

### Recording and Evidence

- [ ] Training session recorded (if remote)
- [ ] Attendance log completed
- [ ] Attestations collected and filed
- [ ] Training completion reported to FM and Johan Ras

---

## Continuous Improvement

After training completion, evaluate:

1. **What worked well in training delivery?**
2. **What was confusing or required additional clarification?**
3. **What training materials should be added/improved?**
4. **Are there patterns suggesting governance gaps?**

**Document improvements in**: `governance/learnings/` (create new BL if warranted)

---

## Escalation

### Training Issues

- **Technical Questions**: Governance Liaison
- **Protocol Clarification**: Governance Liaison or Foreman
- **Constitutional Matters**: Johan Ras
- **Refusal/Non-Compliance**: Johan Ras

### Post-Training Issues

- **Protocol Violations**: Foreman (enforcement) → Johan Ras (pattern)
- **PREHANDOVER_PROOF Quality**: Foreman review and feedback
- **Exception Requests**: Johan Ras

---

## Success Metrics

**Training Success**:
- 100% builder attestation completion
- Zero clarification escalations
- First 5 PRs demonstrate 100% compliance
- Zero protocol violations in first month

**Operational Success**:
- 100% PREHANDOVER_PROOF compliance in all PRs
- 100% first-time CI success rate
- Zero deprecation violations
- Zero test-related PR rework cycles

---

**Training Coordinator**: Governance Liaison  
**Training Authority**: FM + Governance Administrator  
**Training Date**: 2026-01-13  
**Next Review**: 2026-04-13 (quarterly)

---

## Notes

[Space for training coordinator to add notes, observations, or follow-up items]
