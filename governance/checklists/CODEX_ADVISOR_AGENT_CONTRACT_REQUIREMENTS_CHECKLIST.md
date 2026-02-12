# CodexAdvisor Agent Contract Requirements Checklist

**Status**: Reference checklist for contract drafting  
**Purpose**: Exhaustive, source-mapped requirements for a compliant CodexAdvisor agent file in this repo.  
**Primary Sources**: Living Agent System v6.2.0, `governance/canon/*`, consumer repository governance protocols.

---

## Category 0 — Identity, Bindings & Scope

- [ ] **Frontmatter**: `agent.id=CodexAdvisor-agent`, `agent.class=overseer`, `agent.version=6.2.0`; governance protocol declares LIVING_AGENT_SYSTEM; canon_inventory path specified.
- [ ] **Mandatory bindings present**: CANON_INVENTORY.json path, expected artifacts enumerated (CANON_INVENTORY, CONSUMER_REPO_REGISTRY, GATE_REQUIREMENTS_INDEX), degraded mode semantics on placeholder hashes declared.
- [ ] **Scope declaration**: Repository-scoped, agent_files_location specified, approval_required policy declared.

## Category 1 — Authority & Approval Gates

- [ ] **CS2 authority explicit**: All agent file creation/modification requires CS2 authorization; PR-preferred workflow enforced; may_write_directly=false in consumer repositories.
- [ ] **Approval requirements**: ALL_ACTIONS require approval; PR submission mandatory with explicit CS2 authorization in PR description.
- [ ] **Prohibitions enumerated**: No execution without explicit approval, no weakening governance/tests/merge gates, no pushing to main, no secrets in commits, no self-extension of scope/authority, no edits to own agent contract except by CS2-approved issue.
- [ ] **Authority chain**: CS2 → CodexAdvisor → (advisory role, no direct execution authority over builders/foreman).

## Category 2 — Agent Factory Protocol

- [ ] **Agent creation authority**: Defined as agent_factory capability with PR_PREFERRED enforcement; locations specified as [".github/agents/"].
- [ ] **Required checklists binding**: All four checklists explicitly referenced with paths (governance_liaison, foreman, builder, codex_advisor).
- [ ] **Checklist enforcement**: MANDATORY compliance level; 100% checklist compliance required before file creation.
- [ ] **Living Agent System v6.2.0 template**: 9 mandatory components enumerated and enforced (YAML frontmatter, Mission, Wake-up, Memory, Agent Factory, Consumer Mode, Governance Sync, Merge Gate, Authority).
- [ ] **File size limit**: 30,000 character maximum enforced; GitHub UI selectability requirement documented; violation_action=FAIL_VALIDATION.
- [ ] **Template components verification**: Agent files must include: valid YAML frontmatter, mission statement, wake-up protocol, session memory protocol, agent-factory protocol (when applicable), consumer repository mode declaration, governance sync protocol, merge gate interface expectations, authority and prohibitions sections.

## Category 3 — Pre-Creation Requirements

- [ ] **CS2 authorization verification**: BEFORE creating any agent file, must receive CS2 authorization for specific agent file creation/modification.
- [ ] **Checklist loading**: Load appropriate checklist based on agent role from governance/checklists/ directory.
- [ ] **Checklist availability check**: Confirm checklist file exists; if missing check if ripple pending, run alignment first; if still missing STOP and escalate to CS2.
- [ ] **CANON_INVENTORY availability**: Confirm CANON_INVENTORY.json accessible; verify no placeholder hashes in PUBLIC_API artifacts; if degraded STOP and escalate to CS2.
- [ ] **100% checklist coverage**: Confirm 100% checklist coverage before proceeding with agent file creation.

## Category 4 — Governance Alignment & Drift Detection

- [ ] **CANON_INVENTORY-first governance**: Post-PR #1081 alignment model; inventory hash-compare drift detection method declared.
- [ ] **Ripple configuration**: dispatch_from_governance=false (consumer receives only); listen_on=repository_dispatch; canonical_source specified as APGI-cmy/maturion-foreman-governance.
- [ ] **Targets and registry**: targets_from path points to CONSUMER_REPO_REGISTRY.json.
- [ ] **Schedule fallback**: Hourly drift detection schedule declared for missed ripple events.
- [ ] **Evidence paths**: sync_state.json path specified under .agent-admin/governance/.

## Category 5 — Escalation & Stop Conditions

- [ ] **Escalation authority**: CS2 designated as escalation authority.
- [ ] **Escalation rules enumerated**: Contract/authority changes → escalate; canon interpretation/override → escalate; missing expected artifacts → stop_and_escalate; placeholder/truncated hashes in PUBLIC_API → degraded_and_escalate; third-repeat alignment failure → escalate_catastrophic.
- [ ] **Stop triggers**: Missing permissions, inventory access failures, degraded governance state → halt and escalate (governance liaison invocation or direct CS2 escalation).

## Category 6 — Advisory Capabilities

- [ ] **Advisory scope**: Inventory-first alignment and drift detection (hash-compare), evidence-first guidance (prehandover proof, RCA on failure, improvement capture), Merge Gate Interface standardization and branch protection alignment.
- [ ] **Agent factory advisory**: Create or update agent files capability with defined locations, required checklists, enforcement level, compliance requirements, file size limits, approval constraints.
- [ ] **Alignment advisory**: Drift detection methodology, ripple listening, schedule fallback, evidence path management.

## Category 7 — Consumer Repository Mode

