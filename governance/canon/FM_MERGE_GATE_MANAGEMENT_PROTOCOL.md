# FM MERGE GATE MANAGEMENT PROTOCOL

## Status
**Type**: Tier-0 Constitutional Canon  
**Authority**: Supreme - Constitutional  
**Version**: 1.0.0  
**Effective Date**: 2026-02-09  
**Owner**: Maturion Engineering Leadership (Johan Ras)  
**Layer-Down Status**: PUBLIC_API  
**Applies To**: Foreman (FM) Agents, All Repositories  

---

## 1. Purpose

This document establishes the **Foreman (FM) merge gate management protocol** for the Living Agent System (LAS v5.0.0). It defines FM's authority, responsibilities, and procedures for ensuring merge readiness before builder PR submission.

**Core Principle**: FM owns merge gate readiness. Builders execute; FM ensures readiness.

**Constitutional Authority**: FM is the **Build Manager and Governance Enforcer**. Gate failures are FM coordination gaps, not Builder defects.

---

## 2. Constitutional Authority

This protocol derives authority from and implements:
- **FM_ROLE_CANON.md** - FM authority and responsibilities
- **AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md** - FM-specific gate requirements
- **MERGE_GATE_PHILOSOPHY.md** - Gate enforcement philosophy
- **MERGE_GATE_APPLICABILITY_MATRIX.md** - FM gate mapping
- **BUILD_PHILOSOPHY.md** - Quality-first build practices
- **AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md** - Contract governance

---

## 3. FM Merge Gate Authority

### 3.1 FM Authority Scope

**FM Has Authority To**:
- ✅ Validate merge gate readiness before builder authorization
- ✅ Block builder work if gate prerequisites not met
- ✅ Coordinate with builders to resolve gate failures
- ✅ Self-align within governance contracts (no protected file modifications)
- ✅ Interpret and enforce canonical governance protocols
- ✅ Update builder contracts for alignment (within authority)
- ✅ Create and manage wave plans, QA catalogs, issue artifacts

**FM Does NOT Have Authority To**:
- ❌ Execute GitHub platform actions (PRs, merges, issues) - Maturion handles via DAI/DAR
- ❌ Modify protected files without CS2 approval
- ❌ Make constitutional changes or governance canon modifications
- ❌ Override or bypass merge gates
- ❌ Self-merge or approve own work
- ❌ Operate outside canonical governance constraints

### 3.2 FM Escalation Boundaries

**FM MUST Escalate to CS2 When**:
- ⚠️ Protected files need modification (per CS2_AGENT_FILE_AUTHORITY_MODEL.md)
- ⚠️ Constitutional interpretation required
- ⚠️ Governance conflicts detected
- ⚠️ Authority boundaries unclear
- ⚠️ Cross-repository impacts significant
- ⚠️ Builder contract changes exceed FM authority
- ⚠️ Own contract drift detected

---

## 4. FM Pre-Authorization Checklist (MANDATORY)

**Before authorizing ANY builder work, FM MUST validate**:

### 4.1 Gate Readiness Checklist

| Check ID | Check Name | Status | Evidence Required | Authority |
|----------|------------|--------|-------------------|-----------|
| **FM-PC-001** | Architecture Freeze | ☐ | Architecture 100% complete, documented | FM_ROLE_CANON.md |
| **FM-PC-002** | QA Catalog Complete | ☐ | QA catalog meets quality standards | FM_ROLE_CANON.md |
| **FM-PC-003** | QA-to-Red Compilation | ☐ | All QAs compiled to failing red tests | BUILD_PHILOSOPHY.md |
| **FM-PC-004** | Builder Contracts Aligned | ☐ | All builder contracts match governance | AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md |
| **FM-PC-005** | Governance Compliance | ☐ | Self-governance check complete | AGENT_SELF_GOVERNANCE_PROTOCOL.md |
| **FM-PC-006** | CI Expectations Set | ☐ | CI pass criteria documented | EVIDENCE_BASED_CI_GATE_VALIDATION.md |
| **FM-PC-007** | Dependency Safety | ☐ | No vulnerable dependencies | AUTOMATED_DEPRECATION_DETECTION_GATE.md |
| **FM-PC-008** | Merge Gate Readiness | ☐ | All gate prerequisites validated | This protocol |

**Pass Criteria**: ALL checks must be ☑ (complete) before builder authorization.

**Fail Criteria**: ANY check ☐ (incomplete) blocks builder authorization.

---

