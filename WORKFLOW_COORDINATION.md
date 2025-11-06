# Workflow Coordination System

Production-grade coordination system for n8n workflows and agent task handoffs using GitHub Issues.

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│ PUBLIC REPOSITORY (bpm-agency-agents)                           │
│ - Agent definitions (MD files)                                  │
│ - Documentation and guidelines                                  │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│ PRIVATE REPOSITORY (company-workflows)                          │
│ - Production n8n workflows (JSON)                               │
│ - GitHub Issues for task coordination                           │
│ - Agent definitions (Git submodule)                             │
│ - MCP configurations                                            │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│ N8N INSTANCE                                                     │
│ - Running workflows                                             │
│ - Automatic backup → Git                                        │
└─────────────────────────────────────────────────────────────────┘
```

---

## Core Concept: GitHub Issues for Agent Coordination

**Each Issue = 1 Task for 1 Agent**

Issues chain together with dependencies:
```
Issue #45 (orchestrator) → Issue #46 (solution-architect) → Issue #47 (developer) → Issue #48 (tester)
```

**Benefits:**
- ✅ Complete audit trail
- ✅ Native dependency management
- ✅ Automated workflows (GitHub Actions)
- ✅ Integration with n8n MCP + GitHub MCP

---

## Setup: Private Workflow Repository

### 1. Repository Structure

```
company-workflows/
├── .github/workflows/         # GitHub Actions for automation
├── .claude/
│   ├── agents/               # Git submodule → bpm-agency-agents
│   └── mcp-servers/          # MCP configurations
├── workflows/                # n8n workflow JSON files
│   ├── n8n2github/          # MANDATORY: Automated workflow backup to Git
│   ├── customer-onboarding/
│   └── data-processing/
├── docs/                     # Architecture docs
└── README.md
```

### 2. Initial Setup

```bash
# Create private repo
gh repo create company-workflows --private
cd company-workflows

# Setup structure
mkdir -p workflows/{n8n2github,customer-onboarding,data-processing}
mkdir -p .github/workflows
mkdir -p .claude/mcp-servers
mkdir -p docs

# Link agents via Git submodule (auto-updates!)
git submodule add https://github.com/BPMspaceUG/bpm-agency-agents.git .claude/agents

git commit -m "Initial structure with agent submodule"
git push
```

### 3. Update Agents (when public repo updates)

```bash
git submodule update --remote .claude/agents
git commit -am "Update agents"
git push
# Restart Claude Code
```

---

## Issue Configuration

### Create Labels

```bash
# Agent labels
gh label create "agent:orchestrator" --color "0052CC"
gh label create "agent:solution-architect" --color "0052CC"
gh label create "agent:developer" --color "0052CC"
gh label create "agent:tester" --color "0052CC"
gh label create "agent:runbook-manager" --color "0052CC"

# Status labels
gh label create "status:ready" --color "28A745"
gh label create "status:in-progress" --color "FBCA04"
gh label create "status:blocked" --color "D73A4A"
gh label create "status:done" --color "28A745"

# Priority labels
gh label create "priority:critical" --color "B60205"
gh label create "priority:high" --color "D93F0B"
gh label create "priority:medium" --color "FBCA04"

# Type labels
gh label create "type:workflow" --color "C5DEF5"
gh label create "type:bugfix" --color "D73A4A"
gh label create "n8n-workflow" --color "FF6D5A"
```

---

## Issue Template

```markdown
---
name: Agent Task
about: Agent-to-agent task coordination
title: "[AGENT] Task title"
labels: agent:NAME, status:ready
---

## 🎯 Context
**Parent Issue:** #XX
**Workflow:** `workflows/category/name.json`
**n8n ID:** wf_abc123

## 📋 Requirements
- [ ] Requirement 1
- [ ] Requirement 2

## 🎨 Deliverables
1. Deliverable 1
2. Deliverable 2

## 🔄 Handoff Chain
Previous: #XX (agent) → **Current: YOU** → Next: #YY (agent)

## 📊 Success Metrics
- [ ] Metric 1
- [ ] Metric 2

