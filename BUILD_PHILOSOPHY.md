# Maturion Build Philosophy: QA-First Architecture-Driven Development

## The Foundation: One-Time Fully Functional Builds

**Core Principle**: Every build must be a **one-time, fully functional build**. No iterations, no fixes after merge, no regression. The build works perfectly the first time, or it doesn't happen.

**Supreme Mandate**: **A build is not complete unless it is 100% GREEN.**

This is the **primary obligation**, and all rules, QA checks, and governance mechanisms exist to serve this philosophy—not to weaken it.

### 100% GREEN Philosophy

**What 100% GREEN Means**:
- ✅ Zero compilation errors
- ✅ Zero type errors
- ✅ Zero lint errors
- ✅ Zero test failures
- ✅ Zero runtime errors
- ✅ Zero deployment failures
- ✅ Zero warnings (unless explicitly whitelisted)
- ✅ All QA checks passing
- ✅ All governance gates passing
- ✅ Full functionality verified
- ✅ **All test infrastructure complete** (helpers, fixtures, mocks)
- ✅ **ZERO TEST DEBT** (no skips, stubs, incomplete tests, or test infrastructure gaps)

**NOT 100% GREEN**:
- ❌ 99% passing (301/303 tests = TOTAL FAILURE)
- ❌ "Mostly working" (missing features = NOT GREEN)
- ❌ "Works for me" (untested edge cases = NOT GREEN)
- ❌ "Will fix later" (incomplete = NOT GREEN)
- ❌ **"Only X failing"** (minimizing language = TEST DODGING - see POLICY-NO-ONLY-LANGUAGE)
- ❌ **"Just documentation issues"** (minimizing language = TEST DODGING)
- ❌ **"Minor problems"** (minimizing language = TEST DODGING)
- ❌ **Incomplete test helpers** (stub implementations = NOT GREEN)
- ❌ **Any test debt** (skipped tests, test stubs, incomplete test infrastructure = NOT GREEN)
- ❌ **Partial test passes** (ANY failing test = TOTAL FAILURE, not acceptable)

**Zero Test Debt Philosophy**:

Test debt is **NEVER** permitted. This includes:
- Failing tests (FAIL, ERROR, TIMEOUT)
- Skipped tests (.skip(), .todo(), commented out)
- Incomplete tests (stubs, no assertions, TODO comments)
- Incomplete test infrastructure (stub helpers, incomplete fixtures, broken mocks)
- Test configuration issues (missing dependencies, broken setup, isolation failures)
- Hidden test debt (tests passing with warnings, excluded tests, suppressed errors)

**If ANY test debt exists → Execution MUST STOP → Debt MUST be resolved IMMEDIATELY → QA MUST re-run → Only then may execution continue.**

**There are NO exceptions. There is NO "will fix later." There is NO "acceptable" test debt.**

**Rule**: If the build is not 100% GREEN, it is not complete. Period.

---

## Canonical Source

This repository follows the Maturion governance as defined in:

**Repository**: `APGI-cmy/maturion-foreman-governance`  
**Branch**: `main`  
**Location**: https://github.com/APGI-cmy/maturion-foreman-governance

For complete BUILD_PHILOSOPHY documentation, see the canonical source at:
https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/BUILD_PHILOSOPHY.md

---

**Version**: 1.5 (Constitutional Sandbox Pattern integration)  
**Authority**: Johan (Maturion Leadership)  
**Status**: Active and Enforced  
**Last Updated**: 2026-01-09 (Canonical)  
**Layered Down**: 2026-01-11 (This Repository)
