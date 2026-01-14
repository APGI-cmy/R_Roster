# Pre-Implementation Behavior Review Onboarding

**Repository**: R_Roster  
**Purpose**: Builder & Reviewer training for Pre-Implementation Behavior Review Protocol  
**Authority**: PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md (R_Roster governance/canon/)  
**Status**: MANDATORY for all builders working on enhancements  
**Version**: 1.0.0  
**Date**: 2026-01-14

---

## Quick Start (10 Minutes)

### What is Pre-Implementation Behavior Review?

A **mandatory 4-step review process** completed **BEFORE** implementing enhancements or optimizations to prevent:
- Regression bugs from inadequate baseline understanding
- Suboptimal designs from lack of alternatives analysis
- Unexpected failures from inadequate risk assessment
- Unclear success measures leading to scope creep

**Key Principle**: Think deeply BEFORE coding, not after.

---

## When Do I Need This?

### ✅ REQUIRED for Enhancement/Optimization PRs

You **MUST** complete pre-implementation review for:

- **New Features**: Adding capabilities that didn't exist before
- **Optimizations**: Improving performance, efficiency, or user experience
- **Behavior Changes**: Modifying how existing features work
- **Algorithm Improvements**: Changing core logic or computational approaches
- **Significant Refactoring**: Restructuring code with behavior implications

**Examples**:
- "Add teacher availability filter" → **REQUIRES REVIEW**
- "Optimize roster generation algorithm" → **REQUIRES REVIEW**  
- "Improve absence tracking workflow" → **REQUIRES REVIEW**
- "Refactor scheduler for better performance" → **REQUIRES REVIEW**

### ❌ NOT REQUIRED for Non-Enhancement Work

Review is **NOT needed** for:

- **Bug Fixes**: Restoring intended behavior (no enhancement)
- **Governance Changes**: Policy/documentation updates
- **Infrastructure**: Build/CI tooling without app behavior changes
- **Documentation Only**: README, comments, guides

**Examples**:
- "Fix off-by-one error in date calculation" → **NO REVIEW NEEDED**
- "Update README with setup instructions" → **NO REVIEW NEEDED**
- "Add governance policy document" → **NO REVIEW NEEDED**

### 🤔 Uncertain?

**If you're not sure**: 
1. **STOP** - Do not proceed with implementation
2. **ASK** ForemanApp or Governance Liaison for classification
3. **WAIT** for confirmation before starting work

**Default**: If enhancement-like, assume review is required.

---

## The 4-Step Review Process (Detailed)

### Step 1: Baseline Behavior Capture

**Purpose**: Document current system state comprehensively before making changes.

**What to Capture**:
1. **Current Behavior**: How does the system work today? Be specific.
2. **Performance Metrics**: Response times, resource usage, throughput
3. **User Interactions**: Workflows, UI flows, data inputs/outputs
4. **Edge Cases**: Boundary conditions, error handling, unusual scenarios
5. **Known Issues**: Existing bugs or limitations in current behavior

**Evidence to Include**:
- Screenshots/videos of current UI/behavior
- Logs showing current system responses
- Performance metrics (timing, memory, CPU)
- Test outputs demonstrating current behavior
- User feedback or pain points

**Example (Teacher Availability Filter)**:
```markdown
## Step 1: Baseline Behavior Capture

### Current Behavior
- Roster view shows all teachers regardless of availability
- No filtering mechanism exists
- Users manually scan list to find available teachers
- Average time to identify available teacher: 45 seconds (user study)

### Performance Metrics
- Roster load time: 320ms (avg)
- Teachers displayed: 150 (full list)
- No pagination, single-page render

### Edge Cases
- What happens with 500+ teachers? (Not tested, theoretical limit)
- Partially available teachers (sick leave, part-time) show same as fully available
- No indication of availability conflicts

### Known Issues
- Users report difficulty finding available teachers quickly
- No visual distinction between available/unavailable
- Performance degrades with large teacher lists (>200)

### Evidence
- Attached: screenshots of current roster view
- Attached: performance profile showing 320ms average load
- Attached: user feedback logs (3 complaints last month)
```

**Time Required**: 1-2 hours (thorough baseline documentation)

---

