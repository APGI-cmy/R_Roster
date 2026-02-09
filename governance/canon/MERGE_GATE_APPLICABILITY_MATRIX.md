# MERGE GATE APPLICABILITY MATRIX

## Status
**Type**: Tier-0 Constitutional Canon  
**Authority**: Supreme - Constitutional  
**Version**: 1.0.0  
**Effective Date**: 2026-02-09  
**Owner**: Maturion Engineering Leadership (Johan Ras)  
**Layer-Down Status**: PUBLIC_API  
**Applies To**: All Agents, All Repositories  

---

## 1. Purpose

This document provides a **comprehensive matrix** mapping which merge gates apply to which agent classes in the Living Agent System (LAS v5.0.0). It eliminates ambiguity by providing an authoritative reference for gate applicability.

**Core Function**: Define exactly which gates each agent class must validate before merge authorization.

---

## 2. Constitutional Authority

This matrix implements:
- **AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md** - Class-specific gate requirements
- **MERGE_GATE_PHILOSOPHY.md** - Gate enforcement philosophy
- **AGENT_SELF_GOVERNANCE_PROTOCOL.md** - Self-governance requirements
- **CS2_AGENT_FILE_AUTHORITY_MODEL.md** - Authority boundaries

---

## 3. Agent Class Definitions

### 3.1 Agent Classes

| Class | Role | Authority Level | Example Agents |
|-------|------|-----------------|----------------|
| **Overseer** | Constitutional oversight, cross-repo coordination | Supreme | CodexAdvisor, watchdog agents |
| **Liaison** | Governance propagation, self-alignment | High | governance-liaison |
| **Foreman** | Build orchestration, wave planning | Medium | ForemanApp (FM) |
| **Builder** | Application code implementation | Low | api-builder, ui-builder, qa-builder |

---

## 4. Gate Categories

### 4.1 Gate Category Taxonomy

| Category | Purpose | Examples |
|----------|---------|----------|
| **Constitutional** | Protect constitutional integrity | CS2 approval, protected files, authority boundaries |
| **Governance** | Ensure governance compliance | Self-governance check, contract alignment, ripple propagation |
| **Quality** | Validate code quality | Tests pass, lint clean, coverage thresholds |
| **Technical** | Verify technical correctness | Build success, dependency safety, architecture compliance |
| **Coordination** | Ensure team alignment | Wave plan complete, QA catalog ready, builder sync |

---

## 5. Applicability Matrix

### 5.1 Universal Gates (All Agent Classes)

| Gate ID | Gate Name | Applies To | Description | Authority |
|---------|-----------|------------|-------------|-----------|
| **UG-001** | Self-Governance Check | ALL | Load own contract, verify governance bindings | AGENT_SELF_GOVERNANCE_PROTOCOL.md |
| **UG-002** | Session Memory Capture | ALL | Document session, capture learnings | MANDATORY_ENHANCEMENT_CAPTURE_STANDARD.md |
| **UG-003** | Working Contract Validation | ALL | Verify working contract alignment | AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md |
| **UG-004** | Evidence Collection | ALL | Gather evidence of validation | EVIDENCE_BASED_CI_GATE_VALIDATION.md |

### 5.2 Overseer-Specific Gates

| Gate ID | Gate Name | Required | Description | Authority |
|---------|-----------|----------|-------------|-----------|
| **OS-001** | Constitutional Compliance | ✅ MANDATORY | No constitutional violations | CS2_AGENT_FILE_AUTHORITY_MODEL.md |
| **OS-002** | Cross-Repository Integrity | ✅ MANDATORY | No downstream breaks | CROSS_REPOSITORY_LAYER_DOWN_PROTOCOL.md |
| **OS-003** | Quality Gate Enforcement | ✅ MANDATORY | All quality gates pass | MERGE_GATE_PHILOSOPHY.md |
| **OS-004** | Governance Alignment | ✅ MANDATORY | Self-governance complete | AGENT_SELF_GOVERNANCE_PROTOCOL.md |
| **OS-005** | Escalation Resolution | ✅ MANDATORY | All escalations handled | AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md |
| **OS-006** | Protected File Authorization | ✅ MANDATORY | CS2 approval if protected files modified | CS2_AGENT_FILE_AUTHORITY_MODEL.md |
| **OS-007** | Multi-Repository Ripple | ✅ MANDATORY | Ripple awareness communicated | GOVERNANCE_RIPPLE_MODEL.md |

### 5.3 Liaison-Specific Gates

