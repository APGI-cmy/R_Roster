# Improvement Instruction: Add QIW Governance Binding to Agent Contract Administrator

**Instruction ID**: IMPROVE-ACA-QIW-001  
**Date**: 2026-01-14  
**Target Agent**: agent-contract-administrator  
**Authority**: Agent Contract Administrator (self-identified gap)  
**Priority**: LOW (non-blocking, enhancement)

---

## Context

During execution of task "Update All Agent Contracts to Implement QIW Watchdog Channel", the Agent Contract Administrator successfully updated all 8 other agent contracts with QIW governance binding and enforcement sections.

Per constitutional prohibition (AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md), the Agent Contract Administrator correctly did NOT modify its own contract file (`.github/agents/agent-contract-administrator.md`).

However, upon mandatory self-contract review (per Section "Self-Awareness and Continuous Improvement"), a gap was identified.

---

## Gap Identified

**Issue**: Agent Contract Administrator's own contract (`.github/agents/agent-contract-administrator.md`) does NOT include QIW Watchdog Channel governance binding.

**Current State**:
- All 8 other agent contracts: ✅ Have QIW binding
- .agent repository file: ✅ Has QIW binding
- agent-contract-administrator.md: ❌ Missing QIW binding

**Impact**: LOW
- Agent Contract Administrator can still function effectively
- Agent is aware of QIW through .agent file and other agents' contracts
- Gap is consistency/completeness, not functional blocking

---

## Proposed Fix

Add QIW governance binding to `.github/agents/agent-contract-administrator.md` in the "Governance Bindings" section (around line 91-111).

### Location

After the existing governance bindings (currently ending with `build-philosophy` binding), add:

```yaml
    - id: qiw-watchdog-channel
      path: governance/canon/WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md
      role: quality-integrity-awareness
      version: 1.0.0
      source-pr: maturion-foreman-governance#948
      tier: 0
      status: canonical
      summary: Quality Integrity Watchdog (QIW) monitoring and QA blocking requirements
```

### Optional: QIW Awareness Section

Consider adding a brief QIW awareness section after "Contract Modification Authority" section to clarify Agent Contract Administrator's role relative to QIW:

**Suggested content**:

```markdown
---

## QIW Governance Awareness

**Authority**: WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0 (governance/canon/)

Agent Contract Administrator is aware of QIW Watchdog Channel requirements and ensures:
- All agent contract modifications maintain QIW governance binding accuracy
- QIW compliance is not compromised during agent contract updates
- QIW-related governance changes ripple correctly to all agent contracts

**Role**: Governance contract management (not QIW enforcement or implementation)
```

---

## Rationale

**Why This Improvement**:
1. **Consistency**: All agents in R_Roster should have uniform governance bindings for canonical requirements
2. **Completeness**: Agent Contract Administrator manages agent contracts and should have the same bindings it manages in others
3. **Future-Proofing**: When QIW-related governance changes occur, Agent Contract Administrator needs binding awareness to propagate updates

**Why Not Critical**:
1. Agent Contract Administrator's primary role is `.agent` file management and governance contract administration
2. QIW enforcement is handled by other agents (builders, FM, governance-liaison)
3. Agent can reference QIW through .agent file and canonical governance

---

## Assignment

**Assigned To**: Governance Liaison OR Foreman (NOT agent-contract-administrator per constitutional prohibition)

**Process**:
1. Authorized agent reads this instruction
2. Authorized agent adds QIW binding to agent-contract-administrator.md
3. Authorized agent optionally adds QIW awareness section
4. Authorized agent updates version (1.2.0 → 1.3.0)
5. Authorized agent updates date to execution date
6. Authorized agent validates YAML frontmatter integrity
7. Authorized agent creates PR with changes
8. Johan Ras reviews and approves

---

## Validation Criteria

✅ QIW governance binding present in YAML section  
✅ Binding matches format of other agents  
✅ Version incremented (1.2.0 → 1.3.0)  
✅ Date updated to modification date  
✅ YAML frontmatter valid  
✅ Optional QIW awareness section added (if implemented)

---

## Escalation

**Escalate To**: Johan Ras (CS2) if:
- Constitutional ambiguity about who can modify agent-contract-administrator.md
- Governance conflict emerges
- Authorization unclear

---

## Related Documents

- WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0
- AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md
- governance/alignment/QIW_ALIGNMENT.md
- Issue: "Update All Agent Contracts to Implement QIW Watchdog Channel"

---

**Status**: PENDING  
**Created By**: agent-contract-administrator (self-identified gap)  
**Requires Authorization From**: Governance Liaison OR Foreman  
**Final Approval**: Johan Ras (CS2)

---

**End of Instruction**
