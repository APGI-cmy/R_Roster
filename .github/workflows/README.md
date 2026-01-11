# GitHub Workflows

This directory contains CI/CD workflows and PR gate enforcement for the R_Roster application.

## Purpose

According to the **PR Gate Requirements Canon** and **FM Merge Gate Management Canon**:

- PR gates enforce governance compliance before merge
- Workflows validate: architecture conformance, QA 100% pass, zero test debt, zero warnings
- FM owns merge gate readiness preparation

## Structure

Workflow definitions should be placed here as YAML files following the governance canon requirements.

Expected workflows (from apps/R_Roster/mappings/):
- PR gate enforcement
- QA validation
- Architecture conformance checks
- Test debt validation

## Reference

- **PR Gate Canon**: `governance/alignment/PR_GATE_REQUIREMENTS_CANON.md` in governance canon
- **FM Merge Gate Management**: `governance/alignment/FM_MERGE_GATE_MANAGEMENT_CANON.md` in governance canon
- **Repo Mappings**: `apps/R_Roster/mappings/GOVERNANCE_GATE_MAPPING.md` in governance repo

---

*This directory structure established during FPC realignment on 2026-01-11*
