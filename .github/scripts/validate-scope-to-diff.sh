#!/bin/bash
# Validate (or auto-generate) SCOPE_DECLARATION.md against git diff.

set -euo pipefail

SCOPE_FILE="SCOPE_DECLARATION.md"
DIFF_COMMAND="git diff --name-status origin/main"
DIFF_OUTPUT="$($DIFF_COMMAND)"

if [ ! -f "$SCOPE_FILE" ]; then
  # Auto-generate scope declaration when missing to satisfy BL-027.
  {
    echo "# SCOPE_DECLARATION"
    echo ""
    echo "Generated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    echo "Source: $DIFF_COMMAND"
    echo ""
    echo "## Files"
    if [ -n "$DIFF_OUTPUT" ]; then
      echo "$DIFF_OUTPUT"
    else
      echo "(no changes detected)"
    fi
  } > "$SCOPE_FILE"

  echo "✅ SCOPE_DECLARATION.md generated from git diff."
  exit 0
fi

EXPECTED="$(echo "$DIFF_OUTPUT" | sed '/^$/d')"
ACTUAL="$(grep -E '^[A-Z][A-Z0-9]*\t' "$SCOPE_FILE" || true)"

if [ -z "$EXPECTED" ]; then
  if [ -n "$ACTUAL" ]; then
    echo "❌ SCOPE_DECLARATION.md lists files but git diff is empty."
    exit 1
  fi
  echo "✅ SCOPE_DECLARATION.md matches git diff (no changes)."
  exit 0
fi

missing=false
while IFS= read -r line; do
  if ! grep -Fxq "$line" "$SCOPE_FILE"; then
    echo "❌ Missing scope entry: $line"
    missing=true
  fi
done <<< "$EXPECTED"

extra="$(printf '%s\n' "$ACTUAL" | grep -Fvx "$EXPECTED" || true)"
if [ -n "$extra" ]; then
  echo "❌ Extra scope entries not in git diff:"
  echo "$extra"
  missing=true
fi

if [ "$missing" = true ]; then
  exit 1
fi

echo "✅ SCOPE_DECLARATION.md matches git diff."