| Gate ID | Gate Name | Required | Description | Authority |
|---------|-----------|----------|-------------|-----------|
| **LI-001** | Layer-Down Completeness | ✅ MANDATORY | All canonical files layered | CROSS_REPOSITORY_LAYER_DOWN_PROTOCOL.md |
| **LI-002** | Governance Inventory Update | ✅ MANDATORY | GOVERNANCE_ARTIFACT_INVENTORY.md current | GOVERNANCE_ARTIFACT_INVENTORY.md |
| **LI-003** | Ripple Propagation Log | ✅ MANDATORY | Changes logged in ripple log | GOVERNANCE_RIPPLE_CHECKLIST_PROTOCOL.md |
| **LI-004** | File Version Validation | ✅ MANDATORY | Version numbers incremented correctly | GOVERNANCE_VERSIONING_AND_SYNC_PROTOCOL.md |
| **LI-005** | Cross-Repo Sync Check | ✅ MANDATORY | Canonical source matches | GOVERNANCE_RIPPLE_MODEL.md |
| **LI-006** | Self-Alignment Boundary | ✅ MANDATORY | No authority overreach | SELF_ALIGNMENT_AUTHORITY_MODEL.md |
| **LI-007** | Constitutional Conflict Check | ✅ MANDATORY | No governance conflicts | AGENT_SELF_GOVERNANCE_PROTOCOL.md |

### 5.4 Foreman-Specific Gates

| Gate ID | Gate Name | Required | Description | Authority |
|---------|-----------|----------|-------------|-----------|
| **FM-001** | Wave Plan Completeness | ✅ MANDATORY | Wave plan 100% complete | FOREMAN_WAVE_PLANNING_AND_ISSUE_ARTIFACT_GENERATION_PROTOCOL.md |
| **FM-002** | QA Catalog Quality | ✅ MANDATORY | QA catalog meets standards | FM_ROLE_CANON.md |
| **FM-003** | Builder Contract Alignment | ✅ MANDATORY | All builder contracts aligned | AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md |
| **FM-004** | Merge Gate Readiness | ✅ MANDATORY | All gate prerequisites met | FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md |
| **FM-005** | Architecture Freeze | ✅ MANDATORY | Architecture 100% complete | FM_ROLE_CANON.md |
| **FM-006** | QA-to-Red Compilation | ✅ MANDATORY | All QAs compiled to red tests | BUILD_PHILOSOPHY.md |
| **FM-007** | Builder Coordination | ✅ MANDATORY | All builders synchronized | FM_ROLE_CANON.md |
| **FM-008** | Governance Contract Check | ✅ MANDATORY | FM contract binding validated | AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md |
| **FM-009** | Constitutional Boundary | ⚠️ ESCALATE | Escalate if protected files touched | CS2_AGENT_FILE_AUTHORITY_MODEL.md |

### 5.5 Builder-Specific Gates

| Gate ID | Gate Name | Required | Description | Authority |
|---------|-----------|----------|-------------|-----------|
| **BL-001** | All Tests Pass | ✅ MANDATORY | 100% test pass rate | BUILD_PHILOSOPHY.md |
| **BL-002** | Lint Clean | ✅ MANDATORY | Zero lint errors/warnings | BUILD_PHILOSOPHY.md |
| **BL-003** | Build Success | ✅ MANDATORY | Clean build with no errors | BUILD_PHILOSOPHY.md |
| **BL-004** | Test Coverage Threshold | ✅ MANDATORY | Meet or exceed coverage targets | BUILD_PHILOSOPHY.md |
| **BL-005** | Dependency Safety | ✅ MANDATORY | No vulnerable dependencies | AUTOMATED_DEPRECATION_DETECTION_GATE.md |
| **BL-006** | Architecture Compliance | ✅ MANDATORY | Follows frozen architecture | FM_ROLE_CANON.md |
| **BL-007** | QA-to-Green Execution | ✅ MANDATORY | All red tests turned green | BUILD_PHILOSOPHY.md |
| **BL-008** | Scope-to-Diff Alignment | ✅ MANDATORY | Changes match authorized scope | AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md |
| **BL-009** | One-Time Build Law | ✅ MANDATORY | Changes built once, frozen | BUILD_PHILOSOPHY.md |
| **BL-010** | Gate Failure Escalation | ⚠️ ESCALATE | STOP and report to FM on failure | AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md |

---

## 6. Gate Applicability Decision Tree

### 6.1 Decision Logic

```
START
  ↓
Is agent performing work?
  ↓ YES
Universal Gates (UG-001 to UG-004) ALWAYS APPLY
  ↓
What is the agent class?
  ↓
  ├─→ Overseer? → Apply OS-001 to OS-007
  ├─→ Liaison?  → Apply LI-001 to LI-007
  ├─→ Foreman?  → Apply FM-001 to FM-009
  └─→ Builder?  → Apply BL-001 to BL-010
  ↓
Are any escalation conditions met?
  ↓ YES
HALT and escalate to CS2
  ↓ NO
Are all required gates PASSED?
  ↓ YES
AUTHORIZE MERGE
  ↓ NO
BLOCK MERGE - Fix gate failures first
```

---

## 7. Gate Pass/Fail Criteria

### 7.1 Pass Criteria

A gate **PASSES** when:
- ✅ All validation steps complete successfully
- ✅ Evidence of compliance is collected and verified
- ✅ No exceptions or warnings raised
- ✅ All automated checks (CI, lint, tests) succeed
- ✅ Documentation/logs confirm validation

### 7.2 Fail Criteria

A gate **FAILS** when:
- ❌ Any validation step fails
- ❌ Evidence is missing or insufficient
- ❌ Exceptions or errors are raised
- ❌ Automated checks (CI, lint, tests) fail
- ❌ Authority boundaries are exceeded without CS2 approval

