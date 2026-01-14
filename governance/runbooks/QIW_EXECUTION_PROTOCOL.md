# QIW EXECUTION PROTOCOL

**Version**: 1.0.0  
**Authority**: WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0  
**Repository**: R_Roster  
**Date**: 2026-01-14  
**Status**: OPERATIONAL_GUIDANCE

---

## 1. Purpose

This runbook defines the operational protocol for executing Quality Integrity Watchdog (QIW) scans in the R_Roster repository.

**Canonical Authority**: WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0  
**Configuration**: qiw-config.json  
**Incident Schema**: governance/schemas/QIW_INCIDENT_SCHEMA.md

---

## 2. When to Execute QIW

### Mandatory Execution Points

QIW MUST execute at the following points:

1. **Before QA Pass Decision**
   - After all tests complete
   - After all linters run
   - Before marking QA as passed
   - **Rationale**: QA cannot pass with quality anomalies

2. **PR Gate Preflight**
   - Before creating PR
   - As part of local gate validation
   - Before PREHANDOVER_PROOF generation
   - **Rationale**: CI-Confirmatory-Not-Diagnostic principle

3. **CI Pipeline**
   - After build completes
   - After tests complete
   - As separate CI job or step
   - **Rationale**: Automated enforcement in CI

4. **Post-Deployment**
   - After deployment simulation
   - After runtime initialization
   - Before declaring deployment successful
   - **Rationale**: Validate deployment health

### Optional Execution Points

QIW MAY execute at:

1. **On-Demand**
   - Developer requests QIW scan
   - Investigating quality trends
   - Validating fixes

2. **Scheduled**
   - Daily quality health checks
   - Weekly trend analysis
   - Monthly governance reviews

---

## 3. Execution Workflow

### Step 1: Pre-Execution Validation

**Check Prerequisites**:
```bash
# Verify configuration exists
test -f qiw-config.json || echo "ERROR: qiw-config.json not found"

# Verify memory directory exists
test -d memory/R_Roster || mkdir -p memory/R_Roster

# Verify qiw-events.json exists
test -f memory/R_Roster/qiw-events.json || echo "[]" > memory/R_Roster/qiw-events.json

# Verify log directories exist (create if missing)
mkdir -p logs/
```

**Load Configuration**:
```bash
# Parse qiw-config.json
# Validate schema compliance
# Check all 5 channels enabled status
# Load detection patterns
```

**Status**: READY

---

### Step 2: Channel Scanning (5 Channels)

For each enabled channel, execute scan in parallel:

#### QIW-1: Build Log Monitoring

```bash
# Locate build log
BUILD_LOG=$(cat qiw-config.json | jq -r '.channels.build.logsPath')

# Scan for critical patterns
CRITICAL_MATCHES=$(grep -E "Build failed|Compilation error|Fatal error" "$BUILD_LOG")

# Scan for error patterns
ERROR_MATCHES=$(grep -E "\\bERROR\\b|\\bTypeError\\b|Failed to compile" "$BUILD_LOG")

# Scan for warning patterns
WARNING_MATCHES=$(grep -E "\\bWARNING\\b|\\bWARN\\b|Deprecated" "$BUILD_LOG")

# Classify severity
if [ -n "$CRITICAL_MATCHES" ]; then
  SEVERITY="critical"
  QA_BLOCKED=true
elif [ -n "$ERROR_MATCHES" ]; then
  SEVERITY="error"
  QA_BLOCKED=true
elif [ -n "$WARNING_MATCHES" ]; then
  SEVERITY="warning"
  QA_BLOCKED=true  # Zero-warning discipline
else
  SEVERITY="info"
  QA_BLOCKED=false
fi

# Record incident if critical or error
if [ "$SEVERITY" = "critical" ] || [ "$SEVERITY" = "error" ]; then
  # Write to memory/R_Roster/qiw-events.json
  # Follow QIW_INCIDENT_SCHEMA.md structure
fi
```

#### QIW-2: Lint Log Monitoring

```bash
# Locate lint log
LINT_LOG=$(cat qiw-config.json | jq -r '.channels.lint.logsPath')

# Scan for patterns per configuration
# Check whitelist for approved exceptions
# Classify severity
# Record incidents
```

#### QIW-3: Test Log Monitoring

```bash
# Locate test log
TEST_LOG=$(cat qiw-config.json | jq -r '.channels.test.logsPath')

# Scan for patterns per configuration
# Check for .only/.skip suppressions
# Classify severity
# Record incidents
```

#### QIW-4: Deployment Simulation Monitoring

