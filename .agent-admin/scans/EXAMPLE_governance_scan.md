# Governance Scan Example

**Repository**: APGI-cmy/R_Roster  
**Scan Date**: YYYY-MM-DD  
**Scan Type**: Pre-work governance compliance review  
**Performed By**: [Agent name/role]

---

## Canonical Governance Review

**Source**: APGI-cmy/maturion-foreman-governance

### Tier-0 Constitutional Documents
1. **BUILD_PHILOSOPHY.md** - Supreme authority
   - Architecture → QA → Build → Validation
   - Zero Test Debt Mandate
   - One-Time Build Law
   - Status: APPLICABLE

2. **AGENT_CONSTITUTION.md** - Agent doctrine
   - Agent boundaries and specialization
   - Non-stalling requirements
   - Escalation protocols
   - Status: APPLICABLE

3. **EXECUTION_BOOTSTRAP_PROTOCOL.md** - Pre-handover validation
   - PREHANDOVER_PROOF requirements
   - CI-Confirmatory-Not-Diagnostic
   - Status: APPLICABLE

4. **AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md** - Contract modification authority
   - Self-editing prohibition
   - Instruction system requirements
   - Status: APPLICABLE

### Relevant Policies
1. **ZERO_TEST_DEBT_CONSTITUTIONAL_RULE.md**
   - 100% test coverage requirement
   - No "add tests later" pattern
   - Status: APPLICABLE

2. **AUTOMATED_DEPRECATION_DETECTION_GATE.md**
   - Zero deprecation debt
   - Pre-commit enforcement
   - Exception process
   - Status: APPLICABLE

3. **TEST_REMOVAL_GOVERNANCE_GATE_LOCAL.md**
   - Test removal requires FM approval
   - Status: APPLICABLE (if modifying tests)

### Relevant Learnings
1. **BL-024** - Constitutional Sandbox Pattern
2. **BL-026** - Deprecation Detection Learning
3. **T0-009** - Agent-Scoped QA Boundaries

---

## Local Governance Review

**Source**: This repository (governance/ directory)

### Local Policies
1. `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md` - Active
2. `governance/policies/[Other local policies]` - [Status]

### Local Runbooks
1. `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md` - Active
2. `governance/runbooks/[Other runbooks]` - [Status]

### Local Agent Contracts
1. `.github/agents/governance-liaison.md` - Active
2. `.github/agents/ForemanApp-agent.md` - Active
3. `.github/agents/[other agents].md` - [Status]

---

## Constitutional Principles Assessment

### Applicable to This Task
- ✅ **Build Philosophy**: Architecture → QA → Build → Validation
- ✅ **Zero Test Debt**: No test gaps, 100% coverage
- ✅ **Agent Boundaries**: Respect specialization and scope limits
- ✅ **Non-Stalling**: Report blockers immediately with context
- ✅ **Ripple Discipline**: Complete all related file updates
- ✅ **CI-Confirmatory**: Local validation before handover

### Not Applicable to This Task
- ⚠️ **CST Validation**: [Document why if not applicable]
- ⚠️ **[Other principle]**: [Reason]

---

## Agent Contract Requirements

**Relevant Agent Contract**: [Agent name performing this work]

### Contract Obligations for This Task
1. [Obligation 1 from agent contract]
2. [Obligation 2 from agent contract]
3. [Obligation 3 from agent contract]

### Prohibited Actions
1. [Prohibition 1 from agent contract]
2. [Prohibition 2 from agent contract]

### Escalation Requirements
- Escalate to [Authority] if [Condition]
- Cannot waive: [Non-waivable requirements]

---

## Governance Gaps Identified

**Status**: [✅ NONE | ⚠️ GAPS FOUND]

### Gaps (if any)
1. [Gap description]
   - Impact: [High/Medium/Low]
   - Recommendation: [Action needed]
   - Escalation target: [Johan Ras / Governance Liaison]

2. [Additional gaps...]

---

## Scan Conclusion

**Governance Compliance Status**: [✅ COMPLIANT | ⚠️ REVIEW NEEDED | ❌ GAPS REQUIRE RESOLUTION]

**Applicable Requirements Count**: [X requirements identified]

**Action Items**:
1. [Action item 1]
2. [Action item 2]

**Ready to Proceed**: [✅ YES | ❌ NO - Gaps must be resolved]

---

**Scan Completed**: [ISO_8601_TIMESTAMP]  
**Scanned By**: [Agent name/role]  
**Next Scan Due**: [After next governance change]
