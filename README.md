# R_Roster

Personal app for managing teacher absenteeism

## Developer Guide

### Working on Enhancements

**IMPORTANT**: All enhancement and optimization PRs require completion of a Pre-Implementation Behavior Review **BEFORE** implementing code changes.

#### What is Pre-Implementation Behavior Review?

A mandatory 4-step review process that ensures:
1. **Baseline Behavior Captured**: Current system state documented with evidence
2. **Design Alternatives Analyzed**: Multiple approaches considered with trade-offs
3. **Risk Assessment Complete**: Risks identified with mitigation strategies
4. **Success Criteria Defined**: Measurable outcomes established

#### When is Review Required?

✅ **REQUIRED for**:
- New features or capabilities
- Performance optimizations
- Behavior changes or improvements
- Algorithm modifications
- Significant refactoring

❌ **NOT REQUIRED for**:
- Bug fixes (restoring intended behavior)
- Governance/documentation updates
- Infrastructure/tooling changes (without app behavior impact)

**Gate exemption**: PRs limited to `governance/`, `.github/agents/`, or `docs/` are exempt from the pre-implementation review gate.

#### How to Complete Review

1. **Read the onboarding guide**: `governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md`
2. **Get the template**: [Pre-Implementation Review Template](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md)
3. **Complete all 4 steps** thoroughly (typically 4-8 hours)
4. **Include in PR**: Add review report file to your PR
5. **Reference in PR description**: Link to review report

#### File Naming Convention

```
pre_implementation_review_[brief_description].md
```

Examples:
- `pre_implementation_review_teacher_filter.md`
- `pre_implementation_review_roster_optimization.md`

#### Need Help?

- **Classification unclear?** Ask ForemanApp or Governance Liaison
- **Exemption needed?** Request from ForemanApp with justification (exemptions are rare)
- **Technical guidance?** Consult CodexAdvisor

### Pull Request Checklist

Before submitting any PR:

1. ✅ Read applicable checklist:
   - Builders: `governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md`
   - FM: `governance/templates/pr-checklists/FM_ORCHESTRATION_PR_CHECKLIST.md`

2. ✅ For enhancements: Complete pre-implementation review

3. ✅ Execute local validation:
   - **Script-based** (for code): Run governance gate, tests, lints
   - **Evidence-based** (for governance): Create SCOPE_DECLARATION.md + PREHANDOVER_PROOF

4. ✅ Create PREHANDOVER_PROOF using template: `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`

5. ✅ Include all evidence in PR

### CI Gate Validation Methods (BL-027/028)

R_Roster supports two validation methods:

#### Script-Based Validation (Traditional)
**Use for**: Application code, tests, executable scripts

**How it works**:
- Execute validation scripts locally
- All scripts must pass (exit code 0)
- CI confirms local execution results

#### Evidence-Based Validation (BL-027/028)
**Use for**: Governance policies, agent contracts, documentation

**How it works**:
- Document validation in PREHANDOVER_PROOF
- Create SCOPE_DECLARATION.md with attestation
- CI validates documents instead of running scripts

**When to use**: When changes cannot be validated by automated scripts (governance updates, policy changes, documentation)

**Learn more**: `governance/onboarding/EVIDENCE_BASED_VALIDATION_ONBOARDING.md`

### References

**Governance Documentation**:
- Pre-Implementation Review Enforcement: `governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md`
- Pre-Implementation Review Onboarding: `governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md`
- Evidence-Based Validation: `governance/onboarding/EVIDENCE_BASED_VALIDATION_ONBOARDING.md`
- Evidence-Based Policy: `governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md`
- Builder PR Checklist: `governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md`
- Execution Bootstrap Protocol: `governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md`

**Canonical Sources** (maturion-foreman-governance):
- [Pre-Implementation Behavior Review Protocol](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md)
- [Review Report Template](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md)
- [BL-027/028 Pattern](https://github.com/APGI-cmy/maturion-foreman-governance/pull/981)

### Grace Period (Onboarding)

**Until 2026-02-14**: Educational enforcement mode
- Missing reviews trigger warnings, not failures
- FM provides feedback and coaching
- Use this time to learn the process

**After 2026-02-14**: Full enforcement
- Missing reviews BLOCK PR merge
- No tolerance for incomplete reviews without exemption
- Repeat non-compliance escalated to Governance Liaison
