# PREHANDOVER PROOF

**Purpose**: Standard template for documenting execution verification before PR handover.  
**Version**: 2.0.0  
**Authority**: `governance/canon/EXECUTION_BOOTSTRAP_PROTOCOL.md`

---

**Repository**: [REPO_NAME]  
**Branch**: [BRANCH_NAME]  
**Commit**: [COMMIT_SHA]  
**Timestamp**: [ISO_8601_TIMESTAMP]  
**Agent**: [AGENT_NAME]  
**Task**: [TASK_DESCRIPTION]

---

## Governance Artifacts (MANDATORY)

This section provides embedded or referenced governance artifacts required for full constitutional compliance and 10/10 governance auditability.

### Artifact 1: Governance Scan

**Purpose**: Pre-work governance compliance scan to identify applicable policies, bindings, and constitutional requirements.

**Status**: [✅ COMPLETED | ❌ NOT COMPLETED | ⚠️ PARTIALLY COMPLETED]

**Scan Method**: [Manual review | Automated scan | Hybrid]

**Artifacts**:
- **Embedded**: [Yes/No - If Yes, include scan results below]
- **Separate File**: [Yes/No - If Yes, provide path: `.agent-admin/scans/scan_YYYYMMDD_HHMMSS.md`]

**Scan Results** (if embedded):
```
[GOVERNANCE SCAN OUTPUT]

Canonical Governance Review:
- [List relevant governance documents from maturion-foreman-governance]
- [Constitutional requirements identified]
- [Tier-0 bindings applicable to this task]

Local Governance Review:
- [List relevant local governance documents]
- [Repository-specific policies]
- [Agent contract requirements]

Constitutional Principles Assessed:
- [Build Philosophy compliance]
- [Zero Test Debt compliance]
- [Agent boundaries]
- [Other relevant principles]

Governance Gaps Identified: [NONE | List any gaps]
```

**Governance Scan Reference**: [If separate file, provide full path here]

---

### Artifact 2: Risk Assessment

**Purpose**: Comprehensive impact analysis and risk mitigation strategy for proposed changes.

**Status**: [✅ COMPLETED | ❌ NOT COMPLETED | ⚠️ PARTIALLY COMPLETED]

**Artifacts**:
- **Embedded**: [Yes/No - If Yes, include assessment below]
- **Separate File**: [Yes/No - If Yes, provide path: `.agent-admin/risk-assessments/risk_NNN_YYYYMMDD.md`]

**Risk Assessment** (if embedded):
```
[RISK ASSESSMENT OUTPUT]

Repository Context: [Repository name, application domain]
Agent Context: [Agents affected by this change]

Impact Analysis:
- [Impact Category 1]: [Description and severity]
- [Impact Category 2]: [Description and severity]
- [Impact Category 3]: [Description and severity]

Ripple Effects:
- [File/Component 1]: [Expected ripple effect]
- [File/Component 2]: [Expected ripple effect]

Risk Mitigation Strategies:
- [Risk 1]: [Mitigation approach]
- [Risk 2]: [Mitigation approach]

Residual Risks: [NONE | List remaining risks after mitigation]

Constitutional Compliance Risks: [NONE | List compliance risks]
```

**Risk Assessment Reference**: [If separate file, provide full path here]

---

### Artifact 3: Change Record

**Purpose**: Detailed change log with rationale, decisions made, and traceability to requirements.

**Status**: [✅ COMPLETED | ❌ NOT COMPLETED]

**Artifacts**:
- **Embedded**: [Yes/No - If Yes, include change record below]
- **Separate File**: [Yes/No - If Yes, provide path: `.agent-admin/changes/change_NNN_YYYYMMDD.md`]

**Change Record** (if embedded):
```
[CHANGE RECORD OUTPUT]

Change Summary:
- [Brief description of what changed]

Files Modified:
1. [File path] - [Reason for change]
2. [File path] - [Reason for change]
3. [File path] - [Reason for change]

Files Created:
1. [File path] - [Purpose]
2. [File path] - [Purpose]

Files Deleted:
1. [File path] - [Reason for deletion] (if applicable)

Design Decisions:
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

Alternatives Considered:
- [Alternative 1]: [Why not chosen]
- [Alternative 2]: [Why not chosen]

Traceability to Requirements:
- [Requirement 1] → [Implementation approach]
- [Requirement 2] → [Implementation approach]
```

