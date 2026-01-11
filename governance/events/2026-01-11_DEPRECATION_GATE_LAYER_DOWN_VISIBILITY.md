# FM Visibility Event: Deprecation Detection Gate Layer-Down

**Event Type**: Governance Layer-Down  
**Date**: 2026-01-11  
**Status**: COMPLETE - Visibility Pending FM Acknowledgment  
**Authority**: BL-024, BL-026 (Constitutional)

---

## Summary

The **Automated Deprecation Detection Gate** has been successfully layered down to R_Roster repository as a mandatory constitutional requirement. This gate implements BL-024 (Constitutional Sandbox Pattern) and BL-026 (Deprecation Detection Learning) from the canonical governance repository.

**Impact**: All future code commits must pass automated deprecation detection. The gate is now operational and enforced at both pre-commit (local) and CI/CD (remote) levels.

---

## What Changed

### New Governance Policies

1. **governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md**
   - Constitutional policy document
   - Comprehensive deprecation detection requirements
   - Exception process with FM/Johan approval requirement
   - Quarterly review mandate

2. **governance/learnings/BL-026-deprecation-detection.md**
   - Learning documentation from BL-026
   - Key insights and implementation guidance
   - Anti-patterns and failure modes
   - Success criteria

### Infrastructure Added

3. **`.pre-commit-config.yaml`**
   - Pre-commit hooks for local enforcement
   - Python: ruff linter with deprecation rules
   - JavaScript/TypeScript: eslint with deprecation plugin
   - General formatting and validation checks

4. **`.github/workflows/deprecation-gate.yml`**
   - CI/CD workflow for automated enforcement
   - Runs on PR and push to main/develop
   - Blocks merge on deprecation violations
   - Language detection (Python/JS/TS)
   - Dependency audits (pip-audit, npm audit)
   - Whitelist validation with quarterly review checks

5. **`.deprecation-whitelist.json`**
   - Exception registry for justified deprecation usage
   - JSON schema documented
   - Currently empty (clean baseline)

### Audit & Reporting

6. **governance/reports/deprecation-audit-log.md**
   - Ongoing log for all deprecation events
   - Tracks violations, exceptions, remediations
   - Quarterly review schedule

7. **governance/reports/deprecation-audit-2026-01-11.md**
   - Initial baseline audit report
   - Results: Zero code files, zero violations
   - Clean slate confirmation

### Builder Contract Updates