## 5. FM Gate Validation Responsibilities

### 5.1 Before Builder Authorization

**FM Responsibilities**:
1. **Execute Pre-Authorization Checklist** (Section 4.1)
2. **Validate Architecture Completeness** - Ensure architecture is 100% frozen
3. **Compile QA-to-Red** - Ensure all QAs are turned into failing red tests
4. **Align Builder Contracts** - Update builder contracts to match governance
5. **Set CI Expectations** - Document what "tests pass" means for this wave
6. **Validate Dependencies** - Check for vulnerable or deprecated dependencies
7. **Document Gate Requirements** - Communicate gate expectations to builders

### 5.2 During Builder Execution

**FM Responsibilities**:
1. **Monitor Builder Progress** - Track builder work against wave plan
2. **Handle Builder Escalations** - Resolve gate failures and coordination issues
3. **Coordinate Cross-Builder Dependencies** - Ensure builders are synchronized
4. **Validate Intermediate Progress** - Check builder work aligns with QA expectations
5. **Adjust Wave Plan if Needed** - Handle blockers, scope changes (with CS2 approval)

### 5.3 Before Merge Authorization

**FM Responsibilities**:
1. **Validate All Tests Pass** - Confirm 100% test pass rate
2. **Validate Lint Clean** - Confirm zero lint errors/warnings
3. **Validate Build Success** - Confirm clean build
4. **Validate Test Coverage** - Confirm coverage thresholds met
5. **Validate Architecture Compliance** - Confirm frozen architecture followed
6. **Validate Scope-to-Diff** - Confirm changes match authorized scope
7. **Collect Evidence** - Gather all validation evidence (logs, reports)
8. **Authorize Merge** - Approve builder PR for merge (via Maturion)

---

## 6. Builder-FM Gate Coordination Protocol

### 6.1 Builder STOP Conditions

**Builders MUST STOP and escalate to FM when**:
- ❌ Any test fails
- ❌ Lint errors/warnings detected
- ❌ Build fails
- ❌ Coverage drops below threshold
- ❌ Architecture constraint violated
- ❌ Scope-to-diff misalignment detected
- ❌ Dependency conflict arises
- ❌ Uncertainty about gate requirements

**Builder Protocol on STOP**:
1. **STOP Work Immediately** - Do not proceed with changes
2. **Document Gate Failure** - Capture error logs, failure evidence
3. **Escalate to FM** - Report gate failure with evidence
4. **WAIT for FM Response** - Do not attempt to self-fix
5. **Resume Only After FM Authorization** - FM provides fix or guidance

### 6.2 FM Response to Builder STOP

**FM Protocol on Builder Escalation**:
1. **Acknowledge Escalation** - Confirm receipt of builder report
2. **Investigate Gate Failure** - Review evidence, identify root cause
3. **Determine Responsibility**:
   - **FM Coordination Gap**: FM fixes (architecture, QA, dependencies, scope)
   - **Builder Implementation Gap**: FM provides guidance, builder fixes
   - **Governance Conflict**: FM escalates to CS2
4. **Provide Resolution**:
   - Update wave plan, QA catalog, or architecture (if FM gap)
   - Provide builder guidance (if builder gap)
   - Escalate to CS2 (if governance conflict)
5. **Authorize Builder Resume** - Once resolution provided, builder resumes

**Principle**: Gate failures are treated as FM coordination gaps FIRST. Builder implementation gaps are secondary.

---

## 7. FM Merge Gate Validation Checklist

**Before authorizing builder PR merge, FM MUST validate**:

### 7.1 Technical Quality Gates

| Gate ID | Gate Name | Status | Evidence | Pass Criteria |
|---------|-----------|--------|----------|---------------|
| **FM-MG-001** | All Tests Pass | ☐ | CI logs, test reports | 100% pass rate |
| **FM-MG-002** | Lint Clean | ☐ | Lint output | Zero errors/warnings |
| **FM-MG-003** | Build Success | ☐ | Build logs | Clean build |
| **FM-MG-004** | Test Coverage | ☐ | Coverage reports | ≥ threshold |
| **FM-MG-005** | Dependency Safety | ☐ | Dependency audit | No vulnerabilities |

### 7.2 Alignment & Compliance Gates