**Change Record Reference**: [If separate file, provide full path here]

---

### Artifact 4: Completion Summary

**Purpose**: Final delivery summary with metrics, evidence, and handover readiness assessment.

**Status**: [✅ COMPLETED | ❌ NOT COMPLETED]

**Artifacts**:
- **Embedded**: [Yes/No - If Yes, include summary below]
- **Separate File**: [Yes/No - If Yes, provide path: `.agent-admin/completion/completion_NNN_YYYYMMDD.md`]

**Completion Summary** (if embedded):
```
[COMPLETION SUMMARY OUTPUT]

Delivery Metrics:
- Files Changed: [Total count - created/modified/deleted]
- Lines Changed: [+additions / -deletions]
- Documentation Updated: [Yes/No - list files]
- Tests Added/Modified: [Count or N/A]
- Validation Checks Run: [Count]

Deliverable Status:
- [Deliverable 1]: ✅ COMPLETE
- [Deliverable 2]: ✅ COMPLETE
- [Deliverable 3]: ✅ COMPLETE

Quality Gates Passed:
- [Gate 1]: ✅ PASSED
- [Gate 2]: ✅ PASSED
- [Gate 3]: ✅ PASSED

Constitutional Compliance:
- Build Philosophy: ✅ COMPLIANT
- Zero Test Debt: ✅ COMPLIANT
- Agent Boundaries: ✅ COMPLIANT
- [Other principles]: ✅ COMPLIANT

Handover Readiness: [✅ READY | ❌ NOT READY]

Evidence Location: [List all evidence files, logs, artifacts]
```

**Completion Summary Reference**: [If separate file, provide full path here]

---

## CST Validation Attestation

**CST**: Combined Systems Testing - Integration testing across multiple system components, services, or boundaries.

**CST Applicability**: [✅ REQUIRED | ⚠️ NOT REQUIRED | ❓ UNCERTAIN]

### Path A: CST Required

**If CST is required for this change, complete this section:**

**CST Scope**:
- [Component 1] ↔ [Component 2]: [Integration point description]
- [Component 3] ↔ [Component 4]: [Integration point description]
- [Service 1] ↔ [Service 2]: [Integration point description]

**CST Execution Results**:
```bash
# CST Test Suite Execution
$ [command to run CST]

[PASTE ACTUAL CST OUTPUT HERE]

# Example expected output:
# Combined Systems Test Suite
#   Integration Tests
#     ✓ API → Database integration (125ms)
#     ✓ UI → API integration (234ms)
#     ✓ Service → Service communication (189ms)
#     ✓ End-to-end workflow (456ms)
#
# Test Suites: 1 passed, 1 total
# Tests:       4 passed, 4 total
# Time:        1.234s
```

**CST Exit Code**: [0 = SUCCESS | Non-zero = FAILURE]  
**CST Pass Rate**: [X/Y tests passed - MUST be 100%]  
**CST Timestamp**: [ISO_8601_TIMESTAMP]

**Integration Points Validated**: [List all validated integration points]

**CST Status**: [✅ PASSED | ❌ FAILED]

---

### Path B: CST Not Required

**If CST is NOT required for this change, provide attestation:**

**Reason for CST Exemption**: [Select one or more]
- [ ] Documentation-only changes (no code modified)
- [ ] Governance-only changes (no application code affected)
- [ ] Single-component changes with no integration impact
- [ ] Unit tests sufficient (no cross-component interaction)
- [ ] Infrastructure/tooling changes (no application logic)
- [ ] Other: [Specify reason]

**Exemption Justification**:
```
[DETAILED JUSTIFICATION]

Why CST is not applicable to this change:
- [Justification point 1]
- [Justification point 2]
- [Evidence supporting exemption]

What testing WAS performed instead:
- [Alternative testing approach 1]
- [Alternative testing approach 2]
```

**Attestation Authority**: [Agent name/role making this attestation]  
**Reviewed By**: [FM/Governance Liaison if escalation required]  
**Exemption Status**: [✅ APPROVED | ⚠️ PENDING REVIEW | ❌ REJECTED]

