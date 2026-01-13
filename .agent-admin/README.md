# .agent-admin Directory

**Purpose**: Workspace for governance artifacts and administrative evidence produced by agents during task execution.

**Authority**: EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+, PREHANDOVER_PROOF_TEMPLATE v2.0.0

---

## Directory Structure

```
.agent-admin/
├── scans/              # Governance compliance scans
├── risk-assessments/   # Risk and impact assessments
├── changes/            # Change records and decision logs
├── completion/         # Completion summaries and handover evidence
└── validation/         # Historical validation artifacts
```

---

## Artifact Types

### 1. Governance Scans (`scans/`)

**Purpose**: Pre-work governance compliance review to identify applicable policies, bindings, and constitutional requirements.

**When to Create**:
- MANDATORY: Before starting any task
- RECOMMENDED: After governance updates (quarterly)

**Naming Convention**: `scan_YYYYMMDD_HHMMSS.md` or `scan_[task-description]_YYYYMMDD.md`

**Template**: See `EXAMPLE_governance_scan.md`

**Contents**:
- Canonical governance review (from maturion-foreman-governance)
- Local governance review (this repository)
- Constitutional principles assessment
- Applicable agent contract requirements
- Governance gaps identified

**Retention**: Keep last 5 scans per agent

---

### 2. Risk Assessments (`risk-assessments/`)

**Purpose**: Comprehensive impact analysis and risk mitigation strategy for proposed changes.

**When to Create**:
- MANDATORY: Before changes with potential ripple effects
- MANDATORY: For Tier-0 governance modifications
- RECOMMENDED: For significant feature work

**Naming Convention**: `risk_NNN_YYYYMMDD.md` or `risk_[task-description]_YYYYMMDD.md`

**Template**: See `EXAMPLE_risk_assessment.md`

**Contents**:
- Repository and agent context
- Impact analysis by category
- Ripple effect mapping
- Risk mitigation strategies
- Residual risk documentation
- Constitutional compliance risks

**Retention**: Keep last 5 assessments per agent

---

### 3. Change Records (`changes/`)

**Purpose**: Detailed change log with rationale, decisions made, and traceability to requirements.

**When to Create**:
- MANDATORY: For all tasks with file modifications
- RECOMMENDED: For complex changes requiring decision documentation

**Naming Convention**: `change_NNN_YYYYMMDD.md` or `change_[task-description]_YYYYMMDD.md`

**Template**: See `EXAMPLE_change_record.md`

**Contents**:
- Files created/modified/deleted
- Design decisions and alternatives considered
- Traceability to requirements
- Implementation challenges and resolutions
- Cross-references to related work

**Retention**: Keep last 5 change records per agent

---

### 4. Completion Summaries (`completion/`)

**Purpose**: Final delivery summary with metrics, evidence, and handover readiness assessment.

**When to Create**:
- MANDATORY: Before handover/PR submission
- Part of PREHANDOVER_PROOF generation

**Naming Convention**: `completion_NNN_YYYYMMDD.md` or `completion_[task-description]_YYYYMMDD.md`

**Template**: See `EXAMPLE_completion_summary.md`

**Contents**:
- Delivery metrics (files changed, lines changed)
- Deliverable status checklist
- Quality gates passed
- Constitutional compliance evidence
- Handover readiness assessment
- Evidence location references

**Retention**: Keep last 5 completion summaries per agent

---

### 5. Validation Artifacts (`validation/`)

**Purpose**: Historical validation evidence and audit trails.

**When to Create**:
- As needed for special validations
- Protocol alignment audits
- Compliance verification artifacts

**Naming Convention**: `[validation-type]_YYYYMMDD.md`

**Examples**:
- `AGENT_CONTRACT_PROTOCOL_ALIGNMENT_AUDIT_2026-01-13.md`
- `tier0_consistency_validation_2026-01-15.md`

**Retention**: Keep indefinitely (audit trail)

---

## Artifact Usage Patterns

### Embedded vs Separate Files

**Embed artifacts in PREHANDOVER_PROOF when**:
- Artifact is concise (< 100 lines)
- Single-use artifact specific to one task
- Quick review needed without file navigation

**Create separate files in `.agent-admin/` when**:
- Artifact is extensive (> 100 lines)
- Artifact may be referenced by multiple PRs
- Detailed analysis requires dedicated document

**Always** provide clear references in PREHANDOVER_PROOF to separate artifact files.

---

## File Naming Guidelines

