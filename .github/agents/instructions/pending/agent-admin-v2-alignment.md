# Instruction: Update Agent Contract Administrator Contract with v2.0.0 Requirements

**Instruction ID**: agent-admin-v2-alignment  
**Created**: 2026-01-13T14:02:25Z  
**Created By**: agent-contract-administrator (self-identified need)  
**Target Agent**: governance-liaison OR CodexAdvisor (NOT agent-contract-administrator)  
**Priority**: MEDIUM  
**Status**: PENDING

---

## Context

Per AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md, agent-contract-administrator CANNOT modify its own contract file (`.github/agents/agent-contract-administrator.md`) to prevent conflicts of interest and governance circumvention.

During execution of issue "Agent file alignment: v2.0.0 PREHANDOVER_PROOF + mandatory improvement proposals", agent-contract-administrator successfully updated 8 agent contracts but must delegate updating its own contract to an authorized agent.

---

## Rationale

**Constitutional Constraint**: `.github/agents/agent-contract-administrator.md` states:

> "CONSTITUTIONAL PROHIBITION: This agent MUST NOT modify `.github/agents/agent-contract-administrator.md` (this contract file)."

This is Tier-0 constitutional and CANNOT be waived. Agent-contract-administrator correctly identified this constraint during risk assessment and created this instruction instead.

---

## Task Description

Update `.github/agents/agent-contract-administrator.md` to align with v2.0.0 PREHANDOVER_PROOF template requirements and enforce mandatory improvement proposals.

### Required Changes

#### 1. Add PREHANDOVER_PROOF v2.0.0 Section

Add new section after "Workspace" section (around line 170):

```markdown
## PREHANDOVER_PROOF v2.0.0 Requirements (MANDATORY)

**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+ (maturion-foreman-governance PR #924), governance/templates/PREHANDOVER_PROOF_TEMPLATE.md v2.0.0

Before completing agent contract modification work, Agent Contract Administrator MUST generate PREHANDOVER_PROOF v2.0.0 demonstrating compliance.

### Section 0: Four Mandatory Governance Artifacts

Agent Contract Administrator MUST complete ALL four governance artifacts before handover:

1. **Governance Scan** (Artifact 1)
   - Comprehensive scan of canonical governance (maturion-foreman-governance) and local governance
   - Location: `.agent-admin/scans/scan_YYYYMMDD_HHMMSS.md`

2. **Risk Assessment** (Artifact 2)
   - Impact analysis for all affected agent contracts
   - Repository context (R_Roster agents only)
   - Location: `.agent-admin/risk-assessments/risk_NNN_YYYYMMDD.md`

3. **Change Record** (Artifact 3)
   - Detailed log of all `.agent` file modifications
   - Rationale, design decisions, alternatives considered
   - Location: `.agent-admin/changes/change_NNN_YYYYMMDD.md`

4. **Completion Summary** (Artifact 4)
   - Final delivery summary with agent contract modification metrics
   - Location: `.agent-admin/completion/completion_NNN_YYYYMMDD.md`

**Artifact Location**: All artifacts stored in `.agent-admin/` subdirectories per workspace management protocol.

### Section 9: CST Validation Attestation

Agent Contract Administrator work is typically **Path B (CST Not Required)** with justification:
- "Agent contract modifications are documentation-only changes"
- "No application code affected"
- "No cross-component integration"

If agent contract changes affect builder coordination or workflows, escalate CST applicability to ForemanApp.

### Section 11: FAQ Reference

Comprehensive FAQ available in governance/templates/PREHANDOVER_PROOF_TEMPLATE.md v2.0.0 (lines 645-702).

**Template Location**: governance/templates/PREHANDOVER_PROOF_TEMPLATE.md v2.0.0 (718 lines)
```

#### 2. Add Mandatory Improvement Proposal Section

Add new section after "Self-Awareness and Continuous Improvement" section (around line 160):

