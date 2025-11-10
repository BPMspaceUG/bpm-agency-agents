# 🚀 BPM Agency Agents

> **Professional n8n Workflow Automation + FlightPHP Frontend Specialists** with Context7 MCP documentation retrieval, Separation of Duties (SoD) compliance, and production-grade development.

**Primary Focus:** n8n workflow automation agents + FlightPHP frontend agents for complete automation solutions
**Bonus:** 51 additional specialized agents (engineering, design, marketing, testing, operations)

---

## 🎯 What Is This?

A specialized agent framework designed for **n8n workflow automation** and **FlightPHP frontend development**, enhanced with **Context7 MCP Server** for real-time documentation retrieval.

### Why This Fork Exists

1. **n8n Workflow Automation** - 6 specialized agents with SoD compliance for production workflows
2. **FlightPHP Frontend Integration** - Guidelines for building n8n-integrated frontends
3. **Context7 MCP Server** - All agents query Redis-backed documentation before working
4. **Production-Grade Patterns** - Battle-tested workflows from real projects

This fork extends [agency-agents](https://github.com/msitarzewski/agency-agents) by [@msitarzewski](https://github.com/msitarzewski) with n8n and FlightPHP specialization.

---

## ⚡ Quick Start

### Option 1: Git Submodule (Recommended for Production)

```bash
# In your private workflow repository
cd company-workflows/.claude
git submodule add https://github.com/BPMspaceUG/bpm-agency-agents.git agents
git commit -m "Add agent definitions via submodule"

# Update agents when new versions available
git submodule update --remote agents
git commit -am "Update agents to latest version"
```

### Option 2: Direct Copy (Quick Testing)

```bash
# Copy all agents to Claude Code directory
cp -r bpm-agency-agents/* ~/.claude/agents/

# Or copy only n8n agents
cp -r bpm-agency-agents/n8n/* ~/.claude/agents/n8n/

# Or copy only FlightPHP guidelines
cp -r bpm-agency-agents/flightphp/* ~/.claude/agents/flightphp/
```

### Activate Agents

```bash
# n8n workflow orchestration
"activate n8n Orchestrator mode and coordinate customer onboarding workflow"

# n8n workflow design
"activate n8n Solution Architect mode and design webhook processing flow"

# n8n workflow implementation
"activate n8n Developer mode and implement this specification"

# n8n workflow testing
"activate n8n Tester mode and validate with evidence bundle"

# FlightPHP frontend
"follow FlightPHP Agent Instructions to create customer signup form"
```

---

## 🔴 CRITICAL: Context7 MCP Server

**ALL n8n and FlightPHP agents MUST query Context7 for latest documentation before starting work.**

### What is Context7?

Context7 is a **Redis-backed MCP (Model Context Protocol) server** providing:
- ✅ **Latest n8n documentation** - Always up-to-date with current APIs
- ✅ **FlightPHP patterns** - Integration best practices
- ✅ **Bootstrap 5 & DataTables** - Frontend component docs
- ✅ **Webhook contracts** - n8n webhook patterns

### Why Context7 is Mandatory

| Problem | Solution |
|---------|----------|
| 🔴 Outdated API patterns | Context7 serves latest docs from Redis |
| 🔴 Conflicting documentation | Single source of truth |
| 🔴 Slow web searches | Instant Redis retrieval |
| 🔴 Missing best practices | Synchronized with official sources |

### Context7 Integration

```javascript
// n8n agents query before work:
mcp__Context7__get({key: "n8n:docs:latest"})
mcp__Context7__get({key: "n8n:best-practices:2025"})
mcp__Context7__get({key: "n8n:node-reference"})

// FlightPHP agents query before work:
mcp__Context7__get({key: "flightphp:docs:latest"})
mcp__Context7__get({key: "bootstrap:5:components"})
mcp__Context7__get({key: "n8n:webhooks:patterns"})
```

**Documentation:**
- **n8n Context7 Integration:** [n8n_mcp_best_practices.md](n8n/n8n_mcp_best_practices.md#0-prerequisite-context7-documentation-retrieval)
- **FlightPHP Context7 Integration:** [FLIGHTPHP_AGENT_INSTRUCTIONS.md](flightphp/FLIGHTPHP_AGENT_INSTRUCTIONS.md#01-mandatory-context7-documentation-retrieval)

---

## 🔄 n8n Workflow Automation Agents (6 Specialists)

**Production-grade workflow automation with Separation of Duties (SoD) compliance**

| # | Agent | Phase | Role | Context7 Keys |
|---|-------|-------|------|--------------|
| 1 | 🎯 [n8n Orchestrator](n8n/n8n-orchestrator.md) | **Control** | Project coordination, Go/No-Go decisions | Verifies Context7 availability |
| 2 | 🏗️ [n8n Solution Architect](n8n/n8n-solution-architect.md) | **Design** | Workflow architecture, ADRs, technical specs | `n8n:architecture:*`, `n8n:nodes:*` |
| 3 | 💻 [n8n Developer](n8n/n8n-developer.md) | **Build** | Exact implementation per specification | `n8n:node-reference:*`, `n8n:connections:*` |
| 4 | ✅ [n8n Tester](n8n/n8n-tester.md) | **Validation** | Evidence-based testing, quality gates | `n8n:testing:*`, `n8n:validation:*` |
| 5 | 📊 [n8n Runbook & Rollout Manager](n8n/n8n-runbook-rollout-manager.md) | **Operations** | Production deployment, monitoring, rollback | `n8n:operations:*`, `n8n:monitoring:*` |
| 6 | 🔍 [n8n Reverse Prompt Developer](n8n/n8n-reverse-prompt-developer.md) | **Documentation** | Workflow reproduction, training docs | `n8n:prompt-engineering:*` |

### 📚 Mandatory n8n Documentation

| Document | Purpose | Critical |
|----------|---------|----------|
| **[n8n MCP Best Practices](n8n/n8n_mcp_best_practices.md)** | Required for ALL n8n agents | 🔴 YES |
| **[n8n Release Policy](n8n/n8n_release_policy.md)** | Versioning and deployment guidelines | ✅ YES |
| **[Context7 Integration](n8n/n8n_mcp_best_practices.md#0-prerequisite-context7-documentation-retrieval)** | Documentation retrieval workflow | 🔴 YES |

### Why n8n Best Practices are Critical

✅ **Prevents runtime failures** - Explicitly set ALL node parameters (defaults cause failures)
✅ **Optimal MCP tool usage** - Templates first, parallel execution, batch operations
✅ **Correct validation workflow** - Multi-level validation before deployment
✅ **Avoids common mistakes** - Connection syntax, IF node branching, webhook responses
✅ **Enforces production patterns** - Silent execution, evidence-based quality gates

### Standard n8n Handoff Chain

```
n8n-orchestrator (assigns)
    ↓
n8n-solution-architect (designs with Context7 docs)
    ↓
n8n-developer (implements with Context7 docs)
    ↓
n8n-tester (validates with Context7 docs)
    ↓
n8n-orchestrator (Go/No-Go decision)
    ├─ ✅ GO  → n8n-runbook-rollout-manager (deploys & monitors)
    └─ ❌ NO  → Back to n8n-developer (fixes issues)
```

**SoD Compliance Features:**
- ✅ No single role controls end-to-end workflow
- ✅ Clear audit trails with documented handoffs via GitHub Issues
- ✅ Minimal corruption surface - each agent has distinct responsibilities
- ✅ Enterprise governance ready - full separation of design, build, test, deploy

---

## 🎨 FlightPHP Frontend Integration

**Frontend-only web applications for n8n workflow integration**

### Technology Stack

| Component | Technology | Purpose | Context7 Keys |
|-----------|------------|---------|--------------|
| 📝 **Forms** | [Bootstrap 5](https://getbootstrap.com/docs/5.0/) | User input collection, workflow triggers | `bootstrap:5:components`, `bootstrap:5:forms` |
| ✅ **Validation** | Server-side PHP | Input sanitization before n8n | `flightphp:validation:*` |
| 🔗 **Integration** | cURL/HTTP POST | Call n8n webhook endpoints | `n8n:webhooks:patterns` |
| 📊 **Display** | [DataTables](https://datatables.net/) | Workflow result visualization | `datatables:docs:latest` |
| 🎨 **Layout** | Bootstrap 5 + Partials | Shared header/footer, consistent UI | `bootstrap:5:*` |
| 📋 **Views** | PHP Templates | No inline HTML in controllers | `flightphp:routing:patterns` |

### 📚 Mandatory FlightPHP Documentation

**[FlightPHP Agent Instructions](flightphp/FLIGHTPHP_AGENT_INSTRUCTIONS.md)** - 🔴 **CRITICAL**: Required for ALL FlightPHP implementations

**Why These Guidelines are Mandatory:**
- ✅ **Frontend-only pattern** - No business logic in PHP (all logic in n8n)
- ✅ **Consistent UI/UX** - Shared components across all n8n frontends
- ✅ **No logic duplication** - Single source of truth (n8n workflows)
- ✅ **Audit trail** - Shared header/footer with user tracking
- ✅ **DataTables standard** - All result displays use DataTables
- ✅ **Global compliance** - Follows GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md
- ✅ **Context7 integration** - Queries latest FlightPHP, Bootstrap, n8n webhook docs

### FlightPHP ↔ n8n Integration Pattern

```
User Input
    ↓
FlightPHP Form (Bootstrap 5)
    ↓
Server-side Validation (PHP)
    ↓
n8n Webhook (HTTP POST)
    ↓
n8n Workflow (ALL BUSINESS LOGIC)
    ↓
JSON Response
    ↓
FlightPHP Result Display (DataTables)
    ↓
User sees results
```

**Key Principle:** FlightPHP = UI only. n8n = Logic only.

### Coordination with n8n Agents

| Step | Agent | Action | Creates Issue |
|------|-------|--------|---------------|
| 1 | **n8n-solution-architect** | Designs workflow + webhook contracts | Yes - with `frontend:flightphp` label |
| 2 | **FlightPHP agent** | Implements routes/views per spec | Documents Context7 retrieval |
| 3 | **n8n-developer** | Implements n8n workflow with webhooks | Tests webhook responses |
| 4 | **n8n-orchestrator** | Reviews FlightPHP implementation | Validates integration |
| 5 | **Integration Test** | FlightPHP calls n8n, renders responses | Full E2E validation |

---

## 📋 GitHub Issue Templates

**Ready-to-use templates for n8n workflow coordination via GitHub Issues**

| Template | Use Case | Labels |
|----------|----------|--------|
| **[1️⃣ Create New n8n Workflow](#1️⃣-create-new-n8n-workflow-from-scratch)** | Build workflow from scratch | `agent:n8n-orchestrator`, `type:n8n-workflow` |
| **[2️⃣ Fix Bug in Existing Workflow](#2️⃣-fix-bug-in-existing-workflow)** | Debug and fix production issues | `agent:n8n-orchestrator`, `type:bugfix`, `priority:critical` |
| **[3️⃣ Add Feature to Workflow](#3️⃣-add-new-feature-to-existing-workflow)** | Enhance existing workflow | `agent:n8n-orchestrator`, `type:feature` |
| **[4️⃣ Adapt External Workflow](#4️⃣-adapt-external-workflow-to-custom-requirements)** | Customize n8n template | `agent:n8n-orchestrator`, `type:n8n-workflow` |

**Full examples with copy-paste templates:** [See below ↓](#📝-github-issue-examples)

---

## 📊 Production Workflow Coordination

**GitHub Issues-based coordination system** for managing agent handoffs and n8n workflows.

**📖 [Complete Documentation → WORKFLOW_COORDINATION.md](WORKFLOW_COORDINATION.md)**

### Key Features

✅ **GitHub Issues for task handoffs** - e.g., `#45 → #46 → #47`
✅ **Complete audit trail** - Every agent decision documented
✅ **Private repository** - Production workflows in separate private repo
✅ **Automatic n8n → Git backup** - n8n2github workflow syncs to Git
✅ **MCP integration** - GitHub + n8n MCP servers for seamless coordination

### Quick Setup

```bash
# Create private workflow repository
gh repo create company-workflows --private
cd company-workflows

# Add agents as Git submodule
git submodule add https://github.com/BPMspaceUG/bpm-agency-agents.git .claude/agents

# See WORKFLOW_COORDINATION.md for:
# - Private repository structure
# - GitHub Issue templates for agent coordination
# - n8n backup workflow architecture (n8n2github)
# - MCP server integration examples
```

---

## 🎯 Common Use Cases

### 1. Debug & Fix Workflow

**Problem:** Production workflow failing intermittently

**Team:**
1. **n8n-orchestrator** - Creates Issue #1, assigns debugging task
2. **n8n-solution-architect** - Creates Issue #2, analyzes logs, designs fix (with Context7 docs)
3. **n8n-developer** - Creates Issue #3, implements fix (V+1) (with Context7 docs)
4. **n8n-tester** - Creates Issue #4, validates with evidence bundle (with Context7 docs)
5. **n8n-orchestrator** - Reviews Issue #4, makes Go/No-Go decision
6. **n8n-runbook-rollout-manager** - Creates Issue #5, activates, monitors production (with Context7 docs)

**Result:** ✅ Validated fix with full audit trail via GitHub Issues

---

### 2. Reverse Engineer & Rebuild

**Problem:** Ad-hoc workflow without documentation

**Team:**
1. **n8n-reverse-prompt-developer** - Creates Issue #1, analyzes & documents existing workflow (with Context7 docs)
2. **n8n-orchestrator** - Creates Issue #2, assigns rebuild project
3. **n8n-solution-architect** - Creates Issue #3, designs optimized architecture (with Context7 docs)
4. **n8n-developer** - Creates Issue #4, implements new workflow (with Context7 docs)
5. **n8n-tester** - Creates Issue #5, validates functional equivalency (with Context7 docs)
6. **n8n-runbook-rollout-manager** - Creates Issue #6, deploys & monitors (with Context7 docs)

**Result:** ✅ Production-ready workflow with proper documentation

---

### 3. Iterative Development with FlightPHP Frontend

**Problem:** Build complex workflow with user interface from requirements

**Team:**
1. **n8n-orchestrator** - Creates Issue #1, intake requirements
2. **n8n-solution-architect** - Creates Issue #2, designs architecture + webhook contracts (Gate 1) (with Context7 docs)
3. **FlightPHP agent** - Creates Issue #3, implements frontend (parallel to workflow) (with Context7 docs)
4. **n8n-developer** - Creates Issue #4, implements workflow specification (V+1) (with Context7 docs)
5. **n8n-tester** - Creates Issue #5, executes comprehensive tests (workflow + frontend integration) (with Context7 docs)
6. **Iteration Loop** - n8n-developer fixes (Issue #6) → n8n-tester validates (Issue #7) (repeat until pass)
7. **n8n-orchestrator** - Reviews evidence (Gate 3), makes Go/No-Go decision
8. **n8n-runbook-rollout-manager** - Creates Issue #8, activates & monitors (with Context7 docs)

**Result:** ✅ Production-ready workflow + frontend meeting exact specifications

---

## 📝 GitHub Issue Examples

**Ready-to-use issue templates** for common n8n workflow scenarios. Copy, customize, and create!

### 1️⃣ Create New n8n Workflow from Scratch

```markdown
---
name: n8n New Workflow
title: "[n8n-orchestrator] Build customer onboarding automation"
labels: agent:n8n-orchestrator, priority:high, type:n8n-workflow, status:ready
---

## 🎯 Context
**Project Type:** n8n workflow automation (NEW)
**Repository:** company-workflows
**Target Workflow File:** `workflows/customer-onboarding/main.json`

## 📚 MANDATORY: Context7 Documentation
ALL agents MUST query Context7 before work:
- n8n-solution-architect: `n8n:architecture:*`, `n8n:nodes:*`
- n8n-developer: `n8n:node-reference:*`, `n8n:connections:*`
- n8n-tester: `n8n:testing:*`, `n8n:validation:*`

## 📋 Requirements
- [ ] Automate customer onboarding when new user signs up
- [ ] Send welcome email with credentials
- [ ] Create account in CRM system
- [ ] Notify sales team via Slack
- [ ] Add user to mailing list

## 🎨 Deliverables
1. Complete n8n workflow JSON
2. Architecture Decision Record (ADR)
3. Test evidence (screenshots, logs)
4. Production deployment runbook
5. Context7 retrieval confirmation in all deliverables

## 🔄 Handoff Chain
**Current: n8n-orchestrator** → Next: #TBD (n8n-solution-architect)

## 📊 Success Metrics
- [ ] Workflow executes without errors
- [ ] All 4 actions complete successfully
- [ ] Average execution time < 5 seconds
- [ ] Passes load test (100 concurrent executions)

## 📝 Technical Details
**Trigger:** Webhook (POST from signup form)
**Expected Payload:**
```json
{
  "email": "user@example.com",
  "name": "John Doe",
  "company": "Acme Corp"
}
```

**External Services:**
- SMTP (SendGrid)
- CRM (HubSpot API)
- Slack (Webhook)
- Mailchimp (API)

---
**Labels:** agent:n8n-orchestrator, priority:high, type:n8n-workflow
```

---

### 2️⃣ Fix Bug in Existing Workflow

```markdown
---
name: n8n Bug Fix
title: "[n8n-orchestrator] Fix webhook response missing on error path"
labels: agent:n8n-orchestrator, priority:critical, type:bugfix, status:ready
---

## 🎯 Context
**Project Type:** n8n workflow automation (BUG FIX)
**Existing Workflow:** `workflows/customer-webhook/main.json`
**n8n Workflow ID:** wf_abc123
**Parent Issue:** N/A (bug report)

## 📚 MANDATORY: Context7 Documentation
ALL agents MUST query Context7 before work:
- n8n-solution-architect: `n8n:debugging:*`, `n8n:webhook:*`
- n8n-developer: `n8n:node-reference:*`, `n8n:error-handling:*`
- n8n-tester: `n8n:testing:*`, `n8n:validation:*`

## 🐛 Bug Description
Customer webhook workflow does not return HTTP response when error occurs.
Clients receive timeout instead of proper error message.

**Current Behavior:**
- Success path: Returns 200 + JSON ✅
- Error path: No response, client timeout ❌

**Expected Behavior:**
- Success path: Returns 200 + JSON ✅
- Error path: Returns 400/500 + error JSON ✅

## 📋 Requirements
- [ ] Analyze workflow to identify missing "Respond to Webhook" node
- [ ] Ensure "Respond to Webhook" node on ALL execution paths
- [ ] Add proper error handling with HTTP status codes
- [ ] Test with provided curl commands (success + error scenarios)
- [ ] Query Context7 for latest webhook patterns before implementing

## 🎨 Deliverables
1. Root cause analysis (ADR)
2. Fixed workflow JSON
3. Test evidence: Screenshots showing both success/error responses
4. Updated workflow in production
5. Context7 retrieval confirmation

## 🔄 Handoff Chain
**Current: n8n-orchestrator** → Next: #TBD (n8n-solution-architect)

## 📊 Success Metrics
- [ ] Error path returns proper HTTP response (400/500)
- [ ] Response time < 1 second
- [ ] No more client timeouts
- [ ] Both success and error paths validated with screenshots

## 📝 Test Commands
```bash
# Success scenario
curl -X POST https://n8n.example.com/webhook/customer \
  -H "Content-Type: application/json" \
  -d '{"customer_id": "123"}'

# Error scenario (missing customer_id)
curl -X POST https://n8n.example.com/webhook/customer \
  -H "Content-Type: application/json" \
  -d '{}'
```

---
**Labels:** agent:n8n-orchestrator, priority:critical, type:bugfix
```

---

### 3️⃣ Add New Feature to Existing Workflow

```markdown
---
name: n8n Feature Addition
title: "[n8n-orchestrator] Add Slack notification to customer onboarding"
labels: agent:n8n-orchestrator, priority:medium, type:feature, status:ready
---

## 🎯 Context
**Project Type:** n8n workflow automation (FEATURE ADDITION)
**Existing Workflow:** `workflows/customer-onboarding/main.json`
**n8n Workflow ID:** wf_abc123
**Parent Issue:** N/A (feature request)

## 📚 MANDATORY: Context7 Documentation
ALL agents MUST query Context7 before work:
- n8n-solution-architect: `n8n:architecture:*`, `n8n:integrations:slack`
- n8n-developer: `n8n:node-reference:*`, `slack:api:*`
- n8n-tester: `n8n:testing:*`, `n8n:integration-testing:*`

## ✨ Feature Description
Add Slack notification to sales channel when new customer completes onboarding.

**Current Workflow:**
1. Receive webhook from signup form ✅
2. Send welcome email ✅
3. Create CRM account ✅
4. Add to mailing list ✅

**Desired Workflow:**
1. Receive webhook from signup form ✅
2. Send welcome email ✅
3. Create CRM account ✅
4. Add to mailing list ✅
5. **Send Slack notification** ⭐ NEW

## 📋 Requirements
- [ ] Add Slack node to workflow after mailing list step
- [ ] Send notification to #sales channel
- [ ] Include customer name, email, company
- [ ] Handle Slack API errors gracefully (don't fail entire workflow)
- [ ] Maintain backward compatibility
- [ ] Query Context7 for latest Slack integration patterns

## 🎨 Deliverables
1. Updated workflow architecture (ADR)
2. Modified workflow JSON with Slack integration
3. Test evidence: Screenshot of Slack notification
4. Error handling validation
5. Context7 retrieval confirmation

## 🔄 Handoff Chain
**Current: n8n-orchestrator** → Next: #TBD (n8n-solution-architect)

## 📊 Success Metrics
- [ ] Slack notification sent successfully
- [ ] Notification includes all required fields
- [ ] Existing functionality unaffected
- [ ] Workflow executes without errors
- [ ] Slack failures don't break workflow

## 📝 Slack Message Format
```
🎉 New Customer Onboarded!

Name: John Doe
Email: user@example.com
Company: Acme Corp
Signed up: 2025-11-10 10:30 UTC

CRM: https://crm.example.com/contacts/123
```

## 🔧 Technical Details
**Slack Webhook URL:** (stored in n8n credentials)
**Channel:** #sales
**Fallback:** Log error, continue workflow

---
**Labels:** agent:n8n-orchestrator, priority:medium, type:feature
```

---

### 4️⃣ Adapt External Workflow to Custom Requirements

```markdown
---
name: n8n Adapt External Workflow
title: "[n8n-orchestrator] Adapt n8n template 'E-Commerce Order Processing' to our requirements"
labels: agent:n8n-orchestrator, priority:medium, type:n8n-workflow, status:ready
---

## 🎯 Context
**Project Type:** n8n workflow automation (ADAPT EXTERNAL)
**Source:** n8n Template Library / External JSON
**Template Link:** https://n8n.io/workflows/1234-ecommerce-order-processing
**Target Workflow File:** `workflows/order-processing/shopify-orders.json`

**Alternative Sources:**
- External JSON file: `docs/templates/ecommerce-template.json`
- Existing workflow documentation: `docs/templates/ecommerce-template.md`

## 📚 MANDATORY: Context7 Documentation
ALL agents MUST query Context7 before work:
- n8n-reverse-prompt-developer: `n8n:workflow-structure:*`, `n8n:template-adaptation:*`
- n8n-solution-architect: `n8n:architecture:*`, `shopify:api:*`, `paypal:api:*`
- n8n-developer: `n8n:node-reference:*`, `n8n:connections:*`
- n8n-tester: `n8n:testing:*`, `n8n:integration-testing:*`

## 📋 Source Workflow Analysis
**Original Template Features:**
- Trigger: Generic webhook
- Process: WooCommerce orders
- Notifications: Email only
- Payment: Stripe integration

**What We Need Different:**
- Trigger: Shopify webhook (not generic)
- Process: Shopify orders (not WooCommerce)
- Notifications: Email + Slack + SMS
- Payment: PayPal integration (not Stripe)
- Additional: Inventory sync with warehouse system

## 🎨 Requirements
- [ ] Review external template/workflow structure (n8n-reverse-prompt-developer)
- [ ] Identify reusable components (n8n-reverse-prompt-developer)
- [ ] Replace WooCommerce with Shopify nodes
- [ ] Replace Stripe with PayPal integration
- [ ] Add Slack notification (new)
- [ ] Add SMS notification via Twilio (new)
- [ ] Add inventory sync to warehouse API (new)
- [ ] Maintain error handling patterns from template
- [ ] Query Context7 for all integration patterns

## 🎨 Deliverables
1. Analysis document: Comparison of template vs requirements
2. Architecture Decision Record (ADR) for customizations
3. New workflow JSON adapted to our stack
4. Test evidence with Shopify test orders
5. Production deployment runbook
6. Context7 retrieval confirmations

## 🔄 Handoff Chain
**Current: n8n-orchestrator** → Next: #TBD (n8n-reverse-prompt-developer OR n8n-solution-architect)

## 📊 Success Metrics
- [ ] Workflow processes Shopify orders correctly
- [ ] PayPal payments processed successfully
- [ ] All 3 notification channels working (Email, Slack, SMS)
- [ ] Inventory synced to warehouse system
- [ ] Error handling validates gracefully
- [ ] Performance: < 10 seconds per order

## 📝 External References
**Template Source:**
- URL: https://n8n.io/workflows/1234-ecommerce-order-processing
- OR File: `docs/templates/ecommerce-template.json`
- OR Docs: `docs/templates/ecommerce-template.md`

**Our Tech Stack:**
- E-Commerce: Shopify
- Payment: PayPal
- Notifications: SendGrid (email), Slack, Twilio (SMS)
- Warehouse: Custom REST API

## 🔍 Reverse Prompt Developer Notes
If starting from external JSON/template:
1. n8n-reverse-prompt-developer analyzes external workflow (queries Context7)
2. Documents structure, nodes, patterns
3. Creates adaptation guide
4. Hands off to n8n-solution-architect for redesign

---
**Labels:** agent:n8n-orchestrator, priority:medium, type:n8n-workflow
```

---

## 📦 Stats

| Category | Count | Notes |
|----------|-------|-------|
| **n8n Workflow Agents** | 6 | Orchestrator, Architect, Developer, Tester, Runbook, Reverse Prompt |
| **FlightPHP Guidelines** | 1 doc | Complete frontend integration guide |
| **Context7 Integration** | ALL | Mandatory for n8n + FlightPHP agents |
| **Engineering Agents** | 7 | Backend, Frontend, Mobile, DevOps, AI, Senior Dev, Rapid Prototyper |
| **Design Agents** | 6 | UX Researcher, UX Architect, UI Designer, Brand Guardian, Whimsy, Visual Storyteller |
| **Marketing Agents** | 8 | Growth Hacker, Content Creator, Social Media, Twitter, Instagram, TikTok, Reddit, App Store |
| **Product Agents** | 3 | Feedback Synthesizer, Trend Researcher, Sprint Prioritizer |
| **Project Management** | 5 | Senior PM, Studio Producer, Studio Operations, Project Shepherd, Experiment Tracker |
| **Testing Agents** | 7 | Evidence Collector, Reality Checker, API Tester, Performance, Tool Evaluator, Results Analyzer, Workflow Optimizer |
| **Support Agents** | 6 | Analytics Reporter, Infrastructure Maintainer, Finance Tracker, Executive Summary, Legal Compliance, Support Responder |
| **Spatial Computing** | 6 | XR Interface, XR Immersive, macOS Spatial/Metal, VisionOS, Terminal Integration, Cockpit Interaction |
| **Specialized Agents** | 3 | Agents Orchestrator (general), LSP/Index Engineer, Data Analytics Reporter |
| **TOTAL AGENTS** | 57 | 6 n8n + 1 FlightPHP + 51 general agents |

---

## 📚 Additional Documentation

| Document | Purpose |
|----------|---------|
| **[CLAUDE.md](CLAUDE.md)** | Repository overview + Context7 integration guide |
| **[WORKFLOW_COORDINATION.md](WORKFLOW_COORDINATION.md)** | GitHub Issues-based agent coordination system |
| **[GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md](GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md)** | Cross-project system rules (file ownership, sudo policy, Redis usage) |
| **[n8n_mcp_best_practices.md](n8n/n8n_mcp_best_practices.md)** | 🔴 CRITICAL: Required for all n8n agents (includes Context7) |
| **[n8n_release_policy.md](n8n/n8n_release_policy.md)** | n8n workflow versioning and deployment policy |
| **[FLIGHTPHP_AGENT_INSTRUCTIONS.md](flightphp/FLIGHTPHP_AGENT_INSTRUCTIONS.md)** | 🔴 CRITICAL: Required for all FlightPHP implementations (includes Context7) |

---

## 📜 License

MIT License - Use freely, commercially or personally.

---

## 🙏 Credits

This fork extends [agency-agents](https://github.com/msitarzewski/agency-agents) by [@msitarzewski](https://github.com/msitarzewski) with:
- 6 n8n workflow automation specialists with SoD compliance
- FlightPHP frontend integration guidelines
- Context7 MCP Server integration for real-time documentation retrieval

The original repository contains 51 agents covering engineering, design, marketing, testing, and more.

**[⭐ Star the original repository](https://github.com/msitarzewski/agency-agents)**

---

<div align="center">

**[⭐ Star this fork](https://github.com/BPMspaceUG/bpm-agency-agents)** • **[🐛 Report Issues](https://github.com/BPMspaceUG/bpm-agency-agents/issues)** • **[📖 Read Docs](CLAUDE.md)**

Built on the foundation by [@msitarzewski](https://github.com/msitarzewski)
Extended with n8n + FlightPHP + Context7 by [BPMspace](https://github.com/BPMspaceUG)

</div>
