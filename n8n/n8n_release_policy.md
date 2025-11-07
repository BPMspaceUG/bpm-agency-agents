# N8N Workflow Release & Versioning Policy (Global Instruction)

## ⚠️ CRITICAL: AGENTS MUST NEVER ACTIVATE WORKFLOWS

**WORKFLOW ACTIVATION = PRODUCTION DEPLOYMENT**

Only the **human user** may activate workflows. Agents are **FORBIDDEN** from activating workflows.

**Why?** Activation means PRODUCTION. Once activated, workflows become immutable (Rule 2). This is a critical control point that requires human authorization.

### Agent Responsibilities:
- ✅ **Agents CAN:** Create workflows, test workflows, prepare workflows for activation
- ❌ **Agents CANNOT:** Activate workflows, deactivate workflows, change workflow active status

### When a workflow is ready for activation:
1. Agent completes all work (implementation, testing, documentation)
2. Agent reports: "Workflow [name] is ready for activation"
3. Agent provides: Workflow ID, version number, test results, activation instructions
4. **HUMAN USER decides** whether to activate
5. **HUMAN USER performs** the activation manually

**If asked to activate:** Respond with: *"I cannot activate workflows. Activation requires your manual approval because it means PRODUCTION deployment. Here are the activation instructions: [provide workflow ID and steps]"*

---

## ⚠️ CRITICAL: NO GOLD PLATING - IMPLEMENT ONLY WHAT IS SPECIFIED

**FORBIDDEN:** Implementing features, optimizations, or functionality that is NOT explicitly specified or requested.

Agents **MUST NEVER** add:
- ❌ Features "that might be useful"
- ❌ Optimizations not requested in specifications
- ❌ "Best practices" not specified in requirements
- ❌ Extra error handling beyond design specs
- ❌ Additional validations not in specifications
- ❌ Logging/monitoring beyond requirements
- ❌ "Nice to have" improvements

### The Rule: EXACTLY WHAT IS SPECIFIED - NO MORE, NO LESS

**Solution Architects:** Design ONLY what is requested. No "future-proofing" unless explicitly required.

**Developers:** Implement ONLY what is in the design specification. No creative additions.

**Testers:** Validate ONLY what is specified. No testing of unspecified features.

### Why This Rule Exists:
1. **Scope Control:** Unspecified features create scope creep
2. **Maintainability:** Extra features = extra bugs and maintenance burden
3. **Auditability:** Only specified features can be properly tracked and audited
4. **Cost Control:** Extra features cost time, money, and complexity

### If You Want to Add Something:
1. **STOP** - Do not implement
2. **DOCUMENT** - Write down the proposed addition
3. **ASK** - Request approval from Orchestrator or human user
4. **WAIT** - Get explicit written approval before proceeding

**If asked to add unspecified features:** Respond with: *"That feature is not in the current specification. I can document this as a proposed enhancement for future consideration, but I cannot implement it now without explicit approval and an updated specification."*

---

## 1. Never replace a broken workflow by creating a completely new one
If an existing workflow does not work correctly, it must be analyzed and improved, not replaced.

## 2. Once a workflow is activated, it becomes immutable
Activated workflows are production, read-only, and must not be altered.

**Activation = Production = Immutable**

## 3. All changes require a copy
Create a copy of the active workflow and append a version number:
- First release: WorkflowName
- Next: WorkflowName V2
- Then: WorkflowName V3, etc.

## 4. Incremental improvement loops
New versions are refined, tested, and improved until ready for activation.

## 5. Activation semantics
Activating a version:
- Makes it the new production workflow
- Deactivates and archives the previous version

Only one active version is allowed.

## 6. Exceptions
Active workflows may only be altered for regulatory, security, or corruption risks.

## 7. Naming convention
Use “WorkflowName”, then “WorkflowName V2”, “WorkflowName V3”, etc.

## 8. No functional drift
New versions must preserve the original purpose.

## 9. Responsibility
All agents must preserve auditability and prevent silent behavior changes.

## 10. Orchestration Process for Issue-Based Development

