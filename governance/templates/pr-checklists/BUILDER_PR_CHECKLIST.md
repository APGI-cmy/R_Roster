# Builder PR Release Checklist

**Version**: 2.0.0  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL (maturion-foreman-governance PR #924)  
**Status**: MANDATORY for all builder PRs  
**Last Updated**: 2026-01-11

---

## Category 0: Execution Bootstrap Protocol (MANDATORY) ⚠️

**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+  
**Enforcement**: CONSTITUTIONAL - Cannot be waived

**Before ANY handover, builder MUST complete ALL of the following:**

### 7-Step Verification Protocol

- [ ] **Step 1: Local Gate Execution**
  - [ ] Governance gate executed locally: `bash governance-gate-local-validation.sh`
  - [ ] Exit code: 0 (success) captured and documented
  - [ ] Task-specific validation executed (tests, builds, lints)
  - [ ] All gate checks: ✅ PASSED

- [ ] **Step 2: Deliverables Verification**
  - [ ] ALL issue/task deliverables completed
  - [ ] Deliverables checklist created and marked complete
  - [ ] No incomplete or placeholder deliverables
  - [ ] All acceptance criteria met

- [ ] **Step 3: Ripple Validation**
  - [ ] Ripple scope identified (if applicable to change type)
  - [ ] All affected files updated
  - [ ] Consistency validators run (if applicable)
  - [ ] Ripple status: ✅ COMPLETE or ⚠️ NOT APPLICABLE

- [ ] **Step 4: Constitutional Compliance Check**
  - [ ] Zero Test Debt verified (no skipped tests, 100% coverage required)
  - [ ] BUILD_PHILOSOPHY.md compliance verified
  - [ ] Agent contract requirements met
  - [ ] Design freeze respected (no architecture changes without authorization)

- [ ] **Step 5: Zero Test Debt Verification**
  - [ ] All tests passing: ✅ GREEN
  - [ ] No skipped tests (unless pre-existing with documented exceptions)
  - [ ] Coverage requirements met
  - [ ] Test output captured with exit codes

- [ ] **Step 6: Execution Evidence Capture**
  - [ ] Command history documented
  - [ ] Full command output captured
  - [ ] Exit codes for all commands documented
  - [ ] Evidence sections complete in PREHANDOVER_PROOF

- [ ] **Step 7: Handover Authorization Determination**
  - [ ] All previous steps: ✅ GREEN
  - [ ] No blocking issues present
  - [ ] PREHANDOVER_PROOF marked: ✅ **AUTHORIZED**
  - [ ] PREHANDOVER_PROOF committed with PR

### PREHANDOVER_PROOF Requirements

- [ ] **PREHANDOVER_PROOF file created** using template: `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`
- [ ] **Filename format correct**: `PREHANDOVER_PROOF_YYYY-MM-DDTHH:MM:SSZ.md`
- [ ] **ALL placeholders replaced** with actual values
- [ ] **Gate validation results documented** with actual output
- [ ] **Exit codes captured** for all validation commands
- [ ] **Deliverables checklist complete** mapping to issue requirements
- [ ] **Handover status explicit**: ✅ AUTHORIZED or ❌ BLOCKED
- [ ] **File committed with PR** (not generated post-submission)

### Hard Rules (Cannot Violate)

- [ ] **CI is confirmatory, NOT diagnostic** - All validation done locally first
- [ ] **No handover without evidence** - PREHANDOVER_PROOF is mandatory
- [ ] **No claimed AUTHORIZED without green checks** - Evidence must support authorization
- [ ] **No incomplete ripple** - All affected files must be updated

**🚫 BLOCKING**: If ANY Category 0 item unchecked, PR MUST be rejected by FM

---

## Category 8: Builder-Specific Requirements (Builders)

**Authority**: Builder contracts, BUILD_PHILOSOPHY.md  
**Enforcement**: MANDATORY per builder role

### Build & Test Validation

- [ ] **Local build successful**
  - [ ] Build command executed: `[specific build command]`
  - [ ] Build output: ✅ SUCCESS
  - [ ] Exit code: 0
  - [ ] No build warnings (or documented exceptions)

- [ ] **All tests passing**
  - [ ] Test command executed: `[specific test command]`
  - [ ] Test results: ✅ ALL GREEN
  - [ ] Exit code: 0
  - [ ] Test coverage maintained/improved

- [ ] **Linting clean**
  - [ ] Lint command executed: `[specific lint command]`
  - [ ] Lint results: ✅ CLEAN
  - [ ] Exit code: 0
  - [ ] No new warnings introduced

### Code Quality

- [ ] **Architecture conformance**
  - [ ] Changes conform to frozen architecture (`.architecture/`)
  - [ ] No unapproved architecture modifications
  - [ ] Design freeze respected

- [ ] **Zero test debt**
  - [ ] No new skipped tests
  - [ ] No `@skip`, `@ignore`, `xit`, `it.skip` added
  - [ ] All new code has test coverage
  - [ ] Existing coverage maintained

- [ ] **Clean commit history**
  - [ ] Commits logical and atomic
  - [ ] Commit messages descriptive
  - [ ] No "WIP" or "fix" commits in final PR
  - [ ] Branch rebased on latest main (if required)

### Documentation

- [ ] **Code documentation complete**
  - [ ] Public APIs documented
  - [ ] Complex logic has comments
  - [ ] README updated (if needed)
  - [ ] API documentation updated (if API changes)

- [ ] **Governance documentation** (if applicable)
  - [ ] Governance learnings captured (if pattern discovered)
  - [ ] Enhancement reflection completed (if governance change)

### Builder Handover

- [ ] **Work complete per issue**
  - [ ] All acceptance criteria met
  - [ ] All deliverables implemented
  - [ ] No incomplete features/placeholders

- [ ] **Ready for FM review**
  - [ ] PR description complete and accurate
  - [ ] PREHANDOVER_PROOF demonstrates readiness
  - [ ] No known blocking issues
  - [ ] Builder confident in work quality

---

## Category 1: Issue & PR Metadata

- [ ] **Issue linked** in PR description
- [ ] **PR title descriptive** and follows conventions
- [ ] **PR description complete**:
  - [ ] What changed (high-level)
  - [ ] Why changed (context/motivation)
  - [ ] How to test/verify
  - [ ] Link to PREHANDOVER_PROOF
- [ ] **Labels applied** (if required by repo conventions)

---

## Category 2: Security & Safety

- [ ] **No secrets in code**
  - [ ] No API keys, passwords, tokens
  - [ ] No hardcoded credentials
  - [ ] Secrets properly externalized

- [ ] **Dependency safety**
  - [ ] No unapproved dependencies added
  - [ ] Dependency versions pinned (if required)
  - [ ] No known vulnerabilities in dependencies

- [ ] **Security best practices**
  - [ ] Input validation present
  - [ ] Sanitization applied where needed
  - [ ] No obvious security vulnerabilities

---

## Category 3: Pre-Submission Final Checks

- [ ] **Self-review completed**
  - [ ] Code reviewed by self before submission
  - [ ] All TODO/FIXME addressed or tracked
  - [ ] No debug code left in (console.logs, debugger, etc.)

- [ ] **CI will pass**
  - [ ] Local validation matches CI requirements
  - [ ] PREHANDOVER_PROOF demonstrates green checks
  - [ ] No environment-specific assumptions

- [ ] **Ready for merge**
  - [ ] PR targets correct branch
  - [ ] No conflicts with base branch
  - [ ] Branch up to date (if required)

---

## Handover Statement

**Builder Certification**:

I certify that:
- ✅ All Category 0 (Execution Bootstrap Protocol) requirements met
- ✅ All Category 8 (Builder-Specific) requirements met
- ✅ PREHANDOVER_PROOF demonstrates local validation success
- ✅ This PR is ready for FM review and acceptance
- ✅ No known blocking issues remain

**PREHANDOVER_PROOF Location**: `[filename]`  
**Handover Status**: ✅ **AUTHORIZED**

---

## FM Review Checklist (For FM Use)

**FM verifies**:
- [ ] PREHANDOVER_PROOF file present in PR
- [ ] All Category 0 items checked
- [ ] All Category 8 items checked
- [ ] Gate validation results documented with exit codes
- [ ] Handover status is AUTHORIZED
- [ ] Builder certification statement present

**FM Decision**:
- [ ] ✅ **ACCEPT** - All requirements met, merge approved
- [ ] 🔄 **REQUEST CHANGES** - Issues identified, builder must address
- [ ] ❌ **REJECT** - Missing PREHANDOVER_PROOF or critical violations

---

## Escalation

**If blocked or uncertain**:

1. **Review** governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md
2. **Consult** CodexAdvisor for guidance
3. **Escalate** to ForemanApp for coordination
4. **Escalate** to Governance Liaison for governance questions
5. **Escalate** to Johan Ras for constitutional matters

**Do NOT proceed with handover if blocked** - Fix issues or escalate.

---

## References

**Governance Documents**:
- governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md
- governance/templates/PREHANDOVER_PROOF_TEMPLATE.md
- BUILD_PHILOSOPHY.md
- .github/agents/[your-builder].md

**Version History**:
- v2.0.0 (2026-01-11): Added Category 0 (Execution Bootstrap Protocol), restructured
- v1.0.0: Initial builder checklist

---

**Template Authority**: EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+  
**Maintained By**: Governance Liaison  
**Questions**: Escalate per escalation path above
