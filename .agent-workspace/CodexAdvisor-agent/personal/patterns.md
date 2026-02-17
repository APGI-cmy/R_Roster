## Pattern: Gold-Standard Checklist Application
- Observed: 2026-02-11 (Session 001)
- Context: Implementing gold-standard agent contracts from office-app precedent
- Response: Layer down proven checklists, create gap analysis, add missing LOCKED categories, document evidence

## Pattern: Cross-Repository Governance Layerdown
- Observed: 2026-02-11 (Session 001)
- Context: Consumer repository receiving governance enhancements from canonical source
- Response: Fetch from canonical main branch, adapt minimally for local context, preserve source citations

## Pattern: Agent Contract Gold-Standard Compliance
- Observed: 2026-02-11 (Session 001)
- Context: Validating agent contracts against comprehensive requirement checklists
- Response: Verify all categories present (7 for foreman, 10 for liaison), add missing LOCKED sections, enumerate PUBLIC_API canons in appendix

## Pattern: Evidence-Based Session Memory
- Observed: 2026-02-11 (Session 001)
- Context: Documenting significant governance work for future agent sessions
- Response: Create session file with task, actions, decisions, evidence, outcomes, and lessons; store in `.agent-workspace/<agent-id>/memory/`

## Pattern: Canonical Contract Fetch-and-Adapt
- Observed: 2026-02-12 (Session 002)
- Context: Creating repo-scoped agent contracts aligned with canonical governance
- Response: Fetch canonical contract (foreman-v2.agent.md), analyze structure, adapt YAML frontmatter and protocol categories, preserve local requirements, create new contract file

## Pattern: Repository-Specific Integration Points
- Observed: 2026-02-12 (Session 002)
- Context: Gold-standard contracts must accommodate repo-specific governance
- Response: Identify local requirements (QIW, test governance), create dedicated sections, integrate within gold-standard structure without compromising alignment

## Pattern: Migration Path for Contract Updates
- Observed: 2026-02-12 (Session 002)
- Context: New gold-standard contract created alongside existing contract
- Response: Create new contract with canonical naming (foreman.md), preserve old contract for transition, document migration considerations in session memory

## Pattern: Path Verification Before Governance Artifact Creation
- Observed: 2026-02-12 (Session 004)
- Context: Agent files referenced `.governance-pack/` but repository structure used `governance/`
- Response: Verify actual directory structure first, then create artifacts in correct locations; update agent file references to match reality

## Pattern: CANON_INVENTORY as Governance Integrity Checkpoint
- Observed: 2026-02-12 (Session 004)
- Context: Multiple governance artifacts needed integrity tracking and SHA256 verification
- Response: Create CANON_INVENTORY.json with complete checksums for all checklists, agent contracts, and tier-0 manifest; use as single source of truth for artifact integrity

## Pattern: Systematic Gap Analysis for Self-Review
- Observed: 2026-02-12 (Session 004)
- Context: CodexAdvisor self-review required comprehensive assessment of governance completeness
- Response: Check for each expected artifact, identify what's missing vs. what exists, categorize gaps (missing files, path mismatches, integrity issues), create corrective plan addressing all gaps

## Pattern: Checklist Condensation from Canonical Sources
- Observed: 2026-02-12 (Session 004)
- Context: Canonical BUILDER_CONTRACT_BINDING_CHECKLIST.md was 53KB, needed local requirements version
- Response: Extract essential categories and requirements, condense to ~10KB while preserving completeness, maintain category structure for consistency, reference canonical source for full details

## Pattern: 4-Phase Agent Contract Template Reuse
- Observed: 2026-02-17 (Session 006)
- Context: Creating ForemanApp-agent.md with Living Agent System v6.2.0 compliance
- Response: Use CodexAdvisor-agent.md as proven template, replicate 4-phase structure (Preflight-Induction-Build-Handover), adapt content for foreman role, maintain structural consistency

## Pattern: Behavioral Examples for RAEC Operating Model
- Observed: 2026-02-17 (Session 006)
- Context: RAEC model needs concrete demonstrations to guide agent behavior
- Response: Create 4 behavioral examples showing traditional (wrong) vs RAEC (correct) approaches, include self-modification prohibition example, demonstrate escalation patterns, show boundary enforcement

## Pattern: Line-Number Checklist Verification
- Observed: 2026-02-17 (Session 006)
- Context: 100% checklist compliance claims need evidence backing
- Response: Create verification report mapping each requirement to specific line numbers in created artifact, document 21/21 verification with explicit references, provide summary statistics

## Pattern: Consumer Mode Boundary Documentation
- Observed: 2026-02-17 (Session 006)
- Context: Consumer repositories need clear guidance on governance constraints
- Response: Document prohibitions explicitly (no governance mods, no ripple dispatch, no canon weakening), list capabilities separately (receive ripple, detect drift, create alignment PRs), include alignment protocol with step-by-step process

## Pattern: Deprecation Without Deletion
- Observed: 2026-02-17 (Session 006)
- Context: New ForemanApp-agent.md created while old foreman.md exists
- Response: Mark old file as deprecated in CANON_INVENTORY.json, add new file as active entry, preserve historical reference until migration confirmed, update notes explaining transition

## Pattern: Memory Rotation at 5-Session Limit
- Observed: 2026-02-17 (Session 006)
- Context: Created session-006 when already at 5-session limit
- Response: Move oldest session (session-001) to `.archive/` subdirectory, keep 5 most recent sessions active, maintain chronological order, preserve all historical content in archive


## Pattern: 4-Phase Canonical Agent Contract Architecture
- Observed: 2026-02-17 (Session 007)
- Context: Creating BuilderApp-agent.md with Living Agent System v6.2.0 compliance
- Structure:
  * Phase 1: Preflight (Identity, Authority, LOCKED section, RAEC examples, Canonical references)
  * Phase 2: Induction (Wake-up protocol, governance loading, environment health)
  * Phase 3: Build (Execution, specializations, operating boundaries, consumer mode)
  * Phase 4: Handover (Session memory protocol, memory rotation, escalations)
- Response: Use this pattern consistently for all future agent contract creation
- References: ForemanApp-agent.md, BuilderApp-agent.md, maturion-foreman-governance PRs #1147, #1149

## Pattern: RAEC Behavioral Example Format
- Observed: 2026-02-17 (Session 007)
- Context: Demonstrating correct agent behavior in contract
- Format:
  1. Present scenario (task or situation)
  2. Show WRONG behavior (traditional coding agent anti-pattern)
  3. Identify problems with wrong approach
  4. Show CORRECT behavior (RAEC: Review-Advise-Escalate-Coordinate)
  5. Highlight what makes the correct approach compliant
- Response: Always provide both wrong and correct examples to illustrate behavioral boundaries
- Key scenarios: Architecture enforcement, QA gates, self-modification, authority boundaries

## Pattern: Unified Template with Specialized Instances
- Observed: 2026-02-17 (Session 007)
- Context: Managing multiple related agent contracts (builders)
- Approach:
  * Create unified template contract (BuilderApp-agent.md) demonstrating canonical pattern
  * Maintain specialized contracts (api-builder, ui-builder, etc.) for role-specific recruitment
  * Track all contracts in CANON_INVENTORY.json with proper bindings
- Response: Template provides compliance reference, specialized instances allow targeted recruitment
- Benefits: Consistency, checklist compliance, specialization flexibility
