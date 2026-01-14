# QIW INCIDENT SCHEMA

**Schema Version**: 1.0.0  
**Authority**: WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0  
**Repository**: R_Roster  
**Date**: 2026-01-14

---

## 1. Purpose

This document defines the incident schema for Quality Integrity Watchdog (QIW) events recorded in governance memory.

**Canonical Authority**: WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md Section 6 (Governance Memory Integration)

---

## 2. Incident Structure

### TypeScript Definition

```typescript
/**
 * Quality Integrity Incident
 * Represents a quality anomaly detected by QIW channels
 */
interface QualityIntegrityIncident {
  /** Description of what failed */
  whatFailed: string;
  /** File/line or component location */
  where: string;
  /** Root cause analysis */
  why: string;
  /** Actionable fix suggestion */
  recommendedFix: string;
  /** Governance gap identified (empty if none) */
  missingArchitectureRule: string;
  
  /** Which QIW channel detected this */
  channel: QIWChannel;
  /** Critical | Error | Warning | Info */
  severity: Severity;
  
  /** ISO8601 format */
  timestamp: string;
  /** PR/build identifier */
  buildSequenceId: string;
  /** Always "R_Roster" for this repo */
  projectId: string;
  
  /** Additional metadata */
  metadata: {
    /** Git commit SHA */
    commitSha: string;
    /** Git branch name */
    branch: string;
    /** local | ci | preview | production */
    environment: string;
    /** Surrounding log lines for context */
    anomalyContext: string[];
  };
}

/** Enumerated types */
type QIWChannel = 
  | "build" 
  | "lint" 
  | "test" 
  | "deployment_simulation" 
  | "runtime_initialization";

type Severity = 
  | "critical"   // Hard stop, immediate escalation
  | "error"      // QA blocked, escalation required
  | "warning"    // QA blocked (zero-warning), resolution required
  | "info";      // No blocking, logged for visibility
```

---

## 3. Field Specifications

### 3.1 Core Incident Data

#### whatFailed
- **Type**: string
- **Required**: Yes
- **Description**: Clear, concise description of what failed
- **Format**: Plain text, 1-2 sentences
- **Example**: `"ESLint detected 3 error-level violations in src/utils.ts"`

#### where
- **Type**: string
- **Required**: Yes
- **Description**: Location of the failure
- **Format**: 
  - File: `path/to/file.ts:lineNumber`
  - Component: `ComponentName.methodName`
  - System: `Build System`, `Test Runner`, etc.
- **Example**: `"src/components/RosterView.tsx:47"`

#### why
- **Type**: string
- **Required**: Yes
- **Description**: Root cause analysis of the failure
- **Format**: Plain text, 2-3 sentences explaining the cause
- **Example**: `"Variable 'teacherName' is used before being initialized. This occurs because the conditional check does not cover all code paths."`

#### recommendedFix
- **Type**: string
- **Required**: Yes
- **Description**: Actionable suggestion to fix the issue
- **Format**: Plain text, specific steps or code changes
- **Example**: `"Initialize 'teacherName' to empty string at declaration, or add null check before usage."`

#### missingArchitectureRule
- **Type**: string
- **Required**: Yes (empty string if no gap)
- **Description**: Governance or architecture rule that could prevent recurrence
- **Format**: Plain text, rule proposal or empty string
- **Example**: `"Require explicit initialization for all string variables"` or `""`

---

### 3.2 Classification

#### channel
- **Type**: QIWChannel enum
- **Required**: Yes
- **Valid Values**:
  - `"build"` - QIW-1: Build Log Monitoring
  - `"lint"` - QIW-2: Lint Log Monitoring
  - `"test"` - QIW-3: Test Log Monitoring
  - `"deployment_simulation"` - QIW-4: Deployment Simulation Monitoring
  - `"runtime_initialization"` - QIW-5: Runtime Initialization Monitoring

#### severity
- **Type**: Severity enum
- **Required**: Yes
- **Valid Values**:
  - `"critical"` - Hard stop, immediate escalation (<1 hour)
  - `"error"` - QA blocked, escalation required (<4 hours)
  - `"warning"` - QA blocked (zero-warning discipline) (<24 hours)
  - `"info"` - Informational, no blocking

**Severity Mapping**:
- Critical: Build failure, test runner crash, deployment failure, app crash
- Error: Silent build errors, test failures, lint errors, runtime errors
- Warning: Build warnings, lint warnings, skipped tests, performance issues
- Info: Metrics, stats, informational messages

---

### 3.3 Temporal and Context

#### timestamp
- **Type**: string (ISO8601)
- **Required**: Yes
- **Format**: `YYYY-MM-DDTHH:mm:ss.sssZ`
- **Example**: `"2026-01-14T10:30:45.123Z"`
- **Note**: UTC timezone required