---

### Path C: CST Uncertain

**If uncertain whether CST is required, escalate:**

**Uncertainty Description**:
- [Describe why CST applicability is unclear]
- [List components/integrations that may be affected]
- [Questions that need answering]

**Escalation Target**: [ForemanApp | Governance Liaison | CodexAdvisor]  
**Escalation Status**: [⚠️ AWAITING GUIDANCE]

**DO NOT PROCEED** with handover until CST applicability is clarified and appropriate path (A or B) is completed.

---

## Gate Validation Results

### Governance Gate (Tier-0)

**Status**: [✅ PASSED | ❌ FAILED]  
**Execution**: Local validation  
**Command**: `bash governance-gate-local-validation.sh`

**Results**:
- [✅/❌] .architecture/: [PRESENT/MISSING]
- [✅/❌] .qa/: [PRESENT/MISSING]
- [✅/❌] governance/: [PRESENT/MISSING]
- [✅/❌] BUILD_PHILOSOPHY.md: [PRESENT/MISSING]
- [✅/❌] .agent: [PRESENT/MISSING]
- [✅/❌] governance/alignment/GOVERNANCE_ALIGNMENT.md: [PRESENT/MISSING]
- [✅/❌] Test debt check: [RESULT]

---

### Test Execution Validation (MANDATORY)

**Authority**: governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md  
**Principle**: CI-Confirmatory-Not-Diagnostic

**Status**: [✅ PASSED | ❌ FAILED]  
**Local Execution**: [REQUIRED - Tests MUST be run locally before PR]

**Test Suite Execution**:
```bash
# Example: Unit tests
$ npm test
# Expected: 100% pass rate, EXIT 0

# EXAMPLE OUTPUT (replace with your actual output):
# PASS  tests/api/users.test.ts
#   User API Tests
#     ✓ should create user (45ms)
#     ✓ should fetch user by ID (23ms)
#     ✓ should update user (34ms)
#
# Test Suites: 1 passed, 1 total
# Tests:       3 passed, 3 total
# Snapshots:   0 total
# Time:        2.456s
# Ran all test suites.

[PASTE YOUR ACTUAL OUTPUT HERE - showing all tests passed, exit code 0]
```

**Exit Code**: [0 = SUCCESS | Non-zero = FAILURE]  
**Pass Rate**: [X/Y tests passed - MUST be 100%]  
**Timestamp**: [ISO_8601_TIMESTAMP]

**Linting/Code Quality**:
```bash
$ npm run lint
# OR
$ ruff check .
# Expected: Zero errors, zero warnings, EXIT 0

# EXAMPLE OUTPUT (replace with your actual output):
# ✔ 0 problems (0 errors, 0 warnings)

[PASTE YOUR ACTUAL OUTPUT HERE - showing zero errors/warnings, exit code 0]
```

**Exit Code**: [0 = SUCCESS | Non-zero = FAILURE]

**Deprecation Detection** (if applicable):
```bash
$ pre-commit run --all-files
# Expected: Zero violations, EXIT 0

[PASTE ACTUAL OUTPUT HERE]
```

**Exit Code**: [0 = SUCCESS | Non-zero = FAILURE]

---

### Task-Specific Gate Validation

**Status**: [✅ PASSED | ❌ FAILED]  
**Execution**: [Execution method]  
**Command**: [Command used for validation]

**Results**:
- [List task-specific validation results]
- [One item per deliverable]
- [Include file existence checks, syntax validation, content validation]

---

### File Validation

**Syntax Validation** (if applicable):
```bash
# Example commands for validation
$ python3 -c "import json; json.load(open('[FILE.json]'))"
✅ Valid JSON

$ python3 -c "import yaml; yaml.safe_load(open('[FILE.yaml]'))"
✅ Valid YAML
```

---

## Deliverables Checklist

[List ALL deliverables from issue/task with checkbox status]

### Issue Requirements
- [ ] [Deliverable 1 from issue]
- [ ] [Deliverable 2 from issue]
- [ ] [Deliverable 3 from issue]

### Governance Artifacts (MANDATORY)
- [ ] Artifact 1: Governance Scan (embedded or separate file)
- [ ] Artifact 2: Risk Assessment (embedded or separate file)
- [ ] Artifact 3: Change Record (embedded or separate file)
- [ ] Artifact 4: Completion Summary (embedded or separate file)

