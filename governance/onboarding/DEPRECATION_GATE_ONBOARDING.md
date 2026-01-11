# Deprecation Detection Gate Onboarding

**Repository**: R_Roster  
**Purpose**: Developer onboarding guide for automated deprecation detection  
**Authority**: governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md  
**Status**: MANDATORY (post-2026-01-11)

---

## Overview

The **Automated Deprecation Detection Gate** is a constitutional requirement that prevents deprecated API usage from entering the R_Roster codebase. This gate runs at two levels:

1. **Pre-commit hooks** - Local enforcement before git commit
2. **CI/CD workflow** - Remote enforcement before PR merge

**Zero tolerance**: Deprecated code cannot be committed without documented exception approval.

---

## Quick Start (5 Minutes)

### Step 1: Install Pre-commit

**Option A: Python pip**
```bash
pip install pre-commit
```

**Option B: Homebrew (macOS)**
```bash
brew install pre-commit
```

**Option C: npm**
```bash
npm install -g pre-commit
```

### Step 2: Install Repository Hooks

```bash
cd /path/to/R_Roster
pre-commit install
```

**Expected output**:
```
pre-commit installed at .git/hooks/pre-commit
```

### Step 3: Test the Installation

```bash
pre-commit run --all-files
```

**Expected output** (with no code files):
```
Trim trailing whitespace.................Passed
Fix end of files........................Passed
Check YAML..............................Passed
Check JSON..............................Passed
Check for large files...................Passed
```

### Step 4: Read the Policy

📖 **REQUIRED**: Review `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md`

Key sections to understand:
- Exception process (requires FM/Johan approval)
- Tools used (ruff for Python, ESLint for JS/TS)
- Violation consequences (constitutional breach)
- Quarterly review requirements

**Time**: ~15 minutes

---

## How It Works

### Local Development Flow

```
┌─────────────────────────────────────────────────────────────┐
│ 1. Write code with standard APIs                            │
│    ↓                                                         │
│ 2. Run: git add .                                           │
│    ↓                                                         │
│ 3. Run: git commit -m "message"                             │
│    ↓                                                         │
│ 4. Pre-commit hook runs automatically                       │
│    ├─ Python: ruff checks for deprecated APIs               │
│    ├─ JS/TS: eslint checks for deprecated APIs              │
│    └─ General: whitespace, EOF, YAML, JSON checks           │
│    ↓                                                         │
│ 5a. If clean: Commit succeeds ✅                            │
│ 5b. If violations: Commit blocked ❌                        │
│     └─ Fix code OR request exception                        │
└─────────────────────────────────────────────────────────────┘
```

### Pull Request Flow

```
┌─────────────────────────────────────────────────────────────┐
│ 1. Create PR                                                 │
│    ↓                                                         │
│ 2. CI workflow triggers                                      │
│    ├─ Detects language (Python/JS/TS)                       │
│    ├─ Runs deprecation detection tools                      │
│    ├─ Validates .deprecation-whitelist.json                 │
│    └─ Checks for expired exceptions                         │
│    ↓                                                         │
│ 3a. If clean: PR can merge ✅                               │
│ 3b. If violations: PR blocked ❌                            │
│     └─ Fix code OR request exception                        │
└─────────────────────────────────────────────────────────────┘
```

---

## Common Scenarios

### Scenario 1: Writing New Code (Happy Path)

**You write**:
```python
# Good: Using non-deprecated API
import json
data = json.loads(content)
```

**Pre-commit**: ✅ Passes  
**CI workflow**: ✅ Passes  
**Result**: Code commits and merges successfully

---

### Scenario 2: Accidentally Using Deprecated API

**You write**:
```python
# Bad: Using deprecated function
from collections import Iterable  # Deprecated in Python 3.3+
```

**Pre-commit**: ❌ Blocked
```
ruff....................................................Failed
- hook id: ruff
- exit code: 1

path/to/file.py:1:1: UP035 Import from `collections.abc` instead: `Iterable`
```

