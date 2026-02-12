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

## Pattern: Platform Limit-Driven Refactoring
- Observed: 2026-02-12 (Session 003)
- Context: Agent config files exceeding platform hard limit (30,000 chars) become non-selectable
- Response: Systematic size analysis → identify duplication patterns → remove redundant examples → replace with references → verify functionality preserved → document prevention guidelines

## Pattern: Reference Over Duplication in Documentation
- Observed: 2026-02-12 (Session 003)
- Context: Schema documentation with massive example sections causing size bloat
- Response: Remove full example implementations → create minimal syntax reference → add pointers to working agent files → preserve all specifications but eliminate redundancy

## Pattern: Proactive Size Management
- Observed: 2026-02-12 (Session 003)
- Context: Agent files approaching platform limits need preventive monitoring
- Response: Establish recommended targets below hard limits (25k vs 30k) → create audit scripts → document best practices → set up warning thresholds for early intervention
