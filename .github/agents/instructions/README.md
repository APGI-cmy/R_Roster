# Agent Contract Instruction System

**Authority**: AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md  
**Purpose**: Queue-based system for authorized agent contract modifications  
**Status**: Active  
**Version**: 1.0.0  
**Effective Date**: 2026-01-13

---

## Constitutional Prohibition

**NO AGENT may modify their own contract file.** All contract modifications must be executed via this instruction system by an authorized agent who is NOT the contract owner.

**Violation Severity**: CATASTROPHIC - immediate HALT and escalation to Johan required.

---

## Directory Structure

```
.github/agents/instructions/
├── README.md           # This file - instruction system overview
├── pending/            # Instructions awaiting execution
├── completed/          # Successfully executed instructions (audit trail)
└── rejected/           # Invalid or rejected instructions (audit trail)
```

### Pending Instructions
Location: `pending/`

Contains instructions that have been created and authorized but not yet executed. Agents MUST check this directory for assigned work.

**Naming Convention**: `{YYYY-MM-DD}-{target-agent}-{topic}.md`

**Example**: `2026-01-13-governance-liaison-scope-update.md`

### Completed Instructions
Location: `completed/`

Contains instructions that have been successfully executed. Maintains audit trail of all contract modifications. MUST NOT be deleted.

### Rejected Instructions
Location: `rejected/`

Contains instructions that were invalid, unauthorized, or rejected. Maintains audit trail. MUST NOT be deleted.

---

## Instruction Execution Process

### Step 1: Instruction Creation (Authority Only)

**Who Can Create**:
- Johan Ras (ultimate authority)
- Governance Administrator (cross-repo layer-down)
- Repository Owner (with Johan approval)

**Requirements**:
- Create instruction file in `pending/`
- Use standard instruction format (see Template below)
- Assign to authorized executor (NEVER the contract owner)
- Document constitutional compliance

### Step 2: Assignment Verification (Executor)

Before executing, executor MUST verify:
- [ ] Instruction is assigned to them
- [ ] Target contract is NOT their own contract
- [ ] Instruction created by authorized authority
- [ ] Constitutional compliance documented
- [ ] Validation criteria clear

**If ANY check fails**: HALT and escalate. Do NOT proceed.

### Step 3: Implementation (Executor)

Executor implements changes:
- Make ONLY changes specified in instruction
- Follow validation criteria exactly
- Document any issues or deviations
- Update instruction with execution notes

**Prohibited**:
- Expanding scope beyond instruction
- Making "improvement" changes not specified
- Modifying instruction to fit implementation

### Step 4: Validation (Executor)

Executor validates changes:
- [ ] All changes match instruction specification
- [ ] No unspecified changes made
- [ ] Contract syntax valid
- [ ] Bindings updated (if applicable)
- [ ] Documentation updated (if applicable)

### Step 5: Completion (Executor)

Executor finalizes:
- Update instruction status to `completed`
- Add execution timestamp and notes
- Move instruction from `pending/` to `completed/`
- Commit changes with reference to instruction
- Report completion to authority

---

## Instruction Template

Create instruction files using this format:

```markdown
---
instruction_id: {unique-id, e.g., INST-2026-01-13-001}
target_contract: .github/agents/{agent-name}.md
assigned_to: {authorized-agent-id}
created_by: {authority-name}
created_date: {YYYY-MM-DD}
status: pending
authority_level: johan|governance-admin|repo-owner
priority: high|normal|low
---

# Contract Modification Instruction: {Brief Title}

## Target Contract
**File**: `.github/agents/{agent-name}.md`  
**Current Version**: {version if known}

## Assigned Executor
**Agent**: {assigned-agent-id}  
**Assignment Rationale**: {why this agent, not contract owner}

## Modification Required

{Clear, specific description of what needs to change}

### Changes:
1. {Change 1}
2. {Change 2}
3. {etc.}

## Rationale

{Why this change is needed - governance requirement, bug fix, scope clarification, etc.}

## Constitutional Compliance

{How this change complies with constitutional requirements - which protocols or bindings apply}

## Validation Criteria

Changes are considered complete when:
- [ ] {Validation criterion 1}
- [ ] {Validation criterion 2}
- [ ] {etc.}

## Authority

**Created By**: {authority name}  
**Authority Level**: {johan|governance-admin|repo-owner}  
**Authorization**: {reference to authorization source - issue, PR, directive}

## Related Documents
- {Link to related governance documents}
- {Link to relevant issues or PRs}

---

## Execution Notes

{Executor adds notes here during implementation}

**Execution Start**: {timestamp}  
**Executor**: {agent-id}  
**Status Updates**: {executor adds status updates here}  
**Execution Complete**: {timestamp}  
**Final Status**: {completed|rejected with reason}
```