### Step 2: Design Alternatives Analysis

**Purpose**: Consider multiple approaches to ensure optimal design choice.

**Requirements**:
1. Identify **at least 2-3 alternative designs** (including your preferred approach)
2. Evaluate trade-offs for each alternative
3. Document why alternatives were rejected
4. Show you've considered edge cases

**Evaluation Criteria**:
- **Complexity**: Implementation difficulty, maintenance burden
- **Performance**: Speed, resource usage, scalability
- **User Experience**: Usability, intuitiveness, workflow impact
- **Risk**: Regression potential, failure modes, rollback difficulty
- **Extensibility**: Future enhancement support

**Example (Teacher Availability Filter)**:
```markdown
## Step 2: Design Alternatives Analysis

### Alternative 1: Client-Side Filtering (Preferred)
**Approach**: Add filter dropdown in UI, filter teachers list in browser

**Pros**:
- Fast filtering (no server round-trip)
- Simple implementation
- No backend changes needed
- Works with existing data structure

**Cons**:
- Must load full teacher list first (320ms)
- Inefficient for very large datasets (>500 teachers)
- Filter state not persisted across sessions

**Trade-offs**: Simplicity vs scalability. Acceptable for current 150 teachers.

### Alternative 2: Server-Side Filtering with API
**Approach**: Add availability query parameter to API, filter on backend

**Pros**:
- Scalable to any dataset size
- Faster for large lists (only load filtered data)
- Can persist filter preferences server-side
- Better data efficiency (less bandwidth)

**Cons**:
- Requires backend API changes
- More complex implementation (front + back)
- Additional database query optimization needed
- Higher testing burden (integration tests)

**Trade-offs**: Scalability vs complexity. Overengineered for current needs.

### Alternative 3: Hybrid Approach
**Approach**: Client-side for <200 teachers, switch to server-side above threshold

**Pros**:
- Best performance at all scales
- Graceful degradation

**Cons**:
- Most complex implementation
- Two code paths to maintain
- Difficult to test threshold behavior
- Premature optimization

**Trade-offs**: Flexibility vs maintainability. Too complex for v1.

### Recommendation: Alternative 1 (Client-Side)
**Rationale**: Current dataset size (150 teachers) makes client-side filtering optimal balance of simplicity and performance. Can migrate to server-side in future if teacher count exceeds 300 (monitored via telemetry).

**Edge Case Handling**:
- If list grows >300 teachers: Add telemetry alert, trigger migration to Alternative 2
- Partial availability: Use structured availability data (already in schema)
- Filter persistence: Use localStorage (fallback to no filter on clear)
```

**Time Required**: 2-3 hours (research, design, evaluation)

---

### Step 3: Risk Assessment Matrix

**Purpose**: Identify and mitigate risks before they become problems.

**What to Assess**:
1. **Regression Risks**: Could this break existing functionality?
2. **Performance Risks**: Could this degrade system performance?
3. **Edge Case Risks**: What unusual scenarios could fail?
4. **Integration Risks**: Could this affect other system components?
5. **User Experience Risks**: Could this confuse or frustrate users?

**Risk Matrix Template**:

| Risk | Probability | Impact | Severity | Mitigation | Rollback Plan |
|------|-------------|--------|----------|------------|---------------|
| [Risk description] | Low/Med/High | Low/Med/High | [P×I] | [How to prevent] | [How to undo] |