### 7.3 Escalation Criteria

A gate **REQUIRES ESCALATION** when:
- ⚠️ Protected files are modified (CS2 approval needed)
- ⚠️ Authority boundaries unclear or conflicted
- ⚠️ Constitutional issues detected
- ⚠️ Cross-repository impacts significant
- ⚠️ Governance conflicts arise
- ⚠️ Builder cannot resolve gate failure independently

---

## 8. Self-Alignment Authority Boundaries

### 8.1 Self-Alignment Permitted

Agents may **self-align** (fix without escalation) when:
- ✅ Work is within their authority scope
- ✅ No protected files modified
- ✅ No constitutional issues involved
- ✅ Standard gate validation procedures apply
- ✅ Evidence can be collected independently

### 8.2 Escalation Required

Agents **must escalate** when:
- ⚠️ Work exceeds their authority scope
- ⚠️ Protected files need modification
- ⚠️ Constitutional interpretation needed
- ⚠️ Cross-repository impacts detected
- ⚠️ Governance conflicts arise
- ⚠️ Gate failure cannot be resolved independently

---

## 9. Cross-Class Gate Interactions

### 9.1 FM-Builder Interaction

**Scenario**: Builder encounters gate failure

**Protocol**:
1. Builder STOPS work immediately
2. Builder reports gate failure to FM
3. Builder WAITS for FM correction/guidance
4. FM investigates and provides fix OR escalates to CS2
5. Builder resumes only after FM authorization

**Rationale**: Gate failures are FM coordination gaps, not Builder defects.

### 9.2 Liaison-FM Interaction

**Scenario**: Governance layer-down triggers builder contract updates

**Protocol**:
1. Liaison completes layer-down of governance files
2. Liaison validates impact on FM contract
3. Liaison updates GOVERNANCE_ARTIFACT_INVENTORY.md
4. Liaison notifies FM of governance changes
5. FM validates builder contracts align with new governance
6. FM updates builders if needed

**Rationale**: Governance ripple must propagate through FM to builders.

### 9.3 Overseer-All Interaction

**Scenario**: Overseer detects constitutional violation

**Protocol**:
1. Overseer HALTS all related work
2. Overseer escalates to CS2 with evidence
3. CS2 makes constitutional ruling
4. Overseer enforces ruling across all agents
5. All agents align with ruling before proceeding

**Rationale**: Constitutional issues override all other work until resolved.

---

## 10. Gate Validation Evidence Requirements

### 10.1 Evidence Standards

All gate validation must produce **verifiable evidence**:

| Evidence Type | Format | Storage | Retention |
|---------------|--------|---------|-----------|
| Test Results | CI logs, test reports | CI system, git commit | Permanent |
| Lint Results | Lint output, error logs | CI system, git commit | Permanent |
| Build Logs | Build output, artifacts | CI system, git commit | Permanent |
| Governance Validation | Ripple logs, inventory updates | Git commit | Permanent |
| Self-Governance Check | Session logs, contract load proof | Session memory | Per session |

### 10.2 Evidence Collection Protocol

1. **Execute Validation**: Run all applicable gates
2. **Capture Output**: Collect all logs, reports, results
3. **Verify Evidence**: Confirm evidence is complete and valid
4. **Store Evidence**: Commit evidence to git or session memory
5. **Reference Evidence**: Link evidence in PR description or commit message

---

## 11. Governance Alignment

This matrix aligns with:
- ✅ **AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md** - Implements gate protocols per class
- ✅ **MERGE_GATE_PHILOSOPHY.md** - Applies gate philosophy
- ✅ **AGENT_SELF_GOVERNANCE_PROTOCOL.md** - Enforces self-governance
- ✅ **CS2_AGENT_FILE_AUTHORITY_MODEL.md** - Respects authority boundaries
- ✅ **BUILD_PHILOSOPHY.md** - Aligns with build quality standards
- ✅ **GOVERNANCE_RIPPLE_MODEL.md** - Supports governance propagation

---

## Appendices

### Appendix A: Quick Reference by Agent Class

#### Overseer Gates
`UG-001, UG-002, UG-003, UG-004, OS-001, OS-002, OS-003, OS-004, OS-005, OS-006, OS-007`

#### Liaison Gates
`UG-001, UG-002, UG-003, UG-004, LI-001, LI-002, LI-003, LI-004, LI-005, LI-006, LI-007`

#### Foreman Gates
`UG-001, UG-002, UG-003, UG-004, FM-001, FM-002, FM-003, FM-004, FM-005, FM-006, FM-007, FM-008, FM-009`

#### Builder Gates
`UG-001, UG-002, UG-003, UG-004, BL-001, BL-002, BL-003, BL-004, BL-005, BL-006, BL-007, BL-008, BL-009, BL-010`

### Appendix B: Version History

| Version | Date | Changes | Authority |
|---------|------|---------|-----------|
| 1.0.0 | 2026-02-09 | Initial layer-down to R_Roster | Governance Canon |

---

**END OF DOCUMENT**
