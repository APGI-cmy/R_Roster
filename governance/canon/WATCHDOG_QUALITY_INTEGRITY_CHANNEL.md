# WATCHDOG QUALITY INTEGRITY CHANNEL

## Status
**Type**: Canonical Governance Definition (Layer-Down Copy)  
**Authority**: Supreme - Canonical  
**Version**: 1.0.0  
**Effective Date**: 2026-01-13  
**Owner**: Maturion Engineering Leadership (Johan Ras)  
**Source**: APGI-cmy/maturion-foreman-governance/governance/canon/WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md  
**Layer-Down Date**: 2026-01-14  
**Precedence**: Subordinate to WATCHDOG_AUTHORITY_AND_SCOPE.md  
**Applies To**: R_Roster Repository, All Build Systems, All QA Gates

---

## Layer-Down Notice

This document is a **canonical layer-down** from the maturion-foreman-governance repository. It establishes QIW requirements for the R_Roster repository.

**Canonical Source**: https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md

**Layer-Down Authority**: governance-liaison agent per GOVERNANCE_RIPPLE_MODEL.md

**Modification Restrictions**:
- This document MUST NOT be modified locally
- Changes MUST originate from canonical source
- Updates occur via governance ripple process
- Local deviations require Johan Ras approval

---

## 1. Purpose

This document formally defines the **Quality Integrity Watchdog (QIW)** as an observational channel within the Independent Watchdog system for monitoring build, lint, test, deployment, and runtime log integrity.

The QIW Channel exists to:
- Prevent QA systems from reporting false positives
- Detect silent warnings and failures in build artifacts
- Ensure log integrity before QA pass is allowed
- Provide governance memory integration for quality incidents
- Block QA progression when quality anomalies are detected

This document establishes:
- What the QIW Channel observes (5 monitoring channels)
- Detection patterns and anomaly classification
- QA blocking conditions and escalation triggers
- Governance memory integration requirements
- Dashboard visibility and reporting requirements

---

## 2. Constitutional Mandate

This policy derives authority from and implements:
- **WATCHDOG_AUTHORITY_AND_SCOPE.md** - Independent Watchdog authority, observation scope, escalation paths
- **BUILD_PHILOSOPHY.md** - One-Time Build Law, QA as proof, zero-warning discipline
- **GOVERNANCE_PURPOSE_AND_SCOPE.md** - Governance as canonical memory and control system
- **BUILDER_FIRST_PR_MERGE_MODEL.md** - Build-to-Green compliance requirements
- **WARNING_DISCOVERY_BLOCKER_PROTOCOL.md** - Warning escalation and blocking requirements

---

## 3. QIW Observation Channels (5 Required)

### 3.1 QIW-1: Build Log Monitoring

**Detection Patterns**:
- **Critical**: `Build failed`, `Compilation error`, `Fatal error`
- **Error**: `ERROR`, `TypeError`, `ReferenceError`, `Failed to compile`, `Cannot find module`
- **Warning**: `WARNING`, `WARN`, `Deprecated`

**Anomaly Classification**: Critical (hard stop) | Error (QA blocked) | Warning (QA blocked) | Info (logged)

### 3.2 QIW-2: Lint Log Monitoring

**Detection Patterns**:
- **Critical**: Linter crash, configuration error
- **Error**: `error` severity, `✖` marker, rule violations
- **Warning**: `warning` severity, `⚠` marker, deprecated API usage

**Zero-Warning Discipline**: Warnings block QA unless explicitly whitelisted

### 3.3 QIW-3: Test Log Monitoring

**Detection Patterns**:
- **Critical**: Test runner crash, all tests failing
- **Error**: `FAIL`, `✖`, runtime errors, unhandled promise rejections
- **Warning**: `SKIP`, `⊘`, `.only`/`.skip` test suppressions

**Test Integrity Rules**: No skipped tests, no suppressed tests in commits

### 3.4 QIW-4: Deployment Simulation Monitoring

**Detection Patterns**:
- **Critical**: Deployment build failure, server start failure
- **Error**: Route errors, API failures, missing required env vars
- **Warning**: Performance warnings, optional env vars missing

**Deployment Rules**: Preview simulation before production, environment parity validation

### 3.5 QIW-5: Runtime Initialization Monitoring

