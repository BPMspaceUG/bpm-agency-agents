# n8n MCP Best Practices

**Mandatory guidelines for all n8n agents working with n8n-MCP tools**

> 🔴 **CRITICAL**: These are not suggestions - they are required practices that prevent runtime failures and ensure production-grade workflows.

---

## 0. PREREQUISITE: Context7 Documentation Retrieval

**🔴 MANDATORY FIRST STEP**: Before any n8n workflow design, development, or testing, **ALWAYS check Context7 MCP Server for latest documentation**.

### Why Context7?
- **Single source of truth** for n8n, FlightPHP, and integration documentation
- **Always up-to-date** - synchronized with official sources
- **Faster than web search** - Redis-backed instant retrieval
- **Prevents outdated practices** - ensures you use latest API patterns

### Context7 Workflow (Execute Before ANY n8n Work)

```javascript
// STEP 1: Check if Context7 MCP is available
// Look for mcp__Context7__* tools in your environment

// STEP 2: Retrieve latest documentation
// For n8n workflows:
mcp__Context7__get({key: "n8n:docs:latest"})
mcp__Context7__get({key: "n8n:best-practices:2025"})
mcp__Context7__get({key: "n8n:node-reference"})

// For FlightPHP integration:
mcp__Context7__get({key: "flightphp:docs:latest"})
mcp__Context7__get({key: "flightphp:n8n-integration"})

// For webhook contracts:
mcp__Context7__get({key: "n8n:webhook-patterns"})
```

### When to Query Context7

| Phase | What to Retrieve | Key Pattern |
|-------|------------------|-------------|
| **Before Design** | Architecture patterns, node capabilities | `n8n:architecture:*`, `n8n:nodes:*` |
| **Before Implementation** | Node documentation, connection patterns | `n8n:node-reference:*`, `n8n:connections:*` |
| **Before Testing** | Test patterns, validation rules | `n8n:testing:*`, `n8n:validation:*` |
| **Before Frontend** | FlightPHP patterns, webhook contracts | `flightphp:*`, `n8n:webhooks:*` |

### Fallback Strategy (If Context7 Unavailable)

If `mcp__Context7__*` tools are NOT available:
1. ⚠️ Log warning: "Context7 MCP not available - using embedded best practices"
2. Proceed with embedded n8n-MCP tool documentation
3. Use `tools_documentation()` from n8n-MCP for reference
4. **Document assumption**: "Using embedded docs - may not reflect latest n8n updates"

### Integration with Orchestrator

**n8n-orchestrator** must:
- ✅ Verify Context7 availability at project start
- ✅ Include Context7 check in all agent sub-issues
- ✅ Document Context7 retrieval status in project charter

**Example sub-issue text:**
```markdown
## 📚 MANDATORY: Context7 Documentation Check

Before starting work, retrieve latest documentation:
- `mcp__Context7__get({key: "n8n:docs:latest"})`
- `mcp__Context7__get({key: "n8n:node-reference"})`

If Context7 unavailable: document fallback strategy.
```

---

## Core Principles

### 1. Silent Execution
**CRITICAL**: Execute tools without commentary. Only respond AFTER all tools complete.

❌ **BAD**: "Let me search for Slack nodes... Great! Now let me get details..."
✅ **GOOD**: [Execute search_nodes and get_node_essentials in parallel, then respond]

**Why:** Excessive commentary wastes tokens and slows execution. Users want results, not narration.

---

### 2. Parallel Execution
When operations are independent, execute them in parallel for maximum performance.

✅ **GOOD**: Call search_nodes, list_nodes, and search_templates simultaneously
❌ **BAD**: Sequential tool calls (await each one before the next)

**Example:**
```
// ✅ PARALLEL - All at once
search_nodes({query: 'slack', includeExamples: true})
list_nodes({category: 'communication'})
search_templates('slack notification')

// ❌ SEQUENTIAL - Slow
search_nodes() → wait → list_nodes() → wait → search_templates()
```

---

### 3. Templates First
**ALWAYS check templates before building from scratch** (2,709 available).

**Why:** Templates are battle-tested, production-ready workflows created by the community.

**Order of preference:**
1. `search_templates_by_metadata()` - Smart filtering
2. `get_templates_for_task()` - Curated by task
3. `search_templates()` - Text search
4. Build from scratch (last resort)

---

### 4. Multi-Level Validation
Use validate_node_minimal → validate_node_operation → validate_workflow pattern.

**Validation Levels:**

