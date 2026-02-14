# Patterns - Governance Liaison

## Pattern: Ripple Infrastructure Installation
- Observed: 2026-02-14 (Session 001)
- Context: Installing governance ripple receiver and alignment infrastructure in consumer repository
- Components Required:
  - Repository dispatch receiver workflow (`.github/workflows/governance-ripple-sync.yml`)
  - Scheduled fallback workflow (`.github/workflows/governance-alignment-schedule.yml`)
  - Alignment orchestration script (`.github/scripts/align-governance.sh`)
  - Drift detection script (`.github/scripts/check-governance-drift.sh`)
  - Ripple event tracking log (`.agent-admin/governance/ripple-log.json`)
  - Merge gate integration (enhance existing `governance/alignment` job)
  - Documentation (`docs/GOVERNANCE_RIPPLE_SYSTEM.md`, README updates)
- Response:
  1. Study canonical governance protocols first
  2. Create workflows before scripts (workflows call scripts)
  3. Test scripts immediately after creation
  4. Enhance existing workflows rather than replace
  5. Document comprehensively including troubleshooting
  6. Update README with token requirements

## Pattern: Evidence Artifact Creation in Workflows
- Observed: 2026-02-14 (Session 001)
- Context: Governance workflows must create evidence artifacts per EVIDENCE_ARTIFACT_BUNDLE_STANDARD.md
- Structure:
  ```
  .agent-admin/evidence/governance-liaison/<session-type>-<timestamp>/
  ├── evidence-log.json
  ├── alignment-findings.md (if applicable)
  └── validation-results.txt (if applicable)
  ```
- Response:
  1. Create evidence directory with timestamp
  2. Generate structured evidence-log.json
  3. Include session type, trigger, drift status, alignment status
  4. Reference tracking files (ripple-log.json, sync_state.json)
  5. Commit evidence artifacts automatically ([skip ci])

## Pattern: Drift Detection Script Design
- Observed: 2026-02-14 (Session 001)
- Context: Fast integrity checks for pre-commit and CI integration
- Requirements:
  - Sub-second execution time
  - No external dependencies
  - Clear exit codes (0=aligned, 1=drift)
  - Validate critical files (CANON_INVENTORY, TIER_0_CANON_MANIFEST, sync_state)
  - Check for placeholder hashes
  - Validate JSON structure
- Response:
  1. Check file existence first (fast fail)
  2. Validate JSON syntax (jq empty)
  3. Check for placeholder hashes (jq queries)
  4. Validate directory structure (canon/, schemas/)
  5. Exit with appropriate code
  6. Document exit code semantics

## Pattern: Alignment Orchestration Script Design
- Observed: 2026-02-14 (Session 001)
- Context: Comprehensive drift detection and remediation orchestration
- Phases:
  1. Validate local governance structure
  2. Check CANON_INVENTORY integrity
  3. Verify governance directory structure
  4. Check sync state status
  5. Summary and recommendations
  6. Update sync state
  7. Create evidence artifacts
- Response:
  - Track missing files, validation errors separately
  - Provide actionable recommendations
  - Exit 1 if drift detected (signal remediation needed)
  - Create evidence bundle with findings
  - Update sync state with current check results

## Pattern: Merge Gate Integration for Governance Alignment
- Observed: 2026-02-14 (Session 001)
- Context: Validating governance alignment on every PR
- Job: `governance/alignment` in merge-gate-interface.yml
- Checks:
  1. Use drift detection script if available (fallback to manual checks)
  2. Check CANON_INVENTORY for placeholder hashes (FAIL if found)
  3. Check TIER_0_CANON_MANIFEST validity (FAIL if invalid)
  4. Warn on drift (PASS with warning - liaison handles alignment)
- Response:
  - FAIL on degraded manifest (placeholder hashes)
  - FAIL on missing/invalid critical files
  - WARN on drift (but don't block - liaison aligns)
  - PASS on aligned state

## Pattern: Scheduled Fallback Workflow Design
- Observed: 2026-02-14 (Session 001)
- Context: Hourly scheduled governance alignment checks per SLA
- Requirements:
  - Run every hour (cron: '0 * * * *')
  - Check last sync time from sync_state.json
  - Detect if >24 hours since last sync
  - Run drift detection
  - Execute alignment if needed
  - Create escalation if drift persists
- Response:
  1. Check last sync time
  2. Calculate hours since last sync
  3. Run drift detection script
  4. Execute alignment if drift or >24h
  5. Update sync state
  6. Create evidence artifacts
  7. Escalate if drift persists

## Pattern: Token Documentation for Automation
- Observed: 2026-02-14 (Session 001)
- Context: GitHub workflows require different tokens for different operations
- Tokens:
  - GITHUB_TOKEN: Automatically provided, read/write contents, read PRs
  - MATURION_BOT_TOKEN: Optional, enables automated PR creation
- Response:
  1. Document which token is used where
  2. Explain what each token enables
  3. Clarify which tokens are optional vs required
  4. Provide setup instructions for optional tokens
  5. Explain impact if optional token not configured

---
Created: Session 001 | Date: 2026-02-14
