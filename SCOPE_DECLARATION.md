# Scope Declaration

**PR**: Upgrade All Agent Contracts to Canonical v2.5.0  
**Branch**: copilot/upgrade-agent-contracts-to-v2-5-0  
**Date**: 2026-01-15  
**Agent**: agent-contract-administrator  
**Authority**: BL-027 (Scope Declaration Mandatory Before PR Handover)

---

## Files Changed

### Added (A)
.agent-admin/risk-assessments/risk_001_20260115.md
.agent-admin/scans/scan_20260115_142628.md

### Modified (M)
.github/agents/CodexAdvisor-agent.md
.github/agents/ForemanApp-agent.md
.github/agents/api-builder.md
.github/agents/governance-liaison.md
.github/agents/integration-builder.md
.github/agents/qa-builder.md
.github/agents/schema-builder.md
.github/agents/ui-builder.md

### Deleted (D)
(none)

---

## Change Type Summary

- **Governance artifacts (2 added)**: Pre-work governance scan and risk assessment
- **Agent contracts (8 modified)**: Upgraded all to canonical v2.5.0 protection model
- **Total files**: 10 files changed

---

## Scope Validation

All file changes are within expected scope for agent contract v2.5.0 upgrade:
- Governance artifacts created in `.agent-admin/` (required preconditions)
- Agent contracts modified in `.github/agents/` (8 contracts upgraded, excluding self per constitutional constraint)
- No application code modified
- No CI/CD workflows modified
- No secrets or environment files modified

---

**Validation Authority**: `.github/scripts/validate-scope-to-diff.sh`
