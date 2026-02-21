# Governance Liaison Escalation Inbox

This directory holds escalation files created by the governance ripple integration system when
agent file changes are detected in a governance layer-down event.

## When Escalation Files Are Created

An escalation file (`blocker-<YYYYMMDD>.md`) is created when:

1. A governance layer-down issue is received (via `issues` event or `workflow_dispatch`).
2. The associated governance changes include modifications to `.github/agents/` files.
3. Per governance protocol, agent file changes MUST be reviewed by CS2 before merging.

## Escalation File Naming

Files are named `blocker-<YYYYMMDD>-issue-<N>.md` (e.g. `blocker-20260221-issue-42.md`).

## Escalation File Format

```markdown
# Escalation: Agent File Change Detected in Governance Layer-Down

## Type
BLOCKER

## Description
Agent file(s) detected in governance layer-down issue #<N>.
CS2 review required before merge.

## Context
Issue: #<N> - <title>
Detected: <timestamp>

## Recommendation
1. CS2 reviews the agent file changes in the associated draft PR.
2. If approved, CS2 removes the `escalation:agent-files` label and approves the PR.
3. If rejected, CS2 closes the draft PR and documents the reason.
```

## Authority

- `AGENT_CONTRACT_MANAGEMENT_PROTOCOL.md` v3.1.0 (Section 3.2)
- `ESCALATION_POLICY.md`
- Living Agent System v6.2.0
