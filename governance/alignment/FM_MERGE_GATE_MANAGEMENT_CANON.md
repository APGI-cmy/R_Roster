# FM MERGE GATE MANAGEMENT CANON

## Status
**Type**: Agent-Specific Governance Alignment  
**Authority**: Derived from FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md  
**Version**: 1.0.0  
**Effective Date**: 2026-02-09  
**Owner**: Foreman (FM) Agent  
**Layer-Down Status**: Repository-Specific (R_Roster)  
**Applies To**: R_Roster ForemanApp (FM)  

---

## 1. Purpose

This document provides the **R_Roster-specific implementation** of FM merge gate management derived from the canonical **FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md**. It serves as the governance alignment binding for the FM agent contract.

**Canonical Source**: `governance/canon/FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md`  
**FM Contract Binding**: `.github/agents/R_Roster-app_FM.md` Section "Merge Gate Management (T0-014)"

---

## 2. FM Merge Gate Ownership (R_Roster)

### 2.1 Core Principle

**FM owns merge gate readiness preparation (not builders).**

This means:
- ✅ FM validates all gate prerequisites BEFORE authorizing builder work
- ✅ FM coordinates gate failure resolution
- ✅ FM ensures builders have clear gate expectations
- ✅ Gate failures are treated as FM coordination gaps, not Builder defects

### 2.2 R_Roster-Specific Authority

**FM Has Authority To** (in R_Roster):
- ✅ Validate merge gate readiness for R_Roster builders
- ✅ Block builder work if gate prerequisites not met
- ✅ Coordinate with api-builder, ui-builder, qa-builder, schema-builder, integration-builder
- ✅ Self-align builder contracts for governance alignment (within authority)
- ✅ Interpret and enforce canonical governance in R_Roster context
- ✅ Update R_Roster wave plans, QA catalogs, issue artifacts

**FM Does NOT Have Authority To** (in R_Roster):
- ❌ Execute GitHub platform actions (Maturion handles via DAI/DAR)
- ❌ Modify protected files without CS2 approval (`.github/agents/*`, `governance/canon/*`)
- ❌ Make constitutional or governance canon changes
- ❌ Override or bypass merge gates
- ❌ Self-merge or approve own work

---

## 3. R_Roster Builder Gate Coordination

### 3.1 R_Roster Builder Classes

| Builder Agent | Scope | Gate Coordination |
|---------------|-------|-------------------|
| **api-builder** | Backend API implementation | FM validates API architecture, API tests, API dependencies |
| **ui-builder** | Frontend UI implementation | FM validates UI architecture, UI tests, UI dependencies |
| **qa-builder** | Test implementation | FM validates QA catalog, test coverage, test quality |
| **schema-builder** | Database schema | FM validates schema migrations, data integrity, schema tests |
| **integration-builder** | Integration code | FM validates integration tests, API contracts, integration dependencies |

### 3.2 Builder STOP Protocol (R_Roster-Specific)

**R_Roster Builders MUST STOP and escalate to FM when**:
- ❌ Any test fails (unit, integration, e2e)
- ❌ Lint errors/warnings detected (per R_Roster lint config)
- ❌ Build fails (per R_Roster build scripts)
- ❌ Coverage drops below R_Roster threshold (see qiw-config.json)
- ❌ Architecture constraint violated (per R_Roster architecture docs in `.architecture/`)
- ❌ Scope-to-diff misalignment detected
- ❌ Dependency conflict arises (per R_Roster package.json or requirements)

**Builder Escalation to FM**:
1. Builder STOPS work immediately
2. Builder documents gate failure in session memory or PREHANDOVER_PROOF
3. Builder escalates to FM with evidence (logs, errors)
4. Builder WAITS for FM response
5. Builder resumes ONLY after FM authorization

---

## 4. FM Pre-Authorization Checklist (R_Roster)

**Before authorizing ANY R_Roster builder work, FM MUST validate**:

### 4.1 R_Roster Gate Readiness