**Fix**:
```python
# Good: Using non-deprecated import
from collections.abc import Iterable
```

**Result**: Commit succeeds after fix

---

### Scenario 3: Justified Deprecated Usage (Exception Required)

**You need**:
```python
# Required for compatibility with legacy system
deprecated_function()  # No alternative in v2.x
```

**Process**:
1. Document why alternative doesn't exist
2. Escalate to FM or Johan Ras with evidence
3. If approved: Add inline comment
4. Add to `.deprecation-whitelist.json`
5. Set quarterly review date

**Example whitelist entry**:
```json
{
  "exceptions": [
    {
      "file": "src/legacy_integration.py",
      "line": 42,
      "pattern": "deprecated_function",
      "justification": "No alternative API in v2.x, required for legacy system compatibility",
      "approved_by": "Johan Ras",
      "approval_date": "2026-01-11",
      "review_date": "2026-04-11",
      "status": "active"
    }
  ]
}
```

**Inline comment**:
```python
# DEPRECATION EXCEPTION: Using deprecated_function()
# Justification: No alternative API available in v2.x, required for compatibility
# Approved by: Johan Ras (2026-01-11)
# Review date: 2026-04-11 (quarterly)
deprecated_function()
```

---

## Language-Specific Guidance

### Python

**Tool**: ruff (fast Rust-based linter)

**Detects**:
- Deprecated stdlib imports (e.g., `collections.Iterable` → `collections.abc.Iterable`)
- Deprecated syntax patterns (e.g., old string formatting)
- Deprecated function calls

**Rules enabled**: F, E, W, UP, B, A, C4, DTZ, PIE, RET, SIM, ARG, PTH

**Manual check**:
```bash
ruff check . --select UP
```

---

### JavaScript/TypeScript

**Tool**: ESLint with `eslint-plugin-deprecation`

**Detects**:
- `@deprecated` JSDoc tags
- Deprecated framework methods (React, Node, etc.)
- Deprecated TypeScript patterns

**Configuration**: `.eslintrc.json` (created when first JS/TS file added)

**Manual check**:
```bash
npx eslint . --ext .js,.jsx,.ts,.tsx
```

---

## Troubleshooting

### Problem: Pre-commit hook not running

**Symptom**: Commits succeed without any checks

**Solution**:
```bash
# Reinstall hooks
pre-commit install

# Verify installation
ls .git/hooks/pre-commit
```

---

### Problem: False positive (tool incorrectly flags valid code)

**Symptom**: Pre-commit blocks valid, non-deprecated code

**Solution**:
1. Verify against official documentation
2. Update tool version: `pre-commit autoupdate`
3. If still false positive: Request exception with evidence
4. Report to tool maintainers (ruff/eslint)

---

### Problem: Can't fix deprecated API (no alternative exists)

**Symptom**: Tool correctly identifies deprecated API, but no non-deprecated alternative

**Solution**:
1. Research thoroughly for alternatives
2. Check library documentation for migration guides
3. If no alternative: Request exception (see Exception Process)
4. Document justification comprehensively

---

### Problem: Deprecated dependency (not direct code)

**Symptom**: `pip-audit` or `npm audit` reports deprecated package

**Solution**:
1. Update dependency: `pip install --upgrade package` or `npm update package`
2. If constraint prevents update: Document in whitelist
3. Check for alternative packages
4. Escalate to FM if blocking

---

## Exception Approval Process

### Step 1: Prepare Justification

Document:
- What deprecated API you need to use
- Why you need it (business requirement)
- Why alternatives don't work (technical blockers)
- Evidence (documentation, tests, research)

### Step 2: Escalate

Email/message to:
- **Primary**: Foreman Agent
- **Ultimate**: Johan Ras

Include:
- File and line number
- Deprecated API name
- Full justification
- Evidence links

### Step 3: Await Approval

**DO NOT**:
- Bypass the gate (disable hooks, ignore errors)
- Commit with suppression comments
- Proceed without approval

**Timeline**: Typically 1-2 business days

### Step 4: Implement Approval

