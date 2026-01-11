# Canonical Governance Schemas

This repository references canonical governance schemas from the **maturion-foreman-governance** repository rather than maintaining local copies to prevent drift.

## Canonical Source

**Repository**: `APGI-cmy/maturion-foreman-governance`  
**Location**: `governance/schemas/`  
**URL**: https://github.com/APGI-cmy/maturion-foreman-governance/tree/main/governance/schemas

## Applicable Schemas

The following schemas are applicable to this repository:

### Repository Initialization & Evidence
- **REPOSITORY_INITIALIZATION_EVIDENCE.schema.md** - Schema for initialization evidence (used in this repo)
- **COMMISSIONING_EVIDENCE.schema.md** - Schema for commissioning evidence

### Build & QA
- **BUILDER_QA_REPORT.schema.md** - Schema for builder QA reports
- **BUILD_QA_REPORT.schema.json** - JSON schema for build QA reports

### Governance & Compliance
- **GOVERNANCE_COMPLIANCE_REPORT.schema.json** - Schema for governance compliance reports
- **.agent.schema.md** - Schema for repository `.agent` contract

### Agent Contracts
- **BUILDER_CONTRACT_SCHEMA.md** - Schema for builder agent contracts (see `.github/agents/BUILDER_CONTRACT_SCHEMA.md`)

## Usage

When creating evidence files, QA reports, or agent contracts in this repository, refer to the canonical schemas in the governance repository for structure and required fields.

**Do not copy schemas locally.** Always reference the canonical source to ensure alignment with latest governance requirements.

## Schema Updates

When canonical schemas are updated in the governance repository:
1. Governance Liaison reviews changes
2. Updates `GOVERNANCE_ALIGNMENT.md` to reflect new version
3. Updates any affected files in this repository to match new schema requirements

---

**Last Updated**: 2026-01-11  
**Governance Version**: 7dc8110ce2477e1eb441eb905c56951090df36ed
