# Agent Contract Management Protocol

## Status
**Type**: Canonical Governance Protocol  
**Authority**: Supreme - Constitutional  
**Version**: 1.0.0  
**Effective Date**: 2026-01-13  
**Owner**: Maturion Engineering Leadership (Johan Ras)  
**Source**: APGI-cmy/maturion-foreman-governance#938  
**Purpose**: Define constitutional rules for agent contract modification and self-editing

---

## 1. Purpose

This protocol establishes **constitutional prohibitions and requirements** for how agent contracts (`.github/agents/*.md` files) may be modified, with specific focus on preventing agents from editing their own contracts.

**Key Principle**: Agents MUST NOT modify their own defining contracts to prevent conflicts of interest, unauthorized scope expansion, and governance circumvention.

**Related Documents**:
- **AGENT_FILE_BINDING_REQUIREMENTS.md** - Defines bindings in `.agent` files
- **AGENT_RECRUITMENT.md** - Defines agent legitimacy and authority
- **GOVERNANCE_PURPOSE_AND_SCOPE.md** - Supreme authority on governance boundaries

---

## 2. Constitutional Prohibitions

### 2.1 Self-Contract Modification Prohibition

**Rule**: An agent MUST NOT modify, edit, or rewrite its own contract file.

**Applies To**: ALL agents, regardless of class (overseer, builder, liaison, watchdog)

**Rationale**: 
- Prevents agents from expanding their own scope without authorization
- Eliminates conflicts of interest in governance enforcement
- Ensures contract changes have independent oversight
- Maintains separation of powers between execution and governance

**Examples of Prohibited Actions**:
- Governance Liaison editing `.github/agents/governance-liaison.md`
- Foreman editing `.github/agents/ForemanApp-agent.md`
- Any builder editing their own `.github/agents/*-builder.md`

**Enforcement**: CATASTROPHIC violation if attempted. HALT immediately and escalate to Johan.

### 2.2 Instruction System Bypass Prohibition

**Rule**: Agents MUST NOT bypass the contract instruction system by:
- Creating ad-hoc contract modifications outside the instruction queue
- Self-approving contract changes
- Implementing contract changes without proper authority chain

**Enforcement**: Constitutional violation. HALT and escalate.

---

## 3. Contract Modification Authority

### 3.1 Who Can Modify Agent Contracts

**Authority Hierarchy** (in order of precedence):

1. **Johan Ras** (Ultimate Authority)
   - Can modify any agent contract
   - Can override any prohibition
   - Final arbiter of constitutional matters

2. **Governance Administrator** (in maturion-foreman-governance)
   - Can create contract modification instructions
   - Can approve contract changes for cross-repo deployment
   - Issues layer-down directives

3. **Repository Owner** (with Johan approval)
   - Can request contract modifications
   - Must route through instruction system
   - Cannot self-approve

4. **Other Agents** (with strict limitations)
   - Can modify OTHER agents' contracts (not their own)
   - Only when explicitly authorized by instruction
   - Must follow instruction system protocol

**Never Authorized**:
- An agent modifying its own contract
- Any agent bypassing the instruction system
- Automated contract modifications without human oversight

### 3.2 Contract Modification Process

**Standard Process**:

1. **Request**: Need for contract modification identified
2. **Instruction Creation**: Authority creates instruction in `.github/agents/instructions/`
3. **Assignment**: Instruction assigned to authorized agent (NOT the contract owner)
4. **Execution**: Assigned agent implements change per instruction
5. **Validation**: Changes validated against instruction requirements
6. **Approval**: Authority reviews and approves
7. **Deployment**: Changes merged and contract updated

**Emergency Process** (Johan only):
- Direct modification authorized
- Requires incident documentation
- Retrospective instruction created for audit trail

---

## 4. Instruction System

### 4.1 Purpose

The instruction system provides a **queue-based, auditable mechanism** for contract modifications that:
- Separates modification authority from contract ownership
- Maintains audit trail of all contract changes
- Prevents unauthorized self-editing
- Enables constitutional oversight

### 4.2 Instruction Directory Structure

**Location**: `.github/agents/instructions/`