**Detection Patterns**:
- **Critical**: Application crash during initialization, fatal errors
- **Error**: Component failures, service connection errors
- **Warning**: Slow initialization, fallback modes, retries

**Initialization Rules**: All components must initialize successfully

---

## 4. QA Blocking Conditions

### Automatic QA Blocking

**Critical Severity** (Always Blocks):
- Build failure, test runner crash, deployment failure, app crash, linter crash

**Error Severity** (Always Blocks):
- Silent build errors, lint errors, test failures, deployment errors, runtime errors

**Warning Severity** (Blocks per Zero-Warning Discipline):
- Build warnings, lint warnings (unless whitelisted), skipped tests, deployment warnings

**Info Severity** (Does Not Block):
- Informational messages, performance metrics, execution stats

### Enforcement Mechanism

1. QIW runs before QA pass decision
2. QIW scans all 5 channels for anomalies
3. If blocking anomaly detected: set `qaBlocked = true`
4. Record anomalies in governance memory
5. QA fails if `qaBlocked = true`

---

## 5. Governance Memory Integration

### Incident Structure

```typescript
{
  "whatFailed": string,
  "where": string,
  "why": string,
  "recommendedFix": string,
  "missingArchitectureRule": string,
  "channel": "build" | "lint" | "test" | "deployment_simulation" | "runtime_initialization",
  "severity": "critical" | "error" | "warning" | "info",
  "timestamp": ISO8601,
  "buildSequenceId": string,
  "projectId": "R_Roster",
  "metadata": {
    "commitSha": string,
    "branch": string,
    "environment": string,
    "anomalyContext": string[]
  }
}
```

### Memory Location

- **Project-specific**: `memory/R_Roster/qiw-events.json`
- **Write protocol**: Asynchronous, append-only, immutable
- **Queryable by**: channel, severity, timestamp, build

---

## 6. Dashboard Visibility Requirements

### Required Dashboard Elements

- **Real-time Status**: GREEN/AMBER/RED
- **Per-channel Status**: 5 channels
- **QA Blocked Status**: true/false
- **Recent Anomalies**: Last 10
- **Trends**: 7-day minimum

### Dashboard API

**Endpoint**: `/api/qiw/status`

**Response Schema**:
```typescript
{
  "status": "green" | "amber" | "red",
  "qaBlocked": boolean,
  "lastScanTimestamp": ISO8601,
  "channels": [/* 5 channel statuses */],
  "recentAnomalies": [/* last 10 */],
  "trends": { "last7Days": { /* metrics */ } }
}
```

---

## 7. Configuration Schema

```typescript
{
  "channels": {
    "build": { "enabled": true, "logsPath": string },
    "lint": { "enabled": true, "logsPath": string },
    "test": { "enabled": true, "logsPath": string },
    "deploymentSimulation": { "enabled": true, "logsPath": string },
    "runtimeInitialization": { "enabled": true, "logsPath": string }
  },
  "blocking": {
    "blockOnCritical": true,   // MUST be true
    "blockOnError": true,       // MUST be true
    "blockOnWarning": true      // SHOULD be true
  },
  "memoryIntegration": {
    "enabled": true,
    "scope": "project",
    "location": "memory/R_Roster/qiw-events.json"
  },
  "dashboard": {
    "enabled": true,
    "apiEndpoint": "/api/qiw/status"
  }
}
```

---

## 8. Escalation Paths

**Critical Severity**: Human Authority (immediate) - <1 hour response time  
**Error Severity**: Human Authority (priority) - <4 hours response time  
**Warning Severity**: Dashboard visibility + optional notification - <24 hours response time  
**Info Severity**: Dashboard visibility only - no requirement

---

## 9. Precedence and Final Authority

This document has canonical authority over QIW Channel definition.

**Subordinate to**:
1. Johan Ras (human final authority)
2. GOVERNANCE_PURPOSE_AND_SCOPE.md
3. WATCHDOG_AUTHORITY_AND_SCOPE.md

**Superior to**:
- All QIW implementations
- All project-specific QIW configurations
- All dashboard/reporting systems

---

**End of WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md (Layer-Down Copy)**

---

**R_Roster Implementation Status**: See `governance/alignment/QIW_ALIGNMENT.md` for compliance tracking.
