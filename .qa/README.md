# QA Directory

**Purpose**: Builder QA reports, GPCA (Green-Pass Coverage Analysis), and evidence collection for R_Roster.

## Structure

### `/builder`
Builder-specific QA reports and test evidence organized by builder agent (e.g., api-builder, ui-builder).

### `/gpca`
Green-Pass Coverage Analysis reports demonstrating QA-to-Red → Build-to-Green compliance.

### `/evidence`
Consolidated QA evidence, test execution logs, and coverage attestations.

## Governance

This directory is required by the governance gate workflow (`.github/workflows/governance-gate.yml`) as part of the FPC repository layer-down requirements.

**Zero Test Debt Mandate**: All tests must pass. Test debt is constitutional violation per BUILD_PHILOSOPHY.md.

**Authority**: maturion-foreman-governance/governance/canon/FPC_REPOSITORY_LAYERDOWN_GUIDE.md