Once approved:
1. Add inline comment with approval details
2. Update `.deprecation-whitelist.json`
3. Set review date (3 months out)
4. Commit changes
5. Pre-commit and CI will now pass

---

## Best Practices

### ✅ DO:
- Run `pre-commit run --all-files` before creating PR
- Research migration guides when deprecation warnings appear
- Request exceptions early (don't wait until PR blocked)
- Document justifications comprehensively
- Update deprecated APIs during refactoring

### ❌ DON'T:
- Disable pre-commit hooks
- Ignore deprecation warnings ("warnings only" mindset)
- Use suppression comments without approval
- Add exceptions without FM/Johan approval
- Skip quarterly reviews for exceptions

---

## Tools & Commands Reference

### Pre-commit Commands

```bash
# Install hooks
pre-commit install

# Run all hooks
pre-commit run --all-files

# Run specific hook
pre-commit run ruff --all-files

# Update hooks to latest versions
pre-commit autoupdate

# Skip hooks (NOT RECOMMENDED - only for emergencies)
git commit --no-verify
```

### Python (ruff) Commands

```bash
# Check all files
ruff check .

# Check with auto-fix
ruff check . --fix

# Check specific rule category (deprecation)
ruff check . --select UP

# Show rule explanations
ruff rule UP035
```

### JavaScript/TypeScript (eslint) Commands

```bash
# Check all files
npx eslint . --ext .js,.jsx,.ts,.tsx

# Check with auto-fix
npx eslint . --ext .js,.jsx,.ts,.tsx --fix

# Show specific rule details
npx eslint --print-config file.js
```

### Dependency Audit Commands

```bash
# Python
pip-audit

# npm
npm audit

# Check for updates
npm outdated
pip list --outdated
```

---

## Quarterly Review (For Exception Holders)

If you have approved exceptions in the whitelist, you'll be contacted quarterly to review.

**Review Process**:
1. Verify justification still valid
2. Check if non-deprecated alternative now exists
3. Confirm continued need or mark resolved
4. Update review date if continuing

**Schedule**:
- Q1: April 11
- Q2: July 11
- Q3: October 11
- Q4: January 11

---

## Getting Help

### Questions About Policy
→ Read: `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md`

### Technical Issues (Tools)
→ Check: Troubleshooting section above  
→ Search: Tool documentation (ruff/eslint)

### Exception Approval
→ Contact: Foreman Agent or Johan Ras  
→ Include: Full justification and evidence

### Constitutional Questions
→ Escalate: Johan Ras  
→ Reference: BL-024, BL-026

---

## Success Checklist

Before considering yourself fully onboarded:

- [ ] Pre-commit installed and hooks active
- [ ] Test run completed (`pre-commit run --all-files`)
- [ ] Policy document read (AUTOMATED_DEPRECATION_DETECTION_GATE.md)
- [ ] BL-026 learning reviewed
- [ ] Exception process understood
- [ ] Troubleshooting section familiar
- [ ] Know who to contact for help

**Estimated Time**: 30-45 minutes total

---

## Additional Resources

**Internal Documentation**:
- `governance/policies/AUTOMATED_DEPRECATION_DETECTION_GATE.md` - Full policy
- `governance/learnings/BL-026-deprecation-detection.md` - Learning documentation
- `governance/reports/deprecation-audit-log.md` - Historical log
- `.deprecation-whitelist.json` - Current exceptions

**External Tools**:
- [Pre-commit Documentation](https://pre-commit.com/)
- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [ESLint Deprecation Plugin](https://github.com/gund/eslint-plugin-deprecation)
- [pip-audit](https://pypi.org/project/pip-audit/)

**Governance**:
- `BUILD_PHILOSOPHY.md` - Supreme authority
- `.agent` - Repository agent contract
- BL-024: Constitutional Sandbox Pattern
- BL-026: Deprecation Detection Learning

---

**Document Owner**: Governance Liaison Agent  
**Last Updated**: 2026-01-11  
**Next Review**: Quarterly (or on policy updates)
