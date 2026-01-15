# Contract Modification Instruction: Governance Liaison Self-Referential Validation

**Date**: 2026-01-14  
**Authority**: AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md  
**Target Contract**: `.github/agents/governance-liaison.md`  
**Requestor**: Governance Liaison (cannot self-edit)  
**Assignee**: ForemanApp or Johan Ras  
**Priority**: HIGH  
**Reason**: Remediation for PR #612 catastrophic gate bypass

---

## Context

PR #612 created Pre-Implementation Behavior Review enforcement but the PR itself failed the gate it created (self-referential bypass). This occurred because governance-liaison contract has gaps:

1. No requirement to test NEW gates against current PR
2. No binding to Pre-Implementation Behavior Review Protocol
3. No explicit self-referential validation requirement

---

## Required Contract Updates

### Update 1: Add Pre-Implementation Behavior Review Protocol Binding

**Location**: Line 28 (Governance Bindings list)

**Current**:
```markdown
- **governance/canon/AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md** (contract-modification-authority) - CONSTITUTIONAL
```

**Add After**:
```markdown
- **governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md** (pre-implementation-review-enforcement) - CONSTITUTIONAL
```

**Rationale**: Governance Liaison must be explicitly bound to protocols being enforced.

---

### Update 2: Add Self-Referential Gate Validation Requirement

**Location**: After line 136 (end of "Mandatory PR-Gate Preflight" section)

**Add New Subsection**:
```markdown
### Self-Referential Gate Validation (Meta-Requirement)

**When creating NEW gates/workflows in a PR:**

1. **Execute new gate against current PR** BEFORE handover
2. **If PR would fail new gate**:  
   - Either: Complete requirements (add missing artifacts)
   - Or: Document exemption with FM approval
   - Or: ESCALATE if unable to comply
3. **No implicit bootstrap exemption**: Creating enforcement doesn't automatically exempt you from that enforcement

**Example**: If creating pre-implementation review gate, current PR must include pre-implementation review report (if PR is an enhancement).

**Rationale**: Prevents self-referential gate bypass where agent creates enforcement but doesn't follow it.

**Violation Severity**: CATASTROPHIC - undermines governance integrity
```

---

### Update 3: Clarify New Gate Local Execution

**Location**: After line 132 (within "Mandatory PR-Gate Preflight" section)

**Current**:
```markdown
Before handover: MUST perform **PR-Gate Preflight** using CI definitions (workflows, scripts, policies). Execute in agent environment.
```

**Add After**:
```markdown
**New Gates**: If PR creates new CI gates/workflows, MUST:
1. Extract gate logic to standalone executable script
2. Run script locally against current PR
3. Validate PR passes (or document exemption with FM approval)
4. Include gate validation results in PREHANDOVER_PROOF

**Prohibited**: Handing over with new gate without testing if current PR would pass it.
```

---

### Update 4: Add Governance Enhancement Classification

**Location**: After line 37 (end of "Scope" section)

**Add New Subsection**:
```markdown
### Governance Work Classification

**Governance Enhancements** (may require pre-implementation review):
- Creating NEW enforcement mechanisms (gates, workflows, policies)
- Adding NEW governance capabilities (protocols, processes, tools)
- Modifying existing governance in enhancement-like ways

**Governance Maintenance** (does NOT require pre-implementation review):
- Updating existing governance documentation for clarity
- Fixing governance bugs (incorrect references, broken links)
- Routine governance reporting and visibility events

**When Uncertain**: Escalate classification to ForemanApp or Johan
```

---

## Implementation Notes

**Assigned Agent Responsibilities**:
1. Review proposed updates for constitutional compliance
2. Make exact changes to `.github/agents/governance-liaison.md`
3. Validate changes don't conflict with existing contract text
4. Update contract version number (2.1.0 → 2.2.0)
5. Document update in contract version history section
6. Commit with message: "Add self-referential validation requirements (PR #612 remediation)"

**Governance Liaison Review**:
- After changes made, Governance Liaison reviews for constitutional compliance
- Governance Liaison does NOT approve (that's Johan's authority)
- Governance Liaison may raise concerns to Johan

**Johan Approval**: Required for constitutional changes

---

## Success Criteria

- [x] Contract modifications requested
- [ ] Assigned agent makes changes
- [ ] Governance Liaison reviews (no approval authority)
- [ ] Johan provides final approval
- [ ] Contract version updated to v2.2.0
- [ ] Future governance enhancements include self-referential validation

---

## Urgency

**Priority**: HIGH  
**Reason**: Prevents recurrence of catastrophic gate bypass  
**Timeline**: Complete within 1 week

---

**Instruction Status**: PENDING  
**Assignee**: ForemanApp or Johan Ras  
**Tracking**: PR #612 remediation