### CST Validation
- [ ] CST applicability determined (Required/Not Required/Uncertain)
- [ ] Path A: CST executed with 100% pass rate (if required)
- [ ] Path B: CST exemption justified and attested (if not required)
- [ ] Path C: CST uncertainty escalated and resolved (if uncertain)

### Additional Deliverables
- [ ] [Task-specific deliverable 1]
- [ ] [Task-specific deliverable 2]

---

## Ripple Validation

**Ripple Scope**: [Describe what files/systems are affected by this change]

1. ✅ [Ripple item 1]
2. ✅ [Ripple item 2]
3. ✅ [Ripple item 3]

**Ripple Status**: [COMPLETE | INCOMPLETE]

---

## Constitutional Compliance

**[Relevant BL/Constitutional Rule]**: ✅ COMPLIANT  
- [Description of compliance requirement]
- [Evidence of compliance]

**[Additional Constitutional Requirements]**: ✅ MET  
- [Additional requirements and compliance evidence]

**Layer-Down Mandate** (if applicable): ✅ MET  
- [Evidence that layer-down requirements are satisfied]

---

## Zero Test Debt

**Current Status**: [✅ ZERO DEBT | ⚠️ DEBT PRESENT]  
- [Description of test coverage status]
- [Evidence of zero test debt or remediation plan]

**Future Enforcement**: [Description of how this change affects future test enforcement]

---

## Execution Evidence

### Command History

```bash
# [Gate/validation command 1]
[command with full path]
# Result: [RESULT with exit code]

# [Gate/validation command 2]
[command with full path]
# Result: [RESULT with exit code]

# [Additional validation commands as needed]
```

### Exit Codes

All validations: **EXIT [CODE]** ([success/failure])

---

## Handover Authorization

**All checks**: [✅ GREEN | ❌ RED]  
**All gates**: [✅ PASSING | ❌ FAILING]  
**Ripple**: [✅ COMPLETE | ❌ INCOMPLETE]  
**Constitutional compliance**: [✅ VERIFIED | ❌ VIOLATIONS PRESENT]  
**FM visibility**: [✅ PROVIDED | ⚠️ NOT APPLICABLE | ❌ MISSING]

**Handover Status**: [✅ **AUTHORIZED** | ❌ **BLOCKED**]

[If AUTHORIZED]: All required checks are green on latest commit. CI will confirm (not diagnose). This PREHANDOVER_PROOF demonstrates local validation success per PR Gate Precondition (BUILD_PHILOSOPHY.md).

[If BLOCKED]: [Describe blocking issues and remediation required]

---

**Generated**: [ISO_8601_TIMESTAMP]  
**Authority**: [Agent Name/Role]  
**Escalation**: [None required | Description of escalation if needed]

---

## Instructions for Use

### How to Use This Template

1. **Copy this template** to the repository root with timestamp: `PREHANDOVER_PROOF_YYYY-MM-DDTHH-MM-SSZ.md` (uses hyphens for Windows compatibility)
2. **Replace ALL bracketed placeholders** with actual values
3. **Complete ALL four governance artifacts** (Governance Scan, Risk Assessment, Change Record, Completion Summary)
   - Choose embedded OR separate file for each artifact
   - If separate files, create them in `.agent-admin/` subdirectories
   - Provide clear references to separate files if used
4. **Determine CST applicability** and complete appropriate path:
   - Path A: Execute CST and document results if required
   - Path B: Justify and attest exemption if not required
   - Path C: Escalate if uncertain (then complete A or B after clarification)
5. **Execute validation commands** and capture actual output
6. **Document ALL deliverables** from the issue/task
7. **Verify ripple completeness** if governance changes affect multiple files
8. **Confirm constitutional compliance** against relevant governance documents
9. **Ensure handover criteria met** before marking AUTHORIZED
10. **Commit this file with your PR** as evidence of local validation

### When to Generate PREHANDOVER_PROOF

