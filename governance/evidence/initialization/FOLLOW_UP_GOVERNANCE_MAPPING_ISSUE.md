# Follow-Up Issue: Create R_Roster Governance Mapping

## Issue Title
Create governance mapping for R_Roster repository in maturion-foreman-governance

## Repository
`APGI-cmy/maturion-foreman-governance`

## Description

Create repository-specific governance mapping for R_Roster under `apps/r-roster/mappings/`.

### Required Files

1. **`apps/r-roster/mappings/GOVERNANCE_GATE_MAPPING.md`**
   - Map workflow locations (`.github/workflows/governance-gate.yml`)
   - Map validator locations (when tech stack determined)
   - Map evidence folders (`.qa/`, `governance/evidence/`)

2. **`apps/r-roster/mappings/REPOSITORY_PROFILE.md`**
   - Repository type: Application
   - Tech stack: TBD (pending determination)
   - Agent roles: FM, Builders (UI/API/Schema/Integration/QA), Governance Liaison, Codex Advisor
   - Governance version: 7dc8110ce2477e1eb441eb905c56951090df36ed

3. **`apps/r-roster/README.md`**
   - Repository overview
   - Purpose: Teacher absenteeism management
   - Link to R_Roster repository
   - Governance alignment status: ALIGNED

### Cross-Reference

Update `cross-repo/GOVERNANCE_VERSION_MATRIX.md` to include:
```markdown
| R_Roster | r-roster | Application | 7dc8110c | ALIGNED | 2026-01-11 | Copilot (GL) |
```

### Dependencies

- R_Roster FPC layer-down completion (this PR)
- Tech stack decision (when available)

### Acceptance Criteria

- [ ] `apps/r-roster/mappings/` directory created
- [ ] GOVERNANCE_GATE_MAPPING.md created with workflow/validator/evidence mappings
- [ ] REPOSITORY_PROFILE.md created with repo metadata
- [ ] README.md created with repo overview
- [ ] Cross-repo tracking updated in GOVERNANCE_VERSION_MATRIX.md

### Priority

**Medium** - Can be completed after R_Roster PR merge

### Labels

- `governance-mapping`
- `cross-repo-tracking`
- `repository-initialization`

---

**Created For**: R_Roster repository  
**Repo Key**: r-roster  
**Governance Version**: 7dc8110ce2477e1eb441eb905c56951090df36ed  
**Reference**: FPC § 4.7 - Repository-Specific Mapping
