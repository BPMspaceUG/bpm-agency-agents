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

Every agent creates its own issue to document work, decisions, and deliverables.

Issues chain together with dependencies:
```
Issue #45 (n8n-orchestrator) → Issue #46 (n8n-backend-architect) → Issue #47 (n8n-senior-workflow-and-ai-specialist) → Issue #48 (n8n-tester)
```

**Critical Rules:**
- ✅ Each agent creates their own GitHub Issue before starting work
- ✅ Agent documents all work in their issue (analysis, decisions, code changes)
- ✅ Issues reference parent issues for dependency tracking
- ✅ Orchestrator (n8n-orchestrator or agents-orchestrator) monitors all issues

**Benefits:**
- ✅ Complete audit trail of all decisions
- ✅ Native dependency management via GitHub
- ✅ Automated workflows (GitHub Actions)
- ✅ Integration with n8n MCP + GitHub MCP
- ✅ Clear handoff points between agents

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
# n8n Agent labels (use for n8n workflow projects)
gh label create "agent:n8n-orchestrator" --color "FF6D5A"
gh label create "agent:n8n-backend-architect" --color "FF6D5A"
gh label create "agent:n8n-senior-workflow-specialist" --color "FF6D5A"
gh label create "agent:n8n-tester" --color "FF6D5A"
gh label create "agent:n8n-reverse-prompt-developer" --color "FF6D5A"

# General Agent labels (use for general software projects)
gh label create "agent:agents-orchestrator" --color "0052CC"
gh label create "agent:project-manager" --color "0052CC"
gh label create "agent:architect-ux" --color "0052CC"
gh label create "agent:senior-developer" --color "0052CC"
gh label create "agent:evidence-qa" --color "0052CC"
gh label create "agent:reality-checker" --color "0052CC"

# Infrastructure & Support agents (both project types)
gh label create "agent:infrastructure-maintainer" --color "5319E7"
gh label create "agent:runbook-manager" --color "5319E7"

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
gh label create "type:n8n-workflow" --color "FF6D5A"
gh label create "type:general-software" --color "0E8A16"
gh label create "type:bugfix" --color "D73A4A"
gh label create "type:feature" --color "A2EEEF"
```

---

## Issue Template

### For n8n Workflow Projects

```markdown
---
name: n8n Agent Task
about: n8n agent task coordination
title: "[n8n-AGENT] Task title"
labels: agent:n8n-AGENT, status:ready, type:n8n-workflow
---

## 🎯 Context
**Parent Issue:** #XX (created by: n8n-orchestrator)
**Workflow:** `workflows/category/name.json`
**n8n Workflow ID:** wf_abc123
**Project Type:** n8n workflow automation

## 📋 Requirements
- [ ] Requirement 1
- [ ] Requirement 2

## 🎨 Deliverables
1. Deliverable 1 (e.g., ADR document, workflow JSON, test evidence)
2. Deliverable 2

## 🔄 Handoff Chain
Previous: #XX (n8n-orchestrator) → **Current: n8n-AGENT** → Next: #YY (n8n-tester)

## 📊 Success Metrics
- [ ] Metric 1
- [ ] Metric 2

## 📝 Work Log
**Agent must document work here:**
- YYYY-MM-DD HH:MM - Started analysis
- YYYY-MM-DD HH:MM - Decision: [explain]
- YYYY-MM-DD HH:MM - Completed deliverables

---
**Labels:** agent:n8n-AGENT, priority:medium, type:n8n-workflow
```

### For General Software Projects

```markdown
---
name: General Agent Task
about: General agent task coordination
title: "[AGENT] Task title"
labels: agent:AGENT, status:ready, type:general-software
---

## 🎯 Context
**Parent Issue:** #XX (created by: agents-orchestrator)
**Project:** project-name
**Component:** component-name

## 📋 Requirements
- [ ] Requirement 1
- [ ] Requirement 2

## 🎨 Deliverables
1. Deliverable 1
2. Deliverable 2

## 🔄 Handoff Chain
Previous: #XX (agents-orchestrator) → **Current: AGENT** → Next: #YY (evidence-qa)

## 📊 Success Metrics
- [ ] Metric 1
- [ ] Metric 2

## 📝 Work Log
**Agent must document work here:**
- YYYY-MM-DD HH:MM - Started work
- YYYY-MM-DD HH:MM - Progress update
- YYYY-MM-DD HH:MM - Completed