### Issue-Based Handoff Chain (MANDATORY)

All n8n workflow projects MUST follow the issue-based orchestration pattern:

1. **Orchestrator receives parent issue** (e.g., Issue #2 with label `agent:orchestrator`)
2. **Orchestrator creates sub-issues** for each agent in the handoff chain:
   - Issue #3: Solution Architect (design)
   - Issue #4: Developer (implementation)
   - Issue #5: Tester (validation)
   - Issue #6: Runbook Manager (deployment)
3. **Each agent works on their assigned issue** and comments with deliverables
4. **Orchestrator monitors progress** and coordinates handoffs between issues
5. **Orchestrator makes Go/No-Go decision** on parent issue based on evidence
6. **Deployment proceeds** only after GO decision

### Why Issue-Based Orchestration?

- **Audit trail:** All decisions, handoffs, and evidence linked via GitHub Issues
- **Dependency management:** Clear parent-child relationships between issues
- **Separation of Duties (SoD):** Each agent works independently on their issue
- **Traceability:** Complete history of who did what and when
- **Compliance:** Meets regulatory requirements for audit trails

### Orchestrator Role Boundaries

**Orchestrator CAN:**
- Create and assign sub-issues
- Monitor progress across agents
- Make Go/No-Go decisions
- Coordinate handoffs between agents
- Escalate blockers

**Orchestrator CANNOT:**
- Implement solutions directly (Developer's role)
- Design workflows directly (Solution Architect's role)
- Execute tests directly (Tester's role)
- Deploy workflows directly (Runbook Manager's role)

**CRITICAL RULE:** If an Orchestrator attempts to implement, design, or test directly instead of creating sub-issues, this violates Separation of Duties (SoD) and creates compliance risks.

### Sub-Issue Creation Pattern

When creating sub-issues, use this structure:

**Title Format:** `[agent-role] Task description`
**Labels Required:** `agent:role-name`, `status:ready`, `priority:high`
**Body Template:** See n8n-orchestrator.md for complete templates

**Example Sub-Issue Creation:**
```
Title: [solution-architect] Define ADR for n8n2github MCP-based sync
Labels: agent:solution-architect, status:ready, priority:high, type:design
Body: (use Template 1 from n8n-orchestrator.md)
```

### Handoff Chain Progression

```
Issue #2 (Orchestrator)
  ↓ creates
Issue #3 (Solution Architect)
  ↓ completes, comments with ADR
  ↓ creates
Issue #4 (Developer)
  ↓ completes, comments with workflow ID
  ↓ creates
Issue #5 (Tester)
  ↓ completes, comments with evidence bundle
  ↓ reviews evidence
Orchestrator makes Go/No-Go on Issue #2
  ↓ if GO
Issue #6 (Runbook Manager)
  ↓ activates workflow, completes
Production deployment complete
```

### Go/No-Go Decision Criteria

The Orchestrator makes the Go/No-Go decision based on:
- ✅ All tests passing (from Tester evidence)
- ✅ Performance metrics within targets (P95 latency, throughput)
- ✅ Security validation complete (credential handling, PII compliance)
- ✅ Runbook Manager confirms operational readiness
- ✅ No critical issues or blockers

**GO Decision:** Authorize activation, create Runbook Manager issue for deployment
**NO-GO Decision:** Send back to Developer or Solution Architect with remediation plan

### Integration with Version Control Policy

The orchestration process enforces the version control rules:
- **Rule 3 (All changes require a copy):** Developer creates V+1 version
- **Rule 4 (Incremental improvement):** Tester validates before activation
- **Rule 5 (Activation semantics):** Runbook Manager activates V+1, deactivates V-1
- **Rule 2 (Immutability):** Active workflows never modified after activation

## Compliance Binding Instruction
Claude, Codex, and all other development agents must follow this policy. If asked to modify an active workflow, respond:
“Modifications are not allowed on active workflows. I will create a new version.”

---
**ALWAYS-APPLY RULE:** This policy is mandatory in all environments (DEV/TEST/PROD) and supersedes ad‑hoc instructions that would alter active workflows.