### Timestamp Format
- **Date-based**: `YYYYMMDD` (e.g., `20260113`)
- **Full timestamp**: `YYYYMMDD_HHMMSS` (e.g., `20260113_143022`)
- **ISO 8601**: `YYYY-MM-DDTHH:MM:SSZ` (for display in docs)

### Task Description
- Use kebab-case: `template-layer-down`, `contract-update`
- Keep concise (max 3-4 words)
- Include issue number if applicable: `issue-123-template-update`

### Sequence Numbers
- Use `NNN` format: `001`, `002`, `003`...
- Increment per artifact type, not globally
- Reset per agent if needed

---

## Retention Policy

### Active Artifacts
- Keep last 5 per artifact type per agent
- Rotate on a per-type basis: When creating 6th artifact of a type, delete oldest of that type only (not other artifact types)
- Retain if referenced in open PRs (do NOT delete until PR merged/closed)
- Retain if referenced in merged PRs from last 30 days

**Practical Example of Rotation**:
- Agent has 5 governance scans, 3 risk assessments
- Creates new governance scan → Delete oldest governance scan (now 5 scans total)
- Risk assessments remain at 3 (rotation per-type, not global)
- If oldest scan referenced in open PR → Keep it, now have 6 scans temporarily

### Archive Strategy
- Move old artifacts to `archive/` subdirectory (if needed)
- Compress archived artifacts after 6 months
- Delete archives after 1 year (unless audit/legal retention required)

### Exception: Validation Artifacts
- Keep indefinitely for audit trail
- These are typically small and infrequent

---

## Agent Responsibilities

### Agent Contract Administrator
**Artifacts Created**:
- Governance scans (every job)
- Risk assessments (before `.agent` modifications)
- Change records (for contract updates)

**Retention**: Last 3 per type (per contract specification)

---

### Governance Liaison
**Artifacts Created**:
- Governance scans (for governance layer-downs)
- Risk assessments (for constitutional changes)
- Completion summaries (for all governance PRs)

**Retention**: Last 5 per type

---

### Builders (all types)
**Artifacts Created**:
- Risk assessments (for significant features)
- Change records (for complex implementations)
- Completion summaries (with PREHANDOVER_PROOF)

**Retention**: Last 5 per type

---

### ForemanApp
**Artifacts Created**:
- Completion summaries (for orchestration tasks)
- Validation artifacts (for PR gate verification)

**Retention**: Last 5 per type

---

## PREHANDOVER_PROOF Integration

**Template Version**: 2.0.0 requires ALL four artifacts for every PR:
1. Governance Scan
2. Risk Assessment
3. Change Record
4. Completion Summary

**Artifact Location Options**:
1. **Embedded**: Include artifact content directly in PREHANDOVER_PROOF
2. **Referenced**: Create separate file in `.agent-admin/`, reference path in PREHANDOVER_PROOF

**Example PREHANDOVER_PROOF Reference**:
```markdown
## Governance Artifacts (MANDATORY)

### Artifact 1: Governance Scan
**Status**: ✅ COMPLETE
**Artifacts**:
- Embedded: No
- Separate File: Yes
**Governance Scan Reference**: `.agent-admin/scans/scan_template_layerdown_20260113.md`
```

---

## Examples

This directory includes example templates for all artifact types:

1. `scans/EXAMPLE_governance_scan.md`
2. `risk-assessments/EXAMPLE_risk_assessment.md`
3. `changes/EXAMPLE_change_record.md`
4. `completion/EXAMPLE_completion_summary.md`

**Usage**: Copy example file, rename with appropriate timestamp/description, fill in actual values.

---

## Validation

**Artifact Completeness Check**:
- All PREHANDOVER_PROOF files should reference all four artifacts
- Separate artifact files should exist at referenced paths
- Artifacts should be complete (no placeholder text remaining)

**Quality Check**:
- Governance scans should identify applicable requirements
- Risk assessments should have mitigation strategies
- Change records should trace to requirements
- Completion summaries should have 100% checklist completion

---

## Authority & Compliance

**Mandated By**:
- EXECUTION_BOOTSTRAP_PROTOCOL v2.0.0+ (Tier-0)
- PREHANDOVER_PROOF_TEMPLATE v2.0.0 (governance/templates/)
- AGENT_CONTRACT_MANAGEMENT_PROTOCOL (Tier-0)

**Constitutional Requirement**: YES

**Can Be Waived**: NO

**Escalation**: Governance Liaison or Johan Ras for questions

---

**Directory Established**: 2026-01-13  
**Last Updated**: 2026-01-13  
**Version**: 1.0.0
