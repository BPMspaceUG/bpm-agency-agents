# 🔄 The n8n-Agency

> **Professional n8n workflow automation specialists** - 6 specialized agents with **Separation of Duties (SoD)** compliance for production-grade development, testing, and AI integration.

---

## 🚀 Quick Start

```bash
# Copy agents to your Claude Code directory
cp -r bpm-agency-agents/* ~/.claude/agents/

# Activate agents in Claude Code:
# "activate n8n Orchestrator mode and coordinate this project"
# "activate n8n Solution Architect mode and design user onboarding workflow"
# "activate n8n Developer mode and implement this specification"
# "activate n8n Tester mode and validate with evidence"
```

---

## 🔄 n8n Specialists (6 Agents)

**Production-grade workflow automation with SoD compliance**

| Agent | Phase | Role |
|-------|-------|------|
| 🎯 [n8n Orchestrator](n8n/n8n-orchestrator.md) | **Control** | Project coordination, Go/No-Go decisions |
| 🏗️ [n8n Solution Architect](n8n/n8n-solution-architect.md) | **Design** | Workflow architecture, ADRs, technical specs |
| 💻 [n8n Developer](n8n/n8n-developer.md) | **Build** | Exact implementation per specification |
| 📊 [n8n Runbook & Rollout Manager](n8n/n8n-runbook-rollout-manager.md) | **Operations** | Production deployment, monitoring, rollback |
| ✅ [n8n Tester](n8n/n8n-tester.md) | **Validation** | Evidence-based testing, quality gates |
| 🔍 [n8n Reverse Prompt Developer](n8n/n8n-reverse-prompt-developer.md) | **Documentation** | Workflow reproduction, training docs |

**📚 Mandatory Reading:**
- **[n8n MCP Best Practices](n8n/n8n_mcp_best_practices.md)** - 🔴 **CRITICAL**: Required for ALL n8n agents
- **[n8n Release Policy](n8n/n8n_release_policy.md)** - Versioning and deployment guidelines

**Why Best Practices are Mandatory:**
- Prevents runtime failures from parameter defaults
- Ensures optimal MCP tool usage (templates first, parallel execution)
- Provides correct validation workflow
- Avoids common mistakes (connection syntax, IF node branching)
- Enforces production-grade patterns

---

## 🎨 FlightPHP Frontend Agents

**Frontend-only agents for n8n workflow integration**

FlightPHP agents provide web frontends that integrate tightly with n8n workflows. They handle forms, input validation, and result visualization while delegating all business logic to n8n.

**📚 Mandatory Reading:**
- **[FlightPHP Agent Instructions](flightphp/FLIGHTPHP_AGENT_INSTRUCTIONS.md)** - 🔴 **CRITICAL**: Required for ALL FlightPHP agents

**Key Principles:**
- **Frontend-only** - No business logic in PHP (all logic lives in n8n)
- **Bootstrap 5** - All UI components and layouts
- **DataTables** - All tabular result displays
- **KISS** - Keep It Simple, Stupid (minimal, auditable code)
- **Shared Layout** - Mandatory header/footer partials across all pages
- **Views Only** - No inline HTML in controllers

**Integration Pattern:**
```
User → FlightPHP Form → n8n Workflow → FlightPHP Result Display
```

**Agent Responsibilities:**
- ✅ Render forms and input fields
- ✅ Validate and sanitize user input
- ✅ Call n8n webhooks/APIs
- ✅ Display workflow results with DataTables
- ❌ NEVER implement business logic (belongs in n8n)

**Coordination:**
- n8n agents open GitHub Issues requesting frontends
- FlightPHP agents implement routes/views per specification
- All changes follow `GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md`

---

## 🔄 Standard Handoff Chain

```
n8n-orchestrator → n8n-solution-architect → n8n-developer → n8n-tester → Go/No-Go → n8n-runbook-rollout-manager
                                                                          │
                                                                          └─ NO → Back to n8n-developer
```

**SoD Compliance:**
- ✅ No single role controls end-to-end
- ✅ Clear audit trails with documented handoffs
- ✅ Minimal corruption surface
- ✅ Enterprise governance ready

---

## 📋 Production Workflow Coordination

**GitHub Issues-based coordination system** for managing agent handoffs and n8n workflows.

**📖 [Complete Documentation → WORKFLOW_COORDINATION.md](WORKFLOW_COORDINATION.md)**

