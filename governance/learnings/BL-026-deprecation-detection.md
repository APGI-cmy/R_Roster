# BL-026: Deprecation Detection Learning

**Learning ID**: BL-026  
**Category**: Build Safety & Quality Assurance  
**Related**: BL-024 (Constitutional Sandbox Pattern)  
**Date**: 2026-01-11  
**Status**: ACTIVE

---

## Context

Deprecated API usage represents a category of technical debt that can lead to:
- Breaking changes in future dependency updates
- Security vulnerabilities in unmaintained code paths
- Degraded performance from obsolete implementations
- Build failures when deprecated features are removed

Traditional manual code reviews are insufficient for catching all deprecation issues, especially in transitive dependencies and rapidly evolving frameworks.

---

## Learning Statement

**Automated deprecation detection must be enforced at both pre-commit and CI/CD levels to prevent deprecated API usage from entering the codebase.**

Deprecation detection is not a suggestion—it is a constitutional requirement that prevents future build failures and security vulnerabilities.

---

## Key Insights

### 1. Prevention Over Remediation

**Insight**: Blocking deprecated code at commit time is 10x more efficient than fixing it later.

**Evidence**:
- Post-merge deprecation fixes require PR overhead, review cycles, and regression testing
- Deprecated code that ships to production becomes "sticky" due to risk aversion
- Upstream removals of deprecated APIs cause emergency fixes

**Action**: Pre-commit hooks catch issues before they enter version control.

### 2. Transitive Dependency Risk

**Insight**: Direct dependencies are easy to audit; transitive dependencies hide deprecation debt.

**Evidence**:
- Package managers pull in hundreds of indirect dependencies
- Deprecated transitive dependencies surface only during updates
- Security patches may be unavailable for deprecated packages

**Action**: Automated scanning includes full dependency tree analysis.

### 3. Language-Specific Tooling Required

**Insight**: Generic linters miss language-specific deprecation patterns.

**Evidence**:
- Python has `DeprecationWarning` but requires runtime to trigger
- JavaScript/TypeScript deprecation requires AST analysis
- Framework-specific deprecations need specialized plugins

**Action**: Use language-native tools (ruff, ESLint, etc.) with deprecation-specific rules.

### 4. Exception Process Prevents Backdoors

**Insight**: Without a documented exception process, developers bypass the gate.

**Evidence**:
- Justified deprecation usage exists (e.g., legacy system integration)
- Undocumented workarounds create invisible technical debt
- Temporary exceptions become permanent without review cycles

**Action**: Formal exception process with FM approval, inline comments, whitelist, and quarterly review.

---

## Implementation Requirements

### Minimum Viable Gate

1. **Pre-commit hook** for local detection
2. **CI/CD workflow** for enforcement
3. **Whitelist mechanism** for exceptions
4. **Audit log** for tracking

### Language-Specific Configuration

**Python**:
- Tool: `ruff` (fast, built-in Rust)
- Rules: UP (pyupgrade), B (bugbear), F401/F821 (undefined names)
- Config: `pyproject.toml` or `.ruff.toml`

**JavaScript/TypeScript**:
- Tool: `ESLint` with `eslint-plugin-deprecation`
- Rules: `deprecation/deprecation: error`
- Config: `.eslintrc.json`

**Other Languages**:
- Research and document per-language best practices as codebase evolves

---

## Failure Modes & Mitigations

### Failure Mode 1: False Positives

**Scenario**: Tool flags valid code as deprecated incorrectly.

**Mitigation**:
- Verify against official documentation
- Update tool version (bug may be fixed)
- Add to whitelist with detailed justification
- Report false positive to tool maintainers

### Failure Mode 2: Developer Frustration

**Scenario**: Gate blocks urgent work due to transitive dependency deprecation.

**Mitigation**:
- Document emergency exception process
- Maintain pre-vetted alternatives list
- Quarterly dependency updates reduce surprise deprecations
- Clear escalation path to Johan Ras

### Failure Mode 3: Whitelist Bloat

**Scenario**: Exceptions accumulate without re-evaluation.

**Mitigation**:
- Mandatory quarterly review in policy
- Each exception includes review date
- Expired exceptions auto-flagged in next audit
- Governance liaison enforces review compliance

---

## Anti-Patterns to Avoid

### ❌ Anti-Pattern 1: "Warnings Only" Mode

**Problem**: Deprecation warnings without blocking allow debt accumulation.

**Why Wrong**: Developers ignore warnings; CI passes; debt grows silently.

**Correct Approach**: Treat deprecation warnings as errors (blocking).

### ❌ Anti-Pattern 2: Manual Dependency Audits

**Problem**: Relying on developers to manually check for deprecated packages.

**Why Wrong**: Human error, inconsistency, and audit fatigue lead to missed issues.

**Correct Approach**: Automated scanning in CI with tooling (e.g., `pip-audit`, `npm audit`).

### ❌ Anti-Pattern 3: Bypass with Comments

**Problem**: Allowing inline suppression comments without documented approval.

**Why Wrong**: Creates invisible exceptions, no tracking, no review cycle.

**Correct Approach**: Suppression requires whitelist entry with FM approval.

### ❌ Anti-Pattern 4: "Fix Later" Tickets

**Problem**: Creating tickets to fix deprecations without blocking the PR.

**Why Wrong**: Tickets languish, deprecated code ships, becomes entrenched.

**Correct Approach**: Fix before merge OR document approved exception with deadline.

---

## Success Criteria

A deprecation gate is successfully implemented when:

1. ✅ Pre-commit hooks block deprecated code before commit
2. ✅ CI workflow fails on deprecation violations
3. ✅ Exception process documented and enforced
4. ✅ Whitelist tracked with quarterly review
5. ✅ Zero deprecated code in codebase (or all whitelisted)
6. ✅ Dependency audits run automatically
7. ✅ Audit log tracks all deprecation events

---

## Related Learnings

**BL-024: Constitutional Sandbox Pattern**
- Tier-1 constitutional rules (non-waivable) vs Tier-2 procedural guidance
- Deprecation gate is Tier-1: constitutional, no waivers without Johan Ras

**BL-025: Proactive Dependency Management** (if exists)
- Regular dependency updates reduce deprecation surprise
- Lockfile discipline prevents unexpected transitive changes

**Zero Test Debt Mandate** (BUILD_PHILOSOPHY.md)
- Similar philosophy: block problems before they enter, not after
- Deprecation debt is analogous to test debt

---

## Evolution & Maintenance

### When to Update This Learning

- New language added to codebase requires tool research
- Tool improvements offer better deprecation detection
- False positive patterns identified and mitigated
- New anti-patterns discovered in practice

### Continuous Improvement

- Collect metrics: deprecation violations per PR, average fix time
- Developer feedback: friction points, false positives
- Quarterly review: effectiveness, exception trends
- Share insights across Maturion repositories

---

## References

**Internal**:
- `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md`
- `BUILD_PHILOSOPHY.md` (Zero Test Debt Mandate)
- `.github/agents/governance-liaison.md` (Enforcement authority)

**External**:
- Python: https://docs.python.org/3/library/warnings.html#deprecationwarning
- Ruff: https://docs.astral.sh/ruff/
- ESLint Deprecation Plugin: https://github.com/gund/eslint-plugin-deprecation
- Pre-commit: https://pre-commit.com/

---

**Learning Owner**: Governance Liaison  
**Escalation**: Johan Ras (for policy updates)  
**Next Review**: 2026-04-11 (quarterly)
