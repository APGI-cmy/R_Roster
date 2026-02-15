# CS2 Escalation: Protocol Violation in Governance Ripple Implementation

**Type**: GOVERNANCE_GAP  
**Priority**: MEDIUM  
**Date**: 2026-02-15  
**Session**: Foreman investigation of governance ripple  
**Agent**: foreman  
**Authority**: CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md §4

---

## Issue Summary

The canonical governance repository (APGI-cmy/maturion-foreman-governance) is **NOT following** its own protocol specification defined in CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md §4.

This creates a discrepancy between:
1. What the protocol document specifies
2. What the canonical repo actually implements
3. What consumer repos expect to receive

---

## Evidence

### Protocol Specification (CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md §4)

```json
{
  "event_type": "governance_ripple",
  "canonical_commit": "<sha>",
  "inventory_version": "<version>",
  "changed_paths": ["..."],
  "sender": "APGI-cmy/maturion-foreman-governance",
  "dispatch_id": "<uuid>",
  "timestamp": "<iso-8601>"
}
```

### Actual Implementation (governance-ripple-dispatch.yml)

```bash
gh api repos/$repo/dispatches \
  -f event_type="governance_ripple" \
  -f client_payload[source_repo]="APGI-cmy/maturion-foreman-governance" \
  -f client_payload[commit_sha]="$COMMIT_SHA" \
  -f client_payload[commit_message]="$COMMIT_MESSAGE" \
  -f client_payload[timestamp]="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
```

### Field Name Comparison

| Protocol Spec | Actual Implementation | Present? |
|--------------|----------------------|----------|
| canonical_commit | commit_sha | ✅ (different name) |
| inventory_version | — | ❌ Missing |
| dispatch_id | — | ❌ Missing |
| sender | source_repo | ✅ (different name) |
| changed_paths | — | ❌ Missing |
| timestamp | timestamp | ✅ Match |
| — | commit_message | ➕ Extra field |

---

## Impact Assessment

### Current Impact: MEDIUM
- **Functional**: Minimal - ripple events still trigger workflows
- **Audit Trail**: HIGH - field names don't match, causing empty values in logs
- **Governance Compliance**: HIGH - protocol document doesn't match reality
- **Consumer Confusion**: MEDIUM - repos don't know which field names to use

### Affected Repositories
All consumer repositories reading `client_payload` fields:
- APGI-cmy/R_Roster (using protocol spec names → empty values)
- APGI-cmy/maturion-isms (field usage unknown)
- APGI-cmy/maturion-foreman-office-app (field usage unknown)
- APGI-cmy/PartPulse (field usage unknown)

---

## Root Cause

**Hypothesis**: Protocol document was written as specification, but implementation diverged without updating the canon.

**Evidence**:
1. Protocol document date: 2026-02-10
2. Workflow implementation predates protocol formalization
3. No alignment check between protocol spec and workflow implementation

---

## Remediation Options

### Option 1: Update Protocol to Match Implementation (RECOMMENDED)

**Action**: Update CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md §4 to reflect actual payload structure.

**Pros**:
- ✅ Minimal code changes (only documentation)
- ✅ Current implementation is working
- ✅ Field names are more descriptive (commit_message vs inventory_version)
- ✅ Fast to implement

**Cons**:
- ⚠️ Protocol loses some specified fields (inventory_version, dispatch_id, changed_paths)
- ⚠️ May reduce audit trail quality

**Changes Required**:
```markdown
## 4. Dispatch Payload Format

Payload (JSON) MUST include:

{
  "event_type": "governance_ripple",
  "source_repo": "APGI-cmy/maturion-foreman-governance",
  "commit_sha": "<sha>",
  "commit_message": "<message>",
  "timestamp": "<iso-8601>"
}
```

### Option 2: Update Implementation to Match Protocol

**Action**: Modify governance-ripple-dispatch.yml to send protocol-compliant payload.

**Pros**:
- ✅ Implementation follows canonical specification
- ✅ Better audit trail (dispatch_id, inventory_version, changed_paths)
- ✅ Protocol remains unchanged

