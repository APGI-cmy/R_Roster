# Governance Ripple System

**Version**: 1.0.0  
**Authority**: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md, GOVERNANCE_RIPPLE_MODEL.md  
**Status**: Active  
**Last Updated**: 2026-02-14

---

## Overview

The Governance Ripple System enables automated, bidirectional governance evolution in R_Roster through continuous synchronization with the canonical governance repository (`APGI-cmy/maturion-foreman-governance`).

This system ensures:
- **Downward ripple**: Governance changes propagate from canonical source to R_Roster
- **Upward ripple**: Lessons learned and governance gaps escalate to canonical governance
- **Zero drift target**: No repository drifts from canonical governance for more than 24 hours
- **Evidence-first operations**: All alignment actions are tracked and auditable

---

## Architecture

### Components

1. **Repository Dispatch Receiver** (`.github/workflows/governance-ripple-sync.yml`)
   - Receives `repository_dispatch` events from canonical governance
   - Triggers alignment workflow immediately on governance changes
   - Records ripple events to `.agent-admin/governance/ripple-log.json`

2. **Scheduled Fallback** (`.github/workflows/governance-alignment-schedule.yml`)
   - Runs every hour to catch missed dispatch events
   - Ensures compliance with 24-hour drift SLA
   - Escalates persistent drift to CS2

3. **Alignment Script** (`.github/scripts/align-governance.sh`)
   - Orchestrates drift detection and alignment
   - Validates CANON_INVENTORY integrity
   - Creates evidence artifacts
   - Updates sync state

4. **Drift Detection Script** (`.github/scripts/check-governance-drift.sh`)
   - Fast integrity checks for pre-commit and CI
   - Validates critical governance files
   - Detects placeholder hashes and schema violations

5. **Merge Gate Integration** (`.github/workflows/merge-gate-interface.yml`)
   - `governance/alignment` job validates alignment state
   - Fails on degraded CANON_INVENTORY (placeholder hashes)
   - Warns on drift detection

---

## Ripple Event Flow

### Push Ripple (Primary Path)

```
Canonical Governance Repo
  ↓ (governance change merged to main)
  ↓ (dispatch workflow triggers)
  ↓ (repository_dispatch event sent)
  ↓
R_Roster receives event
  ↓ (governance-ripple-sync.yml triggers)
  ↓ (record to ripple-log.json)
  ↓ (run align-governance.sh)
  ↓ (detect drift)
  ↓
IF DRIFT DETECTED:
  → Create alignment PR
  → Update sync_state.json
  → Generate evidence artifacts
ELSE:
  → Update sync_state.json
  → Record successful alignment
```

### Scheduled Fallback (Recovery Path)

```
Hourly Cron Trigger
  ↓ (governance-alignment-schedule.yml)
  ↓ (check last sync time)
  ↓
IF >24 hours since last sync OR drift detected:
  ↓ (run align-governance.sh)
  ↓ (detect drift)
  ↓
  IF DRIFT DETECTED:
    → Create alignment PR
    → Create escalation file
    → Update sync_state.json
  ELSE:
    → Update sync_state.json
```

---

## Key Files and Directories

### Tracking Files

- **`.agent-admin/governance/ripple-log.json`**
  - Records all ripple events received
  - Schema version: 1.0.0
  - Tracks dispatch ID, canonical commit, timestamp

- **`.agent-admin/governance/sync_state.json`**
  - Current alignment state (ALIGNED, DRIFT_DETECTED, DEGRADED)
  - Last sync timestamp
  - Canonical source reference

### Evidence Artifacts

- **`.agent-admin/evidence/governance-liaison/`**
  - Session-specific evidence bundles
  - Alignment findings and validation results
  - Structured per EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md

### Canonical Governance Files

- **`governance/CANON_INVENTORY.json`**
  - Inventory of canonical governance files with SHA256 checksums
  - Must not contain placeholder hashes