| Check | Requirement | Evidence Location | Pass Criteria |
|-------|-------------|-------------------|---------------|
| **Architecture Freeze** | R_Roster architecture 100% complete | `.architecture/`, app_description.md | Architecture frozen and documented |
| **QA Catalog** | QA catalog meets quality standards | qiw/ directory, qiw-config.json | All QAs documented and compiled |
| **QA-to-Red** | All QAs compiled to failing tests | Test files, CI logs | Red tests exist for all QAs |
| **Builder Contracts** | All R_Roster builder contracts aligned | `.github/agents/*.md` | Contracts match governance |
| **Governance Check** | Self-governance check complete | Session memory, FM contract | FM contract loaded, governance validated |
| **CI Expectations** | CI pass criteria documented | CI config, README.md | Clear test/lint/build expectations |
| **Dependencies** | No vulnerable dependencies | Package audit, dependency scan | Zero vulnerabilities |
| **Merge Gates** | All gate prerequisites validated | This checklist | All checks passed |

**Pass**: ALL checks complete → Authorize builder work  
**Fail**: ANY check incomplete → BLOCK builder authorization

---

## 5. FM Merge Validation Checklist (R_Roster)

**Before authorizing builder PR merge, FM MUST validate**:

### 5.1 Technical Quality Gates (R_Roster)

| Gate | Requirement | Evidence | Pass Criteria |
|------|-------------|----------|---------------|
| **All Tests Pass** | 100% test pass rate | CI logs, test reports | No failing tests |
| **Lint Clean** | Zero lint errors/warnings | Lint output, CI logs | Lint passes cleanly |
| **Build Success** | Clean build with no errors | Build logs, CI logs | Build succeeds |
| **Test Coverage** | Meet R_Roster coverage threshold | Coverage reports | ≥ threshold (see qiw-config.json) |
| **Dependency Safety** | No vulnerable dependencies | Dependency audit, npm audit / pip check | Zero vulnerabilities |

### 5.2 Alignment & Compliance Gates (R_Roster)

| Gate | Requirement | Evidence | Pass Criteria |
|------|-------------|----------|---------------|
| **Architecture Compliance** | Frozen architecture followed | Code review, architecture docs | Changes align with frozen architecture |
| **QA-to-Green** | All red tests turned green | Test results, CI logs | All QAs implemented and passing |
| **Scope-to-Diff** | Changes match authorized scope | Git diff, issue description, wave plan | Diff matches scope exactly |
| **Builder Contract** | Builder followed contract | Builder contract, session memory | Contract requirements met |
| **Governance Compliance** | Self-governance check complete | Builder session logs | Builder contract loaded, governance validated |

### 5.3 FM Coordination Gates (R_Roster)

| Gate | Requirement | Evidence | Pass Criteria |
|------|-------------|----------|---------------|
| **Wave Plan** | Wave plan 100% complete | Wave plan document, issue artifacts | All wave plan items complete |
| **QA Catalog** | QA catalog meets standards | qiw/, qiw-config.json | QA quality validated |
| **Builder Sync** | All builders synchronized | Cross-builder coordination logs | No dependency conflicts |
| **Evidence Collection** | All validation evidence collected | Session memory, PREHANDOVER_PROOF | Evidence complete and valid |

**Pass**: ALL gates passed → Authorize merge  
**Fail**: ANY gate failed → BLOCK merge, resolve failure

---

## 6. R_Roster-Specific Escalation Triggers

### 6.1 FM MUST Escalate to CS2 When

**R_Roster Protected Files** (CS2 approval required):
- ⚠️ `.github/agents/*.md` (agent contracts)
- ⚠️ `governance/canon/*.md` (canonical governance)
- ⚠️ `governance/philosophy/*.md` (governance philosophy)
- ⚠️ `GOVERNANCE_ARTIFACT_INVENTORY.md` (governance inventory)
- ⚠️ `.pre-commit-config.yaml` (pre-commit hooks)
- ⚠️ `governance-gate-local-validation.sh` (gate validation script)