```bash
# Locate deployment log
DEPLOY_LOG=$(cat qiw-config.json | jq -r '.channels.deploymentSimulation.logsPath')

# Scan preview simulation logs
# Scan production simulation logs
# Validate environment parity
# Classify severity
# Record incidents
```

#### QIW-5: Runtime Initialization Monitoring

```bash
# Locate runtime init log
RUNTIME_LOG=$(cat qiw-config.json | jq -r '.channels.runtimeInitialization.logsPath')

# Scan for initialization errors
# Check component startup status
# Classify severity
# Record incidents
```

**Status**: SCANNING_COMPLETE

---

### Step 3: Aggregate Results

```bash
# Collect all channel statuses
BUILD_STATUS="green|amber|red"
LINT_STATUS="green|amber|red"
TEST_STATUS="green|amber|red"
DEPLOY_STATUS="green|amber|red"
RUNTIME_STATUS="green|amber|red"

# Determine overall QIW status
if any_channel_red; then
  OVERALL_STATUS="red"
  QA_BLOCKED=true
elif any_channel_amber; then
  OVERALL_STATUS="amber"
  QA_BLOCKED=true  # Zero-warning discipline
else
  OVERALL_STATUS="green"
  QA_BLOCKED=false
fi

# Count anomalies by severity
CRITICAL_COUNT=$(count_incidents "critical")
ERROR_COUNT=$(count_incidents "error")
WARNING_COUNT=$(count_incidents "warning")
INFO_COUNT=$(count_incidents "info")

# Determine QA blocking decision
if [ "$CRITICAL_COUNT" -gt 0 ] || [ "$ERROR_COUNT" -gt 0 ] || [ "$WARNING_COUNT" -gt 0 ]; then
  QA_BLOCKED=true
else
  QA_BLOCKED=false
fi
```

**Status**: RESULTS_AGGREGATED

---

### Step 4: Generate Report

**Blocking Report** (if QA blocked):

```
========================================
QIW BLOCKING REPORT
========================================
Status: RED (QA BLOCKED)
Timestamp: 2026-01-14T10:30:45.123Z
Build ID: PR-42

Overall Status: RED
QA Blocked: true

Channel Status:
- Build: RED (2 errors)
- Lint: AMBER (3 warnings)
- Test: GREEN (0 issues)
- Deployment: GREEN (0 issues)
- Runtime: GREEN (0 issues)

Anomalies:
1. [build] [error] TypeScript compilation failed in src/utils.ts:47
   Fix: Initialize variable before use
   
2. [build] [error] Cannot find module 'lodash'
   Fix: npm install lodash
   
3. [lint] [warning] Deprecated API usage in src/helpers.ts:23
   Fix: Replace Date.parse() with date-fns

QA DECISION: BLOCKED
Reason: 2 errors, 3 warnings detected
Action Required: Fix all errors and warnings before retry

Escalation: Errors require human authority within 4 hours
========================================
```

**Pass Report** (if QA not blocked):

```
========================================
QIW PASS REPORT
========================================
Status: GREEN (QA PASSED)
Timestamp: 2026-01-14T10:30:45.123Z
Build ID: PR-42

Overall Status: GREEN
QA Blocked: false

Channel Status:
- Build: GREEN (0 issues)
- Lint: GREEN (0 issues)
- Test: GREEN (0 issues)
- Deployment: GREEN (0 issues)
- Runtime: GREEN (0 issues)

Anomalies: None detected

QA DECISION: PASSED
========================================
```

**Status**: REPORT_GENERATED

---

### Step 5: Escalate (if needed)

**Escalation Rules**:

```bash
if [ "$CRITICAL_COUNT" -gt 0 ]; then
  # Critical: Immediate escalation
  escalate_to "human-authority" "immediate" "1 hour"
  notify "Johan Ras"
fi

if [ "$ERROR_COUNT" -gt 0 ]; then
  # Error: Priority escalation
  escalate_to "human-authority" "priority" "4 hours"
  notify "Johan Ras" "Foreman Agent"
fi

if [ "$WARNING_COUNT" -gt 0 ]; then
  # Warning: Dashboard notification
  update_dashboard "amber"
  # Optional notification per configuration
fi
```

**Status**: ESCALATION_COMPLETE

---

### Step 6: Update Dashboard

