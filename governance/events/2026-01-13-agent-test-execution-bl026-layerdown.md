# FM Visibility Event: Agent Test Execution Protocol & BL-026 Layer-Down

**Event ID**: VE-2026-01-13-001  
**Date**: 2026-01-13  
**Type**: Constitutional Layer-Down  
**Status**: Visibility Pending  
**Authority**: Governance Liaison + Johan Ras

---

## Summary

Two Tier-0 constitutional protocols have been layered down to the R_Roster repository:

1. **Agent Test Execution Protocol** (CI-Confirmatory-Not-Diagnostic)
2. **BL-026 (T0-015)**: Automated Deprecation Detection Constitutional Rule

These protocols are now binding for ALL builder agents and enforced by Foreman in this repository.

---

## What Changed

### 1. Agent Test Execution Protocol Added

**Location**: `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md`

**Core Requirement**: CI is confirmatory, not diagnostic. Builders MUST:
- Execute ALL tests locally before commit
- Run ALL gate validations before PR submission
- Generate PREHANDOVER_PROOF with full evidence
- Submit PRs ONLY when all checks are GREEN locally
- NEVER rely on CI to discover failures

**Evidence Requirement**: PREHANDOVER_PROOF must include:
- Test execution outputs with exit codes
- Linting outputs with exit codes
- Deprecation detection outputs
- All validation commands matching CI

**Enforcement**: FM blocks PRs without proper evidence. Violations tracked per builder with escalating consequences.

### 2. BL-026 Formalized in .agent File

**Status**: BL-026 deprecation gate was already operational (since 2026-01-11)

**New Binding**: `.agent` file now explicitly references:
- `governance/learnings/BL-026-deprecation-detection.md` (Tier-0)
- `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md` (Tier-0, mandatory)

**Impact**: Makes BL-026 constitutional status explicit in repository agent contract.

### 3. Builder Contracts Updated

**All 5 Builder Agents Updated**:
- api-builder.md
- integration-builder.md
- qa-builder.md
- schema-builder.md
- ui-builder.md

**New Section Added**: "Agent Test Execution Protocol (MANDATORY)"
- Pre-commit obligations
- Pre-PR obligations
- Test evidence requirements
- Exception process
- Training & attestation requirements
- Consequences of violation

### 4. ForemanApp Contract Updated

**New Enforcement Responsibility**:
- Verify PREHANDOVER_PROOF completeness
- Verify test execution evidence present
- Block PRs with missing evidence
- Track protocol violations per builder
- Enforce escalation process

### 5. PREHANDOVER_PROOF Template Enhanced

**New Section**: "Test Execution Validation (MANDATORY)"
- Test suite execution outputs
- Linting/code quality outputs
- Deprecation detection outputs
- All with exit codes and timestamps

### 6. Training Documentation Created

**Location**: `governance/onboarding/BUILDER_TRAINING_ATTESTATION_TEST_EXECUTION_BL026.md`

**Purpose**: Track builder training and attestation for both protocols

**Requirements**:
- All builders must complete training
- All builders must sign attestations
- Foreman must acknowledge enforcement responsibility
- Training completion tracked in document

---

## Why This Matters

### For Builders

**Before**: Unclear expectations about local validation vs CI reliance

**After**: 
- Crystal clear constitutional requirement: CI is confirmatory only
- Documented evidence requirements in PREHANDOVER_PROOF
- Training and attestation process ensures understanding
- Known consequences for violations

**Impact**: Reduces PR rework cycles, eliminates "fixup commit" noise, demonstrates professionalism

### For Foreman

**Before**: PREHANDOVER_PROOF existed but test execution evidence requirements were implicit

**After**:
- Explicit enforcement responsibility for test execution protocol
- Clear criteria for blocking PRs (missing evidence, CI failures)
- Violation tracking and escalation process defined
- Constitutional backing for enforcement actions

**Impact**: Stronger gate enforcement, clearer authority, reduced ambiguity

### For Governance

**Before**: BL-026 operational but not formally bound in .agent file

**After**:
- BL-026 explicitly constitutional in .agent file
- Test execution protocol documented and binding
- Cross-repo consistency with other FM repositories
- Clear escalation path for violations

**Impact**: Stronger constitutional foundation, explicit Tier-0 status, reduced governance gaps

---

## Impact on Current Work

### Immediate (Today - 2026-01-13)

1. **All Current PRs**: Must include enhanced PREHANDOVER_PROOF with test execution evidence
2. **All Builders**: Review new protocol documentation before next PR
3. **Foreman**: Begin enforcing test execution evidence requirements

### Short-Term (Next 2 Weeks)

1. **Builder Training**: Schedule and complete synchronous training session
2. **Attestations**: Collect signed attestations from all builders
3. **First 5 PRs**: Enhanced scrutiny for protocol compliance validation
4. **Pattern Monitoring**: Track compliance rates and violation patterns

### Ongoing

1. **Every PR**: PREHANDOVER_PROOF with full test execution evidence
2. **Every Builder**: Local validation before every PR submission
3. **Foreman**: Block PRs without evidence, track violations
4. **Quarterly**: Review protocol effectiveness and compliance metrics