| Level | Tool | When | Speed | Purpose |
|-------|------|------|-------|---------|
| 1 | `validate_node_minimal` | Before building | <100ms | Required fields only |
| 2 | `validate_node_operation` | Before building | ~500ms | Full validation + fixes |
| 3 | `validate_workflow` | After building | ~1s | Complete workflow check |
| 4 | `n8n_validate_workflow` | Post-deployment | ~2s | Deployed workflow validation |

---

### 5. Never Trust Defaults ⚠️

**🔴 CRITICAL**: Default parameter values are the #1 source of runtime failures.

**ALWAYS explicitly configure ALL parameters that control node behavior.**

**Example - Slack Node:**

```json
// ❌ FAILS at runtime
{
  "resource": "message",
  "operation": "post",
  "text": "Hello"
}

// ✅ WORKS - All parameters explicit
{
  "resource": "message",
  "operation": "post",
  "select": "channel",
  "channelId": "C123456",
  "text": "Hello"
}
```

**Why it fails:** The Slack node requires `select` (channel/user) and `channelId`/`userId`. Defaults don't work.

---

## Workflow Process

### 1. Start
Call `tools_documentation()` for best practices and available tools.

---

### 2. Template Discovery Phase (FIRST - parallel when searching multiple)

**Smart Filtering Strategies:**

```javascript
// Beginners
search_templates_by_metadata({
  complexity: "simple",
  maxSetupMinutes: 30
})

// By role
search_templates_by_metadata({
  targetAudience: "marketers"  // or "developers" or "analysts"
})

// By time constraint
search_templates_by_metadata({
  maxSetupMinutes: 15  // Quick wins
})

// By required service
search_templates_by_metadata({
  requiredService: "openai"  // Compatibility check
})

// Curated by task
get_templates_for_task('webhook_processing')

// Text search
search_templates('slack notification')

// By node type
list_node_templates(['n8n-nodes-base.slack'])
```

---

### 3. Node Discovery (if no suitable template - parallel execution)

**Think deeply about requirements. Ask clarifying questions if unclear.**

```javascript
// Parallel for multiple nodes
search_nodes({query: 'slack', includeExamples: true})
search_nodes({query: 'webhook', includeExamples: true})

// Browse by category
list_nodes({category: 'trigger'})

// AI-capable nodes
list_ai_tools()
```

---

### 4. Configuration Phase (parallel for multiple nodes)

```javascript
// 10-20 key properties + examples
get_node_essentials(nodeType, {includeExamples: true})

// Find specific properties
search_node_properties(nodeType, 'auth')

// Human-readable docs (87% coverage)
get_node_documentation(nodeType)
```

**MANDATORY:** Show workflow architecture to user for approval before proceeding.

---

### 5. Validation Phase (parallel for multiple nodes)

```javascript
// Quick required fields check
validate_node_minimal(nodeType, config)

// Full validation with automatic fixes
validate_node_operation(nodeType, config, 'runtime')
```

**⚠️ Fix ALL errors before proceeding.**

---

### 6. Building Phase

**If using template:**
```javascript
get_template(templateId, {mode: "full"})
```

**🔴 MANDATORY ATTRIBUTION:**
```
"Based on template by **[author.name]** (@[username]). View at: [url]"
```

**If building from scratch:**
- Build from validated configurations
- **⚠️ EXPLICITLY set ALL parameters** - never rely on defaults
- Connect nodes with proper structure
- Add error handling
- Use n8n expressions: `$json`, `$node["NodeName"].json`
- Build in artifact (unless deploying to n8n instance)

---

### 7. Workflow Validation (before deployment)

```javascript
// Complete validation
validate_workflow(workflow)

// Structure check
validate_workflow_connections(workflow)

// Expression validation
validate_workflow_expressions(workflow)
```

**Fix ALL issues before deployment.**

---

### 8. Deployment (if n8n API configured)

```javascript
// Deploy
n8n_create_workflow(workflow)

// Post-deployment check
n8n_validate_workflow({id})

// Batch updates
n8n_update_partial_workflow({id, operations: [...]})

// Test webhooks
n8n_trigger_webhook_workflow()
```

---

## Critical Warnings

### ⚠️ Never Trust Defaults

Default values cause runtime failures. **Example:**

```json
// ❌ FAILS at runtime
{resource: "message", operation: "post", text: "Hello"}

// ✅ WORKS - all parameters explicit
{resource: "message", operation: "post", select: "channel", channelId: "C123", text: "Hello"}
```

---

### ⚠️ Example Availability

`includeExamples: true` returns real configurations from workflow templates.

- **Coverage varies** by node popularity
- When no examples available, use `get_node_essentials` + `validate_node_minimal`

---

## Validation Strategy

### Level 1 - Quick Check (before building)
`validate_node_minimal(nodeType, config)` - Required fields only (<100ms)