```bash
# Write to dashboard API or data file
cat > /tmp/qiw-status.json <<EOF
{
  "status": "$OVERALL_STATUS",
  "qaBlocked": $QA_BLOCKED,
  "lastScanTimestamp": "$(date -u +%Y-%m-%dT%H:%M:%S.%3NZ)",
  "channels": [
    {"name": "build", "status": "$BUILD_STATUS", "lastAnomalyCount": $BUILD_ANOMALY_COUNT},
    {"name": "lint", "status": "$LINT_STATUS", "lastAnomalyCount": $LINT_ANOMALY_COUNT},
    {"name": "test", "status": "$TEST_STATUS", "lastAnomalyCount": $TEST_ANOMALY_COUNT},
    {"name": "deployment_simulation", "status": "$DEPLOY_STATUS", "lastAnomalyCount": $DEPLOY_ANOMALY_COUNT},
    {"name": "runtime_initialization", "status": "$RUNTIME_STATUS", "lastAnomalyCount": $RUNTIME_ANOMALY_COUNT}
  ],
  "recentAnomalies": $(get_recent_anomalies 10),
  "trends": {
    "last7Days": {
      "anomalyCount": $(count_last_7_days),
      "criticalCount": $(count_critical_last_7_days),
      "errorCount": $(count_error_last_7_days),
      "warningCount": $(count_warning_last_7_days),
      "qaBlockCount": $(count_blocks_last_7_days)
    }
  }
}
EOF

# Publish to dashboard API endpoint
# Or update dashboard data file
```

**Status**: DASHBOARD_UPDATED

---

### Step 7: Return Exit Code

```bash
# Exit code determines QA gate pass/fail
if [ "$QA_BLOCKED" = true ]; then
  exit 1  # QA BLOCKED
else
  exit 0  # QA PASSED
fi
```

**Status**: EXECUTION_COMPLETE

---

## 4. Integration with QA Gates

### Local PR-Gate Preflight

```bash
# In governance-gate-local-validation.sh or similar

# Run QIW scan
./scripts/qiw-scan.sh

# Check exit code
if [ $? -ne 0 ]; then
  echo "ERROR: QIW detected quality anomalies"
  echo "QA BLOCKED: Fix issues before creating PR"
  exit 1
fi

echo "QIW: All channels GREEN, QA PASSED"
```

### CI Pipeline Integration

```yaml
# In .github/workflows/qa-gate.yml

jobs:
  qiw-scan:
    name: Quality Integrity Watchdog
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Run QIW Scan
        run: |
          ./scripts/qiw-scan.sh
        
      - name: Check QA Blocked
        if: failure()
        run: |
          echo "::error::QIW detected quality anomalies - QA BLOCKED"
          cat logs/qiw-blocking-report.txt
          exit 1
      
      - name: Upload QIW Report
        if: always()
        uses: actions/upload-artifact@v3
        with:
          name: qiw-report
          path: logs/qiw-report.json
```

---

## 5. Incident Recording Protocol

### Incident Creation

When critical or error anomaly detected:

```typescript
const incident: QualityIntegrityIncident = {
  whatFailed: "Concise description of failure",
  where: "file.ts:lineNumber or ComponentName",
  why: "Root cause analysis (2-3 sentences)",
  recommendedFix: "Actionable fix suggestion",
  missingArchitectureRule: "Proposed governance rule or empty string",
  channel: "build" | "lint" | "test" | "deployment_simulation" | "runtime_initialization",
  severity: "critical" | "error",
  timestamp: new Date().toISOString(),
  buildSequenceId: process.env.BUILD_ID || `LOCAL-${Date.now()}`,
  projectId: "R_Roster",
  metadata: {
    commitSha: getCommitSha(),
    branch: getBranchName(),
    environment: getEnvironment(), // local | ci | preview | production
    anomalyContext: extractLogContext(logFile, lineNumber, 3) // 3 lines before/after
  }
};
```

### Memory Write

```bash
# Validate incident against schema
validate_incident "$incident_json"

# Append to memory file (atomic operation)
jq '. += ['"$incident_json"']' memory/R_Roster/qiw-events.json > /tmp/qiw-events-tmp.json
mv /tmp/qiw-events-tmp.json memory/R_Roster/qiw-events.json

# Verify write success
if [ $? -eq 0 ]; then
  echo "Incident recorded successfully"
else
  echo "ERROR: Failed to record incident to memory"
  # Log error but do NOT block QIW execution
fi
```

---

## 6. Configuration Management

### Updating Detection Patterns

To add custom detection patterns:

1. Edit qiw-config.json
2. Add pattern to appropriate channel's customPatterns array
3. Document rationale in commit message
4. Validate patterns with test logs
5. Run QIW scan to verify

**Rules**:
- Custom patterns are ADDITIVE only
- CANNOT weaken or remove canonical patterns
- Require governance review for approval

### Updating Blocking Rules

