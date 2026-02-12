# Migration Guide: Unified Merge Gate Interface (Living Agent System v6.2.0)

**Version**: 1.0.0  
**Date**: 2026-02-12  
**Authority**: Living Agent System v6.2.0, MERGE_GATE_INTERFACE_STANDARD.md

---

## Overview

This guide documents the migration from repository-specific gate workflows to the unified merge gate interface required by Living Agent System v6.2.0.

### What Changed

**Before (Legacy)**:
- Multiple repository-specific workflow files
- Inconsistent gate naming and contexts
- Mixed validation approaches
- No standardized evidence bundle requirement

**After (v6.2.0)**:
- Single unified workflow: `merge-gate-interface.yml`
- Three standard check contexts:
  - `Merge Gate Interface / merge-gate/verdict`
  - `Merge Gate Interface / governance/alignment`
  - `Merge Gate Interface / stop-and-fix/enforcement`
- Evidence-first validation
- Machine-readable gate results (JSON)

---

## Standard Gate Contexts

### 1. merge-gate/verdict

**Purpose**: Validate evidence artifacts and enforce compliance policies

**Checks**:
- ✓ Deterministic PR classification (governance-only, docs-only, code-change)
- ✓ Required evidence artifacts present (PREHANDOVER_PROOF, gate results JSON, improvements)
- ✓ Gate results JSON schema validation
- ✓ No-minimizing-language policy enforcement
- ✓ Evidence-first error messages

**Failure Triggers**:
- Missing evidence artifacts
- Invalid JSON in gate results
- Minimizing language in PR title or evidence
- Missing required JSON fields

**Remediation**:
- Create missing evidence bundle: `.github/scripts/create-evidence-bundle.sh`
- Fix JSON schema issues
- Remove minimizing language ("just", "only", "simply", "trivial")

---

### 2. governance/alignment

**Purpose**: Verify canonical governance alignment and detect drift

**Checks**:
- ✓ Governance sync state validation (`.agent-admin/governance/sync_state.json`)
- ✓ TIER_0_CANON_MANIFEST.json integrity check
- ✓ Placeholder hash detection (degraded mode indicator)
- ✓ Alignment state assessment

**Failure Triggers**:
- TIER_0_CANON_MANIFEST contains placeholder hashes
- Canon manifest missing or invalid JSON
- Critical drift detected

**Warnings (Non-Blocking)**:
- Governance sync state missing (liaison should sync)
- Alignment state is DEGRADED

**Remediation**:
- Update TIER_0_CANON_MANIFEST with actual sha256 hashes
- Governance liaison should sync with canonical source
- Escalate degraded mode to CS2 per REQ-SS-004

---

### 3. stop-and-fix/enforcement

**Purpose**: Enforce stop-and-fix protocol and detect unresolved issues

**Checks**:
- ✓ Stop-and-fix indicator detection (commit messages, labels, PR metadata)
- ✓ RCA requirement when stop-and-fix occurred
- ✓ Unresolved TODO/FIXME detection in code files
- ✓ Evidence of proper incident handling

**Failure Triggers**:
- Stop-and-fix occurred without RCA
- TODO/FIXME markers in production code
- Unresolved blocking issues

**Remediation**:
- Create RCA in `.agent-admin/rca/`
- Resolve all TODO/FIXME markers before merge
- Document incident properly per stop-and-fix protocol

---

## PR Classification Logic (Deterministic)

The merge gate interface uses deterministic classification to avoid inference errors:

### Rule Order (First Match Wins)

1. **Label Override**
   - Label `governance-only` → classify as governance-only
   - Label `docs-only` → classify as docs-only

2. **Branch Pattern**
   - Branch matches `release/*` or `hotfix/*` → classify as code-change

3. **Governance Changes**
   - Files under `governance/`, `.agent`, `.agent-admin/` → classify as governance-only

4. **Code Changes**
   - Any other file changes → classify as code-change

5. **Docs Only**
   - Only changes to `docs/**` or `*.md` files → classify as docs-only

### Classification Impacts

- **governance-only**: Relaxed requirements, governance liaison authority
- **docs-only**: Documentation-specific validation
- **code-change**: Full builder requirements (QA, evidence, zero-test-debt)

---

## Evidence Artifact Bundle Requirements

All governed PRs must provide evidence artifacts per EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md:

### Required Root
```
.agent-admin/
```

### Required Subpaths
```
.agent-admin/prehandover/       # Prehandover proof (may be in root as PREHANDOVER_PROOF_*.md)
.agent-admin/gates/             # Gate results JSON (machine-readable)
.agent-admin/rca/               # RCA (when stop-and-fix occurred)
.agent-admin/improvements/      # Continuous improvement capture (mandatory)
.agent-admin/governance/        # Governance sync state
```

### Creating Evidence Bundle

Use the automation script:
```bash
.github/scripts/create-evidence-bundle.sh [PR_NUMBER]
```

This creates:
- Directory structure
- Gate results JSON template
- Improvements capture template
- Governance sync state (if not exists)

---

## Migration Steps for Existing PRs

### Step 1: Assess Current PR State

1. Identify PR classification (governance-only, docs-only, code-change)
2. Check if evidence artifacts exist
3. Determine if stop-and-fix occurred

### Step 2: Create Evidence Bundle

```bash
# Run evidence bundle automation
.github/scripts/create-evidence-bundle.sh PR_NUMBER

# Update gate results JSON with actual status
vim .agent-admin/gates/gate-results-*.json
```

### Step 3: Create PREHANDOVER_PROOF

If not already present, create:
```bash
# Root level file
touch PREHANDOVER_PROOF_$(date -u +"%Y-%m-%dT%H%M%SZ").md
```

