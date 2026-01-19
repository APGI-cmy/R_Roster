# Evidence-Based CI Gate Validation

**Repository**: R_Roster  
**Authority**: Constitutional  
**Source**: APGI-cmy/maturion-foreman-governance#981 (BL-027, BL-028)  
**Version**: 1.0.0  
**Date**: 2026-01-19  
**Status**: ACTIVE

---

## Constitutional Mandate

This policy implements BL-027 (Evidence-Based CI Validation) and BL-028 (Agent Attestation Pattern) as mandatory governance capabilities. CI gates must accept evidence-based validation for agent PRs in addition to traditional script execution.

**Layer-Down Requirement**: This capability must be operational before agents can submit governance PRs with evidence-based validation.

---

## Authority & Enforcement

**Status**: MANDATORY  
**Enforcement Level**: CI-GATE-ACCEPTING  
**Waiver Authority**: None (constitutional)  
**Override Path**: Johan Ras only (with documented justification)

---

## Core Principle: Dual Validation Paths

### Traditional Validation (Path A)

**Method**: Script execution with exit code checking

**Requirements**:
- Execute validation scripts locally
- All scripts must exit with code 0 (success)
- CI confirms local execution results

**Use Case**: Standard builder work, application code changes, feature development

### Evidence-Based Validation (Path B - BL-027/028)

**Method**: Agent attestation with documented evidence

**Requirements**:
- PREHANDOVER_PROOF document with complete validation evidence
- SCOPE_DECLARATION.md with explicit scope comparison and attestation
- Agent signature attesting to validation completeness
- CI accepts evidence as proof of validation

**Use Case**: Governance work, agent contract modifications, policy updates, documentation changes

---

## BL-027: Evidence-Based Validation Pattern

### Principle

When agents perform work that cannot be validated by traditional script execution (governance updates, policy changes, documentation), they provide evidence-based validation instead.

### Requirements

**1. PREHANDOVER_PROOF Document**

Must include:
- Timestamp and agent identity
- Complete checklist of validation steps performed
- Evidence of each validation (command output, manual review notes)
- Attestation that all checks passed
- Authorization statement for handover

**2. SCOPE_DECLARATION.md**

Must include:
- Explicit listing of all files changed
- Classification of each change (governance/policy/documentation/code)
- Justification for why evidence-based validation is appropriate
- Comparison of changed files vs. expected scope
- Agent attestation that scope is complete and correct

**3. Agent Attestation**

Must include:
- Agent identity (which agent performed validation)
- Date and time of validation
- Explicit statement: "I attest that all validation has been performed and documented"
- Signature mechanism (agent name in document)

### Validation by CI

CI must:
- Check for presence of PREHANDOVER_PROOF
- Check for presence of SCOPE_DECLARATION.md
- Validate structure and completeness of both documents
- Accept as passing if both documents are present and complete
- Fail if documents are missing or incomplete

---

## BL-028: Agent Attestation Pattern

### Principle

Agents are trusted to perform validation locally and attest to its completeness. CI confirms the attestation exists but does not re-execute validation.

### Trust Model

**Agents are trusted because**:
- They follow constitutional governance protocols
- They are governed by contract files with explicit obligations
- They document all work in PREHANDOVER_PROOF
- They escalate when unable to validate
- They operate under Governance Liaison oversight

**CI role changes from**:
- Execute validation → Confirm attestation
- Diagnostic tool → Evidence checker
- Gatekeeper → Validator of validation

### Attestation Requirements

**Format**:
```markdown
## Agent Attestation

**Agent**: [agent-name]  
**Date**: [ISO-8601 timestamp]  
**Validation Scope**: [description of what was validated]

**Attestation Statement**:
I attest that:
1. All validation steps documented in this PREHANDOVER_PROOF have been executed
2. All validation steps resulted in PASS/GREEN status
3. All files changed are documented in SCOPE_DECLARATION.md
4. The scope is complete and no files were omitted
5. This PR is ready for merge subject to human review

**Signature**: [agent-name]
```

---

## Implementation Requirements

### CI Workflow Changes

All CI workflows must implement dual-path validation:

```yaml
- name: Determine Validation Path
  id: validation_path
  run: |
    if [ -f "SCOPE_DECLARATION.md" ] && [ -f "PREHANDOVER_PROOF_*.md" ]; then
      echo "path=evidence" >> $GITHUB_OUTPUT
      echo "Using evidence-based validation (BL-027/028)"
    else
      echo "path=script" >> $GITHUB_OUTPUT
      echo "Using script-based validation (traditional)"
    fi

- name: Script-Based Validation
  if: steps.validation_path.outputs.path == 'script'
  run: |
    # Execute validation scripts
    ./governance-gate-local-validation.sh
    exit $?

- name: Evidence-Based Validation
  if: steps.validation_path.outputs.path == 'evidence'
  run: |
    # Validate evidence documents
    ./.github/scripts/validate-evidence-based-gate.sh
    exit $?
```

