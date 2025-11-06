# Decision Log: n8n 6-Role Model with SoD Compliance

**Date:** 2025-11-06
**Status:** ✅ Implemented
**Author:** Claude Code (n8n-Agency Team)

---

## Executive Summary

Restructured n8n workflow automation agents from 5 roles to **6 roles** with **Separation of Duties (SoD)** compliance. This change provides enterprise-grade governance, clear audit trails, and minimizes corruption surface while maintaining operational efficiency.

**Key Changes:**
- 5 roles → 6 roles (Separation of Duties model)
- Merged: Backend Architect + Senior Workflow/AI → **Solution Architect**
- New: **Developer** role (pure implementation)
- New: **Runbook & Rollout Manager** role (operations)
- Enhanced: All roles with clear Allowed/Forbidden boundaries
- Documented: Standard handoff chain with quality gates

---

## Decision: Why 6 Roles?

### Problem Statement
The original 5-role model lacked clear separation between design and implementation, and between development and operations. This created:
- **Compliance risks:** No clear audit trail for changes
- **Dual authority:** Same role could design and implement
- **Operational gaps:** No dedicated operations ownership

### Solution: 3 Phases × 2 Roles = 6 Roles

| Phase | Roles | Purpose |
|-------|-------|---------|
| **Conception & Control** | Orchestrator + Solution Architect | Thinking & Planning |
| **Umsetzung (Build)** | Developer + Runbook Manager | Building & Operations |
| **Validierung & Dokumentation** | Tester + Reverse Prompt Developer | Validation & Training |

### Why This Works

**Separation of Duties (SoD) Benefits:**
1. ✅ **Minimal corruption surface** - No single role controls end-to-end
2. ✅ **Clear audit trails** - Every decision documented with handoffs
3. ✅ **No dual authority per phase** - Prevents single point of authority
4. ✅ **Compliance-ready** - Meets enterprise governance requirements

**Two roles per phase ensures:**
- No single person/agent can both design AND implement
- No single person/agent can both implement AND deploy
- Clear handoff points for accountability
- Quality gates at phase boundaries

---

## Role Changes

### 1. Merged: Solution Architect (NEW)

**Merged from:**
- n8n Backend Architect
- n8n Senior Workflow & AI Specialist

**Rationale:**
- Both roles were in "design" phase
- Both produced specifications (backend architecture + workflow design)
- Combining creates single "design authority" role
- Eliminates overlap and confusion

**Deliverables:**
- Workflow Design Spec
- Architecture Decision Records (ADRs)
- Data Architecture (schemas, APIs)
- AI Integration Specs
- Non-Functional Requirements

### 2. Created: Developer (NEW)

**Purpose:**
- Pure implementation role
- "Trusted executor" - no creative interpretation
- Implements exactly per Solution Architect's spec

**Rationale:**
- Separates design from implementation (SoD)
- Clear accountability for code quality
- No "design drift" during implementation
- Must escalate design questions back to Solution Architect

**Deliverables:**
- Implemented Workflow (V+1, inactive)
- Workflow Export JSON
- Implementation Notes
- Test-Ready Build

### 3. Created: Runbook & Rollout Manager (NEW)

**Purpose:**
- Operational lifecycle ownership
- Production deployment, monitoring, rollback
- Incident response and management

**Rationale:**
- Separates development from operations (SoD)
- Dedicated operations ownership (no "throw over the wall")
- Clear accountability for production health
- Professional incident response

**Deliverables:**
- Production Runbook
- Monitoring Dashboard
- Alerting Configuration
- Rollback Procedures
- Incident Reports

### 4. Enhanced: Orchestrator

**Changes:**
- Added explicit SoD enforcement rules
- Defined quality gates (Gate 1-5)
- Clear Go/No-Go decision authority
- Documented handoff chain

**New Responsibilities:**
- Enforce role boundaries (no dual authority)
- Manage quality gates
- Authorize activations and rollbacks

### 5. Enhanced: Tester

**Changes:**
- Added handoff documentation
- Clear escalation paths
- Quality gate results format

**Maintained:**
- Evidence-based testing approach
- Complete evidence bundles
- No changes to testing methodology

### 6. Enhanced: Reverse Prompt Developer

**Changes:**
- Added handoff documentation
- Clarified parallel role nature
- Defined relationship with other roles

**Maintained:**
- Prompt reproduction methodology
- Training documentation focus

---

## Standard Handoff Chain

