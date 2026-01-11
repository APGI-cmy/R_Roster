# FPC Realignment - Mapping Verification Requirements

**Event Type**: Governance Alignment Note  
**Date**: 2026-01-11  
**Status**: VERIFICATION PENDING  
**Scope**: Cross-Repository Coordination

## Purpose

This event documents the requirements for verifying that the `maturion-foreman-governance` repository's mappings for R_Roster are aligned with this repository's reality.

## Context

Following the FPC realignment performed on 2026-01-11, this repository now has:
- Updated governance structure references in all agent files
- FPC-compliant directory structure (`.architecture/`, `.qa/`, `governance/`, `.github/workflows/`)
- `governance/GOVERNANCE_VERSION.md` with realignment history

## Required Verification

The following verification must be performed in the `maturion-foreman-governance` repository:

### 1. Mapping File Location
**Path**: `apps/R_Roster/mappings/GOVERNANCE_GATE_MAPPING.md`

This file should exist and contain R_Roster-specific implementations of governance gates.

### 2. Expected Workflow Definitions

The mapping should reference workflows that match this repository's structure:
- PR gate enforcement workflow
- QA validation workflow
- Architecture conformance checks
- Test debt validation workflow

**Current State**: `.github/workflows/` directory exists but contains only README.md

**Required Action**: Either:
- Define the workflow YAML files in this repository based on governance mappings, OR
- Note in mappings that workflows are pending implementation

### 3. Expected Validator Paths

The mapping should reference validator scripts or tools:
- QA test validators
- Architecture conformance validators
- Test debt detectors
- Build-to-green enforcement scripts

**Current State**: No validator scripts present yet

**Required Action**: Either:
- Create validators based on governance specifications, OR
- Note in mappings that validators are pending implementation

### 4. Evidence Folder Structure

The mapping should define where build evidence is stored:
- QA test results
- Architecture freeze confirmations
- Build completion artifacts

**Current State**: Structure directories created but not yet populated

## Follow-Up Required

### In maturion-foreman-governance Repository:
1. **Verify** `apps/R_Roster/mappings/GOVERNANCE_GATE_MAPPING.md` exists
2. **Validate** that mapped workflow paths, validator paths, and evidence folders match R_Roster's current structure
3. **Update** mappings if discrepancies exist between mapped expectations and repository reality

### In R_Roster Repository (This Repo):
1. **Implement** workflows referenced in mappings (if mappings already exist)
2. **Create** validators referenced in mappings (if mappings already exist)
3. **Populate** evidence folders as builds occur

## Decision Framework

**If mappings exist in governance repo**:
- This repository should implement the mapped requirements (workflows, validators, evidence structure)

**If mappings don't exist yet**:
- Governance repo should create mappings based on this repository's current structure and FPC compliance

**If there's a mismatch**:
- Determine source of truth:
  - If governance mapping is authoritative → update this repo
  - If this repo is source of truth → update governance mapping
- Escalate to Johan/Governance Administrator if unclear

## Blocked Status

This verification is **READ-ONLY** from this repository's perspective. Cannot modify the governance repository from here per governance liaison doctrine.

**Action Required**: Manual verification or separate governance repo task to align mappings with R_Roster reality.

## Cross-Repo Tracking Note

This repository should also appear in:
- `maturion-foreman-governance/cross-repo/GOVERNANCE_VERSION_MATRIX.md`

With state reflecting: `ALIGNED (Structure)` or similar, following FPC realignment.

---

**Created**: 2026-01-11  
**Author**: Governance Liaison Agent  
**Review Status**: Pending verification in governance repository  
**Follow-Up Issue**: Required in maturion-foreman-governance for mapping verification