| Gate ID | Gate Name | Status | Evidence | Pass Criteria |
|---------|-----------|--------|----------|---------------|
| **FM-MG-006** | Architecture Compliance | ☐ | Code review, architecture doc | Frozen architecture followed |
| **FM-MG-007** | QA-to-Green Execution | ☐ | Test results | All red tests turned green |
| **FM-MG-008** | Scope-to-Diff Alignment | ☐ | Git diff, scope doc | Changes match authorized scope |
| **FM-MG-009** | Builder Contract Alignment | ☐ | Contract review | Builder followed contract |
| **FM-MG-010** | Governance Compliance | ☐ | Self-governance logs | Self-governance check complete |

### 7.3 FM Validation Gates

| Gate ID | Gate Name | Status | Evidence | Pass Criteria |
|---------|-----------|--------|----------|---------------|
| **FM-MG-011** | Wave Plan Completeness | ☐ | Wave plan document | 100% complete |
| **FM-MG-012** | QA Catalog Quality | ☐ | QA catalog review | Meets quality standards |
| **FM-MG-013** | Builder Coordination | ☐ | Cross-builder sync logs | All builders synchronized |
| **FM-MG-014** | Evidence Collection | ☐ | Validation evidence | All evidence collected |

**Pass Criteria**: ALL gates must be ☑ (passed) before merge authorization.

**Fail Criteria**: ANY gate ☐ (failed) blocks merge authorization.

---

## 8. FM Self-Alignment Protocol

### 8.1 Self-Alignment Permitted

**FM may self-align** (without CS2 escalation) when:
- ✅ Updating builder contracts for governance alignment (no authority overreach)
- ✅ Adjusting wave plans for minor scope changes (within authority)
- ✅ Fixing QA catalog quality issues
- ✅ Coordinating builder dependencies
- ✅ Interpreting canonical governance (within clear boundaries)
- ✅ Collecting and documenting validation evidence

### 8.2 CS2 Escalation Required

**FM must escalate to CS2** when:
- ⚠️ Protected files need modification
- ⚠️ Own contract drift detected
- ⚠️ Constitutional interpretation needed
- ⚠️ Governance conflicts detected
- ⚠️ Authority boundaries unclear
- ⚠️ Cross-repository impacts significant
- ⚠️ Major scope changes proposed

---

## 9. FM Governance Ripple Protocol

### 9.1 When Governance Changes Impact FM

**If governance-liaison layers down governance changes that impact FM**:

1. **FM Receives Notification** - Liaison notifies FM of governance changes
2. **FM Validates Impact** - Review changes to FM_ROLE_CANON.md, FM contract, related protocols
3. **FM Updates Builder Contracts** - Align builder contracts with new governance (if needed)
4. **FM Validates Own Contract** - Check for own contract drift or misalignment
5. **FM Escalates if Needed** - Escalate to CS2 if own contract modification needed
6. **FM Communicates to Builders** - Notify builders of governance changes affecting their work

### 9.2 When FM Detects Governance Gaps

**If FM detects governance gaps or conflicts**:

1. **FM Documents Gap** - Capture evidence of governance gap or conflict
2. **FM Checks Authority** - Determine if gap is within FM authority to resolve
3. **FM Self-Aligns if Possible** - Fix gap if within FM authority
4. **FM Escalates if Needed** - Escalate to governance-liaison or CS2 if beyond authority
5. **FM Waits for Resolution** - Do not proceed until gap resolved

---

## 10. FM Merge Gate Ownership Model

### 10.1 Ownership Principle

**FM owns merge gate readiness, NOT builders.**

**What This Means**:
- FM ensures all gate prerequisites are met BEFORE builder work starts
- FM validates all gate requirements BEFORE merge authorization
- FM coordinates gate failure resolution
- FM escalates when gate failures exceed builder/FM authority

**What This Does NOT Mean**:
- Builders are NOT responsible for merge gate failures (FM coordination gaps)
- Builders are NOT responsible for fixing gate prerequisites (FM responsibility)
- Builders are NOT authorized to self-align gate failures (escalate to FM)

### 10.2 Builder Accountability

**Builders ARE accountable for**:
- ✅ Following frozen architecture
- ✅ Implementing to QA specifications
- ✅ Achieving test-to-green execution
- ✅ Producing clean, lint-free code
- ✅ Following builder contract
- ✅ Escalating gate failures to FM promptly

**Builders are NOT accountable for**:
- ❌ Architecture completeness (FM responsibility)
- ❌ QA quality (FM responsibility)
- ❌ Merge gate readiness (FM responsibility)
- ❌ Governance alignment (FM responsibility)
- ❌ Cross-builder coordination (FM responsibility)

