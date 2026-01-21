# Evidence-Based CI Gate Validation Onboarding

**Repository**: R_Roster  
**Authority**: governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md (BL-027/028)  
**Version**: 1.0.0  
**Date**: 2026-01-19  
**Audience**: All agents performing governance work

---

## What is Evidence-Based Validation?

Evidence-based validation (BL-027/028) is an alternative CI gate validation method for agent PRs that modify governance, policies, documentation, or agent contracts—work that cannot be validated by traditional script execution.

### Traditional vs Evidence-Based

| **Traditional Validation** | **Evidence-Based Validation** |
|---------------------------|------------------------------|
| Execute validation scripts | Document validation in PREHANDOVER_PROOF |
| Scripts must exit 0 | Agent attests validation complete |
| CI runs scripts | CI checks attestation documents |
| Use for: Application code | Use for: Governance work |

---

## When to Use Evidence-Based Validation

### ✅ Use Evidence-Based When:

- Modifying governance policies or canon documents
- Updating agent contracts in `.github/agents/`
- Changing documentation (README, templates, onboarding)
- Updating non-executable templates
- Modifying workflow configurations (governance changes only)

### ❌ Do NOT Use Evidence-Based When:

- Building application features
- Writing executable code (Python, JS, etc.)
- Creating or modifying test suites
- Changing build scripts or CI logic
- Making any changes with automated tests

**Rule of Thumb**: If you CAN validate with scripts, you MUST use scripts. Evidence-based is for when scripts are insufficient or impossible.

---

## How to Use Evidence-Based Validation

### Step 1: Complete Your Work

Perform your governance work as normal:
- Update policies, canon documents, or agent contracts
- Make changes following constitutional requirements
- Document all changes with clear rationale

### Step 2: Create SCOPE_DECLARATION.md

Use the template at `governance/templates/SCOPE_DECLARATION_TEMPLATE.md`:

```bash
cp governance/templates/SCOPE_DECLARATION_TEMPLATE.md SCOPE_DECLARATION.md
```

Fill out ALL sections:
- **Agent and Date**: Your identity and timestamp
- **Changed Files**: List EVERY file changed (match git diff exactly)
- **Scope Summary**: Count files by category
- **Justification**: Explain WHY evidence-based validation is appropriate
- **Scope Comparison**: Run git diff and verify it matches your documentation
- **Attestations**: Check all boxes and sign

**Critical**: The git diff must EXACTLY match your documented files. CI will verify this.

### Step 3: Create PREHANDOVER_PROOF

Use the template at `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`:

```bash
cp governance/templates/PREHANDOVER_PROOF_TEMPLATE.md PREHANDOVER_PROOF_$(date -u +"%Y-%m-%dT%H-%M-%SZ").md
```

Fill out ALL sections:
- **Section 0**: Four governance artifacts (if milestone completion)
- **Validation Evidence**: Document what you validated and how
- **Section 9**: CST validation attestation (if milestone completion)
- **Attestation**: Sign and date

Include evidence of validation:
- Manual review notes
- Cross-reference checks with canonical governance
- Governance scan results
- Any other validation performed

### Step 4: Commit Both Documents

```bash
git add SCOPE_DECLARATION.md PREHANDOVER_PROOF_*.md
git add [your other changed files]
git commit -m "Your commit message"
git push
```

### Step 5: Submit PR

When you create the PR, CI will automatically:
1. Detect presence of SCOPE_DECLARATION.md and PREHANDOVER_PROOF
2. Switch to evidence-based validation path
3. Validate document structure and completeness
4. Check scope comparison (git diff vs documented)
5. Verify attestations are present and signed
6. Accept as PASSED if all checks pass

---

## What CI Validates

CI will check:

### ✅ Document Presence
- SCOPE_DECLARATION.md exists
- PREHANDOVER_PROOF_*.md exists (with timestamp)

