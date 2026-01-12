# Execution Bootstrap Protocol Onboarding

**Repository**: R_Roster  
**Purpose**: Agent onboarding guide for Execution Bootstrap Protocol  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL (maturion-foreman-governance PR #924)  
**Status**: MANDATORY (effective 2026-01-11)  
**Version**: 1.0.0

---

## Overview

The **Execution Bootstrap Protocol** is a constitutional requirement that prevents "claimed complete without verification" failures by mandating local validation evidence (PREHANDOVER_PROOF) for all agent handovers and governance PRs.

**Core Principle**: CI is confirmatory, NOT diagnostic. Agents must validate locally before handover.

**Applies To**: ALL agents (builders, FM, governance liaison, CodexAdvisor)

---

## Quick Start (5 Minutes)

### What is PREHANDOVER_PROOF?

PREHANDOVER_PROOF is a standardized document that demonstrates:
- ✅ All gate checks executed locally and passed
- ✅ All deliverables completed and verified
- ✅ Exit codes captured and documented
- ✅ Ripple validation complete (for governance changes)
- ✅ Constitutional compliance verified

### When to Generate PREHANDOVER_PROOF

**MANDATORY for**:
- ALL governance changes (policies, learnings, agent contracts, gates, workflows)
- ALL PR submissions where agent contract requires it
- ALL builder handovers to FM
- When explicitly required by issue/task deliverables

**RECOMMENDED for**:
- Significant feature work to demonstrate validation

**OPTIONAL for**:
- Minor documentation-only changes (unless governance-related)

---

## The 7-Step Verification Protocol

Before ANY handover, agents MUST complete ALL seven steps:

### Step 1: Local Gate Execution
**What**: Execute all relevant gate checks locally  
**How**: Run governance-gate-local-validation.sh or task-specific validation  
**Evidence**: Capture command output with exit codes

```bash
# Example: Governance gate validation
bash governance-gate-local-validation.sh
# Exit code: 0 (success)
```

### Step 2: Deliverables Verification
**What**: Verify ALL deliverables from issue/task are complete  
**How**: Create checklist mapping issue requirements to completed items  
**Evidence**: Checkbox list showing all deliverables present

### Step 3: Ripple Validation
**What**: For governance changes, verify all affected files updated  
**How**: Identify ripple scope, execute complete ripple, validate consistency  
**Evidence**: Document ripple scope and completion status

### Step 4: Constitutional Compliance Check
**What**: Verify compliance with relevant governance documents  
**How**: Check against BUILD_PHILOSOPHY.md, agent contracts, policies  
**Evidence**: List constitutional requirements and compliance status

### Step 5: Zero Test Debt Verification
**What**: Confirm no test debt introduced or existing debt remediated  
**How**: Run test suites, verify coverage, check for skipped tests  
**Evidence**: Test execution results and coverage metrics

### Step 6: Execution Evidence Capture
**What**: Document all command executions with full output  
**How**: Capture command history, results, exit codes  
**Evidence**: Command history block with results

### Step 7: Handover Authorization Determination
**What**: Final check that ALL criteria met for handover  
**How**: Verify all previous steps GREEN, no blocking issues  
**Evidence**: Explicit AUTHORIZED or BLOCKED statement with reasoning

---

## Using the PREHANDOVER_PROOF Template

### Location
`governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`

### Instructions

1. **Copy the template** to repository root with timestamp:
   ```bash
   cp governance/templates/PREHANDOVER_PROOF_TEMPLATE.md \
      PREHANDOVER_PROOF_$(date -u +"%Y-%m-%dT%H:%M:%SZ").md
   ```

2. **Replace ALL bracketed placeholders** with actual values:
   - `[REPO_NAME]` → R_Roster
   - `[BRANCH_NAME]` → your branch name
   - `[COMMIT_SHA]` → current commit SHA
   - `[ISO_8601_TIMESTAMP]` → current timestamp
   - `[AGENT_NAME]` → your agent name
   - `[TASK_DESCRIPTION]` → brief task description

3. **Execute validation commands** and paste actual output:
   - Run governance gate validation
   - Run task-specific checks
   - Capture exit codes

4. **Complete all sections**:
   - Gate Validation Results
   - Task-Specific Gate Validation
   - File Validation
   - Deliverables Checklist
   - Ripple Validation
   - Constitutional Compliance
   - Zero Test Debt
   - Execution Evidence
   - Handover Authorization

5. **Commit with your PR**:
   ```bash
   git add PREHANDOVER_PROOF_*.md
   git commit -m "Add PREHANDOVER_PROOF for [task]"
   ```

---

## Handover Authorization Criteria

### AUTHORIZED requires ALL of:
- ✅ All Tier-0 governance gate checks passing
- ✅ All task-specific validation checks passing
- ✅ All deliverables completed and verified
- ✅ Ripple validation complete (if applicable)
- ✅ Constitutional compliance verified
- ✅ Zero test debt (or debt properly documented and remediated)
- ✅ FM visibility provided (if governance change affects FM)

### BLOCKED if ANY of:
- ❌ Gate checks failing
- ❌ Deliverables incomplete
- ❌ Ripple validation incomplete
- ❌ Constitutional violations present
- ❌ Test debt unresolved
- ❌ Required FM visibility missing

**HARD RULE**: If BLOCKED, do NOT proceed with handover. Fix issues or escalate.

---

## Role-Specific Guidance

### For Builders (API, UI, Schema, Integration, QA)

**Your Responsibility**: Generate PREHANDOVER_PROOF before every PR submission

**Required Sections**:
1. Governance Gate validation (Tier-0)
2. Builder-specific validation (tests, builds, linting)
3. Deliverables from assigned issue
4. Zero test debt verification
5. Handover authorization

**Example Workflow**:
```bash
# 1. Complete your work
# 2. Run local validations
npm run test
npm run build
npm run lint

# 3. Run governance gate
bash governance-gate-local-validation.sh

# 4. Generate PREHANDOVER_PROOF
cp governance/templates/PREHANDOVER_PROOF_TEMPLATE.md \
   PREHANDOVER_PROOF_$(date -u +"%Y-%m-%dT%H:%M:%SZ").md

# 5. Fill in all sections with actual results
# 6. Commit and submit PR
git add PREHANDOVER_PROOF_*.md
git commit -m "Add PREHANDOVER_PROOF for feature X"
git push
```

### For Governance Liaison

**Your Responsibility**: Generate PREHANDOVER_PROOF for ALL governance changes

**Required Sections**:
1. Governance Gate validation (mandatory)
2. Ripple validation (mandatory for governance changes)
3. Constitutional compliance verification
4. FM visibility evidence (when applicable)
5. Enhancement reflection (post-completion)
6. Handover authorization

**Example Workflow**:
```bash
# 1. Complete governance change (policy, learning, agent contract, etc.)

# 2. Execute ripple (identify all affected files)
# Update manifest, agent contracts, scripts, workflows as needed

# 3. Run governance gate
bash governance-gate-local-validation.sh

# 4. Run ripple consistency validators
# (if applicable for tier-0 changes)

# 5. Generate PREHANDOVER_PROOF with ripple section
cp governance/templates/PREHANDOVER_PROOF_TEMPLATE.md \
   PREHANDOVER_PROOF_$(date -u +"%Y-%m-%dT%H:%M:%SZ").md

# 6. Create FM visibility event (if needed)

# 7. Commit all changes including PREHANDOVER_PROOF
git add .
git commit -m "Governance: [change description]"
git push
```

### For ForemanApp (FM)

**Your Responsibility**: 
- Verify builders provide PREHANDOVER_PROOF before accepting handover
- Reject PRs without PREHANDOVER_PROOF committed
- Generate PREHANDOVER_PROOF for your own orchestration changes

**Verification Checklist**:
- [ ] PREHANDOVER_PROOF file present in PR
- [ ] All gate checks marked as PASSED
- [ ] Exit codes documented
- [ ] Deliverables checklist complete
- [ ] Handover status is AUTHORIZED (not BLOCKED)

**Rejection Authority**: FM may reject any PR lacking proper PREHANDOVER_PROOF per ForemanApp-agent.md contract

### For CodexAdvisor

**Your Responsibility**: 
- Recommend PREHANDOVER_PROOF generation when missing
- Provide guidance without claiming enforcement authority
- Reference template location when advising

**Advisory Patterns**:
✅ CORRECT: "I notice this governance PR lacks PREHANDOVER_PROOF. Per EXECUTION_BOOTSTRAP_PROTOCOL, I recommend generating validation evidence using governance/templates/PREHANDOVER_PROOF_TEMPLATE.md before handover. Final decision: Foreman or Governance Liaison."

❌ INCORRECT: "You must provide PREHANDOVER_PROOF." (implies authority)

---

## Common Scenarios

### Scenario 1: Simple Bug Fix (Non-Governance)
**PREHANDOVER_PROOF Required?** Depends on agent contract  
**Minimum Sections**: Gate validation, test execution, deliverables  
**Can Skip**: Ripple validation, FM visibility

### Scenario 2: New Feature Implementation
**PREHANDOVER_PROOF Required?** Yes (per builder contracts)  
**Minimum Sections**: Gate validation, tests GREEN, builds passing, deliverables  
**Can Skip**: FM visibility (unless governance-related)

### Scenario 3: Governance Policy Update
**PREHANDOVER_PROOF Required?** YES (mandatory)  
**Minimum Sections**: ALL sections required  
**Cannot Skip**: Ripple validation, FM visibility, constitutional compliance

### Scenario 4: Agent Contract Update
**PREHANDOVER_PROOF Required?** YES (mandatory)  
**Minimum Sections**: ALL sections required  
**Cannot Skip**: Ripple validation (if tier-0), FM visibility

### Scenario 5: Documentation-Only Change
**PREHANDOVER_PROOF Required?** Optional (unless governance documentation)  
**If Generated**: Gate validation, deliverables checklist sufficient

---

## Escalation Protocol

### When to Escalate

Escalate when **BLOCKED** status persists after attempted remediation:

1. **Document blocking condition** with full context
2. **List remediation attempts** made
3. **Escalate to appropriate authority**:
   - Governance issues → Johan Ras (Governance Administrator)
   - Builder coordination → ForemanApp
   - Technical blockers → Relevant builder or CodexAdvisor
4. **Mark status as ESCALATED** in PREHANDOVER_PROOF
5. **WAIT for resolution** - do NOT proceed with handover

### Escalation Format

```markdown
## Escalation

**Status**: ESCALATED  
**Escalated To**: [Authority Name/Role]  
**Escalation Date**: [ISO_8601_TIMESTAMP]

**Blocking Condition**: [Detailed description of what is blocking handover]

**Remediation Attempts**:
1. [Attempt 1 description and result]
2. [Attempt 2 description and result]
3. [Attempt 3 description and result]

**Path Forward**: [Proposed resolution or question for authority]

**Required Authority**: [What decision/action is needed from authority]
```

---

## Pattern Prevention

The Execution Bootstrap Protocol prevents the "claimed complete without verification" pattern identified in PR #8 incident.

**Without Protocol**:
- Agent claims work complete
- No local validation evidence
- CI fails on platform
- Wastes review cycles
- Incident response required

**With Protocol**:
- Agent validates locally
- Captures evidence in PREHANDOVER_PROOF
- CI confirms (not diagnoses)
- Clean handover
- No incident escalation

**Key Insight**: CI role is CONFIRMATORY, not diagnostic. Local validation must succeed before handover.

---

## FAQ

### Q: What if local validation passes but CI fails?
**A**: This indicates environmental differences. Investigate discrepancy. Update PREHANDOVER_PROOF with new findings. Do NOT handover until CI also GREEN.

### Q: Can I skip PREHANDOVER_PROOF for urgent hotfixes?
**A**: NO. Protocol is constitutional. Urgent changes still require validation. Fast execution ≠ Skip validation.

### Q: What if I don't know how to validate something?
**A**: ESCALATE. Don't guess. Ask CodexAdvisor for guidance or escalate to FM/Governance Liaison.

### Q: How detailed should the Execution Evidence section be?
**A**: Include full command outputs, exit codes, and any error messages. More detail is better than less.

### Q: What if ripple validation identifies MORE work needed?
**A**: BLOCKED status until ripple complete. Update PREHANDOVER_PROOF with new ripple scope. Complete work, then re-validate.

### Q: Can I generate PREHANDOVER_PROOF after PR submission?
**A**: NO. PREHANDOVER_PROOF must be committed WITH the PR. Post-submission generation defeats the purpose.

### Q: What if my agent contract doesn't mention PREHANDOVER_PROOF?
**A**: Check governance/events/2026-01-11_EXECUTION_BOOTSTRAP_PROTOCOL_LAYER_DOWN_VISIBILITY.md. All agent contracts updated 2026-01-11. If missing, escalate to Governance Liaison.

---

## Training Exercises

### Exercise 1: Generate Your First PREHANDOVER_PROOF
1. Choose a simple documentation update
2. Copy template to repository root
3. Fill in all sections with actual values
4. Run governance gate and capture output
5. Mark as AUTHORIZED
6. Review with mentor

### Exercise 2: Identify Missing Evidence
Review example PREHANDOVER_PROOF files in repository:
- PREHANDOVER_PROOF_2026-01-11T13:42:09Z.md
- PREHANDOVER_PROOF_2026-01-11T14:23:21Z.md
- PREHANDOVER_PROOF_2026-01-11T15:51:20Z.md

Identify what makes each AUTHORIZED vs potential BLOCKED scenarios.

### Exercise 3: Ripple Validation Practice
1. Identify a governance change (e.g., agent contract update)
2. Map all files that need updating (ripple scope)
3. Document ripple in PREHANDOVER_PROOF format
4. Have Governance Liaison review

---

## Success Criteria

You understand the Execution Bootstrap Protocol when you can:

- ✅ Explain why CI is confirmatory, not diagnostic
- ✅ Generate PREHANDOVER_PROOF using template
- ✅ Identify when PREHANDOVER_PROOF is mandatory
- ✅ Execute the 7-step verification protocol
- ✅ Determine AUTHORIZED vs BLOCKED status
- ✅ Escalate properly when BLOCKED
- ✅ Validate ripple completeness for governance changes

---

## Additional Resources

**Template**: governance/templates/PREHANDOVER_PROOF_TEMPLATE.md  
**Visibility Event**: governance/events/2026-01-11_EXECUTION_BOOTSTRAP_PROTOCOL_LAYER_DOWN_VISIBILITY.md  
**Agent Contracts**: .github/agents/*.md (all include Execution Bootstrap Protocol section)  
**BUILD_PHILOSOPHY.md**: § PR Gate Precondition (constitutional authority)  
**Canonical Source**: maturion-foreman-governance PR #924

---

## Next Steps After Onboarding

1. **Read Template**: Review governance/templates/PREHANDOVER_PROOF_TEMPLATE.md thoroughly
2. **Review Examples**: Study existing PREHANDOVER_PROOF files in repository
3. **Practice**: Generate PREHANDOVER_PROOF for your next task
4. **Ask Questions**: Escalate to CodexAdvisor or Governance Liaison if unclear
5. **Internalize**: Make PREHANDOVER_PROOF generation automatic habit

---

**Version**: 1.0.0  
**Created**: 2026-01-11  
**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL (maturion-foreman-governance PR #924)  
**Maintenance**: Governance Liaison  
**Questions**: Escalate to Johan Ras or Governance Administrator
