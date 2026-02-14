# Governance Ripple Receiver - Testing Guide

**Document Purpose**: Step-by-step testing procedure for governance ripple receiver  
**Authority**: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md  
**Repository**: APGI-cmy/R_Roster  
**Date**: 2026-02-14

---

## Prerequisites

✅ PR with ripple receiver infrastructure has been **merged to default branch**  
✅ You have access to GitHub CLI (`gh`) or GitHub web interface  
✅ You have appropriate repository permissions

**Important**: This testing can only be performed **after merge to default branch**.  
GitHub does not process `repository_dispatch` events from feature branches.

---

## Test 1: Manual Workflow Trigger

### Purpose
Verify the workflow can be manually triggered and executes successfully.

### Steps

1. **Via GitHub CLI**:
   ```bash
   gh workflow run governance-ripple-sync.yml \
     --repo APGI-cmy/R_Roster \
     --ref main \
     --field force_sync=true
   ```

2. **Via GitHub Web Interface**:
   - Navigate to: `https://github.com/APGI-cmy/R_Roster/actions`
   - Click on "Governance Ripple Sync" workflow
   - Click "Run workflow" button
   - Select branch: `main` (or default branch name)
   - Set `force_sync`: `true`
   - Click "Run workflow"

### Expected Results

✓ Workflow execution starts  
✓ Job "governance-ripple-receiver" runs  
✓ All steps complete successfully:
  - Checkout repository
  - Record ripple event (manual trigger)
  - Execute alignment check
  - Update sync state
  - Create alignment evidence
  - Commit ripple tracking updates

### Verification

Check the following files were updated:

```bash
# Check ripple log
cat .agent-admin/governance/ripple-log.json

# Check sync state
cat .agent-admin/governance/sync_state.json

# Check evidence bundle created
ls -la .agent-admin/evidence/governance-liaison/
```

**Expected in ripple-log.json**:
```json
{
  "events": [
    {
      "timestamp": "2026-02-14T...",
      "trigger": "workflow_dispatch",
      "force_sync": "true"
    }
  ]
}
```

---

## Test 2: Repository Dispatch Event Reception

### Purpose
Verify the workflow can receive and process actual ripple events from canonical governance repository.

### Steps

**Note**: This requires coordination with canonical governance repository administrator.

1. **Request test ripple dispatch** from `APGI-cmy/maturion-foreman-governance`:
   - Contact governance repository administrator (or use appropriate process)
   - Request test governance ripple dispatch to `APGI-cmy/R_Roster`
   - Canonical repo should dispatch event with payload:
     ```json
     {
       "event_type": "governance_ripple",
       "client_payload": {
         "canonical_commit": "<commit-sha>",
         "inventory_version": "<version>",
         "dispatch_id": "<unique-id>",
         "sender": "<sender-identifier>"
       }
     }
     ```

2. **Monitor workflow execution**:
   ```bash
   gh run list --repo APGI-cmy/R_Roster --workflow=governance-ripple-sync.yml
   ```

   Or via web: `https://github.com/APGI-cmy/R_Roster/actions`

### Expected Results

✓ Workflow automatically triggered by `repository_dispatch` event  
✓ Event payload extracted and logged  
✓ Ripple event details recorded to ripple-log.json:
  - Canonical commit SHA
  - Inventory version
  - Dispatch ID
  - Sender
✓ Alignment check executed  
✓ Sync state updated  
✓ Evidence bundle created  
✓ Changes committed to repository

### Verification

```bash
# Check latest ripple log entry
cat .agent-admin/governance/ripple-log.json | jq '.events[-1]'

# Expected output:
# {
#   "timestamp": "2026-02-14T...",
#   "canonical_commit": "<commit-sha>",
#   "inventory_version": "<version>",
#   "dispatch_id": "<unique-id>",
#   "sender": "<sender>",
#   "trigger": "repository_dispatch"
# }

# Check sync state
cat .agent-admin/governance/sync_state.json

# Check evidence bundle
ls -la .agent-admin/evidence/governance-liaison/ripple-*/
```

---

## Test 3: Drift Detection and Alignment

### Purpose
Verify the workflow detects governance drift and creates alignment PR.

### Steps

**Note**: This test requires intentionally creating governance drift.

1. **Create drift** (on a test branch):
   ```bash
   git checkout -b test-drift-detection
   # Remove or modify a governance file
   rm governance/some-canon-file.md
   git commit -am "Test: Create governance drift"
   git push origin test-drift-detection
   ```

