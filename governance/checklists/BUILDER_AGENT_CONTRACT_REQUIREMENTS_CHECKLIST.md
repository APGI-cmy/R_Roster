# Builder Agent Contract Requirements Checklist

**Status**: Reference checklist for contract drafting  
**Purpose**: Comprehensive requirements checklist for compliant Builder agent contracts in this repo.  
**Primary Sources**: `governance/canon/BUILDER_CONTRACT_BINDING_CHECKLIST.md`, `governance/canon/GOVERNANCE_BUILDER_SUBMISSION_SURVEY.md`, `BUILD_PHILOSOPHY.md`, Living Agent System v6.2.0.

---

## Category 0 — Identity & Canonical Bindings

- [ ] **Frontmatter**: `agent.id` unique identifier, `agent.class=builder`, `agent.version` semantic version; `governance.protocol=LIVING_AGENT_SYSTEM`.
- [ ] **Builder type specified**: Role declaration (UI Builder, API Builder, Schema Builder, Integration Builder, QA Builder).
- [ ] **Canonical governance reference**: `governance.canon` points to canonical source; binding mode=MANDATORY.
- [ ] **Profile reference**: `governance.profile` references builder.v1.md or specific builder profile.

## Category 1 — Scope & Boundaries

- [ ] **Allowed paths enumerated**: `scope.allowed_paths` defines writable paths (e.g., src/**, tests/**).
- [ ] **Restricted paths protected**: `scope.restricted_paths` includes governance/**, .github/workflows/**, .github/agents/**, BUILD_PHILOSOPHY.md at minimum.
- [ ] **Escalation paths defined**: `scope.escalation_required` specifies paths requiring FM/CS2 escalation (architecture/**, foreman/**).
- [ ] **Repository scope**: Clear declaration of which repository this builder operates in.

## Category 2 — Build Philosophy Binding

- [ ] **Build-to-Green commitment**: Explicit binding to Build-to-Green mandate; refuses non-Build-to-Green instructions.
- [ ] **QA-to-Red requirement**: Builder requires failing QA suite before building; won't build without red QA gates.
- [ ] **Zero Test Debt commitment**: Absolute mandate for zero test debt; no exceptions; partial passes = total failure.
- [ ] **100% GREEN philosophy**: 100% test pass requirement; acceptable_failure_threshold=0; acceptable_warning_threshold=0.
- [ ] **Test infrastructure as production code**: Test helpers/fixtures/mocks treated as production code; stub test infrastructure not acceptable.
- [ ] **STOP-and-FIX doctrine**: Immediate STOP on warnings/test debt; fix → re-run → verify 100% GREEN before proceeding.

## Category 3 — Authority & Supervision

- [ ] **FM supervision acknowledged**: Builder operates under Foreman (FM) authority; FM recruits and supervises.
- [ ] **Authority chain**: CS2 → FM → Builder; human supremacy override preserved.
- [ ] **Self-modification prohibition**: Builder cannot modify own contract; changes require FM/CS2 authorization.
- [ ] **Escalation rules**: Ambiguous requirements → escalate to FM; governance conflicts → escalate to CS2; architecture changes → escalate.

## Category 4 — Execution Bootstrap & Evidence

- [ ] **Execution Bootstrap Protocol binding**: 7-step prehandover verification protocol applied to all executable artifacts.
- [ ] **PREHANDOVER proof mandatory**: Must generate PREHANDOVER_PROOF for all executable changes before PR submission.
- [ ] **CI confirmatory doctrine**: CI is confirmatory not diagnostic; all validation must succeed pre-commit.
- [ ] **Evidence artifacts**: Execution evidence bundle includes: scope declaration, architecture alignment, QA results, test execution logs, PREHANDOVER proof.

## Category 5 — Testing & QA Requirements

- [ ] **Agent Test Execution Protocol binding**: Follows canonical test execution protocol.
- [ ] **Test execution requirements**: All tests must pass 100%; no skipped tests; no disabled tests without documented rationale.
- [ ] **Test coverage expectations**: Builder-specific coverage targets met (if specified in profile).
- [ ] **QA gate compliance**: Builder respects QA gates and cannot bypass or weaken them.

## Category 6 — Memory & Session Management

- [ ] **Session memory protocol**: Creates session memory files in `.agent-workspace/<agent-id>/memory/session-NNN-YYYYMMDD.md`.
- [ ] **Memory template compliance**: Session memory includes all required sections (Task, What I Did, Evidence, Outcome, Lessons).
- [ ] **Memory rotation**: When > 5 sessions, moves oldest to .archive/, keeps only 5 most recent.
- [ ] **Personal learning**: Updates lessons-learned.md and patterns.md in .agent-workspace/<agent-id>/personal/.

## Category 7 — Governance Alignment & Ripple

- [ ] **Ripple awareness**: Non-local impact assumed; builder surfaces potential ripple effects.
- [ ] **Governance drift handling**: Halts if governance drift detected; requests alignment before proceeding.
- [ ] **Canonical context sync**: Follows canonical context synchronization protocol when governance updates occur.
- [ ] **Version sync discipline**: Checks governance versioning; reports mismatches to FM or governance liaison.

## Category 8 — Merge Gate & PR Requirements

- [ ] **Merge gate philosophy binding**: Respects merge gate requirements; cannot bypass gates.
- [ ] **PR gate preconditions**: Follows PR gate precondition rules; verifies gates pass before merge.
- [ ] **First PR requirements** (for new builders): First PR includes agent contract, scope declaration, profile binding, test execution evidence.
- [ ] **Branch protection compliance**: Respects branch protection rules; no force-push; no main branch direct writes.

## Category 9 — Prohibitions & Guardrails

- [ ] **No governance modification**: Builder cannot modify governance/**, BUILD_PHILOSOPHY.md, or canonical artifacts.
- [ ] **No workflow modification**: Builder cannot modify .github/workflows/** or .github/agents/** without escalation.
- [ ] **No architecture changes**: Builder implements frozen architecture; cannot change architecture without FM approval.
- [ ] **No bypassing QA**: Builder cannot skip tests, disable checks, or weaken quality gates.
- [ ] **No self-recruitment**: Builder cannot recruit other agents; only FM has recruitment authority.

## Category 10 — Role-Specific Requirements (Conditional)

### For UI Builders
- [ ] **UI scope**: Allowed paths include UI component directories (e.g., src/components/**, src/pages/**).
- [ ] **UI testing**: Component tests, integration tests, accessibility tests required.
- [ ] **Design system compliance**: Follows established design system and component patterns.

### For API Builders
- [ ] **API scope**: Allowed paths include API route handlers, business logic, data access layers.
- [ ] **API testing**: Unit tests, integration tests, API contract tests required.
- [ ] **API documentation**: OpenAPI/Swagger specs maintained; endpoint documentation updated.

### For Schema Builders
- [ ] **Schema scope**: Allowed paths include database schemas, migrations, model definitions.
- [ ] **Migration discipline**: All schema changes via migrations; no manual DB modifications; reversible migrations preferred.
- [ ] **Data integrity**: Foreign key constraints, indexes, validation rules specified.

### For Integration Builders
- [ ] **Integration scope**: Allowed paths include external service integrations, inter-module connections.
- [ ] **Integration testing**: Integration tests for all external service connections; mock/stub services for testing.
- [ ] **Error handling**: Robust error handling for external service failures; retry logic, circuit breakers where appropriate.

### For QA Builders
- [ ] **QA scope**: Allowed paths include test suites, test infrastructure, QA tooling.
- [ ] **QA-to-Red mandate**: QA Builder creates failing tests FIRST (red QA gates) before implementation builders engage.
- [ ] **Test quality**: Tests are comprehensive, maintainable, and properly isolated; no flaky tests.

## Category 11 — Execution Identity & Safety

- [ ] **Execution identity**: Name specified (e.g., "Maturion Bot"), secret reference provided (e.g., MATURION_BOT_TOKEN).
- [ ] **Safety constraints**: never_push_main=true, write_via_pr=true or similar safety declarations.
- [ ] **PR workflow**: All writes via PR; no direct pushes to protected branches.

## Category 12 — Version & Metadata

- [ ] **Version declaration**: Semantic version in YAML frontmatter (e.g., version: "1.0.0").
- [ ] **Contract creation date**: Created/updated timestamps present.
- [ ] **Living Agent System compliance**: Version 6.2.0 compliance declared where applicable.
- [ ] **Metadata section**: Repository, authority (CS2), canonical_home specified.

## Category 13 — OPOJD & Continuous Execution (if applicable)

- [ ] **OPOJD doctrine binding**: If builder operates in OPOJD mode, continuous execution requirements documented.
- [ ] **Watch mode handling**: If builder runs watch mode (e.g., tsc --watch), process management and lifecycle documented.
- [ ] **Incremental build support**: If builder supports incremental builds, delta detection and caching strategy documented.

---

## Appendix A — Universal Builder Prohibitions (from canonical source)

ALL builders are PROHIBITED from:

1. **Governance interference**: Cannot modify, bypass, or weaken governance artifacts
2. **Self-modification**: Cannot edit own contract without authorization
3. **Scope violation**: Cannot write outside allowed_paths or touch restricted_paths
4. **Quality compromise**: Cannot bypass tests, skip QA gates, or accept test debt
5. **Authority overreach**: Cannot recruit agents, modify workflows, or assume FM/CS2 authority
6. **Architecture freelancing**: Cannot change frozen architecture without approval
7. **Security violations**: Cannot commit secrets, bypass security checks, or weaken protections
8. **Evidence bypass**: Cannot skip PREHANDOVER proof or Execution Bootstrap Protocol
9. **Branch protection bypass**: Cannot force-push, delete branches, or bypass PR requirements
10. **Constitutional violations**: Cannot contradict BUILD_PHILOSOPHY.md or zero-test-debt rule

---

## Usage

Treat every unchecked item in Category 0-9 as a blocker for builder contract readiness. Role-specific items (Category 10) apply conditionally based on builder type. If a required source is unavailable or hash-mismatched, halt and escalate per Category 3.

**Compliance verification**: Run validation against this checklist before any builder agent file creation/modification. A builder contract is INVALID and OUT OF GOVERNANCE if ANY required element is missing or non-compliant.

---

**Authority**: Living Agent System v6.2.0, BUILD_PHILOSOPHY.md  
**Version**: 1.0.0  
**Created**: 2026-02-12  
**Repository**: APGI-cmy/R_Roster (Consumer Mode)  
**Based on**: governance/canon/BUILDER_CONTRACT_BINDING_CHECKLIST.md (53KB canonical source)
