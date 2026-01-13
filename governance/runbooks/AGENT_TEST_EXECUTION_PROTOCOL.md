# Agent Test Execution Protocol

**Repository**: R_Roster  
**Authority**: Constitutional  
**Source**: APGI-cmy/maturion-foreman-governance (CI-Confirmatory-Not-Diagnostic Pattern)  
**Version**: 1.0.0  
**Date**: 2026-01-13  
**Status**: ACTIVE

---

## Constitutional Mandate

This protocol establishes the mandatory test execution discipline for all builder agents in FM-governed repositories. **CI is confirmatory, not diagnostic.** All agents MUST validate their work locally before PR submission.

**Layer-Down Requirement**: This protocol must be operational and binding for all builders before any feature work post-2026-01-13.

---

## Authority & Enforcement

**Status**: MANDATORY  
**Enforcement Level**: PR-BLOCKING  
**Waiver Authority**: None (constitutional)  
**Override Path**: Johan Ras only (with documented justification)

---

## Core Principle: CI is Confirmatory, Not Diagnostic

### The Problem Pattern

**Anti-Pattern**: Submitting PRs without local validation, relying on CI to discover test failures, syntax errors, or gate violations.

**Why It's Wrong**:
- Wastes CI resources and reviewer time
- Creates noise in PR history with fixup commits
- Delays delivery due to multiple CI cycles
- Demonstrates lack of due diligence
- Violates build-to-green principle

### The Correct Pattern

**Correct Pattern**: Execute ALL validation locally, document evidence in PREHANDOVER_PROOF, submit PR only when all checks are GREEN.

**Why It's Right**:
- CI confirms what you already validated
- PR is ready for review on first submission
- Demonstrates professionalism and discipline
- Aligns with one-time build philosophy
- Reduces cycle time and overhead

---

## Agent Obligations

### Pre-Commit Obligations

Before EVERY commit, builder agents MUST:

1. **Run Local Tests**
   - Execute the same test suite that CI will run
   - Verify 100% test passage (zero failures, zero skips, zero warnings)
   - Document test execution in work log

2. **Run Local Linters**
   - Execute all linting and code quality checks
   - Fix all violations before commit
   - Verify zero warnings and zero errors

3. **Run Deprecation Gate**
   - Execute deprecation detection checks (if Python/JS/TS code)
   - Ensure zero deprecated API usage
   - Document any necessary exceptions with approval

4. **Verify Build Success**
   - Build the application locally
   - Confirm zero build errors
   - Verify all dependencies resolve

### Pre-PR Obligations

Before PR submission, builder agents MUST:

1. **Execute Complete Validation**
   - Run all gate validation scripts locally
   - Execute governance gate validation
   - Run all task-specific validation checks
   - Capture full command output and exit codes

2. **Generate PREHANDOVER_PROOF**
   - Use template at `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`
   - Include ALL validation evidence
   - Document all command outputs with exit codes
   - Verify handover authorization criteria met
   - Commit PREHANDOVER_PROOF with PR

3. **Verify Deliverables Complete**
   - All issue/task requirements satisfied
   - All files created/modified as specified
   - All ripple effects addressed
   - Zero test debt

4. **Constitutional Compliance Check**
   - Verify zero test debt
   - Verify zero deprecation violations
   - Verify architecture conformance
   - Verify all gate requirements met

---

## Test Execution Requirements

### Local Test Commands

Builder agents MUST execute the EXACT commands that CI will run:

**Governance Gate** (if governance changes):
```bash
bash governance-gate-local-validation.sh
# Expected: EXIT 0
```

**Unit Tests** (if test suite exists):
```bash
npm test          # For Node.js projects
pytest           # For Python projects
./gradlew test   # For Java projects
# Expected: 100% pass rate, EXIT 0
```

**Integration Tests** (if applicable):
```bash
npm run test:integration
# Expected: 100% pass rate, EXIT 0
```

**Linting** (as configured):
```bash
npm run lint     # For Node.js projects
ruff check .     # For Python projects
# Expected: Zero errors, zero warnings, EXIT 0
```

**Deprecation Detection** (if applicable):
```bash
pre-commit run --all-files
# Expected: Zero violations, EXIT 0
```

