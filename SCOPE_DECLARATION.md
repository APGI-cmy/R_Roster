# SCOPE DECLARATION

**Authority**: BL-027 (BOOTSTRAP_EXECUTION_LEARNINGS.md)  
**Date**: 2026-01-19  
**Agent**: agent-contract-administrator v3.0.0  
**Issue**: Governance Remediation - Complete Universal and Agent-Specific Bindings Update

---

## Files Modified

M .github/agents/governance-liaison.md
M .github/agents/ForemanApp-agent.md
M .github/agents/api-builder.md
M .github/agents/integration-builder.md
M .github/agents/qa-builder.md
M .github/agents/schema-builder.md
M .github/agents/ui-builder.md

---

## Change Type Legend

- **M** = Modified (existing file updated)
- **A** = Added (new file created)
- **D** = Deleted (file removed)

---

## Change Summary

All modifications add/update governance bindings sections in agent contracts:
- Adding 10 universal canonical bindings to all agents
- Adding agent-specific bindings per agent type
- Updating version numbers (minor version bump)
- Documenting changes in version history

**Total Files**: 7 modified agent contract files

---

## Validation

This scope declaration will be validated against actual git diff using:
```bash
.github/scripts/validate-scope-to-diff.sh
```

Exit code 0 required before PR handover (BL-027).