2. **Trigger ripple receiver**:
   ```bash
   gh workflow run governance-ripple-sync.yml \
     --repo APGI-cmy/R_Roster \
     --ref test-drift-detection \
     --field force_sync=true
   ```

### Expected Results

✓ Workflow detects missing governance file  
✓ Drift detected flag set to `true`  
✓ Alignment script creates PR to restore governance files  
✓ Sync state updated with drift status  
✓ Evidence bundle documents drift resolution

### Verification

```bash
# Check drift detection in sync state
cat .agent-admin/governance/sync_state.json | jq '.drift_detected'
# Expected: true

# Check for alignment PR
gh pr list --repo APGI-cmy/R_Roster --label governance-alignment
```

---

## Test 4: Evidence Bundle Creation

### Purpose
Verify proper evidence artifacts are created per EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md.

### Steps

After any workflow execution (Test 1, 2, or 3):

```bash
# Find latest evidence bundle
LATEST_EVIDENCE=$(ls -td .agent-admin/evidence/governance-liaison/ripple-* | head -1)
echo "Latest evidence: $LATEST_EVIDENCE"

# Verify evidence structure
ls -la "$LATEST_EVIDENCE"
```

### Expected Results

✓ Evidence directory created with timestamp  
✓ `evidence-log.json` exists and is valid JSON  
✓ Evidence log contains:
  - Session type
  - Timestamp
  - Trigger type
  - Drift detection status
  - Alignment status

### Verification

```bash
# Validate evidence-log.json
cat "$LATEST_EVIDENCE/evidence-log.json" | jq .

# Check required fields
cat "$LATEST_EVIDENCE/evidence-log.json" | jq '{
  session_type,
  timestamp,
  trigger,
  drift_detected,
  alignment_status
}'
```

---

## Troubleshooting

### Workflow Not Appearing

**Problem**: Can't find "Governance Ripple Sync" in Actions tab

**Solution**:
- Verify workflow file is on default branch: `git show origin/main:.github/workflows/governance-ripple-sync.yml`
- Check workflow file has valid YAML syntax
- Ensure workflow file is in `.github/workflows/` directory

### Workflow Not Triggering on repository_dispatch

**Problem**: Manual trigger works but repository_dispatch doesn't

**Causes**:
1. Workflow not on default branch (GitHub limitation)
2. Event type mismatch (must be exactly `governance_ripple`)
3. Repository not authorized to receive dispatches

**Solution**:
- Confirm workflow is merged to default branch
- Verify dispatch event uses type `governance_ripple`
- Check repository settings for webhook/dispatch permissions

### Alignment Script Fails

**Problem**: Alignment check step fails

**Causes**:
1. Missing governance files
2. Script execution permissions
3. Missing dependencies (jq, git)

**Solution**:
```bash
# Check script permissions
ls -la .github/scripts/align-governance.sh

# Make executable if needed
chmod +x .github/scripts/align-governance.sh

# Test script manually
.github/scripts/align-governance.sh
```

### No Evidence Bundle Created

**Problem**: Evidence directory not created

**Causes**:
1. Workflow lacks write permissions
2. Directory creation failed
3. Commit step skipped

**Solution**:
- Verify workflow has `contents: write` permission
- Check workflow logs for error messages
- Ensure `.agent-admin/` is not in `.gitignore`

---

## Success Criteria

After completing all tests, you should have:

✅ At least one successful workflow run (manual trigger)  
✅ At least one ripple event logged in `ripple-log.json`  
✅ Updated `sync_state.json` with current timestamp  
✅ Evidence bundle(s) created in `.agent-admin/evidence/governance-liaison/`  
✅ All workflow steps completed without errors  
✅ Commits from workflow visible in git history

---

## Next Steps

After successful testing:

1. ✅ Document test results in repository
2. ✅ Notify canonical governance repository that receiver is operational
3. ✅ Monitor ripple events for ongoing governance alignment
4. ✅ Review evidence bundles periodically for audit trail

---

## Support

For issues or questions:
- Review workflow logs in Actions tab
- Check evidence bundles for detailed execution records
- Consult CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md
- Escalate to governance repository administrator if needed

---

**Authority**: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md  
**Session**: Governance Liaison - Session 001 (2026-02-14)  
**Living Agent System**: v6.2.0
