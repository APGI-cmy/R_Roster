# BUILD PHILOSOPHY

**Repository**: R_Roster  
**Authority**: Supreme  
**Source**: APGI-cmy/maturion-foreman-governance  
**Version**: 2026-01-11

---

## Constitutional Mandate

This document establishes the supreme build authority for R_Roster. All development, testing, and deployment processes must align with these principles.

## One-Time Build Law

**Principle**: Every build must succeed on first execution when properly prepared.

**Requirements**:
- Architecture must be frozen before build begins
- QA-to-Red must be present and failing before development
- Build-to-Green: All tests must pass before build completion
- No "build and see what breaks" - validation precedes execution

## QA-as-Proof Philosophy

**Principle**: Quality Assurance is not inspection—it is proof of correctness.

**Requirements**:
- Tests document expected behavior before implementation
- 100% coverage of architecture specifications
- Tests fail (Red) before implementation begins
- Tests pass (Green) only after correct implementation
- Zero test debt: All tests must pass, always

## Zero Test Debt Mandate

**Constitutional Rule**: Test debt is a blocking violation.

**Requirements**:
- No failing tests allowed in any branch
- No skipped tests without constitutional exception
- No "TODO: add tests later" - tests precede implementation
- CI failures are blocking: fix immediately, no merge until green

## PR Gate Precondition

**Principle**: Pull requests are evidence of completion, not work-in-progress discovery.

**Requirements**:
- All checks GREEN locally before PR submission
- PREHANDOVER_PROOF required for governance PRs
- CI is confirmatory, not diagnostic
- No reliance on CI to discover failures

## Build-to-Green Discipline

**Principle**: Green is the only acceptable state.

**Workflow**:
1. Architecture → Frozen specification
2. QA-to-Red → Tests written and failing
3. Build-to-Green → Implementation makes tests pass
4. CI Confirmation → Automated verification of local success

**Prohibited**:
- Building before architecture is frozen
- Building without Red tests
- Merging with failing tests
- Using CI as a diagnostic tool

## Failure Handling

**When failures occur**:
1. **STOP**: Do not proceed
2. **ANALYZE**: Root cause analysis required
3. **REMEDIATE**: Fix locally with validation
4. **VERIFY**: All checks GREEN before resuming
5. **DOCUMENT**: Capture learning for future prevention

**Escalation**: If unable to remediate, escalate with full context (RCA, attempts, blocker analysis).

## Agent Boundaries

**Constitutional Separation**:
- **Builders**: Build and test application code
- **Governance Liaison**: Enforce governance, validate gates
- **Foreman**: Coordinate, delegate, ensure alignment

**Violations are catastrophic**: No cross-boundary work without explicit authorization.

## Non-Stalling Requirement

**When blocked**: Report status immediately with:
- Problem statement
- Why blocked
- Solutions attempted
- Escalation target

**Prohibited**: Silent stalls, vague status, work without updates.

---

**Authority**: Constitutional - No waivers permitted  
**Enforcement**: governance-liaison.md, PR gates, CI workflows  
**Escalation**: Johan Ras (for constitutional matters)
