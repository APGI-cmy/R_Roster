# GOVERNANCE VERSION

**Repository**: APGI-cmy/R_Roster  
**Governance Status**: PARTIAL  
**Last Updated**: 2026-01-11

---

## Governance Repository Reference

**Canonical Governance Source**: https://github.com/APGI-cmy/maturion-foreman-governance

**Structure**:
- **Generic Canon**: `governance/canon/**` - Universal governance rules and policies
- **Repo-Specific Mappings**: `apps/R_Roster/mappings/**` - R_Roster-specific implementations

---

## Governance Version Information

**Governance Canon Version**: Post-restructure (2026-01)  
**FPC Guide**: `governance/canon/FPC_REPOSITORY_LAYERDOWN_GUIDE.md`

---

## Realignment History

### 2026-01-11: Post-Restructure FPC Realignment
- **Action**: Pointer and metadata alignment to new maturion-foreman-governance structure
- **Changes**:
  - Created `governance/GOVERNANCE_VERSION.md` to track governance version
  - Updated references to point to restructured governance repository:
    - Generic rules: `governance/canon/**`
    - Repo-specific mappings: `apps/R_Roster/mappings/**`
  - Confirmed agent contracts reference correct governance paths
- **Status**: Alignment complete for existing governance artifacts
- **Note**: Full governance initialization remains pending (see gap analysis in `governance/reports/`)

### 2026-01-10: Governance Gap Analysis
- **Action**: Comprehensive gap analysis performed by Governance Liaison Agent
- **Results**: Repository classified as `PARTIAL` governance state
- **Documentation**: See `governance/reports/R_ROSTER_GOVERNANCE_GAP_ANALYSIS.md`

---

## Current Governance State

### Present Governance Artifacts
- ✅ `.github/agents/` - Agent contract definitions (9 agents)
- ✅ `governance/reports/` - Gap analysis documentation
- ✅ `governance/events/` - Governance visibility events
- ✅ `governance/GOVERNANCE_VERSION.md` - This file (version tracking)

### Missing Critical Artifacts (Per FPC)
Per the FPC (Full-Package Compliance) expectations, the following are still missing:
- ❌ `.github/workflows/` - PR gate workflows
- ❌ `.architecture/` - Architecture and initialization evidence
- ❌ `.qa/` - QA evidence and builder reports
- ❌ `governance/schemas/` - Governance schema references
- ❌ `governance/policies/` - Governance policy references
- ❌ `BUILD_PHILOSOPHY.md` - Supreme authority document

**Note**: Full initialization is tracked separately and not part of this FPC realignment task.

---

## Governance Compliance

**FPC Recognition**: R_Roster recognizes the FPC guide as the standard governance entry point:
- **Guide Location**: `https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/FPC_REPOSITORY_LAYERDOWN_GUIDE.md`
- **Application**: This repository will follow FPC guidance for future governance layerdown activities

**Mapping Consistency**: 
- Governance mappings for R_Roster are maintained in: `maturion-foreman-governance/apps/R_Roster/mappings/`
- Any repository-specific implementations should align with those mappings

---

## References

- **Gap Analysis**: `governance/reports/R_ROSTER_GOVERNANCE_GAP_ANALYSIS.md`
- **Executive Summary**: `governance/reports/EXECUTIVE_SUMMARY.md`
- **Canonical Governance**: https://github.com/APGI-cmy/maturion-foreman-governance
- **FPC Guide**: https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/FPC_REPOSITORY_LAYERDOWN_GUIDE.md

---

**Maintained By**: Governance Liaison Agent  
**Escalation Contact**: Johan Ras (Governance Administrator)