### Test Evidence Requirements

For PREHANDOVER_PROOF, include:

1. **Command Executed**: Full command with arguments
2. **Exit Code**: Captured exit code (must be 0)
3. **Output Summary**: Key output lines showing success
4. **Timestamp**: When validation was executed
5. **Environment**: Node version, Python version, etc. (if relevant)

Example:
```bash
$ bash governance-gate-local-validation.sh
Checking required directories...
✅ .architecture/ exists
✅ .qa/ exists
✅ governance/ exists
✅ BUILD_PHILOSOPHY.md exists
✅ .agent exists
✅ governance/alignment/GOVERNANCE_ALIGNMENT.md exists
✅ Test debt check: ZERO DEBT

Governance gate validation: PASSED
EXIT 0

Executed: 2026-01-13T10:30:00Z
Environment: bash 5.1.16
```

---

## Exception Process

### When Local Validation is Blocked

If local validation is blocked by factors outside builder control:

1. **STOP**: Do not proceed with PR submission
2. **DOCUMENT**: Capture full context of blocking condition
3. **ESCALATE**: Route to appropriate authority:
   - Technical blockers → Foreman Agent
   - Constitutional matters → Johan Ras
   - Infrastructure issues → Johan Ras
4. **WAIT**: Do not bypass validation while awaiting resolution
5. **MARK**: Update task status as BLOCKED with explanation

### Emergency Exception Process

In rare emergency situations (production outage, security vulnerability):

1. **Document Emergency**: Explain urgency and risk
2. **Request Override**: Escalate to Johan Ras with full context
3. **Wait for Approval**: Do not proceed without explicit override
4. **Post-Emergency Remediation**: Return to full validation discipline immediately after emergency

### ⚠️ CRITICAL: What Does NOT Qualify as Emergency

**The following are NOT valid emergency justifications**:
- ❌ Convenience or developer preference
- ❌ Time pressure or tight deadlines
- ❌ "It's a small change" or "quick fix"
- ❌ CI is faster than local environment
- ❌ Forgot to run tests locally
- ❌ Want to see if CI catches anything

**ONLY production outages or security vulnerabilities qualify for emergency override.**

---

## Training Requirements

### Builder Onboarding

Before any builder begins work, they MUST:

1. **Read This Protocol**: Complete understanding of requirements
2. **Review Example PREHANDOVER_PROOF**: Study successful examples
3. **Execute Test Run**: Practice local validation on a trivial change
4. **Attest Understanding**: Sign attestation confirming comprehension
5. **Acknowledge Consequences**: Understand that violations = work stoppage

### Ongoing Discipline

Builder agents must maintain discipline throughout all work:

- Run tests after EVERY code change
- Verify tests pass before committing
- Document validation in PREHANDOVER_PROOF for EVERY PR
- Never rely on CI to discover problems
- Treat local validation as constitutional requirement

---

## Consequences of Violation

### Pattern Recognition

Violations detected by:
- PR submitted without PREHANDOVER_PROOF
- PREHANDOVER_PROOF claims success but CI fails
- Multiple CI cycles needed to achieve passing status
- Test failures in CI that could have been caught locally
- Commits fixing obvious syntax errors or test failures

### Enforcement Response

**First Violation**: Warning + mandatory protocol re-training  
**Second Violation**: Work stoppage + escalation to FM  
**Third Violation**: Builder contract review + possible revocation  
**Pattern of Violations**: Immediate escalation to Johan Ras

**Rationale**: This pattern indicates either:
- Lack of understanding of constitutional requirements
- Deliberate disregard for governance
- Insufficient diligence in work execution

Any of these conditions makes the builder unsuitable for continued work.

---

## Integration with Existing Governance

### Relationship to BUILD_PHILOSOPHY.md

This protocol implements the "One-Time Build" principle from BUILD_PHILOSOPHY.md:
- Architecture frozen before build
- Tests written to RED before implementation
- Build executes once to make tests GREEN
- Local validation confirms GREEN before PR

### Relationship to Zero Test Debt

Local test execution verifies:
- 100% test passage (no skips, no failures)
- Zero test warnings
- Zero test debt introduced
- All new code is tested

