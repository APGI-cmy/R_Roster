# Governance Artifact Inventory - R_Roster

**Purpose**: Inventory of governance artifacts layered down to R_Roster repository  
**Consumer Repository**: APGI-cmy/R_Roster  
**Canonical Source**: APGI-cmy/maturion-foreman-governance  
**Last Updated**: 2026-01-23  
**Maintained By**: governance-liaison agent

---

## Layer-Down Status

This repository is a **CONSUMER** repository that receives governance canon files from the canonical governance repository via governance ripple layer-down.

**Canonical Governance Source**: `APGI-cmy/maturion-foreman-governance`  
**Layer-Down Direction**: Canonical → R_Roster (this repo)  
**Update Mechanism**: Governance ripple via governance-liaison agent

---

## Layered-Down Governance Files

### Root-Level Governance

| File | Last Updated | Source | Status |
|------|--------------|--------|--------|
| `BUILD_PHILOSOPHY.md` | 2026-01-23 | Root | Layered |

### Governance Canon (governance/canon/)

| File | Last Updated | Source PR | Status |
|------|--------------|-----------|--------|
| `AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md` | 2026-01-23 | governance/canon/ | Layered |
| `AGENT_FILE_BINDING_REQUIREMENTS.md` | 2026-01-23 | governance/canon/ | Layered |
| `PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md` | 2026-01-23 | governance/canon/ | Layered |
| `WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md` | 2026-01-23 | governance/canon/ | Layered |
| `STOP_AND_FIX_DOCTRINE.md` | 2026-01-23 | PR #1005 | **NEW - Layered 2026-01-23** |

### Governance Philosophy (governance/philosophy/)

| File | Last Updated | Source PR | Status |
|------|--------------|-----------|--------|
| `BYG_DOCTRINE.md` | 2026-01-23 | PR #1007 | **UPDATED - Layered 2026-01-23** |

### Agent Contracts (.github/agents/)

| File | Last Updated | Status | Canonical For |
|------|--------------|--------|---------------|
| `governance-liaison.md` | 2026-01-23 | Active | R_Roster |

**Binding Updates**:
- Updated `stop-and-fix` binding to point to `STOP_AND_FIX_DOCTRINE.md` (was `STOP_AND_FIX_PROTOCOL.md`)
- Fixed `byg-doctrine` path formatting

---

## Governance Ripple History

### 2026-01-23: Stop-and-Fix Doctrine Canonization

**Ripple Type**: Tier-0 Constitutional Canon Layer-Down  
**Authority**: GOVERNANCE_RIPPLE_MODEL.md  
**Source PRs**:
- PR #1005: STOP_AND_FIX_DOCTRINE.md canonization
- PR #1007: BYG_DOCTRINE.md integration update

**Files Layered**:
1. `governance/canon/STOP_AND_FIX_DOCTRINE.md` (NEW)
2. `governance/philosophy/BYG_DOCTRINE.md` (UPDATED)

**Agent Contract Updates**:
- `.github/agents/governance-liaison.md`: Updated stop-and-fix and byg-doctrine bindings

**Validation**: All gates passing, governance alignment verified

---

## Repository-Specific Governance

### Local Governance Files (Not Layered)

| File | Purpose | Maintained By |
|------|---------|---------------|
| `SCOPE_DECLARATION.md` | Local scope declaration | Local agents |
| `PREHANDOVER_PROOF_*.md` | Handover evidence | Local agents |
| `FINAL_INCIDENT_RESPONSE.md` | Incident documentation | Local agents |

### Application-Specific

- **Application Type**: Shell scripts (Teacher absenteeism management)
- **Testing Framework**: Shell script validation, shellcheck
- **Build System**: Shell scripts
- **CI/CD**: GitHub Actions

---

## Governance Alignment Status

**Status**: ✅ ALIGNED  
**Last Verified**: 2026-01-23  
**Next Verification**: On next governance ripple or quarterly review

**Alignment Checks**:
- [x] All canon files layered from canonical source
- [x] Agent contracts reference correct file paths
- [x] Governance bindings point to existing files
- [x] All mandatory governance files present
- [x] Inventory up to date with layer-down actions

---

## Notes

- This inventory is maintained by the governance-liaison agent during governance ripple layer-down
- The canonical source of governance is `APGI-cmy/maturion-foreman-governance`
- Not all canonical governance files are layered down—only those applicable to consumer repositories
- Repository-specific governance files are tracked separately and not part of layer-down

---

**Inventory Version**: 1.0.0  
**Last Layer-Down**: 2026-01-23  
**Maintained By**: governance-liaison agent