**Structure**:
```
.github/agents/instructions/
├── README.md                          # Instruction system overview
├── pending/                           # Awaiting execution
│   └── {YYYY-MM-DD}-{agent}-{topic}.md
├── completed/                         # Successfully executed
│   └── {YYYY-MM-DD}-{agent}-{topic}.md
└── rejected/                          # Rejected or invalid
    └── {YYYY-MM-DD}-{agent}-{topic}.md
```

### 4.3 Instruction Format

Each instruction MUST include:

```yaml
---
instruction_id: {unique-id}
target_contract: .github/agents/{agent-name}.md
assigned_to: {authorized-agent-id}
created_by: {authority}
created_date: {YYYY-MM-DD}
status: pending|in-progress|completed|rejected
authority_level: johan|governance-admin|repo-owner
---

# Contract Modification Instruction

## Target Contract
{contract file path}

## Modification Required
{clear description of what needs to change}

## Rationale
{why this change is needed}

## Constitutional Compliance
{how this change complies with constitutional requirements}

## Validation Criteria
{how to verify the change was implemented correctly}

## Authority
{who authorized this change and under what authority}
```

### 4.4 Instruction Execution Requirements

Agent executing instruction MUST:
1. **Verify assignment**: Confirm they are authorized executor
2. **Verify not self**: Confirm target contract is NOT their own
3. **Implement changes**: Make ONLY the changes specified in instruction
4. **Document execution**: Update instruction status and add execution notes
5. **Move instruction**: Move from `pending/` to `completed/` upon success

Agent MUST NOT:
- Execute instructions targeting their own contract
- Modify instructions to expand scope
- Skip validation steps
- Auto-approve own work

---

## 5. Special Cases

### 5.1 Governance Liaison Contract Updates

**Special Rule**: Governance Liaison has ABSOLUTE PROHIBITION against editing `.github/agents/governance-liaison.md`

**Rationale**: 
- Governance Liaison enforces constitutional compliance
- Self-editing would create irreconcilable conflict of interest
- Could circumvent governance by weakening own oversight

**Process for Governance Liaison Contract Changes**:
1. Johan or Governance Administrator creates instruction
2. Instruction assigned to Foreman or another overseer (NOT Governance Liaison)
3. Assigned agent executes changes
4. Governance Liaison reviews for constitutional compliance (but does NOT approve)
5. Johan provides final approval

### 5.2 Emergency Contract Modifications

**When Applicable**: Critical security vulnerability, catastrophic governance failure, production incident

**Authority Required**: Johan Ras only

**Process**:
1. Johan makes direct modification
2. Documents reason in `governance/incidents/`
3. Creates retrospective instruction for audit trail
4. Issues visibility event if affects other repos

### 5.3 Mass Contract Updates (Cross-Repo Layer-Down)

**When Applicable**: Governance ripple requires same change across multiple repositories

**Process**:
1. Governance Administrator issues layer-down directive
2. Creates instruction template in governance repo
3. Each repo creates local instruction from template
4. Each repo executes via instruction system
5. Each repo reports completion to governance repo

---

## 6. Compliance and Validation

### 6.1 Pre-Modification Validation

Before modifying ANY agent contract, MUST verify:
- [ ] Modification authorized by valid instruction
- [ ] Executor is NOT the contract owner
- [ ] Instruction created by authorized authority
- [ ] Constitutional compliance documented
- [ ] Target contract exists and is correct

### 6.2 Post-Modification Validation

After modifying agent contract, MUST verify:
- [ ] Changes match instruction specification
- [ ] No scope expansion beyond instruction
- [ ] Contract syntax and format valid
- [ ] Instruction moved to completed/
- [ ] Execution documented in instruction

### 6.3 Audit Trail Requirements

Every contract modification MUST have:
- Instruction file with full authorization chain
- Git commit linking to instruction
- Constitutional compliance statement
- Authority signature (Johan, Governance Admin, or delegated)

**Prohibited**: Contract modifications without instruction, self-approved changes, undocumented authority

---

## 7. Violations and Enforcement

### 7.1 Violation Categories

**CATASTROPHIC Violations** (HALT immediately, escalate to Johan):
- Agent editing own contract
- Bypassing instruction system
- Unauthorized scope expansion
- Forged or fabricated instructions

**MAJOR Violations** (BLOCK, remediate, escalate):
- Instruction execution without proper assignment
- Incomplete validation
- Missing audit trail
- Unauthorized delegation

**MINOR Violations** (Document, remediate):
- Formatting inconsistencies in instructions
- Late documentation
- Incomplete instruction metadata