- [ ] **Consumer designation**: Repository identified as consumer of canonical governance from APGI-cmy/maturion-foreman-governance.
- [ ] **Checklist locations**: Governance checklists located at governance/checklists/ (not governance-pack/checklists/).
- [ ] **Canon inventory location**: CANON_INVENTORY tracked in governance/ structure (consumer-adapted path).
- [ ] **Ripple reception**: Receive-only mode; cannot dispatch ripple; governance changes escalate to canonical source.
- [ ] **Governance prohibitions**: No modification of canonical governance directory (receive-only); no bypassing alignment gate; no creating governance canon (consumer does not author); no dispatching ripple events.
- [ ] **Governance capabilities**: Receive and process governance ripple events, detect drift, create alignment PRs, report alignment status, escalate constitutional changes for CS2 review.

## Category 8 — Merge Gate Interface

- [ ] **Required checks enumerated**: Three mandatory checks listed (merge-gate/verdict, governance/alignment, stop-and-fix/enforcement).
- [ ] **Auto-merge conditions**: Only allowed when required checks are green.
- [ ] **Alignment check basis**: Compares local code/config against CANON_INVENTORY.json.

## Category 9 — Memory & Evidence Protocol

- [ ] **Session memory protocol documented**: File path structure (.agent-workspace/<agent-id>/memory/session-NNN-YYYYMMDD.md), template provided, Living Agent System v6.2.0 evidence requirements.
- [ ] **Memory rotation**: When > 5 sessions, move oldest to .archive/, keep only 5 most recent.
- [ ] **Personal learning files**: lessons-learned.md and patterns.md in .agent-workspace/<agent-id>/personal/ (cumulative, not rotated).
- [ ] **Escalation inbox**: blocker-YYYYMMDD.md files in .agent-workspace/<agent-id>/escalation-inbox/ when needed.
- [ ] **Persistence mechanism**: Files persist via .gitignore configuration (excludes only working-contract.md and environment-health.json).

## Category 10 — Wake-Up & Session Closure

- [ ] **Wake-up protocol**: Run .github/scripts/wake-up-protocol.sh CodexAdvisor-agent; review generated working-contract.md; proceed only when CANON_INVENTORY present and hashes complete.
- [ ] **Wake-up phases**: Identity → memory scan → governance load → environment health → big picture → escalations → working contract.
- [ ] **Degraded mode handling**: Escalate if CANON_INVENTORY has placeholder/truncated hashes.
- [ ] **Session closure requirements**: Create session memory file, update personal learning files, create escalations if needed, all via standard file creation and git commit.

## Category 11 — Execution Identity & Safety

- [ ] **Execution identity**: Name specified as "Maturion Bot", secret references MATURION_BOT_TOKEN.
- [ ] **Safety constraints**: never_push_main=true, write_via_pr_by_default=true.
- [ ] **PR workflow**: All writes via PR; no direct pushes to main branch.

## Category 12 — Version & Metadata

- [ ] **Version declaration**: agent.version=6.2.0 present in YAML frontmatter.
- [ ] **Living Agent System compliance**: LIVING_AGENT_SYSTEM_v6_2_0 compliance level declared.
- [ ] **Metadata section**: canonical_home specified (APGI-cmy/maturion-foreman-governance), this_copy marked as "consumer", authority=CS2, last_updated timestamp present.
- [ ] **Version status confirmation**: Repository identified as having all v6.2.0 references including session memory (as of governance audit).

---

## Appendix A — Living Agent System v6.2.0 Template Components (9 Mandatory)

These components MUST appear in every agent file created by CodexAdvisor:

1. **YAML Frontmatter** (REQ-CM-001, REQ-CM-002): Consumer mode fields including id, agent class/version, governance protocol/canon_inventory, merge_gate_interface, scope, capabilities, escalation, prohibitions, metadata.

2. **Mission Statement**: Clear declaration of agent's purpose, role, and primary responsibilities.

3. **Living-Agent Wake-Up Protocol**: Phases enumerated, wake-up script path, working contract review, CANON_INVENTORY verification, degraded-mode semantics.

4. **Session Memory Protocol**: File path structure, template with all required sections, memory rotation rules, personal learning updates, escalation creation process.

5. **Agent-Factory Protocol** (when applicable): Authority notice, CS2 authorization requirement, consumer repository mode, requirements (frontmatter, bindings, checklists, template, size limits), pre-creation requirements.

6. **Consumer Repository Mode**: Key differences, checklist locations, canon inventory path, ripple reception mode, prohibitions, capabilities.

7. **Governance Sync Protocol**: Receiving ripple events, creating ripple inbox entry, updating sync state, creating alignment PR, post-merge actions, drift detection.

8. **Merge Gate Interface Expectations**: Required checks enumeration, auto-merge conditions, alignment check basis.

9. **Authority & Prohibitions**: CS2 authority explicit, approval requirements clear, prohibitions enumerated, escalation paths defined.

---

## Usage

Treat every unchecked item as a blocker for CodexAdvisor agent file readiness. Cite the listed source or agent file section that satisfies the item. If a required source is unavailable or hash-mismatched, halt and escalate per Category 5.

**Compliance verification**: Run validation against this checklist before any agent file creation/modification PR is submitted. A CodexAdvisor agent file is INVALID and OUT OF GOVERNANCE if ANY required element is missing or non-compliant.

---

**Authority**: Living Agent System v6.2.0  
**Version**: 1.0.0  
**Created**: 2026-02-12  
**Repository**: APGI-cmy/R_Roster (Consumer Mode)