**Example (Teacher Availability Filter)**:
```markdown
## Step 3: Risk Assessment Matrix

| Risk | Probability | Impact | Severity | Mitigation | Rollback Plan |
|------|-------------|--------|----------|------------|---------------|
| Filter hides teachers incorrectly due to data structure mismatch | Medium | High | HIGH | Comprehensive unit tests for all availability states; manual QA verification with real data | Feature flag to disable filter; reverts to unfiltered view |
| Performance degrades with large lists (>300 teachers) | Low | Medium | MEDIUM | Add performance telemetry; alert if load time >500ms; document migration path to server-side | Feature flag disable; optimize query if needed |
| Filter state confuses users (unclear what's filtered) | Medium | Low | MEDIUM | Add clear filter indicator in UI; "Clear filter" button visible; tooltip explaining filter | Quick UI patch to add clarity; collect user feedback |
| Browser compatibility issues (older browsers) | Low | Medium | MEDIUM | Test on IE11, Safari 12+, Chrome 90+; polyfills for Array methods | Graceful degradation: show all teachers if filter fails |
| Filter breaks mobile responsive layout | Low | High | MEDIUM | Responsive design review; mobile device testing; touch-friendly controls | CSS fix or hide filter on mobile (show all) |

### High-Severity Risks (Require Extra Attention)
1. **Filter hides teachers incorrectly**: MUST have 100% test coverage for availability logic
2. **Mobile layout breaks**: MUST test on iOS/Android before merge

### Rollback Strategy
**Immediate**: Feature flag `ENABLE_TEACHER_FILTER` set to false (env var)  
**Fallback**: Revert commit if flag mechanism fails  
**Recovery Time**: <5 minutes (toggle flag in config)

### Monitoring Plan
- Add telemetry: filter usage rate, load time impact, error rate
- Alert if load time >500ms or error rate >1%
- Weekly review for first 2 weeks post-deployment
```

**Time Required**: 1-2 hours (risk identification, mitigation planning)

---

### Step 4: Success Criteria Definition

**Purpose**: Define clear, measurable outcomes to validate enhancement success.

**Requirements**:
1. **Measurable Criteria**: Quantifiable metrics, not vague goals
2. **Acceptance Tests**: Specific tests that prove success
3. **Performance Thresholds**: If applicable, define acceptable performance
4. **User Experience Validation**: How will users benefit (measurably)?

**Example (Teacher Availability Filter)**:
```markdown
## Step 4: Success Criteria Definition

### Primary Success Criteria (MUST achieve all)

1. **Functional Correctness**
   - Filter accurately shows only available teachers (0 false positives/negatives)
   - All availability states handled: available, partially available, unavailable, unknown
   - Filter persists across page refreshes (localStorage)
   - "Clear filter" button restores full list
   - **Validation**: Unit tests + manual QA on production data

2. **Performance**
   - Filter operation completes in <50ms (p95)
   - Initial roster load time remains <350ms (current: 320ms, +30ms budget)
   - No memory leaks (tested with 1000+ filter toggles)
   - **Validation**: Performance profiling, automated timing tests

3. **User Experience**
   - Filter reduces time-to-find-available-teacher from 45s to <10s (user study)
   - Filter control intuitive (no user confusion in first week)
   - Mobile-friendly (touch targets 44px+, responsive layout)
   - **Validation**: User timing study (5 users, before/after), feedback collection

4. **Browser Compatibility**
   - Works in Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
   - Graceful degradation in IE11 (shows all teachers, no filter)
   - **Validation**: Manual testing on all browsers

### Secondary Success Criteria (Nice-to-have)

1. **Adoption**: >50% of users use filter within first week
2. **Error Rate**: <0.1% filter errors in telemetry
3. **Support**: Zero support tickets related to filter confusion

### Acceptance Tests

#### Test 1: Filter Accuracy
```javascript
describe('Teacher Availability Filter', () => {
  it('shows only available teachers when filter applied', () => {
    // Given: 10 teachers (6 available, 4 unavailable)
    // When: Filter set to "Available only"
    // Then: Exactly 6 teachers displayed
  });
});
```

#### Test 2: Performance
```javascript
it('filters within 50ms for 200 teachers', () => {
  // Given: 200 teachers loaded
  // When: Toggle filter 100 times
  // Then: Each filter operation < 50ms (p95)
});
```

#### Test 3: Persistence
```javascript
it('restores filter state on page refresh', () => {
  // Given: Filter set to "Available only"
  // When: Page refreshed
  // Then: Filter still set to "Available only", list filtered
});
```

### Failure Definition (When to rollback)

**MUST rollback if**:
- False positives/negatives detected (shows wrong teachers)
- Load time degrades >500ms
- Mobile layout breaks (unusable)
- Critical browser compatibility failure (Chrome/Safari)

**MAY rollback if**:
- User confusion >20% (feedback indicating unclear UX)
- Adoption <20% after 2 weeks (feature not useful)
- Error rate >1% (persistent issues)

### Post-Deployment Validation Plan

**Week 1**:
- Daily telemetry review (usage, timing, errors)
- User feedback monitoring
- Performance dashboard checks

**Week 2-4**:
- Weekly review
- Assess success criteria achievement
- Document learnings for future enhancements
```

