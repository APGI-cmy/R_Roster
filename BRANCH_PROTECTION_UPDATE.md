# Branch Protection Update Guide

**Date**: 2026-02-12  
**PR**: Unified Merge Gate Interface Implementation  
**Authority**: MERGE_GATE_INTERFACE_STANDARD.md

---

## Required Branch Protection Changes

After merging this PR, update GitHub branch protection settings to require the new standardized check contexts.

### Step-by-Step Instructions

1. **Navigate to Repository Settings**
   - Go to: `https://github.com/APGI-cmy/R_Roster/settings/branch_protection_rules`
   - Or: Settings → Branches → Branch protection rules

2. **Edit Branch Protection Rule for `main`**
   - Click "Edit" on the protection rule for `main` branch
   - Scroll to "Require status checks to pass before merging"

3. **Add Required Status Checks**

   Add these **three** exact contexts as required:
   ```
   Merge Gate Interface / merge-gate/verdict
   Merge Gate Interface / governance/alignment
   Merge Gate Interface / stop-and-fix/enforcement
   ```

   **Important**: Context names are case-sensitive and must match exactly.

4. **Make Legacy Gates Optional**

   Change these to **optional** (uncheck if currently required):
   ```
   Deprecation Detection Gate
   Pre-Implementation Review Gate / check-pre-implementation-review
   YAML Validation / yamllint
   ```

   These will continue to run but won't block merges during the grace period.

5. **Save Changes**
   - Click "Save changes" at the bottom
   - Verify the new required checks appear in the branch protection rule summary

---

## Verification

After updating branch protection:

1. **Create a Test PR**
   - Make a trivial change (e.g., update README)
   - Create PR to `main`
   - Verify three new gate contexts appear as required checks

2. **Verify Gate Behavior**
   - All three contexts should appear in PR checks
   - Status should be "Pending" → "Running" → "Pass/Fail"
   - Legacy gates should still run but marked as optional

3. **Test Evidence Bundle**
   ```bash
   # In a new branch
   .github/scripts/create-evidence-bundle.sh YOUR_PR_NUMBER
   # Create PREHANDOVER_PROOF_*.md
   # Commit and push
   # Verify gates pass
   ```

---

## Expected Behavior

### New Required Checks
- **merge-gate/verdict**: Validates evidence artifacts, JSON schema, policy compliance
- **governance/alignment**: Validates canon manifest, detects drift
- **stop-and-fix/enforcement**: Validates RCA requirements, checks for unresolved issues

### Optional Checks (Still Run)
- **Deprecation Detection Gate**: Continues to check for deprecated APIs
- **Pre-Implementation Review Gate**: Continues to check for enhancement reviews
- **YAML Validation**: Continues to validate YAML syntax

### Grace Period Behavior
- Both new and old gates coexist
- Old gates don't block merges
- New gates are authoritative
- Grace period ends: 2026-04-12

---

## Troubleshooting

### Issue: New contexts don't appear in PR

**Cause**: Workflow hasn't run yet, or PR is from before workflow merge

**Solution**:
1. Ensure this PR is merged to main
2. Rebase or update branch from main
3. Push change to trigger workflow

---

### Issue: Context names don't match

**Cause**: Typo in branch protection settings

**Solution**:
- Remove incorrect context
- Re-add with exact name from list above
- Names are case-sensitive, include all spaces and slashes

---

### Issue: Old gates still required

**Cause**: Branch protection settings not updated

**Solution**:
- Edit branch protection rule
- Uncheck old gate contexts
- Save changes

---

## After Grace Period (2026-04-12)

1. **Archive Legacy Workflows**
   - Move old workflow files to `.github/workflows/archived/`
   - Add deprecation notice to workflow files
   - Update MIGRATION_GUIDE.md with removal notice

2. **Remove from Branch Protection**
   - Remove optional checks from branch protection (cleanup)
   - Only three required contexts remain

3. **Update Documentation**
   - Remove references to legacy gates
   - Update README if it mentions old gates
   - Archive migration guide

---

## Contact

For issues or questions:
- Review: MIGRATION_GUIDE.md
- Escalate to: Foreman (FM) for gate-specific issues
- Escalate to: CS2 for constitutional/authority issues

---

**Version**: 1.0.0  
**Last Updated**: 2026-02-12  
**Authority**: MERGE_GATE_INTERFACE_STANDARD.md