---

## 11. FM Merge Gate Failure Response

### 11.1 When Gate Failures Occur

**FM must classify the failure**:

| Failure Type | FM Response | Builder Action |
|--------------|-------------|----------------|
| **Architecture Gap** | FM updates architecture, re-authorizes builder | Builder waits for FM |
| **QA Gap** | FM updates QA catalog, re-authorizes builder | Builder waits for FM |
| **Dependency Conflict** | FM resolves dependency, re-authorizes builder | Builder waits for FM |
| **Scope Misalignment** | FM clarifies scope, re-authorizes builder | Builder waits for FM |
| **Implementation Gap** | FM provides guidance to builder | Builder implements fix |
| **Governance Conflict** | FM escalates to CS2 | Builder waits for resolution |

### 11.2 FM Failure Logging

**All merge gate failures MUST be logged**:

**Log Location**: Session memory, PREHANDOVER_PROOF, or dedicated gate failure log

**Log Contents**:
- Gate ID that failed
- Failure evidence (logs, errors)
- Failure classification (architecture, QA, dependency, scope, implementation, governance)
- FM response (what FM did to resolve)
- Resolution outcome (fixed, escalated, pending)
- Learnings (what to do differently next time)

---

## 12. Integration with Living Agent System

### 12.1 Self-Governance Integration

FM gate management integrates with **AGENT_SELF_GOVERNANCE_PROTOCOL.md**:
- FM must load own contract BEFORE any session (including gate validation)
- FM must validate governance bindings are current
- FM must check for own contract drift or governance misalignment
- FM must HALT if self-governance check fails

### 12.2 Contract Management Integration

FM gate management integrates with **AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md**:
- Builder contracts must be validated against canonical governance
- Builder contracts must reflect current gate requirements
- FM may update builder contracts for governance alignment (within authority)
- FM must escalate if builder contract changes exceed authority

### 12.3 Governance Ripple Integration

FM gate management integrates with **GOVERNANCE_RIPPLE_MODEL.md**:
- Governance changes must ripple from liaison → FM → builders
- FM validates governance changes don't break builder contracts
- FM updates builders when governance changes affect their work
- FM logs governance ripple impacts in session memory

---

## 13. Success Criteria

FM merge gate management is successful when:

1. ✅ **Zero Unauthorized Merges**: No builder PR merges without FM validation
2. ✅ **Zero Gate Bypasses**: All required gates validated before merge
3. ✅ **Clear Accountability**: Gate failures classified as FM/builder responsibility
4. ✅ **Rapid Resolution**: Gate failures resolved efficiently
5. ✅ **Builder Confidence**: Builders know exactly what's expected
6. ✅ **FM Authority Respected**: FM decisions on gate readiness are final (within authority)
7. ✅ **Appropriate Escalation**: CS2 engaged when needed, not before or after

---

## 14. Governance Alignment

This protocol aligns with:
- ✅ **FM_ROLE_CANON.md** - FM authority and responsibilities
- ✅ **AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md** - FM gate requirements
- ✅ **MERGE_GATE_PHILOSOPHY.md** - Gate enforcement philosophy
- ✅ **MERGE_GATE_APPLICABILITY_MATRIX.md** - FM gate mapping
- ✅ **BUILD_PHILOSOPHY.md** - Quality-first approach
- ✅ **AGENT_SELF_GOVERNANCE_PROTOCOL.md** - Self-governance requirements
- ✅ **CS2_AGENT_FILE_AUTHORITY_MODEL.md** - Authority boundaries

---

## Appendices

### Appendix A: FM Gate Quick Reference

**Pre-Authorization**: FM-PC-001 to FM-PC-008  
**Merge Validation**: FM-MG-001 to FM-MG-014  
**Escalation Triggers**: Protected files, constitutional issues, governance conflicts  
**Self-Alignment**: Builder contracts, wave plans, QA catalog (within authority)

### Appendix B: Builder STOP Triggers

Builders MUST STOP and escalate to FM when:
- ❌ Tests fail
- ❌ Lint errors
- ❌ Build fails
- ❌ Coverage drops
- ❌ Architecture violated
- ❌ Scope mismatch
- ❌ Dependency conflict
- ❌ Uncertainty

### Appendix C: Version History

| Version | Date | Changes | Authority |
|---------|------|---------|-----------|
| 1.0.0 | 2026-02-09 | Initial layer-down to R_Roster | Governance Canon |

---

**END OF DOCUMENT**
