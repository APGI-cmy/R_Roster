# Foreman Recognized Patterns

This file tracks recurring patterns observed across sessions.

## Pattern Template

### Pattern: [Name]
- Observed: YYYY-MM-DD (Session NNN)
- Context: [when this occurs]
- Response: [how to handle]

---

## Active Patterns

### Pattern: Evidence Artifact Bundle Standard
- Observed: 2026-02-12 (Session 001)
- Context: Every governed PR requires evidence artifacts in standardized locations
- Response: Use `.github/scripts/create-evidence-bundle.sh` to create structure; validate JSON schema; ensure all required artifacts present

### Pattern: Deterministic PR Classification
- Observed: 2026-02-12 (Session 001)
- Context: Gates need to classify PRs to determine applicable requirements
- Response: Use rule-based classification with precedence: label override → branch pattern → file path analysis; avoid inference

### Pattern: Three-Phase Deprecation
- Observed: 2026-02-12 (Session 001)
- Context: Migrating from legacy system to new standard
- Response: Phase 1 (coexistence), Phase 2 (deprecation warnings), Phase 3 (removal); always provide grace period

### Pattern: Foreman Session Protocol
- Observed: 2026-02-12 (Session 001)
- Context: Every Foreman work session
- Response: Wake-up at start (load context) → execute task → session closure (create memory, rotate, clean ephemeral)

### Pattern: Machine-Readable Evidence
- Observed: 2026-02-12 (Session 001)
- Context: Evidence artifacts must be programmatically validatable
- Response: Use JSON schema for gate results; validate syntax and required fields; fail fast on invalid evidence
