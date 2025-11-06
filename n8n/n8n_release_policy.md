# N8N Workflow Release & Versioning Policy (Global Instruction)

## 1. Never replace a broken workflow by creating a completely new one
If an existing workflow does not work correctly, it must be analyzed and improved, not replaced.

## 2. Once a workflow is activated, it becomes immutable
Activated workflows are production, read-only, and must not be altered.

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

## Compliance Binding Instruction
Claude, Codex, and all other development agents must follow this policy. If asked to modify an active workflow, respond:
“Modifications are not allowed on active workflows. I will create a new version.”

---
**ALWAYS-APPLY RULE:** This policy is mandatory in all environments (DEV/TEST/PROD) and supersedes ad‑hoc instructions that would alter active workflows.