#### buildSequenceId
- **Type**: string
- **Required**: Yes
- **Description**: Unique identifier for the build/PR
- **Format**: 
  - PR: `PR-{number}` (e.g., `"PR-42"`)
  - CI Build: `CI-{workflow}-{run_id}` (e.g., `"CI-governance-gate-123456"`)
  - Local: `LOCAL-{timestamp}` (e.g., `"LOCAL-20260114103045"`)
- **Example**: `"PR-42"`

#### projectId
- **Type**: string
- **Required**: Yes
- **Value**: Always `"R_Roster"` for this repository
- **Note**: Fixed value for project-scoped memory

---

### 3.4 Metadata

#### metadata.commitSha
- **Type**: string
- **Required**: Yes
- **Description**: Git commit SHA when incident occurred
- **Format**: Full 40-character SHA or short 7-character SHA
- **Example**: `"a1b2c3d4e5f6789012345678901234567890abcd"` or `"a1b2c3d"`

#### metadata.branch
- **Type**: string
- **Required**: Yes
- **Description**: Git branch name when incident occurred
- **Format**: Branch name string
- **Example**: `"copilot/implement-quality-integrity-watchdog"`

#### metadata.environment
- **Type**: string
- **Required**: Yes
- **Description**: Environment where incident occurred
- **Valid Values**: `"local"`, `"ci"`, `"preview"`, `"production"`
- **Example**: `"local"`

#### metadata.anomalyContext
- **Type**: string[]
- **Required**: Yes (empty array if no context)
- **Description**: Surrounding log lines providing context
- **Format**: Array of log line strings (typically 3-5 lines before/after anomaly)
- **Example**:
```json
[
  "Building application...",
  "Compiling src/utils.ts",
  "ERROR: Variable 'teacherName' used before initialization",
  "  at line 47, column 12",
  "Build completed with 1 error"
]
```

---

## 4. Memory Storage Format

### File Structure

**Location**: `memory/R_Roster/qiw-events.json`

**Format**: JSON array of incidents

```json
[
  {
    "whatFailed": "ESLint detected 3 error-level violations",
    "where": "src/utils.ts:47",
    "why": "Variable used before initialization",
    "recommendedFix": "Initialize variable at declaration",
    "missingArchitectureRule": "Require explicit initialization",
    "channel": "lint",
    "severity": "error",
    "timestamp": "2026-01-14T10:30:45.123Z",
    "buildSequenceId": "PR-42",
    "projectId": "R_Roster",
    "metadata": {
      "commitSha": "a1b2c3d",
      "branch": "feature/roster-view",
      "environment": "local",
      "anomalyContext": [
        "Linting src/utils.ts",
        "ERROR: Variable 'teacherName' used before initialization",
        "  47:12  error  'teacherName' is used before being defined"
      ]
    }
  }
]
```

### Write Protocol

- **Append-Only**: New incidents appended to array, never modified
- **Immutability**: Existing incidents never edited or deleted
- **Asynchronous**: Writes do not block QIW execution
- **Atomic**: Each write operation is atomic (entire incident or nothing)

---

## 5. Queryability

### Query Dimensions

Incidents are queryable by:
- **channel**: Filter by which QIW channel detected incident
- **severity**: Filter by critical/error/warning/info
- **timestamp**: Time-range queries for trend analysis
- **buildSequenceId**: All incidents for a specific build/PR
- **projectId**: All incidents for R_Roster (vs. other projects)
- **commitSha**: Incidents introduced by specific commit
- **branch**: Incidents on specific branch
- **environment**: Incidents in local/ci/preview/production

### Example Queries

**All critical incidents**:
```javascript
incidents.filter(i => i.severity === "critical")
```

**Lint errors in last 7 days**:
```javascript
const sevenDaysAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000);
incidents.filter(i => 
  i.channel === "lint" && 
  i.severity === "error" &&
  new Date(i.timestamp) > sevenDaysAgo
)
```

**All incidents for PR-42**:
```javascript
incidents.filter(i => i.buildSequenceId === "PR-42")
```

---

## 6. Validation Rules

### Schema Validation

All incidents MUST pass the following validations before being written to memory:

1. **Required Fields**: All required fields present and non-empty (except missingArchitectureRule may be empty)
2. **Type Validation**: All fields match specified types
3. **Enum Validation**: channel and severity must be valid enum values
4. **Timestamp Format**: Must be valid ISO8601 format
5. **ProjectId**: Must be "R_Roster"
6. **Metadata Complete**: All metadata fields present and valid

### Validation Failures

If an incident fails validation:
1. Log validation error to QIW logs
2. Do NOT write invalid incident to memory
3. Do NOT block QA based on failed write (write failure is separate from incident occurrence)
4. Alert human authority of validation failure

---

## 7. Memory Maintenance

### Retention Policy

- **Duration**: Incidents retained indefinitely (no automatic deletion)
- **Archival**: May archive incidents older than 1 year to separate file
- **Deletion**: Only via governance approval (e.g., security incident cleanup)

### File Management

- **Rotation**: If file grows beyond 10 MB, rotate to yearly archives
- **Backup**: Memory files backed up per repository backup policy
- **Migration**: If schema changes, migrate existing incidents to new schema