**Time Required**: 1-2 hours (criteria definition, test planning)

---

## Creating Your Review Report

### Step-by-Step Guide

#### 1. Get the Template

**Option A**: Copy from canonical source
```bash
# Download template from governance repository
curl -o pre_implementation_review.md \
  https://raw.githubusercontent.com/APGI-cmy/maturion-foreman-governance/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md
```

**Option B**: Create from outline (see template structure above)

#### 2. Name Your File

**Convention**: `pre_implementation_review_[description].md`

**Examples**:
- `pre_implementation_review_teacher_filter.md`
- `pre_implementation_review_roster_optimization.md`
- `pre_implementation_review_absence_workflow.md`

**Location**: Place in repository root or `docs/pre-implementation-reviews/`

#### 3. Complete All 4 Steps

Fill in each step with detail:
- ✅ Step 1: Baseline (with evidence)
- ✅ Step 2: Alternatives (minimum 2-3)
- ✅ Step 3: Risk Matrix (comprehensive)
- ✅ Step 4: Success Criteria (measurable)

**Quality Check**:
- [ ] All sections complete (no placeholders)
- [ ] Evidence provided (screenshots, metrics, logs)
- [ ] Alternatives compared with trade-offs
- [ ] Risks have mitigation plans
- [ ] Success criteria are measurable

#### 4. Include in PR

Add review report to your enhancement PR:
- Commit report file along with implementation
- Reference report in PR description
- Link to specific sections in checklist

**PR Description Template**:
```markdown
## Enhancement: [Brief Description]

**Pre-Implementation Behavior Review**: See `pre_implementation_review_[name].md`

### Review Summary
- ✅ Step 1: Baseline captured (see Section 2)
- ✅ Step 2: 3 alternatives analyzed (see Section 3)
- ✅ Step 3: 5 risks identified with mitigations (see Section 4)
- ✅ Step 4: Success criteria defined (see Section 5)

[Rest of PR description...]
```

---

## Common Mistakes to Avoid

### ❌ Mistake 1: "I'll do the review after coding"

**Why Bad**: Review is meant to inform design decisions BEFORE implementation. Doing it after is just documentation, not decision-making.

**Fix**: Complete review BEFORE writing any implementation code. Use review to guide implementation.

---

### ❌ Mistake 2: "My design is obviously best, no need for alternatives"

**Why Bad**: Premature optimization and tunnel vision. Alternative analysis often reveals better approaches.

**Fix**: Force yourself to document at least 2 alternatives, even if you're confident. The exercise is valuable.

---

### ❌ Mistake 3: "I don't have time for 4 steps"

**Why Bad**: Skipping review leads to rework, bugs, and delays later (costing more time).

**Fix**: Review typically takes 4-8 hours total. Compare to days/weeks of rework from poor design.

---

### ❌ Mistake 4: "Partial review is good enough"

**Why Bad**: Incomplete risk assessment or success criteria leads to surprises post-deployment.

**Fix**: Complete ALL 4 steps thoroughly. Partial review won't pass FM verification.

---

### ❌ Mistake 5: "This enhancement is too small for review"

**Why Bad**: Even small changes can have unexpected impacts. Classification is not builder's decision.

**Fix**: If uncertain, ask FM for classification. Don't self-exempt.

---

## FM Verification Process (What to Expect)

When you submit your enhancement PR, FM will verify:

### ✅ Classification Check
- [ ] PR is correctly classified as enhancement/optimization
- [ ] Review requirement is appropriate for change type

### ✅ Review Presence
- [ ] Pre-implementation review report file exists in PR
- [ ] File follows naming convention
- [ ] Report is committed (not just mentioned)

### ✅ Completeness Check
- [ ] All 4 steps present and complete
- [ ] No placeholders or "TODO" sections
- [ ] Evidence provided (screenshots, metrics, etc.)
- [ ] Alternatives analysis includes at least 2 options
- [ ] Risk matrix comprehensive with mitigations
- [ ] Success criteria measurable and testable