---
**Labels:** agent:NAME, priority:medium, type:workflow, n8n-workflow
```

---

## Orchestrator Workflow

**Example: Customer Onboarding Automation**

1. **Orchestrator** creates Issue #100: Define requirements
2. Upon #100 close → Create Issue #101: Solution Architect designs architecture
3. Upon #101 close → Create Issue #102: Developer implements workflow
4. Upon #102 close → Create Issue #103: Tester validates with evidence
5. Upon #103 close → Orchestrator reviews, makes Go/No-Go decision
6. If GO → Create Issue #104: Runbook Manager deploys to production

**Issue Chain:**
```
#100 → #101 → #102 → #103 → #104
 ↓      ↓      ↓      ↓      ↓
Orch   Arch   Dev   Test  Deploy
```

---

## n8n Backup Workflow

**Automatic backup:** n8n → Git repository

**Location:** `workflows/n8n2github/` (**MANDATORY**)

**Trigger:** Schedule (every 6 hours) or manual

**Process:**
1. Fetch all workflows from n8n API
2. Export as JSON files
3. Organize by category (workflow tags)
4. Commit to Git (only if changed)
5. Comment on tracking issue

**Implementation:** Use n8n MCP tools to build this workflow

**Files in n8n2github directory:**
- `n8n-backup-workflow.json` - Main backup workflow
- `README.md` - Setup instructions and configuration
- `config.example.json` - Example configuration

**Note:** This workflow will be provided as an example to copy (similar to agent definitions via Git submodule). Check back soon for the reference implementation.

---

## MCP Integration

### GitHub MCP

```javascript
// Create agent task issue
const issue = await github.create_issue({
  owner: "company",
  repo: "workflows",
  title: "[developer] Implement customer onboarding",
  body: issueTemplate,
  labels: ["agent:developer", "status:ready", "n8n-workflow"]
})

// Monitor issue status
const issues = await github.search_issues({
  query: "repo:company/workflows is:open label:status:in-progress"
})
```

### n8n MCP

```javascript
// Get workflow for issue
const workflow = await n8n.n8n_get_workflow({
  id: "wf_abc123"
})

// Validate workflow
const validation = await n8n.validate_workflow({
  workflow: workflowJson
})

// Report in issue
if (!validation.valid) {
  await github.add_issue_comment({
    issue_number: 102,
    body: `⚠️ Validation Failed:\n${validation.errors.join('\n')}`
  })
}
```

---

## Best Practices

### Issue Naming
```
[agent-name] Verb + Object

✅ Good:
- [orchestrator] Plan customer onboarding automation
- [developer] Implement webhook authentication
- [tester] Validate workflow under load

❌ Bad:
- Fix bug (which agent? which bug?)
- Update workflow (too vague)
```

### Always Link Parent Issues
```markdown
**Parent Issue:** #100
```

### One Issue = One Agent = One Workflow File
Keep issues focused and single-responsibility.

### Comment During Work
```markdown
**2024-03-15 10:30** - Started design, considering OAuth2 vs HMAC
**2024-03-15 14:20** - Decision: HMAC-SHA256 for simplicity
**2024-03-15 16:45** - Design complete, ready for developer
```

---

## Git Submodules: Why Better Than Copying

### ❌ Copying Agent Files
```bash
cp -r bpm-agency-agents/* .claude/agents/
# Must manually re-copy on updates
```

### ✅ Git Submodules
```bash
git submodule add https://github.com/BPMspaceUG/bpm-agency-agents.git .claude/agents
# Automatic updates: git submodule update --remote
```

**Benefits:**
- Always in sync with public repo
- Version tracking
- Easy rollback
- Team collaboration

**Update workflow:**
```bash
git submodule update --remote .claude/agents
git commit -am "Update agents to latest version"
# Restart Claude Code
```

---

## Summary

**This system provides:**

✅ Complete traceability via GitHub Issues
✅ Structured agent handoffs with dependencies
✅ Automated n8n workflow backup
✅ MCP integration (GitHub + n8n)
✅ Private repo security
✅ Git submodules for agent sync

**Next Steps:**
1. Create private workflow repository
2. Configure issue labels
3. Link agents via submodule
4. Implement n8n backup workflow
5. Create first orchestrator issue

**For Questions:** See [CLAUDE.md](CLAUDE.md) for agent philosophy and usage
