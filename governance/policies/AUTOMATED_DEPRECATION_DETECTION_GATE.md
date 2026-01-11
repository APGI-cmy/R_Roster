# Automated Deprecation Detection Gate

**Repository**: R_Roster  
**Authority**: Constitutional  
**Source**: APGI-cmy/maturion-foreman-governance (BL-024, BL-026)  
**Version**: 1.0.0  
**Date**: 2026-01-11  
**Status**: ACTIVE

---

## Constitutional Mandate

This policy implements BL-024 (Constitutional Sandbox Pattern) and BL-026 (Deprecation Detection Learning) as mandatory governance safeguards. All code introduced to this repository must comply with automated deprecation detection requirements.

**Layer-Down Requirement**: This gate must be operational before any feature work or builder onboarding post-2026-01-11.

---

## Authority & Enforcement

**Status**: MANDATORY  
**Enforcement Level**: PR-BLOCKING  
**Waiver Authority**: None (constitutional)  
**Override Path**: Johan Ras only (with documented justification)

---

## Scope

### Covered Languages

This gate applies to all detected languages in the codebase:

- **Python**: Enforced via `ruff` linter with deprecation checks
- **JavaScript/TypeScript**: Enforced via `ESLint` with deprecation detection plugins
- **Other languages**: Extended as codebase composition evolves

### Detection Targets

The gate detects and blocks:

1. **Deprecated API Usage**
   - Standard library deprecated functions
   - Third-party library deprecated methods
   - Framework deprecated patterns

2. **Deprecated Dependencies**
   - Packages marked as deprecated in package registries
   - Dependencies with security advisories
   - Unmaintained dependencies (no updates >2 years)

3. **Deprecated Language Features**
   - Language syntax/features marked for removal
   - Compatibility-breaking patterns in upcoming versions

---

## Pre-Commit Hook

### Configuration

Pre-commit hooks MUST be configured to run deprecation detection before any commit is accepted locally.

**Python Configuration** (`.pre-commit-config.yaml`):
```yaml
- repo: https://github.com/astral-sh/ruff-pre-commit
  rev: v0.1.15
  hooks:
    - id: ruff
      args: [--select, F401,F821,UP,B,W605]
```

**JavaScript/TypeScript Configuration** (`.eslintrc.json`):
```json
{
  "extends": ["eslint:recommended"],
  "plugins": ["deprecation"],
  "rules": {
    "deprecation/deprecation": "error"
  }
}
```

### Installation

All developers must install pre-commit hooks:

```bash
# Install pre-commit
pip install pre-commit  # or npm install -g pre-commit

# Install hooks
pre-commit install

# Optional: Run on all files
pre-commit run --all-files
```

---

## CI/CD Gate

### Workflow Integration

The deprecation detection gate runs as a mandatory CI check in `.github/workflows/deprecation-gate.yml`.

**Status Check**: `deprecation-gate`  
**Required for Merge**: YES  
**Failure Handling**: BLOCKING

### Failure Response

When the gate fails:

1. **STOP**: Do not proceed with merge
2. **ANALYZE**: Review deprecation warnings/errors
3. **REMEDIATE**: 
   - Update to non-deprecated alternatives, OR
   - Document exception with justification (see Exception Process)
4. **VERIFY**: Re-run gate locally and in CI
5. **DOCUMENT**: Update audit log

---

## Audit Process

### Codebase Audit

Before initial gate activation, perform comprehensive deprecation audit:

1. **Scan all source files** for deprecated API usage
2. **Scan all dependencies** for deprecated packages
3. **Generate audit report** in `governance/reports/deprecation-audit-YYYY-MM-DD.md`
4. **Create remediation plan** with prioritized technical debt tickets
5. **Establish baseline** for ongoing monitoring

### Dependency Audit

Quarterly dependency audits required:

- Review all direct and transitive dependencies
- Check for deprecation notices in package registries
- Update or replace deprecated dependencies
- Document exceptions in whitelist

---

## Exception Process

### Justified Usage

Deprecated APIs may be used ONLY when:

1. **No viable alternative exists** (documented)
2. **Migration cost exceeds risk** (quantified)
3. **Third-party dependency constraint** (cannot update)

### Exception Requirements

ALL exceptions MUST include:

1. **FM Approval**: Foreman or Johan Ras approval required
2. **Code Comments**: Inline comment explaining justification
   ```python
   # DEPRECATION EXCEPTION: Using deprecated_function()
   # Justification: No alternative API available in v2.x, required for compatibility
   # Approved by: Johan Ras (2026-01-11)
   # Review date: 2026-04-11 (quarterly)
   ```
3. **Whitelist Entry**: Add to `.deprecation-whitelist.json`
4. **Quarterly Review**: Re-evaluate every 3 months

### Whitelist Format