8. **All builder contracts updated** (.github/agents/*-builder.md)
   - api-builder.md ✅
   - integration-builder.md ✅
   - qa-builder.md ✅
   - schema-builder.md ✅
   - ui-builder.md ✅
   
   **Added section**: "Deprecation Detection Gate (BL-024, BL-026)"
   - Constitutional status clarified
   - Pre-commit obligations documented
   - Exception process referenced
   - Violation consequences stated

### Governance Alignment

9. **governance/alignment/GOVERNANCE_ALIGNMENT.md**
   - Updated Tier-0 requirements to include deprecation gate
   - Added constitutional reference to AUTOMATED_DEPRECATION_DETECTION_GATE.md
   - Documented realignment history entry for 2026-01-11

---

## FM Adjustments Required

### Builder Onboarding

**Action Required**: Update builder onboarding process to include:
- Mandatory review of governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md
- Pre-commit hook installation: `pre-commit install`
- Local validation run: `pre-commit run --all-files`
- Acknowledgment of zero-deprecation-debt constitutional requirement

**Timeline**: Before any builder begins feature work (per issue mandate: post-2026-01-11)

### Developer Environment Setup

**Action Required**: Add to onboarding documentation:
```bash
# Install pre-commit
pip install pre-commit

# Install hooks
pre-commit install

# Verify installation
pre-commit run --all-files
```

**Timeline**: Immediate (for any new developers joining)

### Exception Approval Authority

**Action Required**: FM (or Johan Ras) must be available to approve justified exceptions.

**Process**:
1. Builder encounters necessary deprecated API usage
2. Builder documents justification with evidence
3. Builder escalates to FM/Johan for approval
4. Upon approval: inline comment added, whitelist entry created
5. Quarterly review date set (3 months from approval)

**Timeline**: Ongoing (as exceptions arise)

### Quarterly Review Cadence

**Action Required**: Schedule quarterly deprecation exception reviews.

**Schedule**:
- Q1 2026: April 11, 2026
- Q2 2026: July 11, 2026
- Q3 2026: October 11, 2026
- Q4 2026: January 11, 2027

**Responsible**: Governance Liaison (with FM oversight)

---

## Grace Period

**Grace Period**: NONE

Per constitutional mandate (BL-024, BL-026) and issue requirements, this gate must be operational before any feature work or builder onboarding post-2026-01-11.

**Rationale**: Repository currently has zero code files. Gate establishes clean baseline. No existing code requires remediation.

---

## Enforcement Timeline

**Immediate Enforcement** (as of 2026-01-11):
- ✅ Pre-commit hooks operational
- ✅ CI workflow operational
- ✅ Builder contracts updated
- ✅ Policy documentation complete

**Required Actions**:
- [ ] FM acknowledges visibility event
- [ ] FM updates builder onboarding checklist
- [ ] FM confirms exception approval authority
- [ ] FM schedules quarterly review reminders

---

## Technical Details

### Supported Languages

**Python**:
- Tool: ruff (Rust-based linter)
- Rules: F, E, W, UP, B, A, C4, DTZ, PIE, RET, SIM, ARG, PTH
- Deprecation detection: UP (pyupgrade) rules

**JavaScript/TypeScript**:
- Tool: ESLint with eslint-plugin-deprecation
- Rules: deprecation/deprecation set to "error"
- Requires TypeScript for AST analysis

**Extensibility**: Additional languages can be added as codebase composition evolves.

### CI Workflow Behavior

**Triggers**:
- Pull requests to main/develop
- Pushes to main/develop
- Manual workflow dispatch

**Path Filters**: Only runs when code files or dependency manifests change

**Language Detection**: Automatically detects Python vs JS/TS files and runs appropriate tools

**Failure Handling**: PR blocked on deprecation violations (non-optional)

### Whitelist Validation

The CI workflow includes automated whitelist validation:
- Validates JSON syntax
- Checks for expired exceptions (review_date < today)
- Reports warnings for exceptions requiring review
- Does not block on expired exceptions (warning only)

---

## Developer Experience Impact

### Pre-Commit Flow

**Before** (no deprecation gate):
```bash
git commit -m "Add feature"
# Commit succeeds immediately
```

**After** (with deprecation gate):
```bash
git commit -m "Add feature"
# Pre-commit runs deprecation checks
# If deprecated APIs found: commit blocked
# Developer must fix or request exception
```

**Estimated Time Impact**: +5-10 seconds per commit (when clean)

### PR Flow

**Before** (no deprecation gate):
```
Create PR → CI runs → Merge (if passing)
```

**After** (with deprecation gate):
```
Create PR → CI runs (includes deprecation gate) → Blocks if violations → Fix or exception → Merge
```

**Estimated Time Impact**: None if local pre-commit used (confirms CI result)

---

## Risk Assessment

### Low Risk

✅ **Clean Baseline**: Zero existing code means zero remediation required  
✅ **Pre-Commit Protection**: Developers catch issues locally before CI  
✅ **Exception Process**: Documented path for justified usage  
✅ **Mature Tooling**: ruff and ESLint are production-grade, widely used

### Mitigation Strategies

**Risk**: False positives from deprecation tools  
**Mitigation**: Exception process with FM approval, whitelist tracking

**Risk**: Developer friction/frustration  
**Mitigation**: Clear documentation, onboarding training, escalation path

**Risk**: Quarterly reviews neglected  
**Mitigation**: Automated reminders in CI, governance liaison responsibility

---

## Questions for FM

1. **Exception Approval**: Confirm Johan Ras is primary exception approver, or delegate to FM?
2. **Onboarding Timeline**: When is next builder onboarding scheduled?
3. **Quarterly Reviews**: Should governance liaison schedule calendar reminders, or will FM track?
4. **Tooling Preferences**: Any preference for additional deprecation detection tools?

---

## Success Metrics

**Short-term** (30 days):
- Zero deprecated code introduced
- Pre-commit adoption: 100% of active developers
- Exception requests: Documented and tracked

**Long-term** (90 days):
- CI gate passes: >95% first-attempt rate
- False positive rate: <5%
- Developer satisfaction: Positive feedback on clarity

---

## References

**Governance Documents**:
- governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md
- governance/learnings/BL-026-deprecation-detection.md
- BUILD_PHILOSOPHY.md (Zero Test Debt Mandate analogy)

**External Tools**:
- Ruff: https://docs.astral.sh/ruff/
- ESLint Deprecation: https://github.com/gund/eslint-plugin-deprecation
- Pre-commit: https://pre-commit.com/

**Canonical Source**:
- APGI-cmy/maturion-foreman-governance/governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md
- BL-024: Constitutional Sandbox Pattern
- BL-026: Deprecation Detection Learning

---

## Next Steps

**Immediate**:
1. ✅ Deprecation gate operational
2. ✅ Policy and learning documentation complete
3. ✅ Builder contracts updated
4. ✅ Initial audit complete
5. [ ] FM acknowledges this visibility event
6. [ ] FM updates onboarding materials

**Ongoing**:
- Monitor gate effectiveness
- Collect developer feedback
- Quarterly exception reviews
- Share learnings with other FM repositories

---

**Event Owner**: Governance Liaison Agent  
**FM Action Required**: Acknowledge and integrate into onboarding  
**Escalation**: Johan Ras (for constitutional questions)  
**Status**: COMPLETE - Awaiting FM Acknowledgment