- **`governance/TIER_0_CANON_MANIFEST.json`**
  - Tier 0 (constitutional) canon manifest
  - Validated in merge gate

- **`governance/canon/`**
  - Directory containing canonical governance policies
  - Layered down from canonical source

---

## Operational Procedures

### Manual Alignment Check

To manually check for governance drift:

```bash
.github/scripts/check-governance-drift.sh
```

**Exit codes:**
- `0` - No drift detected
- `1` - Drift detected

### Manual Alignment Execution

To manually execute alignment:

```bash
.github/scripts/align-governance.sh
```

**Exit codes:**
- `0` - Aligned successfully
- `1` - Drift detected (requires remediation)

### Triggering Manual Sync

To manually trigger ripple sync workflow:

```bash
gh workflow run governance-ripple-sync.yml
```

To force synchronization:

```bash
gh workflow run governance-ripple-sync.yml -f force_sync=true
```

### Reviewing Sync State

To check current alignment status:

```bash
cat .agent-admin/governance/sync_state.json
```

**Expected fields:**
- `alignment_state`: ALIGNED | DRIFT_DETECTED | DEGRADED
- `last_sync`: ISO-8601 timestamp
- `drift_detected`: boolean
- `canonical_source`: Repository reference

### Reviewing Ripple Events

To see ripple event history:

```bash
cat .agent-admin/governance/ripple-log.json | jq '.events'
```

---

## SLA and Expectations

### Service Level Agreement

Per CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md:

- **Push ripple dispatch**: Within 10 minutes of canonical merge
- **Scheduled fallback**: Every 60 minutes
- **Alignment PR creation**: Within 30 minutes of drift detection
- **Maximum drift window**: 24 hours

### Escalation Triggers

1. **Drift persists for >24 hours**
   - Escalation file created in `.agent-workspace/governance-liaison/escalation-inbox/`
   - CS2 notification required

2. **Placeholder hashes in CANON_INVENTORY**
   - Merge gate fails on `governance/alignment` job
   - Degraded mode - escalate per REQ-SS-004

3. **Three consecutive alignment failures**
   - Circuit breaker engaged
   - Manual intervention required

---

## Merge Gate Integration

### Governance/Alignment Job

The `governance/alignment` job in `merge-gate-interface.yml` validates:

1. **Sync state exists and is valid**
   - `.agent-admin/governance/sync_state.json` present
   - JSON schema valid
   - Alignment state not DRIFT_DETECTED

2. **CANON_INVENTORY integrity**
   - `governance/CANON_INVENTORY.json` present
   - No placeholder hashes (degrades to FAIL)
   - Valid SHA256 checksums

3. **TIER_0_CANON_MANIFEST integrity**
   - `governance/TIER_0_CANON_MANIFEST.json` present
   - No placeholder values
   - Valid JSON structure

### Failure Modes

**FAIL conditions:**
- CANON_INVENTORY contains placeholder hashes → degraded mode
- TIER_0_CANON_MANIFEST missing or invalid
- Critical governance files missing

**WARN conditions (pass with warning):**
- Sync state indicates drift → governance liaison should align
- Sync state missing → first-time setup
- Sync state in DEGRADED state → review required

---

## Security and Secrets

### Required Secrets

**`GITHUB_TOKEN`** (automatically provided by GitHub Actions)
- Used for: Committing sync state updates, creating evidence artifacts
- Permissions: `contents: write`, `pull-requests: read`

**`MATURION_BOT_TOKEN`** (optional - for PR automation)
- Used for: Creating alignment PRs automatically
- Permissions: `contents: write`, `pull-requests: write`, `issues: write`
- Setup: Configure in repository secrets (Settings → Secrets and variables → Actions)

### Token Best Practices

1. Use `GITHUB_TOKEN` for read operations
2. Use `MATURION_BOT_TOKEN` for PR automation (when available)
3. Never use personal access tokens in workflows
4. Scope tokens to minimum required permissions