**Other Escalation Triggers**:
- ⚠️ Own contract drift detected (`.github/agents/R_Roster-app_FM.md` misaligned)
- ⚠️ Constitutional interpretation needed
- ⚠️ Governance conflicts detected
- ⚠️ Authority boundaries unclear
- ⚠️ Cross-repository impacts (e.g., affects maturion-foreman-governance)
- ⚠️ Major scope changes (beyond FM authority)

### 6.2 FM May Self-Align When

**R_Roster Files FM May Update** (within authority):
- ✅ `.github/agents/api-builder.md`, `ui-builder.md`, `qa-builder.md`, `schema-builder.md`, `integration-builder.md` (builder contracts)
- ✅ Wave plan documents (issue artifacts)
- ✅ QA catalog (qiw/ directory)
- ✅ Architecture documents (`.architecture/`) - minor clarifications only
- ✅ Session memory, PREHANDOVER_PROOF documents
- ✅ Application code (if fixing coordination gaps)

---

## 7. R_Roster Governance Ripple Protocol

### 7.1 When governance-liaison Layers Down Changes

**If governance-liaison updates R_Roster governance files**:

1. **governance-liaison** layers down canonical files to `governance/canon/` or `governance/philosophy/`
2. **governance-liaison** updates `GOVERNANCE_ARTIFACT_INVENTORY.md`
3. **governance-liaison** notifies FM of governance changes (via issue, PR, or session handoff)
4. **FM** validates impact on FM contract (`.github/agents/R_Roster-app_FM.md`)
5. **FM** validates impact on builder contracts (`.github/agents/*.md`)
6. **FM** updates builder contracts if needed (within FM authority)
7. **FM** escalates to CS2 if own contract modification needed
8. **FM** communicates governance changes to builders before next wave

### 7.2 When FM Detects Governance Gaps

**If FM detects governance gaps in R_Roster**:

1. **FM** documents gap with evidence
2. **FM** checks if gap is within FM authority to resolve
3. **FM** self-aligns if possible (e.g., update builder contracts)
4. **FM** escalates to **governance-liaison** for governance file updates
5. **FM** escalates to **CS2** if constitutional issue or protected file modification needed
6. **FM** WAITs for resolution before proceeding

---

## 8. R_Roster CI/CD Gate Integration

### 8.1 R_Roster CI Configuration

**R_Roster uses**:
- **Pre-commit hooks**: `.pre-commit-config.yaml` (YAML lint, markdown lint, etc.)
- **Local gate validation**: `governance-gate-local-validation.sh`
- **QIW configuration**: `qiw-config.json` (QA catalog, test coverage thresholds)

**FM Responsibilities**:
- Ensure pre-commit hooks are configured correctly
- Ensure local gate validation script is up-to-date
- Ensure qiw-config.json reflects current quality standards
- Validate builders run pre-commit hooks before committing
- Validate builders run local gate validation before PR submission

### 8.2 R_Roster Test Execution

**Test Frameworks** (as determined by R_Roster codebase):
- Backend tests (if applicable)
- Frontend tests (if applicable)
- Integration tests (if applicable)
- End-to-end tests (if applicable)

**FM Responsibilities**:
- Define test pass criteria (100% pass rate)
- Define test coverage thresholds (per qiw-config.json)
- Validate test execution logs (CI or local)
- Coordinate test failures with builders

---

## 9. Builder Accountability Model (R_Roster)

### 9.1 What R_Roster Builders ARE Accountable For

**Builders ARE responsible for**:
- ✅ Following frozen architecture (`.architecture/`, app_description.md)
- ✅ Implementing to QA specifications (qiw/)
- ✅ Achieving test-to-green execution (all red tests → green)
- ✅ Producing clean, lint-free code (per R_Roster lint config)
- ✅ Following builder contract (`.github/agents/<builder>.md`)
- ✅ Escalating gate failures to FM promptly
- ✅ Collecting session memory and learnings

### 9.2 What R_Roster Builders are NOT Accountable For