### Level 2 - Comprehensive (before building)
`validate_node_operation(nodeType, config, 'runtime')` - Full validation with fixes

### Level 3 - Complete (after building)
`validate_workflow(workflow)` - Connections, expressions, AI tools

### Level 4 - Post-Deployment
1. `n8n_validate_workflow({id})` - Validate deployed workflow
2. `n8n_autofix_workflow({id})` - Auto-fix common errors
3. `n8n_list_executions()` - Monitor execution status

---

## Response Format

### Initial Creation
```
[Silent tool execution in parallel]

Created workflow:
- Webhook trigger → Slack notification
- Configured: POST /webhook → #general channel

Validation: ✅ All checks passed
```

### Modifications
```
[Silent tool execution]

Updated workflow:
- Added error handling to HTTP node
- Fixed required Slack parameters

Changes validated successfully.
```

---

## Batch Operations

**Use `n8n_update_partial_workflow` with multiple operations in a single call.**

✅ **GOOD - Batch multiple operations:**
```json
n8n_update_partial_workflow({
  id: "wf-123",
  operations: [
    {type: "updateNode", nodeId: "slack-1", changes: {...}},
    {type: "updateNode", nodeId: "http-1", changes: {...}},
    {type: "cleanStaleConnections"}
  ]
})
```

❌ **BAD - Separate calls:**
```json
n8n_update_partial_workflow({id: "wf-123", operations: [{...}]})
n8n_update_partial_workflow({id: "wf-123", operations: [{...}]})
```

---

## 🔴 CRITICAL: addConnection Syntax

The `addConnection` operation requires **four separate string parameters**. Common mistakes cause misleading errors.

❌ **WRONG - Object format** (fails with "Expected string, received object"):
```json
{
  "type": "addConnection",
  "connection": {
    "source": {"nodeId": "node-1", "outputIndex": 0},
    "destination": {"nodeId": "node-2", "inputIndex": 0}
  }
}
```

❌ **WRONG - Combined string** (fails with "Source node not found"):
```json
{
  "type": "addConnection",
  "source": "node-1:main:0",
  "target": "node-2:main:0"
}
```

✅ **CORRECT - Four separate string parameters:**
```json
{
  "type": "addConnection",
  "source": "node-id-string",
  "target": "target-node-id-string",
  "sourcePort": "main",
  "targetPort": "main"
}
```

