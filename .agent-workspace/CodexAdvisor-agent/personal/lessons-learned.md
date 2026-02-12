## Session 20260211

### Lesson: Apply Gold-Standard Checklists From Successful Implementations
- Context: When asked to implement gold-standard protocols, reference prior successful implementations
- Pattern: maturion-foreman-office-app PRs #730 and #733 provided definitive checklist structure
- Action: Always layer down proven gold-standard artifacts rather than creating from scratch

### Lesson: Gap Analysis Before Implementation
- Context: Large-scale agent contract updates benefit from systematic gap identification
- Pattern: Comparing current state against checklist requirements reveals precise work scope
- Action: Create gap analysis document before making changes to ensure complete coverage

### Lesson: LOCKED Sections Enforce Governance Stability
- Context: Gold-standard requirements must be protected from unauthorized modification
- Pattern: All governance-critical sections benefit from LOCK IDs with authority citations
- Action: Use LOCKED sections with explicit authorities for all new governance requirements

### Lesson: Consumer-Repo Liaison Contracts Are Significantly More Complex
- Context: Governance liaison role has unique cross-repo and registry responsibilities
- Pattern: Liaison contracts are 3x longer than other agent contracts (Categories 0-10 + Appendix A)
- Action: Budget appropriate time and detail for liaison contract gold-standard compliance

### Lesson: Surgical Additions Preserve Contract Quality
- Context: Adding missing categories to existing contracts risks disruption
- Pattern: Minimal surgical additions at strategic insertion points maintain contract flow
- Action: Preserve existing content structure while adding new LOCKED sections before final sections

## Session 20260212

### Lesson: Canonical Source Fetching Ensures Accurate Layer-Down
- Context: When creating gold-standard contracts, directly fetch canonical source
- Pattern: Fetching maturion-foreman-governance/foreman-v2.agent.md provided authoritative structure
- Action: Always fetch canonical contracts before layer-down to ensure fidelity

### Lesson: Dual Versioning Improves Governance Tracking
- Context: Agent contracts need to track both system version and contract iteration
- Pattern: version: 6.2.0 (system) + contract_version: 2.0.0 (iteration) provides clarity
- Action: Use dual version numbering in all agent contracts for transparency

### Lesson: Preserve Repository-Specific Requirements During Standardization
- Context: Gold-standard alignment must not erase critical local governance
- Pattern: R_Roster QIW and test governance requirements needed integration into v6.2.0 structure
- Action: Identify and preserve local governance requirements when adopting canonical patterns

### Lesson: Include Operational Templates in Contracts
- Context: Agents need concrete guidance for session memory and evidence creation
- Pattern: Including full session memory templates and evidence automation scripts in contract
- Action: Embed operational templates directly in contracts to reduce agent cognitive load

## Session 20260212 (003)

### Lesson: Platform Limits Are Constitutional Constraints
- Context: GitHub Copilot enforces 30,000 character maximum for agent config files
- Pattern: Files exceeding limit appear in UI but are NOT selectable, blocking all workflows
- Action: Treat platform limits as hard governance boundaries - always design within constraints

### Lesson: Examples Are Size Killers in Documentation
- Context: BUILDER_CONTRACT_SCHEMA.md exceeded limit due to massive example sections
- Pattern: Full code block examples duplicating specifications added 16,400+ unnecessary characters
- Action: Use references to working examples instead of embedding full examples in documentation

### Lesson: Reference Architecture Prevents Documentation Bloat
- Context: "Complete Example" section duplicated 250+ lines of content already specified earlier
- Pattern: Pointing to actual working agent files is more effective than reproducing them
- Action: Replace large examples with references like "see .github/agents/ui-builder.md"

### Lesson: Preserve Functionality While Reducing Size
- Context: Needed 39.7% size reduction without losing schema validation capabilities
- Pattern: Removing redundant examples preserved 100% of functional specifications
- Action: Focus refactoring on duplication and verbosity, never on core requirements

### Lesson: Establish Size Targets With Buffer Zones
- Context: Working right at 30,000 char limit leaves no room for future additions
- Pattern: Target 25,000 chars to maintain 5,000 char buffer for evolution
- Action: Set recommended targets below hard limits to allow organic growth
