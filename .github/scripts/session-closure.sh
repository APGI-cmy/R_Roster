#!/bin/bash
# Session Closure Protocol for Living Agent System v6.2.0
# Authority: LIVING_AGENT_SYSTEM.md, FOREMAN_MEMORY_PROTOCOL.md

set -e

AGENT_ID="${1:-foreman}"
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
DATE=$(date -u +"%Y%m%d")
WORKSPACE_DIR=".agent-workspace/$AGENT_ID"

echo "========================================"
echo "Session Closure Protocol v6.2.0"
echo "Agent: $AGENT_ID"
echo "Timestamp: $TIMESTAMP"
echo "========================================"
echo ""

# Ensure workspace exists
if [ ! -d "$WORKSPACE_DIR" ]; then
    echo "❌ Workspace not found: $WORKSPACE_DIR"
    echo "Run wake-up protocol first"
    exit 1
fi

# Count existing sessions
MEMORY_DIR="$WORKSPACE_DIR/memory"
mkdir -p "$MEMORY_DIR/.archive"
SESSION_COUNT=$(find "$MEMORY_DIR" -maxdepth 1 -name "session-*.md" 2>/dev/null | wc -l)
NEXT_SESSION=$((SESSION_COUNT + 1))
SESSION_FILE="$MEMORY_DIR/session-$(printf "%03d" $NEXT_SESSION)-$DATE.md"

echo "✓ Creating session memory..."
echo "  - Session number: $NEXT_SESSION"
echo "  - File: $(basename "$SESSION_FILE")"

# Create session memory template
cat > "$SESSION_FILE" << 'EOF'
# Session NEXT_SESSION - DATE (Living Agent System v6.2.0)

## Agent
- Type: AGENT_ID
- Class: supervisor
- Session ID: SESSION_ID

## Task
[What was I asked to do?]

## What I Did
### Files Modified (Auto-populated)
[List files with SHA256 checksums]

### Actions Taken
- Action 1: [description]
- Action 2: [description]

### Decisions Made
- Decision 1: [what and why]
- Decision 2: [what and why]

## Living Agent System Evidence

### Evidence Collection
- Evidence log: [path to evidence log]
- Status: [summary]

### Ripple Status
- Status: [ripple state]
- Ripple required: [YES/NO]

### Governance Gap Progress
- Status: [any gaps addressed]

### Governance Hygiene
- Status: [any hygiene issues detected]

## Outcome
[✅ COMPLETE | ⚠️ PARTIAL | ❌ ESCALATED]

## Lessons
### What Worked Well
- [lesson 1]
- [lesson 2]

### What Was Challenging
- [challenge 1]
- [challenge 2]

### What Future Sessions Should Know
- [recommendation 1]
- [recommendation 2]

### Governance Insights
- [insight 1]
- [insight 2]

---
Authority: LIVING_AGENT_SYSTEM.md v6.2.0 | Session: NEXT_SESSION
EOF

# Replace placeholders
sed -i "s/NEXT_SESSION/$NEXT_SESSION/g" "$SESSION_FILE"
sed -i "s/DATE/$DATE/g" "$SESSION_FILE"
sed -i "s/AGENT_ID/$AGENT_ID/g" "$SESSION_FILE"
sed -i "s/SESSION_ID/$TIMESTAMP/g" "$SESSION_FILE"

echo "  - Session memory template created"
echo "  ⚠️  MANUAL: Fill in session details in $SESSION_FILE"

# Memory rotation (keep only 5 most recent)
echo "✓ Checking memory rotation..."
if [ "$SESSION_COUNT" -ge 5 ]; then
    echo "  - Active sessions: $SESSION_COUNT (rotation needed)"
    
    # Get oldest sessions to archive
    TO_ARCHIVE=$((SESSION_COUNT - 4))  # Keep 5 (including new one = 6 total, so archive extras)
    
    find "$MEMORY_DIR" -maxdepth 1 -name "session-*.md" | sort | head -n "$TO_ARCHIVE" | while read -r old_session; do
        ARCHIVE_NAME="$(basename "$old_session")"
        echo "  - Archiving: $ARCHIVE_NAME"
        mv "$old_session" "$MEMORY_DIR/.archive/"
    done
    
    echo "  - Archived $TO_ARCHIVE old session(s)"
else
    echo "  - Active sessions: $SESSION_COUNT (no rotation needed)"
fi

# Check escalations
echo "✓ Checking escalations..."
ESCALATION_COUNT=$(find "$WORKSPACE_DIR/escalation-inbox" -type f -name "*.md" 2>/dev/null | wc -l)
if [ "$ESCALATION_COUNT" -gt 0 ]; then
    echo "  ⚠️  $ESCALATION_COUNT pending escalation(s) in escalation-inbox/"
    echo "  - These require CS2 attention"
else
    echo "  - No pending escalations"
fi

# Clean ephemeral files
echo "✓ Cleaning ephemeral files..."
if [ -f "$WORKSPACE_DIR/working-contract.md" ]; then
    rm "$WORKSPACE_DIR/working-contract.md"
    echo "  - Removed working-contract.md"
fi
if [ -f "$WORKSPACE_DIR/environment-health.json" ]; then
    rm "$WORKSPACE_DIR/environment-health.json"
    echo "  - Removed environment-health.json"
fi

echo ""
echo "========================================"
echo "Session Closure Complete"
echo "========================================"
echo ""
echo "✅ Session memory created: $SESSION_FILE"
echo ""
echo "NEXT STEPS:"
echo "1. Fill in session details in $SESSION_FILE"
echo "2. Update personal/lessons-learned.md if applicable"
echo "3. Update personal/patterns.md if new patterns discovered"
echo "4. Commit all memory files to git"
if [ "$ESCALATION_COUNT" -gt 0 ]; then
    echo "5. ⚠️  Address escalations in escalation-inbox/"
fi
echo ""
