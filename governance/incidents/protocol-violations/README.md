# Protocol Violations Incident Tracking

**Repository**: R_Roster  
**Purpose**: Track Execution Bootstrap Protocol violations and enforcement actions  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL_MONITORING_AND_ENFORCEMENT.md  
**Status**: Active (2026-01-11+)

---

## Overview

This directory tracks violations of the **Execution Bootstrap Protocol** to enable:
- Pattern recognition across violations
- Effectiveness monitoring of protocol enforcement
- Quarterly compliance reporting
- Continuous improvement of governance processes

---

## What Gets Tracked

### Protocol Violations
- Missing PREHANDOVER_PROOF when required
- Incomplete PREHANDOVER_PROOF (missing sections)
- Claimed AUTHORIZED without evidence
- Handover without local validation
- CI-as-diagnostic pattern (relying on CI to discover failures)

### Non-Violations (Do NOT Track)
- Optional PREHANDOVER_PROOF not generated (when truly optional)
- Documentation-only changes without PREHANDOVER_PROOF
- Legitimate escalations with proper documentation

---

## Incident File Naming Convention

```
YYYY-MM-DD_protocol-violation_[identifier].md
```

**Examples**:
- `2026-01-15_protocol-violation_pr-123-missing-proof.md`
- `2026-02-03_protocol-violation_builder-incomplete-validation.md`
- `2026-03-12_protocol-violation_claimed-authorized-without-gates.md`

---

## Incident Template

Use the following template for all protocol violation incidents:

```markdown
# Protocol Violation Incident

**Incident ID**: YYYY-MM-DD_[identifier]  
**Date**: YYYY-MM-DD  
**Reporter**: [Agent/Role]  
**Severity**: [Critical | High | Medium | Low]

---

## Incident Summary

**What Happened**: [Brief description]

**Violation Type**: [Select one]
- Missing PREHANDOVER_PROOF
- Incomplete PREHANDOVER_PROOF
- Handover without validation
- CI-as-diagnostic pattern
- Other: [specify]

**Affected PR/Issue**: [PR# or Issue#]  
**Agent Involved**: [Agent name/role]

---

## Detailed Description

[Comprehensive description of what occurred, timeline, and discovery method]

---

## Evidence

**Missing/Incomplete Elements**:
- [ ] PREHANDOVER_PROOF file absent
- [ ] Gate validation results missing
- [ ] Exit codes not captured
- [ ] Deliverables checklist incomplete
- [ ] Handover authorization missing/improper
- [ ] Other: [specify]

**Artifacts**:
- Link to PR: [URL]
- Link to commit: [URL]
- Screenshot/logs: [if applicable]

---

## Impact Assessment

**Build Impact**: [Did this cause build failure? Test failure? Delay?]

**Pattern Match**: [Does this match prior incidents? Reference previous incidents]

**Downstream Effects**: [What happened as result? Review cycles? Rework? Escalation?]

---

## Root Cause Analysis

**Primary Cause**: [Why did violation occur?]

**Contributing Factors**:
1. [Factor 1]
2. [Factor 2]
3. [Factor 3]

**Agent Understanding**: [Did agent understand protocol? First-time? Repeat offender?]

---

## Resolution Actions

**Immediate Actions Taken**:
1. [Action 1]
2. [Action 2]

**Corrective Actions**:
1. [Action 1 - to prevent recurrence]
2. [Action 2 - to strengthen enforcement]

**Preventive Actions**:
1. [Action 1 - systemic improvements]
2. [Action 2 - process enhancements]

---

## Enforcement Action

**Action Type**: [Select one]
- Educational (first-time, good faith)
- Warning (repeated or negligent)
- Escalation (constitutional concern)
- Override (authority decision required)

**Details**: [Description of enforcement action taken]

**Follow-up Required**: [Yes/No - and what follow-up]

---

## Lessons Learned

**What Worked**:
- [Positive observation 1]
- [Positive observation 2]

**What Didn't Work**:
- [Gap or failure 1]
- [Gap or failure 2]

**Recommendations**:
1. [Recommendation for protocol improvement]
2. [Recommendation for enforcement improvement]
3. [Recommendation for training improvement]

---

## References

**Governance Documents**:
- governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md
- governance/templates/PREHANDOVER_PROOF_TEMPLATE.md
- governance/events/2026-01-11_EXECUTION_BOOTSTRAP_PROTOCOL_LAYER_DOWN_VISIBILITY.md

**Related Incidents**: [Links to related incidents if pattern]

---

**Incident Closed**: [YYYY-MM-DD or OPEN]  
**Closed By**: [Agent/Role]  
**Review Date**: [Date for follow-up review]
```

---

