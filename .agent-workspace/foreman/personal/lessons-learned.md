# Foreman Personal Lessons Learned

This file accumulates lessons from all sessions for pattern recognition and continuous improvement.

## Session Template

### Session YYYYMMDD

#### Lesson: [Title]
- Context: [when this applies]
- Pattern: [what to watch for]
- Action: [what to do]

---

## Active Lessons

### Session 20260212

#### Lesson: Wake-Up Protocol Provides Essential Context
- Context: Starting any new task or session
- Pattern: Without wake-up, agent lacks governance state, memory context, and environment health
- Action: Always run `.github/scripts/wake-up-protocol.sh [agent_id]` before starting work

#### Lesson: Evidence-First Design Simplifies Gate Logic
- Context: Designing gates or validation workflows
- Pattern: Checking for evidence artifacts before script execution eliminates redundant work and complexity
- Action: Always check for PREHANDOVER_PROOF and evidence bundle first; only run validation scripts if evidence missing

#### Lesson: Deterministic Classification Avoids Edge Cases
- Context: Designing PR classification or agent role detection
- Pattern: Inference-based classification leads to misapplication and edge cases
- Action: Use rule-based classification with clear precedence (label override → branch pattern → file paths)

#### Lesson: Modular Scripts Enable Reuse
- Context: Creating infrastructure or automation
- Pattern: Monolithic scripts become unmaintainable; separate concerns enable composition
- Action: Separate wake-up, closure, and task-specific scripts; use clear interfaces

#### Lesson: Documentation Upfront Clarifies Requirements
- Context: Complex implementations with migration or transition
- Pattern: Creating comprehensive documentation early helps identify edge cases and requirements gaps
- Action: Write migration guide or README before/during implementation, not after