**Reference:** [GitHub Issue #327](https://github.com/czlonkowski/n8n-mcp/issues/327)

---

## ⚠️ CRITICAL: IF Node Multi-Output Routing

IF nodes have **two outputs** (TRUE and FALSE). Use the **`branch` parameter** to route to the correct output.

✅ **CORRECT - Route to TRUE branch** (when condition is met):
```json
{
  "type": "addConnection",
  "source": "if-node-id",
  "target": "success-handler-id",
  "sourcePort": "main",
  "targetPort": "main",
  "branch": "true"
}
```

✅ **CORRECT - Route to FALSE branch** (when condition is NOT met):
```json
{
  "type": "addConnection",
  "source": "if-node-id",
  "target": "failure-handler-id",
  "sourcePort": "main",
  "targetPort": "main",
  "branch": "false"
}
```

**Common Pattern - Complete IF node routing:**
```json
n8n_update_partial_workflow({
  id: "workflow-id",
  operations: [
    {type: "addConnection", source: "If Node", target: "True Handler", sourcePort: "main", targetPort: "main", branch: "true"},
    {type: "addConnection", source: "If Node", target: "False Handler", sourcePort: "main", targetPort: "main", branch: "false"}
  ]
})
```

**Note:** Without the `branch` parameter, both connections may end up on the same output, causing logic errors!

---

### removeConnection Syntax

Use the same four-parameter format:
```json
{
  "type": "removeConnection",
  "source": "source-node-id",
  "target": "target-node-id",
  "sourcePort": "main",
  "targetPort": "main"
}
```

---

## Example Workflows

### Template-First Approach

```javascript
// STEP 1: Template Discovery (parallel execution)
[Silent execution]
search_templates_by_metadata({
  requiredService: 'slack',
  complexity: 'simple',
  targetAudience: 'marketers'
})
get_templates_for_task('slack_integration')

// STEP 2: Use template
get_template(templateId, {mode: 'full'})
validate_workflow(workflow)

// Response after all tools complete:
"Found template by **David Ashby** (@cfomodz).
View at: https://n8n.io/workflows/2414

Validation: ✅ All checks passed"
```

---

### Building from Scratch (if no template)

```javascript
// STEP 1: Discovery (parallel execution)
[Silent execution]
search_nodes({query: 'slack', includeExamples: true})
list_nodes({category: 'communication'})

// STEP 2: Configuration (parallel execution)
[Silent execution]
get_node_essentials('n8n-nodes-base.slack', {includeExamples: true})
get_node_essentials('n8n-nodes-base.webhook', {includeExamples: true})

// STEP 3: Validation (parallel execution)
[Silent execution]
validate_node_minimal('n8n-nodes-base.slack', config)
validate_node_operation('n8n-nodes-base.slack', fullConfig, 'runtime')

// STEP 4: Build
// Construct workflow with validated configs
// ⚠️ Set ALL parameters explicitly

// STEP 5: Validate
[Silent execution]
validate_workflow(workflowJson)

// Response after all tools complete:
"Created workflow: Webhook → Slack
Validation: ✅ Passed"
```

---

### Batch Updates

```json
// ONE call with multiple operations
n8n_update_partial_workflow({
  id: "wf-123",
  operations: [
    {type: "updateNode", nodeId: "slack-1", changes: {position: [100, 200]}},
    {type: "updateNode", nodeId: "http-1", changes: {position: [300, 200]}},
    {type: "cleanStaleConnections"}
  ]
})
```

---

## Important Rules

### Core Behavior
1. **Silent execution** - No commentary between tools
2. **Parallel by default** - Execute independent operations simultaneously
3. **Templates first** - Always check before building (2,709 available)
4. **Multi-level validation** - Quick check → Full validation → Workflow validation
5. **Never trust defaults** - Explicitly configure ALL parameters

### Attribution & Credits
- **MANDATORY TEMPLATE ATTRIBUTION**: Share author name, username, and n8n.io link
- **Template validation** - Always validate before deployment (may need updates)

### Performance
- **Batch operations** - Use diff operations with multiple changes in one call
- **Parallel execution** - Search, validate, and configure simultaneously
- **Template metadata** - Use smart filtering for faster discovery

### Code Node Usage
- **Avoid when possible** - Prefer standard nodes
- **Only when necessary** - Use code node as last resort
- **AI tool capability** - ANY node can be an AI tool (not just marked ones)

---

## Most Popular n8n Nodes

**For `get_node_essentials` reference:**

1. **n8n-nodes-base.code** - JavaScript/Python scripting
2. **n8n-nodes-base.httpRequest** - HTTP API calls
3. **n8n-nodes-base.webhook** - Event-driven triggers
4. **n8n-nodes-base.set** - Data transformation
5. **n8n-nodes-base.if** - Conditional routing
6. **n8n-nodes-base.manualTrigger** - Manual workflow execution
7. **n8n-nodes-base.respondToWebhook** - Webhook responses
8. **n8n-nodes-base.scheduleTrigger** - Time-based triggers
9. **@n8n/n8n-nodes-langchain.agent** - AI agents
10. **n8n-nodes-base.googleSheets** - Spreadsheet integration
11. **n8n-nodes-base.merge** - Data merging
12. **n8n-nodes-base.switch** - Multi-branch routing
13. **n8n-nodes-base.telegram** - Telegram bot integration
14. **@n8n/n8n-nodes-langchain.lmChatOpenAi** - OpenAI chat models
15. **n8n-nodes-base.splitInBatches** - Batch processing
16. **n8n-nodes-base.openAi** - OpenAI legacy node
17. **n8n-nodes-base.gmail** - Email automation
18. **n8n-nodes-base.function** - Custom functions
19. **n8n-nodes-base.stickyNote** - Workflow documentation
20. **n8n-nodes-base.executeWorkflowTrigger** - Sub-workflow calls

**Note:** LangChain nodes use the `@n8n/n8n-nodes-langchain.` prefix, core nodes use `n8n-nodes-base.`

---

## Summary: Non-Negotiable Rules

🔴 **These are MANDATORY, not optional:**

1. ✅ **Silent execution** - No commentary during tool calls
2. ✅ **Parallel execution** - Independent operations run simultaneously
3. ✅ **Templates first** - Check 2,709 templates before building from scratch
4. ✅ **Multi-level validation** - Minimal → Operation → Workflow
5. ✅ **Never trust defaults** - Explicitly set ALL parameters
6. ✅ **Batch operations** - Multiple changes in one call
7. ✅ **Correct connection syntax** - Four string parameters for addConnection
8. ✅ **IF node branching** - Use `branch: "true"` or `branch: "false"`
9. ✅ **Template attribution** - Credit author, username, link
10. ✅ **Show architecture** - Get user approval before building

**Violation of these rules leads to:**
- Runtime failures
- Silent errors
- Poor performance
- Production incidents
- Wasted development time

---

**For questions or clarifications:** See [n8n-MCP Documentation](https://github.com/czlonkowski/n8n-mcp)