---

## Adjustments Required

### For Builders

**Action Required**:
1. Read `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md` (15 min)
2. Review updated builder contract (5 min)
3. Study enhanced PREHANDOVER_PROOF template (10 min)
4. Practice: Generate one PREHANDOVER_PROOF with test evidence (30 min)
5. Attend training session when scheduled (45-60 min)
6. Sign attestations (5 min)

**Total Time**: ~2 hours per builder

### For Foreman

**Action Required**:
1. Review `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md` (15 min)
2. Review updated ForemanApp contract (5 min)
3. Understand enforcement responsibilities (10 min)
4. Attend training session (45-60 min)
5. Acknowledge enforcement responsibility (5 min)
6. Begin enforcing on next PR (ongoing)

**Total Time**: ~1.5 hours

### For Repository Operations

**No Breaking Changes**: 
- Existing workflows continue unchanged
- Deprecation gate already operational (no new CI changes)
- PREHANDOVER_PROOF already required (evidence requirements enhanced)
- No new dependencies or tooling required

**Enhancement Only**: More rigorous evidence requirements, clearer expectations

---

## Grace Period

**Grace Period**: 2 weeks (until 2026-01-27)

**During Grace Period**:
- Builders should review documentation and prepare
- Training session will be scheduled and completed
- Attestations will be collected
- Enforcement begins but with educational focus (not punitive)

**After Grace Period**:
- Full enforcement active
- Violations tracked per builder
- Escalation process in effect
- No exceptions without Johan Ras approval

---

## Enforcement Timeline

**Phase 1: Education (Weeks 1-2, 2026-01-13 to 2026-01-27)**
- Training completion
- Attestation collection
- First 5 PRs with enhanced scrutiny
- Feedback and clarification

**Phase 2: Validation (Weeks 3-4, 2026-01-27 to 2026-02-10)**
- Full enforcement begins
- First violations = warning + re-training
- Pattern analysis
- Protocol effectiveness assessment

**Phase 3: Steady State (After 2026-02-10)**
- 100% compliance expected
- Violations escalate per defined process
- Quarterly review of protocol effectiveness
- Continuous improvement

---

## Questions & Clarifications

### Q: What if I have no tests to run?

**A**: Document this in PREHANDOVER_PROOF. Show governance gate validation and any other applicable checks (linting, deprecation). If truly no validation possible, escalate to FM before PR submission.

### Q: What if local tests pass but CI fails?

**A**: This indicates environmental difference or incomplete local validation. STOP, investigate root cause, fix locally, re-run complete validation, update PREHANDOVER_PROOF. This pattern suggests protocol violation.

### Q: What about emergency situations?

**A**: Only production outages or security vulnerabilities qualify. Must escalate to Johan Ras for explicit override approval. Convenience/time pressure NOT valid justifications. Post-emergency return to full discipline immediately.

### Q: How detailed should test evidence be?

**A**: Include command executed, exit code, summary output showing 100% pass rate, timestamp. Full verbose output not required but must prove tests executed and passed. See template examples.

### Q: What if deprecation gate fails?

**A**: Fix deprecated usage OR request exception (FM approval, whitelist entry, quarterly review). Do NOT bypass. See `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md` for exception process.

---

## Escalation

### For Questions
- **Protocol Clarification**: Governance Liaison
- **Technical Blockers**: Foreman
- **Constitutional Matters**: Johan Ras

### For Issues
- **Training Problems**: Governance Liaison
- **Enforcement Disputes**: Johan Ras
- **Exception Requests**: Johan Ras

---

## Success Criteria

**Layer-Down COMPLETE When**:
- [x] Protocol documentation created
- [x] .agent file updated with bindings
- [x] All builder contracts updated
- [x] ForemanApp contract updated
- [x] PREHANDOVER_PROOF template enhanced
- [x] Training documentation created
- [x] Visibility event published (this document)
- [ ] Builder training session completed
- [ ] All attestations collected
- [ ] First 5 PRs demonstrate compliance
- [ ] Zero violations in validation period

**Operational SUCCESS When**:
- 100% PREHANDOVER_PROOF compliance
- 100% first-time CI success rate
- Zero deprecation violations
- Zero protocol violations
- Builder attestations 100% complete

---

## Related Documents

**Protocol Documentation**:
- `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md` (NEW)
- `governance/learnings/BL-026-deprecation-detection.md` (EXISTING)
- `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md` (EXISTING)

**Builder Contracts** (ALL UPDATED):
- `.github/agents/api-builder.md`
- `.github/agents/integration-builder.md`
- `.github/agents/qa-builder.md`
- `.github/agents/schema-builder.md`
- `.github/agents/ui-builder.md`
- `.github/agents/ForemanApp-agent.md`

**Supporting Documents**:
- `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md` (ENHANCED)
- `governance/onboarding/BUILDER_TRAINING_ATTESTATION_TEST_EXECUTION_BL026.md` (NEW)
- `.agent` (UPDATED)

---

**Published**: 2026-01-13  
**Authority**: Governance Liaison  
**Visibility Target**: ForemanApp, All Builders, Johan Ras  
**Next Review**: 2026-04-13 (quarterly)