### Relationship to EXECUTION_BOOTSTRAP_PROTOCOL

PREHANDOVER_PROOF requirement comes from EXECUTION_BOOTSTRAP_PROTOCOL:
- Mandatory evidence of local validation
- Standardized proof format
- Handover authorization criteria
- CI as confirmation, not discovery

### Relationship to BL-026 (Deprecation Detection)

Local execution includes deprecation validation:
- Pre-commit hooks catch deprecated usage
- Builder fixes before commit
- CI confirms (does not discover)
- Zero deprecation debt maintained

---

## Builder Contract Binding

This protocol MUST be referenced in all builder agent contracts:

**Required Sections in Builder Contracts**:

1. **Test Execution Protocol Binding**:
   ```markdown
   ## Test Execution Protocol (Constitutional)
   
   **Authority**: governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md
   **Status**: MANDATORY
   
   **CI is Confirmatory, Not Diagnostic**: All validation MUST be executed 
   locally before PR submission. PREHANDOVER_PROOF required for every PR.
   
   **Obligations**:
   - Run ALL tests locally before commit
   - Execute ALL gate validations before PR
   - Generate PREHANDOVER_PROOF with full evidence
   - Submit PR ONLY when all checks are GREEN locally
   - NEVER rely on CI to discover failures
   
   **Violation = Work stoppage + contract review**
   ```

2. **Evidence Requirements**:
   - Link to `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`
   - Specify test commands to execute
   - Document expected exit codes
   - Reference constitutional status

---

## Monitoring & Improvement

### Metrics Collection

Track the following for continuous improvement:

- **First-Time Success Rate**: % of PRs that pass CI on first submission
- **Average CI Cycles**: Number of CI runs needed per PR
- **PREHANDOVER_PROOF Compliance**: % of PRs with proper evidence
- **Violation Rate**: Number of protocol violations per builder

**Target**: 100% first-time success rate, 100% PREHANDOVER_PROOF compliance

### Quarterly Review

Every quarter (Jan, Apr, Jul, Oct):

1. Review protocol effectiveness
2. Analyze violation patterns
3. Update training materials
4. Propose process improvements
5. Report findings to Johan Ras

---

## Escalation

### When Blocked

If protocol compliance is blocked:

1. **Evaluate**: Is the blocker genuine? (see Exception Process)
2. **Document**: Prepare full context and evidence
3. **Request**: Escalate to appropriate authority
4. **Wait**: Do NOT bypass protocol while awaiting resolution
5. **Update**: Document resolution and lessons learned

### Escalation Path

- **Technical Questions**: Foreman Agent
- **Exception Requests**: Johan Ras
- **Constitutional Matters**: Johan Ras
- **Process Improvements**: Governance Liaison → Johan Ras

---

## Ripple Effects

This protocol ripples to:

1. **`.agent`** - Test execution section required
2. **`.github/agents/*-builder.md`** - Builder contract bindings
3. **`governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`** - Evidence requirements
4. **`.github/workflows/*`** - CI workflow documentation
5. **`governance/onboarding/*`** - Training materials
6. **`governance/events/`** - FM visibility event

---

## Success Criteria

Protocol successfully layered down when:

- [ ] Runbook created and reviewed
- [ ] `.agent` file references protocol
- [ ] All builder contracts updated with protocol binding
- [ ] PREHANDOVER_PROOF template includes test execution section
- [ ] Training materials created
- [ ] All builders attested understanding
- [ ] First 5 PRs demonstrate 100% compliance
- [ ] Zero protocol violations in initial validation period

---

## Platform Alignment

**Canonical Source**: APGI-cmy/maturion-foreman-governance/governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md

**Learnings Applied**:
- One-Time Build principle (BUILD_PHILOSOPHY.md)
- CI-Confirmatory-Not-Diagnostic pattern
- EXECUTION_BOOTSTRAP_PROTOCOL (PR #924)

**Cross-Repo Consistency**: This protocol must be layered down to all FM repositories. Divergence requires Johan Ras approval.

---

**Authority**: Constitutional - No waivers permitted  
**Enforcement**: PREHANDOVER_PROOF requirement, PR review, pattern monitoring  
**Escalation**: Johan Ras (for exceptions and constitutional matters)