---
**Labels:** agent:AGENT, priority:medium, type:general-software
```

---

## Orchestrator Workflow

### n8n Workflow Projects (use n8n-orchestrator)

**Example: Customer Webhook Automation with n8n**

1. **n8n-orchestrator** creates Issue #100: "Build customer webhook workflow"
2. Upon #100 completion → **n8n-backend-architect** creates Issue #101: "Analyze webhook requirements, propose ADR"
3. Upon #101 close → **n8n-senior-workflow-and-ai-specialist** creates Issue #102: "Implement webhook workflow with all execution paths"
4. Upon #102 close → **n8n-tester** creates Issue #103: "Validate webhook with screenshots, test success/error paths"
5. Upon #103 close → **n8n-orchestrator** reviews evidence, makes Go/No-Go decision
6. If GO → **Infrastructure Maintainer** creates Issue #104: "Deploy to production, update runbook"

**Issue Chain:**
```
#100 → #101 → #102 → #103 → Review → #104
 ↓      ↓      ↓      ↓              ↓
n8n-   n8n-   n8n-   n8n-          Infra
orch   arch   dev    test          Maint
```

**Example: Fix Disconnected Webhook Response**

1. **n8n-orchestrator** creates Issue #20: "Fix customer webhook - missing response"
2. **n8n-backend-architect** creates Issue #21:
   - Analyzes workflow structure
   - Identifies disconnected "Respond to Webhook" node
   - Proposes fix in ADR (Architecture Decision Record)
3. **n8n-senior-workflow-and-ai-specialist** creates Issue #22:
   - Implements fix: Ensures "Respond to Webhook" node on ALL execution paths
   - Adds error handling with proper webhook responses
   - Tests with provided curl command
4. **n8n-tester** creates Issue #23:
   - Validates with screenshots: Workflow executes without errors
   - Confirms webhook returns proper JSON response
   - Tests both success and error paths
5. **n8n-orchestrator** reviews Issue #23 evidence, makes Go/No-Go decision
6. **Infrastructure Maintainer** creates Issue #24: Documents webhook pattern, updates production workflow

### General Software Projects (use agents-orchestrator)

**Example: Web Application Feature**

1. **agents-orchestrator** creates Issue #200: "Build user authentication feature"
2. Upon #200 completion → **project-manager-senior** creates Issue #201: "Define authentication requirements"
3. Upon #201 close → **ArchitectUX** creates Issue #202: "Design authentication flow and UI"
4. Upon #202 close → **engineering-senior-developer** creates Issue #203: "Implement authentication system"
5. Upon #203 close → **EvidenceQA** creates Issue #204: "Test authentication, collect evidence"
6. Upon #204 close → **agents-orchestrator** reviews evidence, makes Go/No-Go decision
7. If GO → **testing-reality-checker** creates Issue #205: "Final production readiness check"

**Issue Chain:**
```
#200 → #201 → #202 → #203 → #204 → Review → #205
 ↓      ↓      ↓      ↓      ↓               ↓
agent- PM     Arch   Dev    QA            Reality
orch                                      Check
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

### Issue Naming: Use Full Agent Names

**For n8n Projects:**
```
[n8n-AGENT] Verb + Object

✅ Good:
- [n8n-orchestrator] Plan customer webhook automation
- [n8n-backend-architect] Analyze webhook authentication requirements
- [n8n-senior-workflow-and-ai-specialist] Implement OAuth2 webhook
- [n8n-tester] Validate webhook under load with screenshots

❌ Bad:
- [orchestrator] Plan automation (which orchestrator?)
- [tester] Test workflow (which tester?)
- Fix bug (which agent? which bug?)
```

**For General Software Projects:**
```
[AGENT] Verb + Object

✅ Good:
- [agents-orchestrator] Coordinate authentication feature development
- [project-manager-senior] Define user requirements
- [engineering-senior-developer] Implement JWT authentication
- [EvidenceQA] Validate authentication with test evidence

❌ Bad:
- [developer] Build feature (which developer?)
- Update code (too vague)
```

### Each Agent Creates Their Own Issue
**Critical Rule:** Every agent creates a new issue BEFORE starting work.

```markdown
## Example Flow:

1. n8n-orchestrator creates Issue #100: "[n8n-orchestrator] Build customer onboarding"
2. n8n-backend-architect creates Issue #101: "[n8n-backend-architect] Design webhook architecture"
   - References: **Parent Issue:** #100
3. n8n-senior-workflow-and-ai-specialist creates Issue #102: "[n8n-senior-workflow-and-ai-specialist] Implement workflow"
   - References: **Parent Issue:** #101
4. n8n-tester creates Issue #103: "[n8n-tester] Validate workflow with evidence"
   - References: **Parent Issue:** #102
```