- **MANDATORY**: For ALL governance changes (policies, learnings, agent contracts, gates)
- **MANDATORY**: For ALL PR submissions where agent contract requires it
- **MANDATORY**: When explicitly required by issue/task deliverables
- **MANDATORY**: For changes affecting multiple system components (CST required)
- **RECOMMENDED**: For significant feature work to demonstrate validation
- **OPTIONAL**: For minor documentation-only changes (unless governance-related)

### Governance Artifacts Guidance

**Artifact 1: Governance Scan**
- **When**: Always before starting work
- **Purpose**: Identify applicable governance requirements
- **Create**: Manual review of canonical + local governance
- **Location**: Embedded in PREHANDOVER_PROOF OR `.agent-admin/scans/`
- **Authority**: Agent Contract Administrator pattern (comprehensive scan)

**Artifact 2: Risk Assessment**
- **When**: Before making changes with potential ripple effects
- **Purpose**: Identify and mitigate risks
- **Create**: Impact analysis + mitigation strategies
- **Location**: Embedded in PREHANDOVER_PROOF OR `.agent-admin/risk-assessments/`
- **Authority**: Agent Contract Administrator pattern (risk assessment)

**Artifact 3: Change Record**
- **When**: During implementation
- **Purpose**: Document what changed and why
- **Create**: Track all modifications, decisions, alternatives
- **Location**: Embedded in PREHANDOVER_PROOF OR `.agent-admin/changes/`
- **Authority**: Traceability and audit requirements

**Artifact 4: Completion Summary**
- **When**: After all work completed, before handover
- **Purpose**: Demonstrate delivery completeness
- **Create**: Metrics, evidence, handover readiness assessment
- **Location**: Embedded in PREHANDOVER_PROOF OR `.agent-admin/completion/`
- **Authority**: Execution Bootstrap Protocol v2.0.0+

**Embedded vs Separate Files**:
- **Embed** if artifacts are concise (< 100 lines each)
- **Separate files** if artifacts are extensive or reusable
- **Always provide clear references** to separate files in PREHANDOVER_PROOF

### CST Validation Guidance

**When CST is REQUIRED**:
- Changes affecting multiple system components
- Integration between services/APIs
- Cross-boundary data flow modifications
- End-to-end workflow changes
- Database + API + UI modifications

**When CST is NOT REQUIRED**:
- Documentation-only changes
- Governance-only changes
- Single-component unit tests sufficient
- Infrastructure/tooling (no app logic)
- Pure refactoring with no behavior change

**When UNCERTAIN**:
- Escalate to ForemanApp, Governance Liaison, or CodexAdvisor
- Do NOT proceed until clarified
- Document uncertainty and await guidance

**CST Execution Requirements**:
- Run locally before PR submission
- Capture full output in PREHANDOVER_PROOF
- 100% pass rate required
- Document exit code, timestamp, pass rate
- List all integration points validated

**If Local CST Execution Not Possible**:
- ESCALATE immediately to ForemanApp or CodexAdvisor
- Document environment constraints preventing local CST
- DO NOT proceed with handover until resolution
- This violates CI-Confirmatory-Not-Diagnostic principle
- Environment must be fixed to support local CST before work continues

### Validation Requirements

- **All gate checks MUST be GREEN** before handover authorization
- **All four governance artifacts MUST be complete** (embedded or referenced)
- **CST validation MUST be completed** (Path A, B, or C)
- **Command output MUST be actual execution results**, not hypothetical
- **Exit codes MUST be captured** and documented
- **Ripple validation MUST be complete** for governance changes
- **Constitutional compliance MUST be verified** against relevant bindings

### Handover Authorization Criteria

**AUTHORIZED** requires ALL of:
- ✅ All Tier-0 governance gate checks passing
- ✅ All four governance artifacts complete (Governance Scan, Risk Assessment, Change Record, Completion Summary)
- ✅ CST validation complete (appropriate path: A, B, or C)
- ✅ All task-specific validation checks passing
- ✅ All deliverables completed and verified
- ✅ Ripple validation complete (if applicable)
- ✅ Constitutional compliance verified
- ✅ Zero test debt (or debt properly documented and remediated)
- ✅ FM visibility provided (if governance change affects FM)

**BLOCKED** if ANY of:
- ❌ Gate checks failing
- ❌ Governance artifacts incomplete or missing
- ❌ CST validation incomplete or uncertain
- ❌ Deliverables incomplete
- ❌ Ripple validation incomplete
- ❌ Constitutional violations present
- ❌ Test debt unresolved
- ❌ Required FM visibility missing