**Key Features:**
- GitHub Issues for task handoffs (e.g., `#45 → #46 → #47`)
- Complete audit trail
- Private repository for production workflows
- Automatic n8n → Git backup
- MCP integration (GitHub + n8n)

**Quick Setup:**
```bash
gh repo create company-workflows --private
cd company-workflows
git submodule add https://github.com/BPMspaceUG/bpm-agency-agents.git .claude/agents
# See WORKFLOW_COORDINATION.md for complete setup
```

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

## 🎨 Deliverables
1. Root cause analysis (ADR)
2. Fixed workflow JSON
3. Test evidence: Screenshots showing both success/error responses
4. Updated workflow in production

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

## 🎨 Deliverables
1. Updated workflow architecture (ADR)
2. Modified workflow JSON with Slack integration
3. Test evidence: Screenshot of Slack notification
4. Error handling validation

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
Signed up: 2025-11-09 10:30 UTC

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
- [ ] Review external template/workflow structure
- [ ] Identify reusable components
- [ ] Replace WooCommerce with Shopify nodes
- [ ] Replace Stripe with PayPal integration
- [ ] Add Slack notification (new)
- [ ] Add SMS notification via Twilio (new)
- [ ] Add inventory sync to warehouse API (new)
- [ ] Maintain error handling patterns from template

## 🎨 Deliverables
1. Analysis document: Comparison of template vs requirements
2. Architecture Decision Record (ADR) for customizations
3. New workflow JSON adapted to our stack
4. Test evidence with Shopify test orders
5. Production deployment runbook

## 🔄 Handoff Chain
**Current: n8n-orchestrator** → Next: #TBD (n8n-solution-architect)

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
1. n8n-reverse-prompt-developer analyzes external workflow
2. Documents structure, nodes, patterns
3. Creates adaptation guide
4. Hands off to n8n-solution-architect for redesign

---
**Labels:** agent:n8n-orchestrator, priority:medium, type:n8n-workflow
```

---

## 🎯 Use Cases

### Debug & Fix Workflow
**Problem:** Production workflow failing intermittently

**Team:**
1. **n8n-orchestrator** - Assign debugging task
2. **n8n-solution-architect** - Analyze logs, design fix
3. **n8n-developer** - Implement fix (V+1)
4. **n8n-tester** - Validate with evidence
5. **n8n-orchestrator** - Go/No-Go decision
6. **n8n-runbook-rollout-manager** - Activate, monitor production

**Result:** Validated fix with full audit trail

---

### Reverse Engineer & Rebuild
**Problem:** Ad-hoc workflow without documentation

**Team:**
1. **n8n-reverse-prompt-developer** - Analyze & document existing workflow
2. **n8n-orchestrator** - Assign rebuild project
3. **n8n-solution-architect** - Design optimized architecture
4. **n8n-developer** - Implement new workflow
5. **n8n-tester** - Validate functional equivalency
6. **n8n-runbook-rollout-manager** - Deploy & monitor

**Result:** Production-ready workflow with proper documentation

---

### Iterative Development
**Problem:** Build complex workflow from requirements

**Team:**
1. **n8n-orchestrator** - Intake requirements
2. **n8n-solution-architect** - Design architecture (Gate 1)
3. **n8n-developer** - Implement specification (V+1)
4. **n8n-tester** - Execute comprehensive tests
5. **Iteration Loop** - n8n-developer fixes → n8n-tester validates (repeat until pass)
6. **n8n-orchestrator** - Review evidence (Gate 3), Go/No-Go
7. **n8n-runbook-rollout-manager** - Activate & monitor

**Result:** Production-ready workflow meeting exact specifications

---

## 📜 License

MIT License - Use freely, commercially or personally.

---

## 🙏 Credits

This fork extends [agency-agents](https://github.com/msitarzewski/agency-agents) by [@msitarzewski](https://github.com/msitarzewski) with n8n-specific automation specialists.

The original repository contains 51 agents covering engineering, design, marketing, testing, and more. This fork adds 6 n8n workflow specialists with SoD compliance.

**[⭐ Star the original repository](https://github.com/msitarzewski/agency-agents)**

---

<div align="center">

**[⭐ Star this fork](https://github.com/BPMspaceUG/bpm-agency-agents)** • **[🐛 Report Issues](https://github.com/BPMspaceUG/bpm-agency-agents/issues)**

Built on the foundation by [@msitarzewski](https://github.com/msitarzewski)

</div>
