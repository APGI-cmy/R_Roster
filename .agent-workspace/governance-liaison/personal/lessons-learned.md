# Lessons Learned - Governance Liaison

## Session 20260214

### Lesson: Always Explore Canonical Governance Before Implementation
- Context: When implementing governance infrastructure
- Pattern: Review canonical governance protocols (CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md, GOVERNANCE_RIPPLE_MODEL.md, GOVERNANCE_ALIGNMENT_MONITORING_PROTOCOL.md) before writing any code
- Action: Read canonical requirements first, then implement to specification
- Benefit: Ensures compliance with governance mandates, avoids rework

### Lesson: Test Scripts Immediately After Creation
- Context: When creating new governance scripts
- Pattern: Run scripts immediately after making them executable to validate logic
- Action: `bash .github/scripts/check-governance-drift.sh` right after creation
- Benefit: Catches bugs early, validates assumptions, confirms current state

### Lesson: Evidence Artifacts Must Be Automated
- Context: All governance alignment actions
- Pattern: Workflows must create evidence artifacts automatically, not rely on manual steps
- Action: Include evidence creation steps in workflow jobs
- Benefit: Ensures compliance with EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md, provides audit trail

### Lesson: Minimal Changes Principle for Existing Workflows
- Context: Enhancing existing governance workflows
- Pattern: Prefer enhancing existing jobs over replacing them
- Action: Add automated drift detection to existing governance/alignment job
- Benefit: Preserves existing logic, reduces risk, maintains stability

### Lesson: Exit Code Semantics Matter for Drift Detection
- Context: Scripts that detect governance drift
- Pattern: Exit 1 when drift detected (signal remediation needed), exit 0 when aligned
- Action: Document exit code semantics clearly in script comments
- Benefit: Calling code can distinguish between states, enables automation

### Lesson: Documentation Must Include Troubleshooting
- Context: Complex governance systems
- Pattern: Include troubleshooting section with symptoms, diagnosis, resolution
- Action: Create docs/GOVERNANCE_RIPPLE_SYSTEM.md with comprehensive troubleshooting guide
- Benefit: Reduces support burden, enables self-service resolution

### Lesson: Token Requirements Must Be Clear
- Context: Automation requiring GitHub tokens
- Pattern: Document which token (GITHUB_TOKEN vs MATURION_BOT_TOKEN), what it's used for, whether optional
- Action: Add clear token documentation to README and system docs
- Benefit: Users understand requirements, can configure appropriately

### Lesson: Scheduled Workflows Require Careful Frequency Selection
- Context: Scheduled governance alignment checks
- Pattern: Follow canonical protocol requirements (hourly per CROSS_REPO_RIPPLE_TRANSPORT_PROTOCOL.md)
- Action: Implement as specified, document rationale
- Benefit: Ensures SLA compliance, provides predictable execution pattern

## Session 2026-02-15

### Lesson: Enhance Before Replace
- Context: When encountering "missing" functionality, verify existing implementation first
- Pattern: Issue says "workflow missing" but workflow may exist with gaps
- Action: Explore thoroughly, identify gaps, enhance rather than recreate

### Lesson: Exit Code as Signal, Not Failure
- Context: Scripts that exit with non-zero codes on expected conditions
- Pattern: `align-governance.sh` exits 1 when drift detected (expected behavior)
- Action: Wrap in conditional, capture exit code, use as signal not failure indicator

### Lesson: Null-Safe jq Queries
- Context: Working with JSON structures that may have null/missing fields
- Pattern: `jq '.field[]'` fails on null, use `jq '(.field // [])[]'` instead
- Action: Always use null-coalescing operator for arrays that might not exist

### Lesson: rsync for Governance Sync
- Context: Syncing governance files from canonical repository
- Pattern: Need to preserve structure, handle deletions, exclude local-only files
- Action: Use `rsync -av --delete --exclude=.git --exclude=*.log --exclude=sync_state.json`

### Lesson: CANON_INVENTORY Structure Variance
- Context: Different repositories may organize CANON_INVENTORY differently
- Pattern: Some use `canon_files[]`, others use `checklists[]` and `agent_contracts[]`
- Action: Write flexible queries that handle structure variations

### Lesson: Governance Liaison Unique Authority
- Context: Self-alignment of governance artifacts
- Pattern: No CS2 approval needed for governance sync from canonical
- Action: Execute alignment, document in session memory, create evidence, proceed with mission

### Lesson: Evidence-First Operations
- Context: Living Agent System v6.2.0 compliance
- Pattern: Every governance action needs evidence artifacts
- Action: Create evidence bundles, update sync_state, log ripple events, maintain session memory