### 7.2 Enforcement Actions

**For CATASTROPHIC Violations**:
1. HALT all agent operations immediately
2. Revert unauthorized changes
3. Document incident in `governance/incidents/protocol-violations/`
4. Escalate to Johan with full context
5. Await constitutional ruling

**For MAJOR Violations**:
1. BLOCK further contract modifications
2. Document violation
3. Remediate immediately
4. Report to Governance Liaison
5. Create corrective instruction

**For MINOR Violations**:
1. Document issue
2. Create remediation task
3. Update processes to prevent recurrence

---

## 8. Binding Requirements

### 8.1 Repository .agent File Binding

Repositories implementing this protocol MUST add binding to `.agent` file:

```yaml
governance:
  bindings:
    - id: agent-contract-management
      path: governance/canon/AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md
      role: contract-modification-authority
```

### 8.2 Agent Contract References

Agent contracts SHOULD include reference to this protocol:

```markdown
## Contract Modification Authority

This contract is governed by **AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md**.

**CONSTITUTIONAL PROHIBITION**: This agent MUST NOT modify this contract file.

Contract modifications MUST be executed via the instruction system (`.github/agents/instructions/`) 
and MUST be performed by an authorized agent who is NOT the contract owner.

**Authority**: Johan Ras (ultimate), Governance Administrator (layer-down), instruction system (execution)
```

---

## 9. Instruction System Initialization

### 9.1 First-Time Setup

When deploying this protocol to a repository:

1. Create `.github/agents/instructions/` directory
2. Create `README.md` in instructions directory
3. Create `pending/`, `completed/`, `rejected/` subdirectories
4. Add binding to `.agent` file
5. Update Governance Liaison contract with prohibition language
6. Validate via governance gate

### 9.2 README.md Template

`.github/agents/instructions/README.md` MUST include:

```markdown
# Agent Contract Instruction System

**Authority**: AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md  
**Purpose**: Queue-based system for authorized agent contract modifications

## Constitutional Prohibition

**NO AGENT may modify their own contract file.** All contract modifications must be 
executed via this instruction system by an authorized agent who is NOT the contract owner.

## Directory Structure

- `pending/` - Instructions awaiting execution
- `completed/` - Successfully executed instructions
- `rejected/` - Invalid or rejected instructions

## Process

1. Authority creates instruction in `pending/`
2. Instruction assigns authorized executor (NOT contract owner)
3. Executor implements changes per instruction
4. Executor validates and moves instruction to `completed/`
5. Authority reviews and approves

## Authority Levels

- **Johan Ras**: Ultimate authority, can authorize any modification
- **Governance Administrator**: Can issue cross-repo layer-down instructions
- **Repository Owner**: Can request modifications (with Johan approval)

## Emergency Contact

For constitutional questions or violations: Escalate to Johan Ras
```

---

## 10. Related Documents

| Document | Purpose |
|----------|---------|
| **AGENT_FILE_BINDING_REQUIREMENTS.md** | Bindings in `.agent` files |
| **AGENT_RECRUITMENT.md** | Agent legitimacy and authority |
| **GOVERNANCE_PURPOSE_AND_SCOPE.md** | Supreme governance authority |
| **GOVERNANCE_RIPPLE_MODEL.md** | Cross-repo change propagation |

---

## 11. Version History

| Version | Date | Changes | Authority |
|---------|------|---------|-----------|
| 1.0.0 | 2026-01-13 | Initial protocol (layer-down from maturion-foreman-governance#938) | Johan Ras |

---

## 12. Authority and Precedence

**Authority**: This document is CONSTITUTIONAL and SUPREME for agent contract modification rules.

**Precedence**:
- This protocol supersedes any conflicting agent contract language
- This protocol cannot be waived or overridden except by Johan Ras
- Violations are constitutional matters requiring escalation

**Enforcement**:
- Governance Liaison MUST enforce this protocol
- Any agent attempting self-contract modification MUST be halted immediately
- Instruction system is the ONLY authorized mechanism for contract changes

---

**This protocol protects the integrity of agent contracts and prevents conflicts of interest.**

**Version**: 1.0.0  
**Last Updated**: 2026-01-13  
**Next Review**: 2026-07-13 (6 months)  
**Authority**: Johan Ras (Constitutional)
