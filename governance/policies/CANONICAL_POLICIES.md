# Canonical Governance Policies

This repository references canonical governance policies from the **maturion-foreman-governance** repository rather than maintaining local copies to prevent drift.

## Canonical Source

**Repository**: `APGI-cmy/maturion-foreman-governance`  
**Location**: `governance/policies/`  
**URL**: https://github.com/APGI-cmy/maturion-foreman-governance/tree/main/governance/policies

## Applicable Policies

The following canonical policies apply to this application repository:

### Build & Quality
- **Zero Test Debt Constitutional Rule** - No test debt tolerated, immediate resolution required
- **100% GREEN Philosophy** - All tests must pass, zero warnings, zero errors
- **Build Philosophy** - Architecture → Red QA → Build to Green workflow

### PR & Merge
- **PR Gate Precondition Rule** - PR gates must pass before merge
- **PR Scope Control Policy** - PRs must be scoped appropriately
- **POLICY-NO-ONLY-LANGUAGE** - Ban minimizing language ("only X failing")

### Agent Roles
- **Builder QA Handover Policy** - Handover requirements from builders to FM
- **FM Builder Appointment Protocol** - How FM appoints builders
- **Agent Recruitment** - How agents are recruited and assigned

### Governance & Compliance
- **Governance Supremacy Rule (GSR)** - Governance rules have supreme authority
- **Quality Integrity Contract (QIC)** - QA must be comprehensive and accurate
- **Constitutional Sandbox Pattern** - Agent judgment within constitutional boundaries

### Failure Handling
- **Second-Time Failure Prohibition** - TARP activation for repeated failures
- **Feedback Loop (FL) / Continuous Improvement (CI)** - Learn from failures

### Cross-Repo
- **Cross-Repository Layer Down Protocol** - Version synchronization across repos
- **Governance Versioning and Sync Protocol** - How governance updates propagate

## Constitutional Hierarchy

Policies follow a **two-tier hierarchy**:

1. **Tier 1 - Constitutional (Supreme Authority)**
   - Zero Test Debt
   - 100% GREEN requirement
   - BUILD_PHILOSOPHY execution sequence
   - GSR, QIC
   - **Non-negotiable, unbreakable**

2. **Tier 2 - Procedural (Flexible, Advisory)**
   - Collaboration patterns
   - Process step details
   - **Optimizable within constitutional boundaries**

## Usage

All agents and processes in this repository must comply with these canonical policies. Do not create local policy variations that contradict canonical governance.

**Do not copy policies locally.** Always reference the canonical source to ensure alignment with latest governance requirements.

## Policy Updates

When canonical policies are updated in the governance repository:
1. Governance Liaison reviews changes
2. Updates `GOVERNANCE_ALIGNMENT.md` to reflect new version
3. Ensures repository practices align with updated policies
4. Creates visibility event in `governance/events/` if changes affect FM operations

---

**Last Updated**: 2026-01-11  
**Governance Version**: 7dc8110ce2477e1eb441eb905c56951090df36ed