`.deprecation-whitelist.json`:
```json
{
  "exceptions": [
    {
      "file": "src/legacy_integration.py",
      "line": 42,
      "pattern": "deprecated_function",
      "justification": "No alternative API in v2.x",
      "approved_by": "Johan Ras",
      "approval_date": "2026-01-11",
      "review_date": "2026-04-11",
      "status": "active"
    }
  ]
}
```

---

## Builder Contract Requirements

### Builder Obligations

All builder agents MUST:

1. **Pre-Check**: Run deprecation detection locally before committing
2. **Zero Violations**: No new deprecation violations introduced
3. **Documentation**: Document any necessary exceptions before PR
4. **Updates**: Proactively update deprecated APIs during refactoring

### Builder Onboarding

Before any builder agent begins work:

1. Confirm deprecation gate is operational
2. Review this policy in full
3. Install pre-commit hooks
4. Verify local deprecation checks pass
5. Acknowledge constitutional compliance requirement

---

## Onboarding Documentation

### New Developer Checklist

- [ ] Read AUTOMATED_DEPRECATION_DETECTION_GATE.md policy
- [ ] Install pre-commit hooks (`pre-commit install`)
- [ ] Verify deprecation checks run locally
- [ ] Review .deprecation-whitelist.json for existing exceptions
- [ ] Understand exception approval process
- [ ] Test local gate: `pre-commit run --all-files`
- [ ] Confirm CI workflow exists and passes

### New Dependency Checklist

Before adding any new dependency:

- [ ] Check package registry for deprecation notices
- [ ] Verify package is actively maintained (updated within 6 months)
- [ ] Check for security advisories
- [ ] Confirm no deprecated transitive dependencies
- [ ] Document decision in commit message

---

## Monitoring & Reporting

### Audit Log

All deprecation-related events are logged in `governance/reports/deprecation-audit-log.md`:

- Deprecation violations detected
- Exception requests and approvals
- Quarterly review outcomes
- Dependency updates
- Gate failures and remediations

### Quarterly Review

Every quarter (Jan, Apr, Jul, Oct):

1. Review all active exceptions
2. Re-evaluate justifications
3. Check for new non-deprecated alternatives
4. Update or close exceptions
5. Report findings to Johan Ras

---

## Technical Debt Management

### Remediation Priorities

**Priority 1 (Immediate)**:
- Security-related deprecations
- APIs removed in next major version
- Critical path functionality

**Priority 2 (30 days)**:
- Non-critical deprecated APIs
- Dependencies with alternatives available
- Performance-impacting patterns

**Priority 3 (90 days)**:
- Soft deprecations (warnings only)
- Optional dependency deprecations
- Cosmetic/style deprecations

### Ticket Creation

For each deprecation requiring remediation:

1. Create technical debt ticket
2. Include: file, line, deprecated API, alternative, priority
3. Assign to responsible builder
4. Track in project board
5. Link to audit log entry

---

## Escalation

### When Blocked

If deprecation gate blocks progress:

1. **Evaluate**: Is exception justified? (see Exception Process)
2. **Document**: Prepare justification with evidence
3. **Request**: Escalate to Foreman or Johan Ras
4. **Wait**: Do NOT bypass gate while awaiting approval
5. **Update**: Add approved exception to whitelist

### Escalation Path

- **Technical Questions**: Foreman Agent
- **Exception Approval**: Johan Ras
- **Constitutional Matters**: Johan Ras
- **Process Improvements**: Governance Liaison → Johan Ras

---

## Ripple Effects

This policy ripples to:

1. **`.github/workflows/deprecation-gate.yml`** - CI workflow
2. **`.pre-commit-config.yaml`** - Pre-commit hooks
3. **`.eslintrc.json`** (when JS/TS added) - ESLint config
4. **`pyproject.toml`** (when Python added) - Ruff config
5. **`.deprecation-whitelist.json`** - Exception registry
6. **`.github/agents/*-builder.md`** - Builder contracts
7. **`governance/alignment/GOVERNANCE_ALIGNMENT.md`** - Alignment tracking
8. **`governance/events/`** - FM visibility event

---

## Compliance Validation

### Pre-Handover Checklist

Before marking implementation complete:

- [ ] Policy document created and reviewed
- [ ] CI workflow operational and passing
- [ ] Pre-commit configuration created
- [ ] Whitelist template created
- [ ] Builder contracts updated
- [ ] Onboarding documentation created
- [ ] Audit log initialized
- [ ] FM visibility event published
- [ ] Local gate validation passes
- [ ] PREHANDOVER_PROOF generated

---

## Platform Alignment

**Canonical Source**: APGI-cmy/maturion-foreman-governance/governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md

**Learnings Applied**:
- BL-024: Constitutional Sandbox Pattern
- BL-026: Deprecation Detection Learning

**Cross-Repo Consistency**: This policy must be layered down to all FM repositories. Divergence requires Johan Ras approval.

---

**Authority**: Constitutional - No waivers permitted  
**Enforcement**: CI workflow, pre-commit hooks, PR gates  
**Escalation**: Johan Ras (for exceptions and constitutional matters)