### ✅ Document Structure
- All required sections present in both documents
- No incomplete template placeholders ([brackets] that weren't filled)
- Attestation statements present ("I attest...")
- Agent signatures present

### ✅ Scope Accuracy
- Git diff file count matches documented file count (within 20% tolerance)
- All changed files appear documented
- Justification for evidence-based validation is substantive

### ✅ Quality Signals
- Recent timestamp (within 24 hours)
- Validation method justification has meaningful content
- Attestation checkboxes all marked

### ❌ What CI Does NOT Validate

CI does NOT check:
- Whether your governance changes are correct
- Whether your validation was thorough
- Whether evidence-based validation was truly appropriate
- Exact file-by-file scope match (human reviewer does this)

**Human reviewers** must verify:
- Scope completeness and accuracy
- Quality of validation evidence
- Appropriateness of evidence-based method
- Constitutional compliance

---

## Common Mistakes

### ❌ Mistake 1: Using Evidence-Based for Code Changes

**Wrong**: Using evidence-based validation for Python/JS changes

**Right**: Use traditional script validation for any executable code

**Fix**: Remove SCOPE_DECLARATION.md and run validation scripts instead

### ❌ Mistake 2: Incomplete SCOPE_DECLARATION

**Wrong**: Leaving template placeholders like `[agent-name]` or `[FILE]`

**Right**: Fill out ALL placeholders with actual values

**Fix**: Search for `[` in your SCOPE_DECLARATION and replace all placeholders

### ❌ Mistake 3: Git Diff Mismatch

**Wrong**: Documenting 5 files when you actually changed 8

**Right**: Run `git diff --name-only` and document EXACTLY what changed

**Fix**: Update "Changed Files" section to match git diff output exactly

### ❌ Mistake 4: Missing Attestations

**Wrong**: Skipping the attestation checkboxes or signature

**Right**: Check ALL boxes and sign with your agent name

**Fix**: Go to "Scope Attestation" and "Agent Signature" sections and complete

### ❌ Mistake 5: Weak Justification

**Wrong**: "Using evidence-based because governance change"

**Right**: "Using evidence-based because these policy changes have no automated tests. Manual review confirms constitutional alignment, governance canon consistency, and ripple completeness. PREHANDOVER_PROOF documents governance scan results and cross-reference validation."

**Fix**: Write 3-5 sentences explaining specifically WHY scripts can't validate this

---

## Troubleshooting

### CI Says "SCOPE_DECLARATION.md: MISSING"

**Problem**: File not found or not committed

**Solution**: 
```bash
ls -la SCOPE_DECLARATION.md  # Verify file exists
git add SCOPE_DECLARATION.md  # If not added
git commit --amend --no-edit  # Add to commit
git push --force  # Update PR
```

### CI Says "Structure: INCOMPLETE"

**Problem**: Missing required sections in documents

**Solution**: 
- Open SCOPE_DECLARATION.md
- Search for each required section (see validation script output)
- Add missing sections from template
- Commit and push

### CI Says "CONTAINS PLACEHOLDERS"

**Problem**: Template placeholders not replaced

**Solution**:
```bash
grep '\[.*\]' SCOPE_DECLARATION.md  # Find placeholders
# Edit file to replace [brackets] with actual values
git add SCOPE_DECLARATION.md
git commit --amend --no-edit
git push --force
```

### CI Says "SIGNIFICANT DISCREPANCY"

**Problem**: Git diff shows different file count than documented

**Solution**:
```bash
git diff --name-only origin/main...HEAD  # See actual changed files
# Update "Changed Files" section to match
git add SCOPE_DECLARATION.md
git commit --amend --no-edit
git push --force
```

### CI Says "Missing attestation statement"

**Problem**: "I attest" text not found in SCOPE_DECLARATION

**Solution**:
- Go to "Scope Attestation" section
- Ensure all "I attest that:" items are present
- Add signature at "Agent Signature" section
- Commit and push

---

## Examples

### Good Example: Governance Policy Update

**Scenario**: Adding a new governance policy document

**SCOPE_DECLARATION.md excerpt**:
```markdown
## Changed Files

### Governance Files
- `governance/policies/NEW_POLICY.md` - New policy for X
- `governance/alignment/ALIGNMENT.md` - Added reference to new policy

## Validation Method Justification

**Why Evidence-Based Validation is Appropriate**:

This PR adds a new governance policy document. There are no automated tests
for policy documents because they are text-based governance rules, not 
executable code. Evidence-based validation is appropriate because:

1. Policy content cannot be validated by scripts
2. Constitutional compliance requires human judgment
3. Alignment with canonical governance must be manually verified
4. PREHANDOVER_PROOF documents governance scan and cross-reference checks

**What Evidence Replaces Scripts**:

PREHANDOVER_PROOF provides:
- Governance scan confirming constitutional alignment
- Cross-reference check with maturion-foreman-governance canon
- Ripple analysis showing all affected files updated
- Manual review confirmation of policy completeness
```

**Result**: ✅ CI accepts evidence-based validation, human reviewer approves

### Bad Example: Code Change with Evidence

**Scenario**: Adding Python script but using evidence-based validation

**Problem**: Using evidence-based for executable code

**SCOPE_DECLARATION.md** would say:
```markdown
## Changed Files

### Scripts
- `.github/scripts/new-script.py` - New validation script
```

**Result**: ❌ Inappropriate use of evidence-based validation

**Fix**: Remove SCOPE_DECLARATION.md, run validation scripts instead:
```bash
rm SCOPE_DECLARATION.md PREHANDOVER_PROOF_*.md
python .github/scripts/new-script.py  # Test it works
pytest tests/  # Run tests
# Create traditional PREHANDOVER_PROOF with script execution evidence
```

---

## Quick Reference Card

### When to Use Evidence-Based

```
✅ governance/policies/*.md
✅ governance/canon/*.md  
✅ .github/agents/*.md
✅ governance/templates/*.md
✅ README.md (governance sections)
✅ docs/*.md

❌ *.py, *.js, *.ts (code)
❌ .github/workflows/*.yml (if adding executable logic)
❌ Tests or build scripts
❌ Application features
```

### Required Files

```
SCOPE_DECLARATION.md                   ← Use template
PREHANDOVER_PROOF_2026-01-19T...md    ← Use template with timestamp
[All your changed files]               ← Your actual work
```

### Checklist Before Push

```
□ SCOPE_DECLARATION.md created from template
□ All [placeholders] replaced with actual values
□ "Changed Files" section lists EVERY changed file
□ Git diff matches documented files exactly
□ Justification is 3+ sentences and specific
□ All attestation checkboxes checked
□ Agent signature present with timestamp
□ PREHANDOVER_PROOF created from template
□ PREHANDOVER_PROOF includes validation evidence
□ PREHANDOVER_PROOF includes attestation section
□ Both files committed and pushed
```

---

## Questions?

**Q: Can I use evidence-based for workflow YAML changes?**  
A: Only if the changes are governance configuration (gate settings, policy enforcement). If adding executable logic or scripts, use traditional validation.

**Q: What if I have BOTH governance and code changes?**  
A: Split into two PRs. Use evidence-based for governance PR, traditional for code PR.

**Q: Can I skip parts of SCOPE_DECLARATION?**  
A: No. All sections are required. If a section doesn't apply (e.g., no workflow changes), write "None" but keep the section.

**Q: How detailed should validation evidence be?**  
A: Enough for a human reviewer to understand what you validated and how. List checks performed, not just "validated everything."

**Q: What if CI keeps failing on scope comparison?**  
A: Run `git diff --name-only origin/main...HEAD` and ensure your "Changed Files" section matches EXACTLY. Include every file, even minor ones.

---

## Policy Reference

**Full Policy**: `governance/policies/EVIDENCE_BASED_CI_GATE_VALIDATION.md`

**Templates**:
- `governance/templates/SCOPE_DECLARATION_TEMPLATE.md`
- `governance/templates/PREHANDOVER_PROOF_TEMPLATE.md`

**Canonical Source**: APGI-cmy/maturion-foreman-governance#981 (BL-027/028)

---

**Authority**: Constitutional - BL-027/028 from maturion-foreman-governance  
**Questions**: Escalate to Governance Liaison or ForemanApp  
**Override**: Johan Ras only (constitutional matters)
