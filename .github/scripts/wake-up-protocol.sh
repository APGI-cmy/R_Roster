#!/bin/bash
# Wake-Up Protocol for Living Agent System v6.2.0
# Authority: LIVING_AGENT_SYSTEM.md, FOREMAN_AUTHORITY_AND_SUPERVISION_MODEL.md

set -e

AGENT_ID="${1:-foreman}"
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
WORKSPACE_DIR=".agent-workspace/$AGENT_ID"

echo "========================================"
echo "Wake-Up Protocol v6.2.0"
echo "Agent: $AGENT_ID"
echo "Timestamp: $TIMESTAMP"
echo "========================================"
echo ""

# Ensure workspace exists
mkdir -p "$WORKSPACE_DIR/memory"
mkdir -p "$WORKSPACE_DIR/personal"
mkdir -p "$WORKSPACE_DIR/escalation-inbox"

# Load identity
echo "✓ Loading agent identity..."
if [ -f ".github/agents/${AGENT_ID}.md" ] || [ -f ".github/agents/${AGENT_ID}_v*.md" ]; then
    echo "  - Agent contract found"
else
    echo "  ⚠️  No agent contract found for $AGENT_ID"
fi

# Load last memories (5 most recent)
echo "✓ Loading last memories..."
MEMORY_COUNT=$(find "$WORKSPACE_DIR/memory" -maxdepth 1 -name "session-*.md" 2>/dev/null | wc -l)
if [ "$MEMORY_COUNT" -gt 0 ]; then
    echo "  - Found $MEMORY_COUNT session memories"
    echo "  - Most recent sessions:"
    find "$WORKSPACE_DIR/memory" -maxdepth 1 -name "session-*.md" | sort -r | head -5 | while read -r session; do
        echo "    * $(basename "$session")"
    done
else
    echo "  - No previous memories (first session)"
fi

# Check governance state
echo "✓ Checking governance state..."
if [ -f "governance/TIER_0_CANON_MANIFEST.json" ]; then
    # Check for placeholder hashes
    if grep -E '(PLACEHOLDER|TODO|TBD|xxx|000)' governance/TIER_0_CANON_MANIFEST.json > /dev/null 2>&1; then
        echo "  ⚠️  DEGRADED MODE: TIER_0_CANON_MANIFEST contains placeholder hashes"
        echo "  - Escalation required per REQ-SS-004"
        echo "  - Gate alignment may fail"
    else
        echo "  - TIER_0_CANON_MANIFEST valid"
    fi
else
    echo "  ⚠️  TIER_0_CANON_MANIFEST.json not found"
fi

# Environment health check
echo "✓ Checking environment health..."
ENV_HEALTH="$WORKSPACE_DIR/environment-health.json"
cat > "$ENV_HEALTH" << EOF
{
  "timestamp": "$TIMESTAMP",
  "agent_id": "$AGENT_ID",
  "workspace_exists": true,
  "memory_count": $MEMORY_COUNT,
  "governance_manifest_valid": $([ -f "governance/TIER_0_CANON_MANIFEST.json" ] && echo "true" || echo "false"),
  "wake_up_protocol_version": "6.2.0"
}
EOF
echo "  - Environment health logged"

# Generate working contract
echo "✓ Generating working contract..."
WORKING_CONTRACT="$WORKSPACE_DIR/working-contract.md"
cat > "$WORKING_CONTRACT" << EOF
# Working Contract - $AGENT_ID

**Generated**: $TIMESTAMP  
**Living Agent System**: v6.2.0  
**Wake-Up Protocol**: Executed

## Session Context
- Agent ID: $AGENT_ID
- Workspace: $WORKSPACE_DIR
- Previous sessions: $MEMORY_COUNT
- Governance state: $([ -f "governance/TIER_0_CANON_MANIFEST.json" ] && echo "Valid" || echo "Missing")

## Active Contract
This agent operates under:
- Agent contract: .github/agents/${AGENT_ID}*.md
- Living Agent System v6.2.0
- Canon governance from governance/canon/

## Authority Boundaries
- Self-alignment: Within agent role scope
- Escalation required: CS2 for protected files, constitutional changes, authority conflicts
- Execution mode: PR-only (MATURION_BOT_TOKEN)

## Session Responsibilities
- Execute assigned task per issue/PR
- Maintain evidence trail (.agent-admin/)
- Create session memory on closure
- Escalate blockers/gaps to CS2

---
**Status**: Active  
**Valid Until**: Session closure
EOF
echo "  - Working contract generated: $WORKING_CONTRACT"

# Check for escalations
echo "✓ Checking escalation inbox..."
ESCALATION_COUNT=$(find "$WORKSPACE_DIR/escalation-inbox" -type f -name "*.md" 2>/dev/null | wc -l)
if [ "$ESCALATION_COUNT" -gt 0 ]; then
    echo "  ⚠️  $ESCALATION_COUNT pending escalation(s)"
    find "$WORKSPACE_DIR/escalation-inbox" -type f -name "*.md" | while read -r esc; do
        echo "    * $(basename "$esc")"
    done
else
    echo "  - No pending escalations"
fi

echo ""
echo "========================================"
echo "Wake-Up Complete"
echo "========================================"
echo "Agent $AGENT_ID is ready to execute."
echo ""