Include required sections:
- Agent attestation
- Work summary
- Evidence trail
- Compliance confirmation

### Step 4: Update Improvements Capture

Edit `.agent-admin/improvements/improvements-*.md`:
- Change status from PARKED to CAPTURED if improvements made
- List identified improvements
- Document rationale

### Step 5: Create RCA (If Needed)

If stop-and-fix occurred:
```bash
# Create RCA document
vim .agent-admin/rca/rca-$(date -u +"%Y-%m-%d").md
```

Include:
- Incident description
- Root cause analysis
- Resolution steps
- Prevention measures

---

## Branch Protection Updates

### Required Status Checks

Update branch protection to require **only** these three contexts:

```
Merge Gate Interface / merge-gate/verdict
Merge Gate Interface / governance/alignment
Merge Gate Interface / stop-and-fix/enforcement
```

### Remove Old Required Checks

These are now optional (still run, but not required):
- Deprecation Detection Gate
- Pre-Implementation Review Gate
- YAML Validation

The old gates remain functional for backward compatibility but are superseded by the unified interface.

---

## Legacy Gate Deprecation Timeline

### Phase 1: Grace Period (Current - 2026-03-12)
- ✅ New unified gate is active
- ✅ Old gates still run (optional)
- ✅ Both systems coexist
- Action: Migrate PRs to use evidence bundles

### Phase 2: Transition (2026-03-12 - 2026-04-12)
- Old gates marked as deprecated
- Warning messages added to old gate outputs
- New PRs must use unified interface
- Action: Complete migration of all open PRs

### Phase 3: Removal (After 2026-04-12)
- Old gate workflows archived
- Only unified interface remains
- No backward compatibility
- Action: All PRs must be compliant

---

## Troubleshooting

### Issue: Gate fails with "Missing evidence artifacts"

**Cause**: Evidence bundle not created or incomplete

**Solution**:
```bash
.github/scripts/create-evidence-bundle.sh PR_NUMBER
# Then commit the created files
```

---

### Issue: Gate fails with "Invalid JSON"

**Cause**: Gate results JSON syntax error or missing fields

**Solution**:
1. Validate JSON: `python3 -c "import json; json.load(open('.agent-admin/gates/gate-results-*.json'))"`
2. Ensure required fields: timestamp, pr_number, verdict, gates
3. Fix syntax errors

---

### Issue: Gate fails with "Minimizing language detected"

**Cause**: PR title or evidence contains banned phrases

**Solution**:
- Remove: "just", "only", "simply", "merely", "trivial", "minor change"
- Reword to be specific and descriptive
- Example: "Only update README" → "Update README with installation instructions"

---

### Issue: Governance alignment fails with "placeholder hashes"

**Cause**: TIER_0_CANON_MANIFEST contains placeholder values

**Solution**:
1. This indicates degraded governance mode
2. Update manifest with actual sha256 hashes
3. Escalate to CS2 per REQ-SS-004
4. Governance liaison should sync with canonical source

---

### Issue: Stop-and-fix enforcement fails "RCA required"

**Cause**: Stop-and-fix occurred but no RCA created

**Solution**:
1. Create RCA: `.agent-admin/rca/rca-$(date +%Y-%m-%d).md`
2. Document incident, root cause, resolution
3. Commit RCA to evidence bundle

---

## Integration with Foreman Infrastructure

### Wake-Up Protocol

Before starting work, Foreman should run:
```bash
.github/scripts/wake-up-protocol.sh foreman
```

This:
- Loads agent identity and memories
- Checks governance state
- Generates working contract
- Reports environment health

### Session Closure Protocol

After completing work, Foreman should run:
```bash
.github/scripts/session-closure.sh foreman
```

This:
- Creates session memory
- Rotates old memories (keeps 5 most recent)
- Cleans ephemeral files
- Checks for pending escalations

---

## Evidence Bundle Schema

### Gate Results JSON Schema

```json
{
  "timestamp": "ISO8601_TIMESTAMP",
  "pr_number": "PR_NUMBER",
  "verdict": "PASS|FAIL",
  "gates": {
    "merge-gate/verdict": {
      "status": "PASS|FAIL",
      "evidence_artifacts": {
        "prehandover_proof": "path/to/proof",
        "gate_results": "path/to/results.json",
        "rca": "path/to/rca.md (if applicable)",
        "improvements": "path/to/improvements.md"
      },
      "issues": []
    },
    "governance/alignment": {
      "status": "PASS|FAIL",
      "drift_detected": false,
      "alignment_state": "ALIGNED|DEGRADED|DRIFT",
      "issues": []
    },
    "stop-and-fix/enforcement": {
      "status": "PASS|FAIL",
      "stop_and_fix_occurred": false,
      "rca_required": false,
      "issues": []
    }
  },
  "test_results": {
    "total_tests": 0,
    "passed": 0,
    "failed": 0,
    "skipped": 0,
    "test_debt": "ZERO|DETECTED"
  }
}
```

---

## Canonical References

- **MERGE_GATE_INTERFACE_STANDARD.md** - Standard gate definitions
- **FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md** - FM gate management authority
- **EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md** - Evidence requirements
- **LIVING_AGENT_SYSTEM.md** - v6.2.0 framework
- **BUILD_PHILOSOPHY.md** - Zero test debt, one-time build law

---

## Support

For issues or questions:
1. Review this migration guide
2. Check canonical governance documentation
3. Escalate to Foreman (FM) for gate-specific issues
4. Escalate to CS2 for constitutional/authority issues

---

**Version**: 1.0.0  
**Last Updated**: 2026-02-12  
**Authority**: Living Agent System v6.2.0