**Cons**:
- ⚠️ Requires code changes in canonical repo
- ⚠️ Requires updates in ALL consumer repos
- ⚠️ More complex (need to generate UUIDs, track inventory versions)
- ⚠️ Higher risk of breaking existing integrations

**Changes Required**:
1. Update governance-ripple-dispatch.yml to send correct fields
2. Update all 4 consumer repos to read correct fields
3. Test ripple propagation end-to-end

### Option 3: Accept Divergence (NOT RECOMMENDED)

**Action**: Document that protocol spec is "aspirational" and implementation may vary.

**Pros**:
- ✅ No immediate changes needed

**Cons**:
- ❌ Governance integrity compromised
- ❌ Consumer repos don't know which spec to follow
- ❌ Future maintainability issues

---

## Recommendation

**Adopt Option 1**: Update protocol document to match current implementation.

**Rationale**:
1. Current implementation is working and stable
2. Consumer repos can immediately align to known-good implementation
3. Minimal disruption to running system
4. Can add missing fields (inventory_version, dispatch_id, changed_paths) in future enhancement

**Additional Enhancement**: Add missing fields incrementally:
- Phase 1: Update protocol to match current (commit_sha, commit_message, source_repo)
- Phase 2: Add inventory_version (from CANON_INVENTORY.json)
- Phase 3: Add dispatch_id (generate UUID)
- Phase 4: Add changed_paths (from git diff)

---

## Proposed Canon Update

**File**: governance/canon/CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md  
**Section**: §4 Dispatch Payload Format

**Current**:
```markdown
## 4. Dispatch Payload Format

Payload (JSON) MUST include:

{
  "event_type": "governance_ripple",
  "canonical_commit": "<sha>",
  "inventory_version": "<version>",
  "changed_paths": ["..."],
  "sender": "APGI-cmy/maturion-foreman-governance",
  "dispatch_id": "<uuid>",
  "timestamp": "<iso-8601>"
}
```

**Proposed**:
```markdown
## 4. Dispatch Payload Format

Payload (JSON) MUST include:

{
  "event_type": "governance_ripple",
  "source_repo": "APGI-cmy/maturion-foreman-governance",
  "commit_sha": "<sha>",
  "commit_message": "<message>",
  "timestamp": "<iso-8601>"
}

### Optional Fields (Future Enhancement)
{
  "inventory_version": "<version>",     // From CANON_INVENTORY.json
  "dispatch_id": "<uuid>",             // Generated unique identifier
  "changed_paths": ["path1", "path2"] // Files modified in trigger commit
}
```

---

## CS2 Decision Required

**Question**: Which remediation option should be pursued?

**Options**:
1. ✅ Update protocol to match implementation (RECOMMENDED)
2. ⚠️ Update implementation to match protocol
3. ❌ Accept divergence (NOT RECOMMENDED)

**Additional Questions**:
1. Should we add missing fields (inventory_version, dispatch_id, changed_paths) in future?
2. Should we create a standard for protocol vs implementation alignment checks?
3. Should we audit other protocols for similar divergences?

---

## Testing Plan (If Option 1 Approved)

1. Update CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md in canonical repo
2. Update R_Roster workflow to read correct field names (DONE)
3. Update other consumer repos (ISMS, PartPulse, foreman-office-app)
4. Trigger governance change to test ripple propagation
5. Verify payload fields populated correctly in all repos
6. Close escalation

---

## Authority & References

- **CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md**: Protocol specification (needs update)
- **GOVERNANCE_ALIGNMENT_MONITORING_PROTOCOL.md**: Alignment monitoring requirements
- **LIVING_AGENT_SYSTEM.md v6.2.0**: Governance integrity requirements
- **ESCALATION_POLICY.md**: Protocol violation escalation trigger

---

**Created**: 2026-02-15  
**Agent**: foreman  
**Session**: governance-ripple-investigation  
**Status**: AWAITING CS2 DECISION  
**Urgency**: MEDIUM (functional impact low, governance integrity high)