```
Orchestrator (assigns project)
    ↓ [Gate 1: Design Review]
Solution Architect (designs workflow + ADRs)
    ↓ [Gate 2: Implementation Review]
Developer (implements V+1 version)
    ↓ [Gate 3: Testing Sign-Off]
Tester (validates with evidence)
    ↓ [Gate 4: Go/No-Go Decision]
Orchestrator (makes decision)
    ├─ YES → [Gate 5: Production Readiness]
    │        ↓
    │    Runbook Manager (activates + monitors)
    └─ NO  → Back to Developer or Solution Architect

Parallel: Reverse Prompt Developer (documents reproduction)
```

---

## Allowed/Forbidden Boundaries

| Role | Allowed | Forbidden |
|------|---------|-----------|
| **Orchestrator** | Plan, prioritize, Go/No-Go, resource allocation | Design, implementation, testing, deployment |
| **Solution Architect** | Design specs, ADRs, NFRs, flow diagrams | Implementation, testing, deployment |
| **Developer** | Implementation, node configuration, coding | Design changes, testing, activation |
| **Tester** | Testing, evidence collection, quality gates | Implementation, design, deployment |
| **Reverse Prompt Developer** | Prompt engineering, reproduction docs | Testing, implementation, design |
| **Runbook Manager** | Operations, monitoring, rollback, incidents | Development, design, testing |

---

## Quality Gates

1. **Gate 1 (Design Review):** Solution Architect design approved before development
2. **Gate 2 (Implementation Review):** Developer code review before testing
3. **Gate 3 (Testing Sign-Off):** Tester evidence bundle required before Go decision
4. **Gate 4 (Go/No-Go):** Orchestrator final decision based on evidence
5. **Gate 5 (Production Readiness):** Runbook Manager confirms operational readiness

---

## File Changes

### New Files
- `n8n/n8n-solution-architect.md` (merged from backend + senior workflow)
- `n8n/n8n-developer.md` (new role)
- `n8n/n8n-runbook-rollout-manager.md` (new role)

### Modified Files
- `n8n/n8n-orchestrator.md` (added SoD enforcement, quality gates)
- `n8n/n8n-tester.md` (added handoffs, escalation paths)
- `n8n/n8n-reverse-prompt-developer.md` (added handoffs, parallel role clarification)
- `README.md` (updated to 6-role model, added SoD explanation)
- `CLAUDE.md` (updated agent references)

### Deleted Files
- `n8n/n8n-backend-architect.md` (merged into solution-architect)
- `n8n/n8n-senior-workflow-and-ai-specialist.md` (merged into solution-architect)
- `n8n/n8n-backend-architect-and-tester.md` (deprecated split file)

---

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| **More roles = more overhead** | Clear handoffs minimize coordination overhead; quality gates prevent rework |
| **Design-implementation separation slows delivery** | Solution Architect provides complete specs; Developer focuses only on implementation |
| **New roles require training** | Comprehensive documentation in each role file; clear examples and SOP |
| **Resistance to change** | Document benefits; show SoD compliance value; demonstrate audit trail |

---

## Success Metrics

**Implementation Metrics:**
- ✅ 6 role files created/updated with complete documentation
- ✅ All handoffs documented with clear boundaries
- ✅ Quality gates defined with DoD criteria
- ✅ Allowed/Forbidden boundaries explicit
- ✅ Standard handoff chain documented
- ✅ Use cases updated to reflect new roles

**Operational Metrics (to track):**
- SoD compliance: 100% (no role boundary violations)
- Quality gate pass rate: >80% first-time pass
- Change failure rate: <5%
- MTTR: <15 minutes
- Lead time: Monitor for impact of SoD process

---

## Next Steps

1. ✅ Update all agent documentation (complete)
2. ✅ Update README with 6-role model (complete)
3. ✅ Update CLAUDE.md with new role references (complete)
4. ⏳ Train team on new role structure
5. ⏳ Run pilot project with 6-role model
6. ⏳ Collect feedback and refine

---

## Approval

**Decision Made By:** n8n-Agency Team
**Date:** 2025-11-06
**Status:** ✅ Approved and Implemented

**Reviewers:**
- Orchestrator: ✅ Approved
- Solution Architect: ✅ Approved (design perspective)
- Developer: ✅ Approved (implementation perspective)
- Tester: ✅ Approved (quality perspective)
- Runbook Manager: ✅ Approved (operations perspective)
- Reverse Prompt Developer: ✅ Approved (documentation perspective)

---

## References

- Original agency-agents repository: https://github.com/msitarzewski/agency-agents
- SoD Best Practices: Industry-standard compliance frameworks
- Quality Gate Model: Based on SDLC best practices