### Escalation Protocol

If **BLOCKED** status persists after attempted remediation:
1. **Document blocking condition** with full context
2. **List remediation attempts** made
3. **Escalate to appropriate authority**:
   - Governance issues → Johan Ras
   - Builder coordination → ForemanApp
   - Technical blockers → Relevant builder or CodexAdvisor
   - CST uncertainty → ForemanApp or CodexAdvisor
4. **Mark status as ESCALATED** in PREHANDOVER_PROOF
5. **WAIT for resolution** - do not proceed with handover

### FAQ: Governance Artifacts

**Q: Can I skip governance artifacts for small changes?**  
A: No. All four artifacts are MANDATORY per template v2.0.0. For small changes, artifacts may be brief (embedded), but must still be present.

**Examples of brief artifacts for small changes**:
- Documentation fix: Governance Scan (10-20 lines listing applicable docs), Risk Assessment (5-10 lines noting low impact), Change Record (15-25 lines with file and reason), Completion Summary (20-30 lines with metrics)
- Single file update: Each artifact 20-50 lines embedded in PREHANDOVER_PROOF
- Configuration change: Similar to above, focus on what changed and why
- Total embedded artifacts for small changes: typically 100-200 lines combined

**Q: Should I embed artifacts or use separate files?**  
A: Use embedded for concise artifacts (< 100 lines each). Use separate files in `.agent-admin/` for extensive artifacts. Always provide clear references.

**Q: What if I don't have a Governance Scan?**  
A: STOP. Governance Scan is mandatory BEFORE starting work. Review canonical governance (maturion-foreman-governance) and local governance, document findings.

**Q: What if Risk Assessment shows high risks?**  
A: Document mitigation strategies. If risks are unacceptable, ESCALATE to FM or Johan. Do not proceed with BLOCKED risks.

**Q: Do governance-only changes need all artifacts?**  
A: Yes. Governance changes require full artifact attestation to ensure constitutional compliance and auditability.

### FAQ: CST Validation

**Q: What is CST?**  
A: Combined Systems Testing - integration testing across multiple components, services, or boundaries.

**Q: How do I know if CST is required?**  
A: If your change affects multiple components OR crosses system boundaries, CST is likely required. When uncertain, escalate.

**Q: Can I skip CST for documentation changes?**  
A: Yes, use Path B (Not Required) with appropriate justification and attestation.

**Q: What if CST fails?**  
A: FIX the failures locally, re-run CST until 100% pass rate, then update PREHANDOVER_PROOF. Do not handover with failing CST.

**Q: What if I can't run CST locally?**  
A: This violates CI-Confirmatory-Not-Diagnostic principle. ESCALATE to FM. Environment must support local CST execution.

**Q: What if CST applicability is unclear?**  
A: Use Path C (Uncertain), escalate to ForemanApp/CodexAdvisor, wait for guidance. Do not proceed until resolved.

### FAQ: General

**Q: Can I handover with warnings?**  
A: No. Zero warning policy applies. All warnings must be resolved before handover.

**Q: What if CI reveals issues not caught locally?**  
A: This indicates incomplete local validation. STOP, investigate, fix locally, re-run all validations, update PREHANDOVER_PROOF.

**Q: Can I update PREHANDOVER_PROOF after initial creation?**  
A: Yes, if you make changes after initial validation, re-run all checks and update PREHANDOVER_PROOF before handover.

**Q: What if I discover gaps in governance after starting work?**  
A: ESCALATE to Governance Liaison. Governance gaps may require protocol updates before work can continue.



---

**Status**: Active Template  
**Version**: 2.0.0  
**Last Updated**: 2026-01-13  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL.md v2.0.0+, COMBINED_TESTING_PATTERN.md v1.0.0  
**Owner**: Governance Administrator

---

## Changelog

**Changelog**:
- **v2.0.0** (2026-01-13): Added Embedded Governance Artifacts section and CST Validation Attestation section per Subwave 3.3 learnings
- **v1.0.0** (2026-01-11): Initial template creation with core PREHANDOVER_PROOF sections