**PROHIBITED**: Disabling blockOnCritical or blockOnError (constitutional requirement)

**PERMITTED**: Adjusting blockOnWarning (with justification and governance approval)

### Whitelist Management

For lint warnings requiring exception:

1. Add to .qiw-lint-whitelist.json:
```json
{
  "rules": [
    {
      "rule": "no-deprecated-api",
      "file": "src/legacy/oldModule.ts",
      "lines": [23, 45],
      "justification": "Legacy code - scheduled for refactor in Q2",
      "approvedBy": "Johan Ras",
      "expirationDate": "2026-06-01"
    }
  ]
}
```

2. Require governance approval
3. Set expiration date (no permanent exceptions)
4. Document removal plan

---

## 7. Troubleshooting

### QIW Scan Fails

**Symptom**: QIW script exits with error before scanning  
**Causes**:
- Missing configuration file
- Invalid JSON in qiw-config.json
- Missing log files
- Permission errors

**Resolution**:
```bash
# Verify configuration
test -f qiw-config.json && echo "Config exists" || echo "Config missing"

# Validate JSON
jq '.' qiw-config.json > /dev/null && echo "Valid JSON" || echo "Invalid JSON"

# Check log directories
ls -la logs/

# Fix permissions
chmod 644 qiw-config.json
chmod 755 scripts/qiw-scan.sh
```

### False Positives

**Symptom**: QIW detects anomaly that is not actually a problem  
**Causes**:
- Overly broad detection pattern
- Missing whitelist entry
- Log format change

**Resolution**:
1. Review anomaly details
2. If false positive confirmed, add to whitelist (with justification)
3. If pattern too broad, refine pattern (governance approval required)
4. Document in learnings

### False Negatives

**Symptom**: QIW misses actual quality issue  
**Causes**:
- Incomplete detection patterns
- Log not scanned
- Channel disabled

**Resolution**:
1. Analyze missed issue
2. Add detection pattern to configuration
3. Test pattern with sample logs
4. Document in learnings
5. Propose governance improvement

### Memory Write Failures

**Symptom**: Incidents not recorded to memory  
**Causes**:
- Permission errors on memory file
- Disk full
- Invalid incident schema

**Resolution**:
```bash
# Check permissions
ls -la memory/R_Roster/qiw-events.json

# Check disk space
df -h

# Validate incident schema
# (incident validation logic)

# Fix permissions
chmod 644 memory/R_Roster/qiw-events.json
```

---

## 8. Maintenance

### Daily

- Monitor dashboard for new anomalies
- Review blocking incidents
- Escalate per severity guidelines

### Weekly

- Analyze 7-day trends
- Identify patterns in anomalies
- Review whitelist expirations
- Update detection patterns if needed

### Monthly

- Comprehensive governance review
- Analyze memory for systemic issues
- Propose governance improvements
- Update documentation per learnings

### Quarterly

- Canonical synchronization check
- Configuration audit
- Detection pattern effectiveness review
- Escalation process review

---

## 9. Success Metrics

### Operational Health

- **QIW Scan Success Rate**: >99% (scans complete without error)
- **QA Blocking Accuracy**: >95% (blocks are justified)
- **False Positive Rate**: <5% (anomalies are real issues)
- **False Negative Rate**: <1% (QIW catches quality issues)

### Quality Trends

- **Overall Status**: Target GREEN >90% of time
- **QA Block Rate**: Decreasing over time (improving quality)
- **Critical Incidents**: Zero per month (target)
- **Error Incidents**: <5 per month (target)
- **Warning Incidents**: Zero per build (zero-warning discipline)

### Response Times

- **Critical Escalation**: <1 hour (100% compliance)
- **Error Escalation**: <4 hours (100% compliance)
- **Warning Resolution**: <24 hours (>90% compliance)

---

## 10. References

**Canonical Authority**:
- WATCHDOG_QUALITY_INTEGRITY_CHANNEL.md v1.0.0 (governance/canon/)

**R_Roster Documents**:
- qiw-config.json (configuration)
- governance/schemas/QIW_INCIDENT_SCHEMA.md (incident schema)
- governance/alignment/QIW_ALIGNMENT.md (compliance tracking)
- memory/R_Roster/qiw-events.json (governance memory)

**Escalation**:
- Johan Ras (constitutional matters)
- Foreman Agent (implementation coordination)

---

**Runbook Authority**: governance-liaison agent  
**Version Control**: Update when canonical or configuration changes  
**Status**: OPERATIONAL_GUIDANCE (awaiting implementation)

---

**End of QIW_EXECUTION_PROTOCOL.md**