---

## 8. Integration with Dashboard

### Dashboard Queries

Dashboard uses the following queries:

1. **Recent Anomalies**: Last 10 incidents (all channels, all severities)
2. **7-Day Trends**: Incident counts by day for last 7 days
3. **Channel Health**: Last incident per channel, incident count per channel
4. **Severity Distribution**: Count of critical/error/warning/info in last 7 days

### Real-Time Updates

- Dashboard polls memory file every 60 seconds
- Or uses file system watch for real-time updates
- Dashboard caches parsed incidents for performance

---

## 9. Example Incidents

### Example 1: Build Error

```json
{
  "whatFailed": "TypeScript compilation failed in src/roster/RosterCalculator.ts",
  "where": "src/roster/RosterCalculator.ts:142",
  "why": "Type 'undefined' is not assignable to type 'Teacher'. The function getTeacherById can return undefined, but the caller does not handle this case.",
  "recommendedFix": "Add null check: if (!teacher) { throw new Error('Teacher not found'); } before using teacher object.",
  "missingArchitectureRule": "All database/lookup functions must return Result<T, Error> type for explicit error handling",
  "channel": "build",
  "severity": "error",
  "timestamp": "2026-01-14T10:35:22.456Z",
  "buildSequenceId": "LOCAL-20260114103520",
  "projectId": "R_Roster",
  "metadata": {
    "commitSha": "b3e4f5a",
    "branch": "feature/roster-calculator",
    "environment": "local",
    "anomalyContext": [
      "Compiling src/roster/RosterCalculator.ts",
      "src/roster/RosterCalculator.ts:142:18 - error TS2322: Type 'undefined' is not assignable to type 'Teacher'.",
      "  const teacher = getTeacherById(id);",
      "  teacher.name = newName; // ERROR: teacher may be undefined",
      "Found 1 error."
    ]
  }
}
```

### Example 2: Lint Warning (Zero-Warning Discipline)

```json
{
  "whatFailed": "ESLint detected deprecated API usage in src/utils/dateHelpers.ts",
  "where": "src/utils/dateHelpers.ts:23",
  "why": "Using deprecated Date.parse() method which has inconsistent behavior across browsers. Should use modern date parsing library.",
  "recommendedFix": "Replace Date.parse(dateString) with new Date(dateString).getTime() or use date-fns parse function.",
  "missingArchitectureRule": "Prohibit use of deprecated JavaScript APIs, enforce via ESLint rules",
  "channel": "lint",
  "severity": "warning",
  "timestamp": "2026-01-14T11:02:15.789Z",
  "buildSequenceId": "PR-43",
  "projectId": "R_Roster",
  "metadata": {
    "commitSha": "c5d6e7f",
    "branch": "feature/date-helpers",
    "environment": "ci",
    "anomalyContext": [
      "Linting src/utils/dateHelpers.ts",
      "src/utils/dateHelpers.ts",
      "  23:18  warning  'Date.parse' is deprecated  no-deprecated-api",
      "✖ 1 warning (0 errors)"
    ]
  }
}
```

### Example 3: Test Failure

```json
{
  "whatFailed": "Test failed: 'RosterCalculator.allocateReplacement should respect max 2 allocations per teacher'",
  "where": "src/roster/__tests__/RosterCalculator.test.ts:87",
  "why": "Assertion failed: Expected teacher 'Smith J' to have 2 allocations, but had 3. The allocation logic does not enforce the max-2-per-day constraint correctly.",
  "recommendedFix": "Fix allocateReplacement() method to check current allocation count before assigning. Add: if (getAllocationsToday(teacher) >= 2) { continue; }",
  "missingArchitectureRule": "All business rule constraints must have corresponding tests covering both success and boundary cases",
  "channel": "test",
  "severity": "error",
  "timestamp": "2026-01-14T11:15:33.012Z",
  "buildSequenceId": "PR-44",
  "projectId": "R_Roster",
  "metadata": {
    "commitSha": "d7e8f9a",
    "branch": "feature/allocation-logic",
    "environment": "local",
    "anomalyContext": [
      "FAIL src/roster/__tests__/RosterCalculator.test.ts",
      "  RosterCalculator",
      "    ✕ allocateReplacement should respect max 2 allocations per teacher (15 ms)",
      "  Expected: 2",
      "  Received: 3"
    ]
  }
}
```

---

## 10. References

**Canonical Authority**: WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0  
**Related Documents**:
- governance/alignment/QIW_ALIGNMENT.md (compliance tracking)
- qiw-config.json (detection patterns and configuration)
- governance/runbooks/QIW_EXECUTION_PROTOCOL.md (operational procedures)

---

**Schema Authority**: governance-liaison agent  
**Version Control**: Update only when canonical schema changes  
**Escalation**: Johan Ras (constitutional matters)

---

**End of QIW_INCIDENT_SCHEMA.md**
