# Scope Declaration for PR #[NUMBER]

**Agent**: [agent-name]  
**Date**: [ISO-8601 timestamp, e.g., 2026-01-19T15:30:00Z]  
**PR Title**: [Full PR title]  
**Validation Method**: Evidence-Based (BL-027/028)

---

## Purpose

This document provides explicit scope declaration and attestation for evidence-based CI gate validation. It documents all files changed, justifies the use of evidence-based validation, and provides agent attestation that validation is complete.

**Authority**: governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md

---

## Changed Files

### Governance Files

*List all governance policy, canon, and template files changed*

- `governance/policies/[FILE].md` - [Brief description of change and purpose]
- `governance/onboarding/[FILE].md` - [Brief description of change and purpose]
- `governance/templates/[FILE].md` - [Brief description of change and purpose]

### Agent Contracts

*List all agent contract files in .github/agents/ changed*

- `.github/agents/[AGENT].md` - [Brief description of change and purpose]

### Workflows

*List all GitHub workflow files changed*

- `.github/workflows/[WORKFLOW].yml` - [Brief description of change and purpose]

### Scripts

*List all script files changed*

- `.github/scripts/[SCRIPT].sh` - [Brief description of change and purpose]

### Documentation

*List all documentation files changed*

- `README.md` - [Brief description of change and purpose]
- `[OTHER-DOC].md` - [Brief description of change and purpose]

### Other Files

*List any other files changed that don't fit above categories*

- `[FILE]` - [Brief description of change and purpose]

---

## Scope Summary

**Total Files Changed**: [number]  
**Governance Files**: [number]  
**Agent Contracts**: [number]  
**Workflows**: [number]  
**Scripts**: [number]  
**Documentation**: [number]  
**Other**: [number]

**All Files Documented**: Yes ✓ / No ✗  
**Scope Complete**: Yes ✓ / No ✗

---

## Validation Method Justification

**Why Evidence-Based Validation is Appropriate**:

[Provide detailed justification for using evidence-based validation instead of script execution. Valid reasons include:
- Governance policy changes that have no executable validation
- Documentation updates that cannot be tested by scripts
- Agent contract modifications that affect behavior but have no test scripts
- Template changes that cannot be validated automatically
- Workflow configuration changes that are non-code]

**What Cannot Be Script-Validated**:

[Explain specifically what aspects of this PR cannot be validated by traditional script execution]

**What Evidence Replaces Scripts**:

[Explain what evidence is provided in PREHANDOVER_PROOF that serves the same purpose as script validation]

---

## Scope Comparison

### Git Diff Files

*Run: `git diff --name-only origin/[base-branch]...HEAD`*

```
[Paste complete output of git diff --name-only]
```

### Documented Files

*List all files from "Changed Files" section above*

```
[List all files documented in this SCOPE_DECLARATION]
```

### Comparison Result

**Files in Git Diff**: [number]  
**Files in Documentation**: [number]  
**Match**: Yes ✓ / No ✗

**Discrepancies**: [List any files in git diff but not documented, or documented but not in git diff, or write "None"]

---

## Validation Evidence Reference

**PREHANDOVER_PROOF File**: `PREHANDOVER_PROOF_[timestamp].md`

**Validation Steps Documented in PREHANDOVER_PROOF**:
1. [List key validation steps performed]
2. [E.g., "Manual review of governance policy alignment"]
3. [E.g., "Validation of template structure and completeness"]
4. [E.g., "Cross-reference check with canonical governance source"]

**All Validation Steps Complete**: Yes ✓ / No ✗

---

## Scope Attestation

### Completeness Attestation

I attest that:
- [✓] All files changed in this PR are documented in the "Changed Files" section above
- [✓] The scope is complete and no files were omitted from documentation
- [✓] No files were changed outside of the documented scope
- [✓] The git diff comparison confirms scope accuracy
- [✓] All changes serve the stated purpose of this PR

### Validation Method Attestation

I attest that:
- [✓] Evidence-based validation is appropriate for this work (see justification)
- [✓] Traditional script validation would be insufficient or impossible for this work
- [✓] Complete validation evidence is provided in PREHANDOVER_PROOF
- [✓] All validation steps have been performed and documented
- [✓] All validation results are PASS/GREEN

### Quality Attestation

I attest that:
- [✓] All changes follow governance policy and constitutional requirements
- [✓] All changes are aligned with canonical governance source (if applicable)
- [✓] All documentation is accurate and complete
- [✓] All ripple effects have been identified and addressed
- [✓] This PR is ready for merge subject to human review

---

## Agent Signature

**Agent Identity**: [agent-name]  
**Contract File**: `.github/agents/[agent-name].md`  
**Date**: [ISO-8601 timestamp]

**Signature Statement**:

I, [agent-name], attest that all information in this SCOPE_DECLARATION.md is accurate and complete. I have performed all validation steps documented in PREHANDOVER_PROOF and confirmed that this PR meets all governance requirements. I authorize handover of this PR to human reviewers for final approval.

**Signed**: [agent-name]  
**Timestamp**: [ISO-8601 timestamp]

---

## Reviewer Checklist

*For human reviewers of evidence-based PRs*

- [ ] SCOPE_DECLARATION.md is present and complete
- [ ] PREHANDOVER_PROOF is present with attestation section
- [ ] All changed files are documented in scope declaration
- [ ] Git diff matches documented scope (no discrepancies)
- [ ] Justification for evidence-based validation is valid
- [ ] Agent attestations are present and properly signed
- [ ] All validation evidence is provided in PREHANDOVER_PROOF
- [ ] Changes align with PR title and description
- [ ] No concerns about scope or validation quality

**Reviewer**: [reviewer-name]  
**Date**: [date]  
**Approval**: Approved ✓ / Changes Requested ✗