### Validation Script Requirements

Evidence validation script must check:

1. **SCOPE_DECLARATION.md exists and is valid**
   - File is present
   - Contains all required sections
   - Lists all changed files
   - Includes attestation statement
   - Signed by agent

2. **PREHANDOVER_PROOF exists and is complete**
   - File is present (PREHANDOVER_PROOF_*.md pattern)
   - Contains validation evidence
   - All checklist items marked complete
   - Includes attestation section
   - Timestamp is recent (within last 24 hours)

3. **Scope consistency**
   - Files listed in SCOPE_DECLARATION match git diff
   - No files changed but not documented
   - No files documented but not changed
   - Tolerance: 20% variance allowed (minimum 1 file) to account for generated files or minor discrepancies

---

## SCOPE_DECLARATION.md Template

```markdown
# Scope Declaration for PR #[number]

**Agent**: [agent-name]  
**Date**: [ISO-8601 timestamp]  
**PR Title**: [title]

## Changed Files

### Governance Files
- `governance/policies/FILE.md` - [brief description]
- `governance/canon/FILE.md` - [brief description]

### Agent Contracts
- `.github/agents/AGENT.md` - [brief description]

### Documentation
- `README.md` - [brief description]

## Scope Attestation

**Total Files Changed**: [number]  
**All Files Documented**: Yes ✓  
**Scope Complete**: Yes ✓

**Validation Method**: Evidence-based (BL-027/028)

**Justification**: This PR modifies [governance/policy/documentation] files that cannot be validated by traditional script execution. Evidence-based validation is appropriate because [reason].

## Scope Comparison

**Git Diff Files**: [list from git diff --name-only]  
**Documented Files**: [list from above]  
**Match**: Yes ✓

## Agent Signature

I attest that:
1. All changed files are documented above
2. The scope is complete and accurate
3. No files were changed outside of documented scope
4. Evidence-based validation is appropriate for this work

**Signed**: [agent-name]  
**Date**: [ISO-8601 timestamp]
```

---

## Workflow Integration

### For Agents

**When to use evidence-based validation**:
- Governance policy changes
- Agent contract modifications
- Documentation updates
- Template changes
- Workflow configuration changes (non-code)

**How to use**:
1. Complete work as normal
2. Create SCOPE_DECLARATION.md from template
3. Create PREHANDOVER_PROOF with attestation
4. Commit both documents with PR
5. CI will automatically detect and use evidence path

### For Reviewers

**How to review evidence-based PRs**:
1. Check SCOPE_DECLARATION.md for completeness
2. Review PREHANDOVER_PROOF for validation evidence
3. Verify attestation is present and properly signed
4. Compare documented scope against actual changes
5. Verify justification for evidence-based validation
6. Approve if evidence is complete and accurate

---

## Testing Requirements

### Initial Testing

This policy requires validation with at least one successful merge using evidence-based validation before being considered operational.

**Test Criteria**:
- Create a test PR with SCOPE_DECLARATION.md and PREHANDOVER_PROOF
- CI must accept evidence-based validation
- PR must merge successfully
- Post-merge verification confirms no issues

### Ongoing Validation

- Monitor evidence-based PRs for quality
- Escalate any incomplete or inaccurate attestations
- Review evidence quality quarterly
- Update validation scripts as needed

---

## Escalation

**If evidence is incomplete**: CI fails with clear message indicating missing elements

**If evidence is inaccurate**: Human reviewer blocks merge and provides feedback

**If pattern is misused**: Governance Liaison escalates to Johan with incident report

**If validation script fails**: Agent escalates to ForemanApp with full diagnostic context

---

## References

**Canonical Source**: APGI-cmy/maturion-foreman-governance#981

**Related Governance**:
- `BUILD_PHILOSOPHY.md` - PR Gate Precondition
- `governance/runbooks/AGENT_TEST_EXECUTION_PROTOCOL.md` - CI as Confirmatory
- `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md` - Evidence format

**Implementation Files**:
- `.github/scripts/validate-evidence-based-gate.sh` - Evidence validation script
- `.github/scripts/validate-scope-declaration.sh` - Scope validation script
- `governance/templates/SCOPE_DECLARATION_TEMPLATE.md` - Template for agents

---

**Authority**: Constitutional - Implements BL-027/028 from governance canon  
**Enforcement**: CI workflows, governance gates, human review  
**Escalation**: Governance Liaison → Johan Ras (for constitutional matters)
