# Branch Protection Configuration Instructions

## Automatic Configuration (Recommended)

Use the GitHub API to apply the configuration from `BRANCH_PROTECTION_CONFIG.json`:

```bash
# Set your GitHub token
export GITHUB_TOKEN="your_github_token_here"

# Apply branch protection
curl -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/APGI-cmy/R_Roster/branches/main/protection \
  -d @governance/evidence/commissioning/BRANCH_PROTECTION_CONFIG.json
```

## Manual Configuration (via GitHub UI)

If API access is not available, configure via GitHub UI:

1. Navigate to: https://github.com/APGI-cmy/R_Roster/settings/branches
2. Click "Add branch protection rule"
3. Configure as follows:

### Branch name pattern
- `main`

### Protect matching branches
- ✅ Require a pull request before merging
  - ✅ Require approvals: 1
  - ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Require status checks to pass before merging
  - ✅ Require branches to be up to date before merging
  - Required status checks: `validate-structure`
- ✅ Require conversation resolution before merging
- ✅ Do not allow bypassing the above settings
- ❌ Allow force pushes (disabled)
- ❌ Allow deletions (disabled)

## Verification

After configuration, verify branch protection is active:

```bash
curl -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/APGI-cmy/R_Roster/branches/main/protection
```

## Configuration Details

The configuration enforces:
- **PR Required**: All changes must go through pull requests
- **Status Checks**: `validate-structure` workflow must pass
- **Code Review**: 1 approving review required
- **Conversation Resolution**: All review comments must be resolved
- **No Force Push**: Prevents rewriting history on main branch
- **No Deletions**: Prevents accidental branch deletion

## Status

**Configuration File**: ✅ Created (`BRANCH_PROTECTION_CONFIG.json`)  
**Applied**: ⏸️ Pending (requires GitHub token or manual UI configuration)  
**Verified**: ⏸️ Pending (after application)

---

**Created**: 2026-01-11  
**Authority**: Governance Liaison Agent  
**Reference**: FPC § 4.8 - Branch Protection Requirements