```markdown
## Mandatory Improvement Proposal (COMPULSORY)

**Authority**: MANDATORY_ENHANCEMENT_CAPTURE_DOCTRINE.md, up-rippled from governance canon  
**Status**: MANDATORY at completion (cannot finalize without)

After completing agent contract modification work, Agent Contract Administrator MUST provide at least ONE specific improvement proposal OR detailed justification why no improvements are warranted.

### Required Questions

1. **What went well in this contract modification?**
   - Identify governance elements that enabled success
   - Highlight what should be preserved

2. **What failed, was blocked, or required rework?**
   - Document failures, blockers, rework cycles with root causes
   - Include governance gaps or unclear specifications

3. **What process or governance changes would have improved this work?**
   - Propose specific improvements to prevent recurrence
   - Identify friction points in contract modification workflow

4. **Did you comply with all governance learnings and constitutional requirements?**
   - Verify compliance with AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md
   - Verify repository awareness (R_Roster agents only)
   - If non-compliance: STOP, document reason, escalate to CS2

5. **What actionable improvement should be layered up to governance canon?**
   - Propose concrete governance/process changes for canonization
   - OR justify why no improvements are warranted with detailed reasoning

**Minimum Requirement**: Agent Contract Administrator MUST propose at least ONE specific improvement OR provide detailed justification why no improvements are warranted. Generic "None identified" is PROHIBITED without substantive justification.

**FM/CS2 Routing**: Improvement proposals are recorded as PARKED and routed to Johan Ras (CS2) for governance consideration.

**Prohibition**: Agent Contract Administrator cannot finalize work without improvement proposal completion.
```

#### 3. Update Handover Requirements Section

Locate "Handover Requirements" section (around line 175) and enhance:

```markdown
## Handover Requirements

**Exit Code**: 0

**Options**:
1. 100% complete with PREHANDOVER_PROOF v2.0.0 (Section 0, 9, 11 complete) AND mandatory improvement proposal
2. Governance blocker escalated

**NO Option 3**

**v2.0.0 Compliance Checklist**:
- ✅ Governance Scan complete (Artifact 1)
- ✅ Risk Assessment complete (Artifact 2)
- ✅ Change Record complete (Artifact 3)
- ✅ Completion Summary complete (Artifact 4)
- ✅ CST attestation complete (typically Path B for contract modifications)
- ✅ At least ONE specific improvement proposal OR justified "no improvements" statement
- ✅ All agent contract modifications validated
- ✅ Repository context verified (R_Roster agents only)

**Continuous Improvement**: MANDATORY (including self-contract review and improvement proposal)
```

---

## Validation Criteria

After implementing changes:

1. ✅ PREHANDOVER_PROOF v2.0.0 section added with Section 0, 9, 11 requirements
2. ✅ Mandatory Improvement Proposal section added with 5 questions
3. ✅ Handover Requirements section updated with v2.0.0 checklist
4. ✅ All references to governance/templates/PREHANDOVER_PROOF_TEMPLATE.md specify v2.0.0
5. ✅ Constitutional constraint (cannot modify own contract) preserved
6. ✅ Repository awareness (R_Roster) maintained
7. ✅ No breaking changes to existing workflows

---

## Authority

- AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md (Tier-0 Constitutional)
- EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+ (maturion-foreman-governance PR #924)
- MANDATORY_ENHANCEMENT_CAPTURE_DOCTRINE.md
- Issue: "Agent file alignment: v2.0.0 PREHANDOVER_PROOF + mandatory improvement proposals"

---

## Assigned Agent Requirements

**Authorized Agents**: governance-liaison OR CodexAdvisor (with Johan Ras approval)  
**Prohibited Agent**: agent-contract-administrator (constitutional constraint)

**Assigned Agent MUST**:
- Review this instruction completely
- Verify constitutional authority to modify agent-contract-administrator.md
- Make ONLY the changes specified above
- Preserve all existing sections and functionality
- Validate changes align with other 8 agent contracts already updated
- Generate own PREHANDOVER_PROOF v2.0.0 for this work
- Provide improvement proposal per MANDATORY_ENHANCEMENT_CAPTURE_DOCTRINE.md

---

## Notes

This instruction was created as part of comprehensive agent file alignment work where agent-contract-administrator updated 8 other agent contracts but correctly identified constitutional constraint preventing self-modification.

**Parallel Work**: 
- ✅ api-builder.md updated
- ✅ qa-builder.md updated
- ✅ ui-builder.md updated
- ✅ schema-builder.md updated
- ✅ integration-builder.md updated
- ✅ governance-liaison.md updated
- ✅ ForemanApp-agent.md updated
- ✅ CodexAdvisor-agent.md updated
- ⏳ agent-contract-administrator.md awaiting authorized agent (THIS INSTRUCTION)
- ✅ BUILDER_CONTRACT_SCHEMA.md updated

---

**Created By**: agent-contract-administrator  
**Reason**: Constitutional prohibition on self-modification  
**Escalation Path**: governance-liaison → Johan Ras (if needed)  
**Expected Completion**: Before PR merge of agent alignment work
