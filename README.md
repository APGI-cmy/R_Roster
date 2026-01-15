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

3. ✅ Execute local validation (governance gate, tests, lints)

4. ✅ Create PREHANDOVER_PROOF using template: `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`

5. ✅ Include all evidence in PR

### References

**Governance Documentation**:
- Pre-Implementation Review Enforcement: `governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md`
- Pre-Implementation Review Onboarding: `governance/onboarding/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ONBOARDING.md`
- Builder PR Checklist: `governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md`
- Execution Bootstrap Protocol: `governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md`

**Canonical Sources** (maturion-foreman-governance):
- [Pre-Implementation Behavior Review Protocol](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md)
- [Review Report Template](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md)

### Grace Period (Onboarding)

**Until 2026-02-14**: Educational enforcement mode
- Missing reviews trigger warnings, not failures
- FM provides feedback and coaching
- Use this time to learn the process

**After 2026-02-14**: Full enforcement
- Missing reviews BLOCK PR merge
- No tolerance for incomplete reviews without exemption
- Repeat non-compliance escalated to Governance Liaison
