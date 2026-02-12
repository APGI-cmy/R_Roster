# Agent File Size Guidelines

**Version**: 1.0
**Date**: 2026-02-12
**Authority**: CodexAdvisor (Living Agent System v6.2.0)
**Context**: Resolution of Issue - Agent config exceeding max prompt length

---

## Problem Background

GitHub Copilot enforces a **30,000 character maximum** for agent configuration files (`.github/agents/*.md`). Agents exceeding this limit will:
- ❌ Appear in the custom agents list but will **NOT be selectable**
- ❌ Show error: "Invalid config: 'prompt' exceeds max length of 30000"
- ❌ Block all assignment, governance, and agent operation workflows

This is a **HARD LIMIT** enforced by the GitHub Copilot platform, not a soft guideline.

---

## Size Limit Requirements

### Hard Limits
- **Maximum size**: 30,000 characters
- **Recommended target**: 25,000 characters (allows 5,000 char buffer for future additions)
- **Critical threshold**: 28,000 characters (triggers review for size reduction)

### Size Categories
- **✅ Optimal**: < 25,000 characters (safe margin)
- **⚠️ Acceptable**: 25,000-28,000 characters (monitor closely)
- **🔴 Critical**: 28,000-30,000 characters (requires immediate attention)
- **❌ Invalid**: > 30,000 characters (NOT selectable, must fix immediately)

---

## Best Practices for Agent File Structure

### 1. Use References Instead of Duplication

**❌ BAD** (duplicates content):
```markdown
## Section 1
[500 lines of detailed content]

## Complete Example
[Repeats all 500 lines from Section 1 in example format]
```

**✅ GOOD** (references existing content):
```markdown
## Section 1
[500 lines of detailed content]

## Complete Example
For complete examples, see existing agent contracts:
- `.github/agents/ui-builder.md`
- `.github/agents/api-builder.md`
```

### 2. Condense Examples

**❌ BAD** (full example for each section):
```markdown
### Required Field: builder_id

**Description**: Unique identifier

**Example**:
---
builder_id: ui-builder
builder_type: specialized
version: 2.0.0
[... 30 more lines ...]
---
```

**✅ GOOD** (minimal example):
```markdown
### Required Field: builder_id

**Description**: Unique identifier
**Example**: `builder_id: ui-builder`
```

### 3. Remove Redundant Explanations

**❌ BAD** (repeats same concept):
```markdown
Field X is required.
Field X must be present.
If Field X is missing, validation fails.
Without Field X, the agent cannot be recruited.
```

**✅ GOOD** (states once clearly):
```markdown
Field X is required. Validation fails if missing.
```

### 4. Use Compact Formatting

**❌ BAD** (verbose bullet points):
```markdown
**Validation Requirements**:
- Requirement 1: The field must be present
- Requirement 2: The field must not be empty
- Requirement 3: The field must match the pattern
```

**✅ GOOD** (compact list):
```markdown
**Validation**: Must be present, non-empty, match pattern
```

### 5. Extract Extensive Documentation

For schema documents (like BUILDER_CONTRACT_SCHEMA.md), consider:
- Keep core requirements in agent file
- Move extensive explanations to separate documentation
- Link to detailed docs from agent file

---

## Refactoring Strategies

### When an Agent File Exceeds 28,000 Characters:

1. **Remove duplicate content**
   - Search for repeated sections
   - Replace full examples with references
   - Consolidate validation rules

2. **Condense verbose sections**
   - Remove redundant explanations
   - Use bullet points instead of paragraphs
   - Combine related requirements

3. **Extract to external documentation**
   - Move detailed explanations to separate docs
   - Keep only essential specifications in agent file
   - Add links to full documentation

4. **Review example sections**
   - Replace full examples with minimal syntax examples
   - Reference existing working agents instead of duplicating
   - Keep only unique or critical examples

---

## Monitoring and Enforcement

### Regular Audits
Run this command to check all agent file sizes:
```bash
for file in .github/agents/*.md; do 
  chars=$(wc -c < "$file")
  if [ $chars -gt 28000 ]; then 
    echo "🔴 CRITICAL: $chars chars - $file"
  elif [ $chars -gt 25000 ]; then 
    echo "⚠️  WARNING: $chars chars - $file"
  else 
    echo "✅ OK: $chars chars - $file"
  fi
done | sort -k3 -rn
```

### CI Validation
Consider adding a CI check that:
- Measures agent file sizes
- Fails PR if any file exceeds 30,000 characters
- Warns if any file exceeds 25,000 characters

### Pre-commit Hook
Add size validation to pre-commit checks:
```yaml
- repo: local
  hooks:
    - id: check-agent-size
      name: Check agent file size
      entry: scripts/check-agent-size.sh
      language: script
      files: ^\.github/agents/.*\.md$
```

---

## Case Study: BUILDER_CONTRACT_SCHEMA.md Refactoring

**Original size**: 41,299 characters (37.7% over limit)
**Refactored size**: 24,899 characters (16.7% under limit)
**Reduction**: 39.7% (16,400 characters removed)

### What Was Removed:
1. **Complete Example section** (250+ lines)
   - Replaced with minimal YAML structure + references to working examples
   - Saved ~8,000 characters

2. **Duplicate field definition** (builder_id listed twice)
   - Removed exact duplicate
   - Saved ~350 characters

3. **8 Full Doctrine Section Examples**
   - Removed code blocks with full example implementations
   - Kept only "Required Elements" bullet points
   - Saved ~8,000 characters

### What Was Preserved:
- ✅ All YAML field definitions
- ✅ All validation rules
- ✅ All required elements lists
- ✅ All structural requirements
- ✅ All mandatory section specifications
- ✅ Complete functionality and compliance

### Key Insight:
Documentation can be comprehensive without being verbose. Required elements can be specified without full implementation examples when working examples exist elsewhere.

---

## Reference Sizes (Post-Refactoring)

All active agent files are now compliant:
- ✅ ui-builder.md: 27,014 chars (90% of limit)
- ✅ BUILDER_CONTRACT_SCHEMA.md: 24,899 chars (83% of limit)
- ✅ governance-liaison-v2.agent.md: 23,605 chars (79% of limit)
- ✅ integration-builder.md: 22,832 chars (76% of limit)
- ✅ qa-builder.md: 22,788 chars (76% of limit)
- ✅ schema-builder.md: 22,634 chars (75% of limit)
- ✅ api-builder.md: 22,606 chars (75% of limit)
- ✅ foreman.md: 17,352 chars (58% of limit)
- ✅ CodexAdvisor-agent.md: 11,224 chars (37% of limit)

**Recommended reference**: Use `governance-liaison-v2.agent.md` (23,605 chars) as a structural reference for well-sized, compliant agent files.

---

## Escalation

If unable to reduce an agent file below 30,000 characters while maintaining required functionality:
1. Document why size reduction is not possible
2. Escalate to CS2 for guidance
3. Consider splitting into multiple specialized agents
4. Review if content belongs in agent file vs. separate documentation

---

**Authority**: Living Agent System v6.2.0
**Status**: ACTIVE GUIDANCE
**Next Review**: When GitHub Copilot platform limits change
