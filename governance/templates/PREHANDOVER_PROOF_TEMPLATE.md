# PREHANDOVER PROOF

**Repository**: [REPO_NAME]  
**Branch**: [BRANCH_NAME]  
**Commit**: [COMMIT_SHA]  
**Timestamp**: [ISO_8601_TIMESTAMP]  
**Agent**: [AGENT_NAME]  
**Task**: [TASK_DESCRIPTION]

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
# OR
$ pytest
# Expected: 100% pass rate, EXIT 0

[PASTE ACTUAL OUTPUT HERE]
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

[PASTE ACTUAL OUTPUT HERE]
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

### [Category 1]
- [x] [Deliverable 1]
- [x] [Deliverable 2]

### [Category 2]
- [x] [Deliverable 3]
- [x] [Deliverable 4]

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

1. **Copy this template** to the repository root with timestamp: `PREHANDOVER_PROOF_YYYY-MM-DDTHH:MM:SSZ.md`
2. **Replace ALL bracketed placeholders** with actual values
3. **Execute validation commands** and capture actual output
4. **Document ALL deliverables** from the issue/task
5. **Verify ripple completeness** if governance changes affect multiple files
6. **Confirm constitutional compliance** against relevant governance documents
7. **Ensure handover criteria met** before marking AUTHORIZED
8. **Commit this file with your PR** as evidence of local validation

### When to Generate PREHANDOVER_PROOF

- **MANDATORY**: For ALL governance changes (policies, learnings, agent contracts, gates)
- **MANDATORY**: For ALL PR submissions where agent contract requires it
- **MANDATORY**: When explicitly required by issue/task deliverables
- **RECOMMENDED**: For significant feature work to demonstrate validation
- **OPTIONAL**: For minor documentation-only changes (unless governance-related)

### Validation Requirements

- **All gate checks MUST be GREEN** before handover authorization
- **Command output MUST be actual execution results**, not hypothetical
- **Exit codes MUST be captured** and documented
- **Ripple validation MUST be complete** for governance changes
- **Constitutional compliance MUST be verified** against relevant bindings

### Handover Authorization Criteria

**AUTHORIZED** requires ALL of:
- ✅ All Tier-0 governance gate checks passing
- ✅ All task-specific validation checks passing
- ✅ All deliverables completed and verified
- ✅ Ripple validation complete (if applicable)
- ✅ Constitutional compliance verified
- ✅ Zero test debt (or debt properly documented and remediated)
- ✅ FM visibility provided (if governance change affects FM)

**BLOCKED** if ANY of:
- ❌ Gate checks failing
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
4. **Mark status as ESCALATED** in PREHANDOVER_PROOF
5. **WAIT for resolution** - do not proceed with handover

---

**Template Version**: 1.0.0  
**Template Date**: 2026-01-11  
**Template Authority**: EXECUTION_BOOTSTRAP_PROTOCOL (maturion-foreman-governance PR #924)  
**Template Purpose**: Prevent "claimed complete without verification" pattern (BL-026 follow-up)