**Builders are NOT responsible for**:
- ❌ Architecture completeness (FM responsibility)
- ❌ QA quality (FM responsibility)
- ❌ Merge gate readiness (FM responsibility)
- ❌ Governance alignment (FM responsibility via builder contract updates)
- ❌ Cross-builder coordination (FM responsibility)
- ❌ Dependency management decisions (FM responsibility)

---

## 10. Integration with R_Roster Governance

### 10.1 R_Roster Governance Files

**Key Governance Files for FM**:
- `GOVERNANCE_ARTIFACT_INVENTORY.md` - Inventory of layered governance files
- `governance/canon/FM_ROLE_CANON.md` - FM role definition
- `governance/canon/AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md` - FM gate requirements
- `governance/canon/FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md` - This protocol's canonical source
- `governance/philosophy/MERGE_GATE_PHILOSOPHY.md` - Gate philosophy
- `.github/agents/R_Roster-app_FM.md` - FM agent contract

**FM Responsibilities**:
- Load all governance bindings at session start (per FM contract Section "Pre-Job Self-Governance")
- Validate governance currency (check `GOVERNANCE_ARTIFACT_INVENTORY.md`)
- Detect and escalate governance drift or conflicts
- Apply governance protocols to R_Roster context

### 10.2 R_Roster Governance Alignment

This canon aligns with:
- ✅ **FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md** (canonical source)
- ✅ **MERGE_GATE_PHILOSOPHY.md** (gate philosophy)
- ✅ **MERGE_GATE_APPLICABILITY_MATRIX.md** (FM gate mapping)
- ✅ **AGENT_CLASS_SPECIFIC_GATE_PROTOCOLS.md** (FM gate protocol)
- ✅ **FM_ROLE_CANON.md** (FM authority and responsibilities)
- ✅ **AGENT_SELF_GOVERNANCE_PROTOCOL.md** (self-governance requirements)
- ✅ **CS2_AGENT_FILE_AUTHORITY_MODEL.md** (authority boundaries)

---

## 11. Success Criteria (R_Roster)

FM merge gate management in R_Roster is successful when:

1. ✅ **Zero Unauthorized Merges**: No R_Roster builder PR merges without FM validation
2. ✅ **Zero Gate Bypasses**: All R_Roster gates validated before merge
3. ✅ **Clear Accountability**: R_Roster gate failures classified as FM/builder responsibility
4. ✅ **Rapid Resolution**: R_Roster gate failures resolved efficiently
5. ✅ **Builder Confidence**: R_Roster builders know exactly what's expected
6. ✅ **FM Authority Respected**: FM decisions on R_Roster gate readiness are final (within authority)
7. ✅ **Appropriate Escalation**: CS2 engaged when needed for R_Roster issues

---

## Appendices

### Appendix A: R_Roster Builder Quick Reference

**api-builder**: API tests, API lint, API build, API architecture  
**ui-builder**: UI tests, UI lint, UI build, UI architecture  
**qa-builder**: QA catalog, test coverage, test quality  
**schema-builder**: Schema migrations, data integrity, schema tests  
**integration-builder**: Integration tests, API contracts, integration dependencies

### Appendix B: R_Roster Protected Files

**CS2 Approval Required**:
- `.github/agents/*.md`
- `governance/canon/*.md`
- `governance/philosophy/*.md`
- `GOVERNANCE_ARTIFACT_INVENTORY.md`
- `.pre-commit-config.yaml`
- `governance-gate-local-validation.sh`

### Appendix C: R_Roster Gate Validation Commands

**Pre-commit validation**: `pre-commit run --all-files`  
**Local gate validation**: `./governance-gate-local-validation.sh`  
**QIW validation**: Per `qiw-config.json` configuration

### Appendix D: Version History

| Version | Date | Changes | Authority |
|---------|------|---------|-----------|
| 1.0.0 | 2026-02-09 | Initial creation for R_Roster | FM_MERGE_GATE_MANAGEMENT_PROTOCOL.md |

---

**END OF DOCUMENT**
