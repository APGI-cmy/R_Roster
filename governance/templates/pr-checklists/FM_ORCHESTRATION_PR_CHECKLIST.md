# FM Orchestration PR Release Checklist

**Version**: 2.0.0  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL (maturion-foreman-governance PR #924)  
**Status**: MANDATORY for all FM orchestration PRs  
**Last Updated**: 2026-01-11

---

## Category 0: Execution Bootstrap Protocol (MANDATORY) ⚠️

**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+  
**Enforcement**: CONSTITUTIONAL - Cannot be waived

**Before ANY handover, FM MUST complete ALL of the following:**

### 7-Step Verification Protocol

- [ ] **Step 1: Local Gate Execution**
  - [ ] Governance gate executed locally: `bash governance-gate-local-validation.sh`
  - [ ] Exit code: 0 (success) captured and documented
  - [ ] All orchestration validations executed
  - [ ] All gate checks: ✅ PASSED

- [ ] **Step 2: Deliverables Verification**
  - [ ] ALL wave/task deliverables completed
  - [ ] Deliverables checklist created and marked complete
  - [ ] No incomplete or placeholder work
  - [ ] All wave goals achieved

- [ ] **Step 3: Ripple Validation**
  - [ ] Ripple scope identified across all affected systems
  - [ ] All builder PRs integrated
  - [ ] All governance updates propagated
  - [ ] Ripple status: ✅ COMPLETE

- [ ] **Step 4: Constitutional Compliance Check**
  - [ ] Zero Test Debt verified across all builder work
  - [ ] BUILD_PHILOSOPHY.md compliance verified
  - [ ] FM contract requirements met
  - [ ] Governance alignment maintained

- [ ] **Step 5: Zero Test Debt Verification**
  - [ ] All integrated tests passing: ✅ GREEN
  - [ ] No test debt from any builder
  - [ ] Integration coverage requirements met
  - [ ] Test results captured with exit codes

- [ ] **Step 6: Execution Evidence Capture**
  - [ ] Orchestration command history documented
  - [ ] All builder PREHANDOVER_PROOF verified
  - [ ] Integration validation results captured
  - [ ] Evidence sections complete in PREHANDOVER_PROOF

- [ ] **Step 7: Handover Authorization Determination**
  - [ ] All previous steps: ✅ GREEN
  - [ ] No blocking issues present
  - [ ] PREHANDOVER_PROOF marked: ✅ **AUTHORIZED**
  - [ ] PREHANDOVER_PROOF committed with orchestration PR

### PREHANDOVER_PROOF Requirements

- [ ] **PREHANDOVER_PROOF file created** using template: `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`
- [ ] **Filename format correct**: `PREHANDOVER_PROOF_YYYY-MM-DDTHH:MM:SSZ.md`
- [ ] **ALL placeholders replaced** with actual values
- [ ] **Gate validation results documented** with actual output
- [ ] **Exit codes captured** for all validation commands
- [ ] **Deliverables checklist complete** mapping to wave/task requirements
- [ ] **Builder verification documented** (all builders provided PREHANDOVER_PROOF)
- [ ] **Handover status explicit**: ✅ AUTHORIZED or ❌ BLOCKED
- [ ] **File committed with orchestration PR**

### Hard Rules (Cannot Violate)

- [ ] **CI is confirmatory, NOT diagnostic** - All validation done locally first
- [ ] **No handover without evidence** - PREHANDOVER_PROOF is mandatory
- [ ] **No accepting builder work without PREHANDOVER_PROOF** - Reject incomplete handovers
- [ ] **No incomplete orchestration ripple** - All integration points validated

**🚫 BLOCKING**: If ANY Category 0 item unchecked, orchestration PR cannot proceed

---

## Category 4: FM-Specific Requirements (Foreman)

**Authority**: ForemanApp-agent.md, FM_EXECUTION_MANDATE.md  
**Enforcement**: MANDATORY per FM role

### Builder Coordination & Verification

- [ ] **All builder PRs accepted**
  - [ ] Each builder provided PREHANDOVER_PROOF
  - [ ] Each builder's PREHANDOVER_PROOF verified (AUTHORIZED status)
  - [ ] All builder work integrated successfully
  - [ ] No rejected or pending builder PRs

- [ ] **Builder handover verification**
  - [ ] Verified: Each builder executed local validation
  - [ ] Verified: Each builder captured gate results
  - [ ] Verified: Each builder provided execution evidence
  - [ ] Verified: No builders relied on CI-as-diagnostic

- [ ] **Integration validation**
  - [ ] All builder work integrated
  - [ ] Integration tests executed locally
  - [ ] Integration tests: ✅ ALL GREEN
  - [ ] No integration conflicts

### Orchestration Quality

- [ ] **Wave/task planning complete**
  - [ ] Wave plan documented
  - [ ] Builder assignments appropriate
  - [ ] Dependencies properly sequenced
  - [ ] No coordination gaps

- [ ] **Governance enforcement**
  - [ ] Zero Test Debt maintained across all work
  - [ ] Constitutional requirements enforced
  - [ ] Design freeze respected
  - [ ] No governance violations tolerated

- [ ] **Documentation & tracking**
  - [ ] Wave documentation complete
  - [ ] Builder coordination documented
  - [ ] Issue/task tracking up to date
  - [ ] Governance learnings captured (if applicable)

### FM Authority Exercised Appropriately

- [ ] **Rejection authority used properly**
  - [ ] Rejected any PRs missing PREHANDOVER_PROOF
  - [ ] Rejected any PRs with incomplete validation
  - [ ] Rejection reasons documented
  - [ ] Builders given clear guidance

- [ ] **Escalation when needed**
  - [ ] Escalated governance questions to Governance Liaison
  - [ ] Escalated constitutional matters to Johan
  - [ ] Escalated complex technical issues to CodexAdvisor
  - [ ] No silent blockers

---

## Category 1: Orchestration Metadata

- [ ] **Wave/task issue linked** in PR description
- [ ] **PR title descriptive** and follows FM conventions
- [ ] **PR description complete**:
  - [ ] Wave goals and outcomes
  - [ ] Builder coordination summary
  - [ ] Integration validation results
  - [ ] Link to FM PREHANDOVER_PROOF
  - [ ] Links to all builder PREHANDOVER_PROOF files
- [ ] **Labels applied** (if required by repo conventions)

---

## Category 2: Governance Compliance

- [ ] **BUILD_PHILOSOPHY.md adherence**
  - [ ] One-Time Build Correctness maintained
  - [ ] Build-to-Green achieved
  - [ ] Zero Regression verified
  - [ ] No debt introduced

- [ ] **Agent boundaries respected**
  - [ ] FM stayed within orchestration role
  - [ ] Did not execute platform actions (unless CS2 proxy)
  - [ ] Builders stayed within their domains
  - [ ] No boundary violations

- [ ] **Governance updates propagated** (if applicable)
  - [ ] Governance changes communicated to builders
  - [ ] FM visibility events created (if needed)
  - [ ] Agent contracts updated (if governance changed)
  - [ ] Ripple complete for governance changes

---

## Category 3: Integration & System Validation

- [ ] **System-level validation**
  - [ ] All subsystems integrated
  - [ ] End-to-end tests executed (if applicable)
  - [ ] System validation: ✅ PASSED
  - [ ] No system-level regressions

- [ ] **Dependency validation**
  - [ ] All dependencies between builder work resolved
  - [ ] No circular dependencies
  - [ ] Dependency order correct
  - [ ] All prerequisites met

- [ ] **Quality gates**
  - [ ] Governance gate: ✅ PASSED
  - [ ] Build gate: ✅ PASSED
  - [ ] Test gate: ✅ PASSED
  - [ ] All custom gates: ✅ PASSED

---

## Category 5: Pre-Handover Final Checks

- [ ] **Self-review completed**
  - [ ] Orchestration plan reviewed
  - [ ] All builder work verified
  - [ ] Integration validated
  - [ ] No outstanding TODOs

- [ ] **CI will confirm (not diagnose)**
  - [ ] Local validation matches CI requirements
  - [ ] PREHANDOVER_PROOF demonstrates green checks
  - [ ] Confident CI will confirm success

- [ ] **Ready for deployment** (if applicable)
  - [ ] Orchestration targets correct branch
  - [ ] No conflicts with base branch
  - [ ] Deployment readiness verified

---

## Handover Statement

**FM Certification**:

I certify that:
- ✅ All Category 0 (Execution Bootstrap Protocol) requirements met
- ✅ All Category 4 (FM-Specific) requirements met
- ✅ ALL builders provided valid PREHANDOVER_PROOF
- ✅ PREHANDOVER_PROOF demonstrates orchestration validation success
- ✅ This orchestration PR is ready for final review and merge
- ✅ No known blocking issues remain

**FM PREHANDOVER_PROOF Location**: `[filename]`  
**Builder PREHANDOVER_PROOF Verified**: [X builders, all AUTHORIZED]  
**Handover Status**: ✅ **AUTHORIZED**

---

## Governance Liaison Review Checklist (For Governance Use)

**Governance Liaison verifies** (if governance-related):
- [ ] FM PREHANDOVER_PROOF file present
- [ ] All Category 0 items checked
- [ ] All Category 4 items checked
- [ ] Governance ripple complete (if applicable)
- [ ] FM visibility provided (if applicable)
- [ ] Constitutional compliance verified

**Governance Decision**:
- [ ] ✅ **APPROVE** - All governance requirements met
- [ ] 🔄 **REQUEST CHANGES** - Governance gaps identified
- [ ] ❌ **BLOCK** - Constitutional violations present

---

## Builder Verification Matrix

**FM must verify each builder's PREHANDOVER_PROOF:**

| Builder | PR# | PREHANDOVER_PROOF | Status | Notes |
|---------|-----|-------------------|--------|-------|
| [Builder 1] | [PR#] | [filename] | [✅/❌] | [notes] |
| [Builder 2] | [PR#] | [filename] | [✅/❌] | [notes] |
| [Builder 3] | [PR#] | [filename] | [✅/❌] | [notes] |

**Summary**: [X/X builders AUTHORIZED and verified]

---

## Integration Validation Evidence

**Commands Executed**:
```bash
# Example: Integration test suite
npm run test:integration
# Exit code: 0

# Example: System validation
npm run validate:system
# Exit code: 0

# Example: Governance gate
bash governance-gate-local-validation.sh
# Exit code: 0
```

**Results**: ✅ ALL PASSED

---

## Escalation

**If blocked or uncertain**:

1. **Review** governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md
2. **Review** ForemanApp-agent.md for FM authority boundaries
3. **Consult** CodexAdvisor for technical guidance
4. **Escalate** to Governance Liaison for governance questions
5. **Escalate** to Johan Ras for constitutional matters

**Do NOT proceed with handover if blocked** - Fix issues or escalate.

---

## References

**Governance Documents**:
- governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md
- governance/templates/PREHANDOVER_PROOF_TEMPLATE.md
- BUILD_PHILOSOPHY.md
- .github/agents/ForemanApp-agent.md
- governance/contracts/FM_EXECUTION_MANDATE.md
- governance/contracts/FM_OPERATIONAL_GUIDANCE.md

**Related Checklists**:
- governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md (for builders)

**Version History**:
- v2.0.0 (2026-01-11): Added Category 0 (Execution Bootstrap Protocol), Category 4 (FM-Specific)
- v1.0.0: Initial FM orchestration checklist

---

**Template Authority**: EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+  
**Maintained By**: Governance Liaison  
**Questions**: Escalate per escalation path above