---

## Authority Levels

### Johan Ras (Ultimate Authority)
- Can authorize ANY contract modification
- Can override any prohibition
- Can execute emergency modifications directly
- Final arbiter of constitutional matters

**Contact**: Via escalation to Governance Liaison or direct issue

### Governance Administrator (Cross-Repo Authority)
- Can issue layer-down directives from maturion-foreman-governance
- Can create instructions for cross-repo governance alignment
- Cannot override constitutional prohibitions

**Contact**: Via maturion-foreman-governance repository

### Repository Owner (Limited Authority)
- Can REQUEST contract modifications
- Must route through Johan for approval
- Cannot self-approve or execute own requests

---

## Special Cases

### Governance Liaison Contract Modifications

**SPECIAL RULE**: Governance Liaison has ABSOLUTE PROHIBITION against editing their own contract.

**Process**:
1. Johan or Governance Administrator creates instruction
2. Instruction assigned to Foreman or another overseer (NEVER Governance Liaison)
3. Assigned agent executes changes
4. Governance Liaison reviews for constitutional compliance (but does NOT approve)
5. Johan provides final approval

**Rationale**: Governance Liaison enforces constitutional compliance. Self-editing would create irreconcilable conflict of interest.

### Emergency Modifications

**Authority**: Johan Ras only

**When**: Critical security vulnerability, catastrophic governance failure, production incident

**Process**:
1. Johan makes direct modification
2. Documents reason in `governance/incidents/`
3. Creates retrospective instruction for audit trail
4. Issues visibility event if affects other repos

### Cross-Repo Layer-Down

**When**: Same contract change needed across multiple repositories

**Process**:
1. Governance Administrator issues layer-down directive in maturion-foreman-governance
2. Creates instruction template
3. Each repo creates local instruction from template
4. Each repo executes via local instruction system
5. Each repo reports completion

---

## Violations and Escalation

### CATASTROPHIC Violations (HALT Immediately)

- Agent editing own contract
- Bypassing instruction system
- Unauthorized scope expansion
- Forged or fabricated instructions

**Response**:
1. HALT all operations
2. Revert changes immediately
3. Document incident in `governance/incidents/protocol-violations/`
4. Escalate to Johan Ras with full context
5. Await constitutional ruling

### MAJOR Violations (BLOCK and Remediate)

- Executing unassigned instructions
- Incomplete validation
- Missing audit trail
- Unauthorized delegation

**Response**:
1. BLOCK further modifications
2. Document violation
3. Remediate immediately
4. Report to Governance Liaison
5. Create corrective instruction

### Questions or Concerns

For constitutional questions, violations, or urgent matters:

**Escalation Path**:
1. Governance Liaison (for interpretation)
2. Foreman (for coordination)
3. Johan Ras (for constitutional authority)

---

## Instruction System Maintenance

### Regular Audits

Governance Liaison SHOULD audit instruction system quarterly:
- Review completed instructions for compliance
- Verify no bypassed modifications
- Check audit trail completeness
- Report anomalies to Johan

### Archive Policy

**Completed Instructions**: MUST retain indefinitely (audit trail)  
**Rejected Instructions**: MUST retain indefinitely (audit trail)  
**Pending Instructions**: Should be resolved within 30 days or moved to rejected with reason

### Quality Standards

All instructions MUST:
- Use standard format
- Include constitutional compliance statement
- Have clear validation criteria
- Reference authorizing source
- Maintain audit trail

---

## Quick Reference

**Creating Instruction**: Authority creates in `pending/` with all required fields  
**Executing Instruction**: Assigned agent verifies, implements, validates, moves to `completed/`  
**Emergency**: Johan only, requires retrospective instruction  
**Violation**: HALT, document, escalate

**Remember**: NO agent may modify their own contract. This is CONSTITUTIONAL.

---

**Version**: 1.0.0  
**Last Updated**: 2026-01-13  
**Authority**: AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md (governance/canon/)  
**Questions**: Escalate to Governance Liaison or Johan Ras
