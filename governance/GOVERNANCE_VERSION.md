# Governance Version

**Repository**: R_Roster  
**Governance State**: ALIGNED (Structure)  
**Last Updated**: 2026-01-11

## Governance Authority

This repository is governed by the canonical governance framework located at:

**Repository**: `https://github.com/APGI-cmy/maturion-foreman-governance`

### Generic Canon
- **Path**: `/governance/canon/**`
- **Content**: Universal governance rules, policies, and specifications
- **Reference**: `main` branch

### Repo-Specific Mappings
- **Path**: `/apps/R_Roster/mappings/**`
- **Content**: Repository-specific implementations and workflow configurations
- **Reference**: `main` branch

## FPC Compliance

This repository follows the **Foreman Process Canon (FPC)** as defined in:
- `governance/canon/FPC_REPOSITORY_LAYERDOWN_GUIDE.md`

Required FPC structure elements:
- ✅ `.github/agents/` - Agent definitions present
- ✅ `.github/workflows/` - Workflow directory (to be populated)
- ✅ `.architecture/` - Architecture specifications directory
- ✅ `.qa/` - QA and test artifacts directory
- ✅ `governance/` - Local governance metadata

## Realignment History

### 2026-01-11: Post-Restructure FPC Realignment
- **Action**: Pointer and metadata realignment following governance repo restructure
- **Changes**:
  - Updated all agent files to reference new governance structure
  - Created missing FPC-expected directories (`.architecture/`, `.qa/`, `governance/`)
  - Updated governance references from old paths to:
    - Generic canon: `governance/canon/**`
    - Repo mappings: `apps/R_Roster/mappings/**`
- **Status**: Structure aligned, content implementation pending

## Current Governance Version

**Identifier**: FPC-Post-Restructure-2026-01-11  
**Agent Framework Version**: 2.0.0+  
**FM Version**: 4.0.0  
**Builder Contract Schema**: 2.0

## Tier-0 Constitutional Documents

This repository is bound by all 14 Tier-0 constitutional governance documents as referenced in:
- `.github/agents/ForemanApp-agent.md` (governance.bindings section)

Key constitutional requirements:
- Zero Test Debt
- 100% QA Pass Rate
- One-Time Build Correctness
- Build-to-Green Enforcement
- Design Freeze before Build
- Architecture Conformance
- Protected Paths (governance, workflows)

## References

- **Governance Canon Repository**: https://github.com/APGI-cmy/maturion-foreman-governance
- **FPC Guide**: https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/FPC_REPOSITORY_LAYERDOWN_GUIDE.md
- **Build Philosophy**: Defined in `BUILD_PHILOSOPHY.md` (governance canon)

## Notes

This realignment focused on pointer and metadata updates only. No changes to governance content or meaning were made. This is structural alignment in preparation for full FPC implementation.

---

*Established during FPC realignment: 2026-01-11*