## Severity Levels

### Critical
- Caused build failure or production incident
- Repeated violation after warnings
- Deliberate bypass of protocol
- Constitutional boundary violation

**Response**: Immediate escalation to Johan/Governance Administrator

### High
- Missing PREHANDOVER_PROOF on governance change
- Incomplete validation causing CI failure
- Pattern of negligence emerging

**Response**: Formal warning + corrective action plan

### Medium
- Incomplete PREHANDOVER_PROOF sections
- First-time violation, good faith effort
- Minor gaps in validation evidence

**Response**: Educational guidance + re-training

### Low
- Optional documentation without PREHANDOVER_PROOF
- Process confusion (not negligence)
- Edge case interpretation issue

**Response**: Clarification + documentation update

---

## Workflow

### 1. Incident Discovery
- FM discovers during PR review
- Governance Liaison identifies during audit
- CI failure without local validation evidence
- Agent self-reports violation

### 2. Incident Documentation
- Create incident file using template
- Assign severity level
- Gather evidence
- Document impact

### 3. Root Cause Analysis
- Investigate why violation occurred
- Identify contributing factors
- Check for pattern match with prior incidents

### 4. Resolution
- Take immediate actions
- Implement corrective actions
- Plan preventive actions
- Document enforcement action

### 5. Follow-up
- Verify corrective actions effective
- Monitor for recurrence
- Update protocol/training if needed
- Close incident when resolved

### 6. Quarterly Aggregation
- Compile incidents for quarterly report
- Analyze trends and patterns
- Report effectiveness metrics
- Recommend systemic improvements

---

## Quarterly Reporting

All incidents tracked here feed into the **Quarterly Compliance and Effectiveness Report**.

**Report Schedule**:
- Q1 2026: Due 2026-04-14
- Q2 2026: Due 2026-07-14
- Q3 2026: Due 2026-10-14
- Q4 2026: Due 2027-01-14

**Metrics Tracked**:
- Total violations by type
- Violations by agent/role
- Repeat violations (agent-specific)
- Average time to resolution
- CI failure rate (with vs without PREHANDOVER_PROOF)
- Protocol compliance rate
- Effectiveness trends over time

**Report Template**: See governance/templates/EXECUTION_BOOTSTRAP_PROTOCOL_QUARTERLY_MONITORING_REPORT.template.md

---

## Pattern Recognition

### Common Patterns to Watch

**Pattern 1: CI-as-Diagnostic**
- Agent submits PR without local validation
- Relies on CI to discover failures
- No PREHANDOVER_PROOF evidence

**Indicator**: Multiple CI failures on same PR, no local validation documented

**Pattern 2: Incomplete Ripple**
- Governance change submitted
- PREHANDOVER_PROOF present but ripple section incomplete
- Related files not updated

**Indicator**: PREHANDOVER_PROOF exists but downstream failures occur

**Pattern 3: Claimed AUTHORIZED Without Evidence**
- PREHANDOVER_PROOF marks handover AUTHORIZED
- Gate validation sections empty or placeholder
- Exit codes missing

**Indicator**: AUTHORIZED status but no execution evidence

**Pattern 4: Repeat Offender**
- Same agent/role multiple violations
- Pattern of non-compliance
- Educational actions not effective

**Indicator**: Multiple incidents with same agent over time

---

## Escalation Criteria

Escalate to Johan/Governance Administrator when:

1. **Critical severity** incident occurs
2. **Pattern of repeat violations** by same agent (3+ incidents)
3. **Constitutional boundary** violations
4. **Protocol itself ineffective** (systemic issue identified)
5. **Authority override** required to resolve
6. **Cross-repository pattern** detected

**Escalation Format**: Use governance escalation template

---

## Current Status

**Tracking Start Date**: 2026-01-11  
**Incidents Tracked**: 0 (baseline)  
**Last Quarterly Report**: N/A (awaiting Q1 2026)  
**Next Report Due**: 2026-04-14

---

## Access and Maintenance

**Who Can File**: Any agent discovering protocol violation  
**Who Maintains**: Governance Liaison (primary), ForemanApp (secondary)  
**Review Frequency**: Weekly (for open incidents), Quarterly (for trends)  
**Retention**: All incidents retained indefinitely for pattern analysis

---

## Questions

For questions about incident tracking:
- Protocol questions: See governance/onboarding/EXECUTION_BOOTSTRAP_PROTOCOL_ONBOARDING.md
- Escalation: Johan Ras or Governance Administrator
- Process: Governance Liaison

---

**Created**: 2026-01-11  
**Version**: 1.0.0  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL_MONITORING_AND_ENFORCEMENT.md  
**Maintained By**: Governance Liaison