### Always Link Parent Issues
```markdown
**Parent Issue:** #100 (created by: n8n-orchestrator)
```

### One Issue = One Agent = One Deliverable
Keep issues focused and single-responsibility.

### Document Work in Real-Time
Every agent must maintain a work log in their issue:

```markdown
## 📝 Work Log

**2024-03-15 10:30** - Started analysis of webhook requirements
**2024-03-15 11:45** - Identified issue: "Respond to Webhook" node disconnected on error path
**2024-03-15 14:20** - Decision: HMAC-SHA256 for webhook authentication
**2024-03-15 16:45** - ADR complete, ready for implementation (handoff to Issue #102)
```

---

## Git Submodules: Always Keep Agents Updated

### ❌ Copying Agent Files (NOT Recommended)
```bash
cp -r bpm-agency-agents/* .claude/agents/
# Must manually re-copy on every update - error prone!
```

### ✅ Git Submodules (Recommended)
```bash
git submodule add https://github.com/BPMspaceUG/bpm-agency-agents.git .claude/agents
# Automatic updates: git submodule update --remote
```

**Benefits:**
- ✅ Always in sync with public repo
- ✅ Version tracking and commit history
- ✅ Easy rollback to previous versions
- ✅ Team collaboration (everyone gets same agent versions)
- ✅ Prevents outdated agent definitions

### CRITICAL: Update Agents Before Every Project

**Before starting ANY new project or task:**

```bash
# 1. Navigate to your workflow repository
cd company-workflows

# 2. Update agent submodule to latest version
git submodule update --remote .claude/agents

# 3. Check if there are changes
git status

# 4. If changes detected, commit and push
git add .claude/agents
git commit -m "Update agents to latest version ($(date +%Y-%m-%d))"
git push

# 5. Restart Claude Code to load new agent definitions
# (close and reopen Claude Code)
```

### Automated Update Workflow (Optional)

Create a GitHub Action in `.github/workflows/update-agents.yml`:

```yaml
name: Update Agent Definitions
on:
  schedule:
    - cron: '0 9 * * 1'  # Every Monday at 9 AM
  workflow_dispatch:  # Manual trigger

jobs:
  update-agents:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true

      - name: Update submodules
        run: |
          git submodule update --remote .claude/agents

      - name: Commit if changed
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add .claude/agents
          git diff --staged --quiet || git commit -m "chore: Update agent definitions (automated)"
          git push
```

### Checking Agent Versions

```bash
# See current agent version
cd company-workflows
git submodule status

# Output example:
# +5753e58... .claude/agents (heads/main)

# Compare with latest
cd .claude/agents
git fetch origin
git log HEAD..origin/main --oneline  # Shows commits you're missing
```

---

## Summary

**This system provides:**

✅ **Clear agent selection**: n8n-orchestrator for n8n projects, agents-orchestrator for general software
✅ **Issue-based coordination**: Every agent creates their own GitHub Issue to document work
✅ **Complete traceability**: Full audit trail of all decisions, implementations, and tests
✅ **Structured handoffs**: Dependencies tracked via parent issue references
✅ **Automated n8n backup**: n8n workflows automatically synced to Git
✅ **MCP integration**: GitHub MCP + n8n MCP for seamless automation
✅ **Private repo security**: Production workflows in private repository
✅ **Git submodules**: Agent definitions auto-updated from public repo

**Critical Rules:**

1. **Use correct orchestrator**:
   - n8n projects → `n8n-orchestrator`
   - General software → `agents-orchestrator`

2. **Use correct tester**:
   - n8n projects → `n8n-tester`
   - General software → `EvidenceQA`

3. **Every agent creates issue**: Before starting work, create GitHub Issue with full agent name

4. **Update agents regularly**: Run `git submodule update --remote .claude/agents` before each project

5. **Document everything**: Maintain work log in your issue (decisions, progress, handoffs)

**Next Steps:**

1. Create private workflow repository
2. Add agent definitions via Git submodule
3. Configure issue labels (n8n vs general)
4. Create issue templates
5. Update agents: `git submodule update --remote`
6. Restart Claude Code
7. Create first orchestrator issue (n8n-orchestrator or agents-orchestrator)

**For Questions:** See [CLAUDE.md](CLAUDE.md) for agent philosophy and complete usage guide