### ✅ Quality Check
- [ ] Baseline adequately documents current state
- [ ] Alternatives show genuine consideration of trade-offs
- [ ] Risks are realistic and mitigations practical
- [ ] Success criteria align with enhancement goals

### Possible Outcomes

**✅ APPROVED**: Review complete, PR proceeds to technical review

**🔄 CHANGES REQUESTED**: Review incomplete or inadequate, specific sections need work

**❌ REJECTED**: Review missing or fundamentally inadequate, must restart

---

## Exemption Requests (Rare)

### When to Request Exemption

Exemptions are **RARE** and only for:
1. **Emergency Hotfixes**: Time-critical fixes with zero regression risk
2. **Trivial Enhancements**: Extremely simple changes (FM judgment)
3. **Governance-Authorized**: Explicit approval from Johan

### How to Request Exemption

1. **DO NOT self-exempt**: You cannot skip review on your own authority
2. **Request from FM**: Explain why review is not needed
3. **Provide Justification**: Why is this case special?
4. **Wait for Approval**: Do not proceed until FM grants exemption

**Template**:
```markdown
## Exemption Request: Pre-Implementation Review

**Enhancement**: [Brief description]

**Reason for Exemption**: [Explain why review not needed]
- [ ] Emergency hotfix (time-critical)
- [ ] Trivial change (minimal risk)
- [ ] Other: [explain]

**Risk Assessment**: [Why is this safe to skip review?]

**FM Approval Required**: @ForemanApp
```

**Default**: Assume NO exemption unless FM explicitly grants it.

---

## FAQ

### Q: How long does the review process take?
**A**: Typically 4-8 hours total across all 4 steps. Plan accordingly when estimating enhancement work.

### Q: Can I reuse a review for similar enhancements?
**A**: No. Each enhancement requires its own review. Similar enhancements may have different contexts, risks, and success criteria.

### Q: What if I discover new risks during implementation?
**A**: Update your review report with new risks and mitigations. Commit updated report with implementation.

### Q: Do I need review for enhancements to test/build code?
**A**: No. Review is only for application behavior enhancements. Test/build infrastructure changes don't require review (unless they affect application behavior).

### Q: Can FM waive incomplete sections?
**A**: No. All 4 steps are mandatory per governance. FM cannot waive constitutional requirements.

### Q: What if FM and I disagree on classification?
**A**: Escalate to Governance Liaison for binding classification decision. Do not proceed until resolved.

### Q: Is review required during grace period?
**A**: Yes, but enforcement is educational. FM will provide feedback rather than hard rejection during grace period (through 2026-02-14).

---

## Training Attestation

**Builder Certification**:

I, [Builder Name], certify that I have:
- [ ] Read this onboarding guide completely
- [ ] Reviewed canonical protocol documentation
- [ ] Understand the 4-step review process
- [ ] Know when review is required vs optional
- [ ] Understand FM verification expectations
- [ ] Know how to request exemptions (rarely)
- [ ] Understand non-compliance consequences

**Date**: [YYYY-MM-DD]  
**Signature**: [Builder Name]

---

## References

**Canonical Documents**:
- [PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_PROTOCOL.md)
- [PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/templates/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_REPORT.template.md)
- [builder.v1.md](https://github.com/APGI-cmy/maturion-foreman-governance/blob/main/governance/profiles/builder.v1.md)

**Local Documents**:
- governance/canon/PRE_IMPLEMENTATION_BEHAVIOR_REVIEW_ENFORCEMENT.md
- governance/templates/pr-checklists/BUILDER_PR_CHECKLIST.md
- governance/templates/pr-checklists/FM_ORCHESTRATION_PR_CHECKLIST.md

**Get Help**:
- Classification questions: Ask ForemanApp or Governance Liaison
- Technical questions: Ask CodexAdvisor
- Constitutional questions: Escalate to Johan Ras

---

## Version History

- **v1.0.0** (2026-01-14): Initial onboarding guide for R_Roster repository

---

**Document Authority**: Governance Liaison  
**Maintained By**: Governance Liaison  
**Next Review**: 2026-04-14 (quarterly)