---

## Troubleshooting

### Drift Detected But No Changes Made

**Symptoms:** Scheduled check reports drift, but no obvious changes

**Diagnosis:**
1. Run drift detection script: `.github/scripts/check-governance-drift.sh`
2. Review sync state: `cat .agent-admin/governance/sync_state.json`
3. Check for placeholder hashes: `jq '.canon_files[] | select(.sha256 == "placeholder")' governance/CANON_INVENTORY.json`

**Resolution:**
- If placeholder hashes found: Update with actual SHA256 checksums
- If sync state stale: Run alignment script manually
- If persistent: Escalate to CS2

### Ripple Events Not Received

**Symptoms:** No events in ripple-log.json, scheduled checks only

**Diagnosis:**
1. Check workflow runs: `gh run list --workflow=governance-ripple-sync.yml`
2. Verify repository is registered in canonical governance `CONSUMER_REPO_REGISTRY.json`
3. Check canonical governance dispatch workflow is running

**Resolution:**
- Verify repository registration in canonical governance
- Ensure `repository_dispatch` trigger is enabled
- Rely on scheduled fallback (runs hourly)

### Merge Gate Failing on Governance/Alignment

**Symptoms:** PRs blocked by `governance/alignment` check

**Diagnosis:**
1. Review workflow logs for specific failure reason
2. Check CANON_INVENTORY for placeholder hashes
3. Verify sync state is present and valid

**Resolution:**
- For placeholder hashes: Update CANON_INVENTORY with actual checksums
- For missing sync state: Run alignment script to create it
- For drift: Execute alignment to sync with canonical source

### Alignment Script Exits with Error

**Symptoms:** `align-governance.sh` exits with code 1

**This is expected behavior:** The script exits with code 1 when drift is detected to signal that remediation is needed. This is not a failure - it's drift detection working correctly.

**Next steps:**
- Review the script output to understand what drift was detected
- Execute layer-down from canonical governance (if authorized)
- Create alignment PR with required changes
- Re-run alignment script to verify resolution

---

## Governance Liaison Agent

The Governance Liaison agent is responsible for:
- Receiving and processing ripple events
- Executing alignment checks
- Creating alignment PRs
- Maintaining evidence artifacts
- Escalating persistent drift to CS2

**Unique authority:** Self-alignment for local governance artifacts (Issue #999)

**Contract location:** `.github/agents/governance-liaison-v2.md`

**Session memories:** `.agent-workspace/governance-liaison/memory/`

---

## References

### Canonical Governance Documents

- **CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md** - Ripple transport requirements
- **GOVERNANCE_RIPPLE_MODEL.md** - Bidirectional governance evolution
- **GOVERNANCE_ALIGNMENT_MONITORING_PROTOCOL.md** - Alignment monitoring standards
- **MERGE_GATE_INTERFACE_STANDARD.md** - Standard merge gate interface
- **EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md** - Evidence artifact requirements
- **GOVERNANCE_LIAISON_MINIMUM_APPOINTMENT_REQUIREMENTS.md** - Liaison authority and constraints

### Related Files

- `.github/workflows/governance-ripple-sync.yml` - Repository dispatch receiver
- `.github/workflows/governance-alignment-schedule.yml` - Scheduled alignment checks
- `.github/scripts/align-governance.sh` - Alignment orchestration
- `.github/scripts/check-governance-drift.sh` - Fast drift detection
- `.agent-admin/governance/ripple-log.json` - Ripple event log
- `.agent-admin/governance/sync_state.json` - Current alignment state

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-02-14 | Initial governance ripple system installation |

---

**Authority**: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md, GOVERNANCE_RIPPLE_MODEL.md  
**Compliance**: EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md, MERGE_GATE_INTERFACE_STANDARD.md  
**Maintained by**: Governance Liaison Agent  
**Last Updated**: 2026-02-14
