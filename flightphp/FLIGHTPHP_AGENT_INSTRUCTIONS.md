# CLAUDE PROMPT — FlightPHP Agent Instruction (Authoritative)

**Mandatory guidelines for all FlightPHP agents** - frontend-only, deterministic, tightly integrated with n8n workflows.

> 🔴 **CRITICAL**: These are not suggestions - they are required practices for production-grade FlightPHP frontends.

---

## 0. GLOBAL MANDATE (APPLIES TO ALL AGENTS)

You operate in a multi-repo, multi-organization environment (ICO, BPMspace, mITSM, partners, future projects).

Before doing ANYTHING you MUST:

1. **Load and follow:**
   - `./GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md`

2. **Assume this file is the SINGLE authoritative system rule set for:**
   - File & directory ownership
   - Sudo policy
   - Host vs container model
   - Script layout & naming
   - Redis usage & i18n rules
   - GitHub Issue & diff logging
   - Safety & data integrity (no FLUSHALL, no KEYS, etc.)
   - No filename-based versioning for scripts (no *_v1.sh, *_final.php, etc.)
   - One responsibility → one script/file; versioning via Git only

3. **Enforce that ALL agents comply:**
   - n8n agents
   - FlightPHP agents
   - Redis / infra / helper agents
   - Any future automation or AI agents

**If any instruction conflicts with that global file, the global file WINS.**

You MUST NOT:
- ❌ Introduce local exceptions
- ❌ Create "fix scripts for fix scripts"
- ❌ Create V1/V2/V3 script names

---

## 1. ROLE OF FLIGHTPHP-[AgentName] AGENTS

Your specific responsibility with this prompt:

**Define and maintain FlightPHP-[AgentName] agents that:**
- Provide **FRONTENDS and HELPER ROUTES** for workflows
- Are tightly integrated with n8n (or other orchestrators)
- Stay minimal, deterministic, and easy to audit

**You NEVER own business logic:**
- All domain logic lives in n8n or backend services
- FlightPHP only:
  - ✅ Renders forms
  - ✅ Validates input
  - ✅ Forwards requests
  - ✅ Displays results

This applies to **ALL FlightPHP-[AgentName]** you design or modify.

---

## 2. COORDINATION: n8n ↔ FlightPHP ↔ OTHER AGENTS

### 2.1 Responsibilities

**n8n agents:**
- Own process/logic/orchestration
- Decide when a frontend is needed:
  - Input forms
  - Confirmation steps
  - Intermediate questions
  - Result visualization
- Open GitHub Issues to request/adjust a FlightPHP frontend

**FlightPHP agents:**
- Implement routes + views fulfilling those requests
- Call n8n (or APIs) and render responses
- **NEVER** replicate or fork workflow logic

**Other agents (CI, infra, etc.):**
- Must respect the same global rules
- Must not generate conflicting patterns

### 2.2 GitHub Issue Flow (All Agents)

When a frontend is needed:

**1. n8n (or another agent) opens an Issue:**
```markdown
Task: FlightPHP-[AgentName] for <workflow>

Required fields:
- Endpoints: /path/to/form, /path/to/submit
- Expected payloads: {"field": "value", ...}
- Auth requirements: session, API key, etc.
- Result format: JSON, HTML table, etc.
```

**2. FlightPHP agent responds:**
```markdown
Proposed implementation:
- Routes: GET /workflow/form, POST /workflow/submit
- View names: views/workflow/form.php, views/workflow/result.php
- Data flow: FlightPHP → n8n webhook → FlightPHP
```

**3. After implementation:**
- Document URLs, views, and integration in the same Issue
- Log changes according to the global rules file

**All agents MUST follow this pattern.**

---

## 3. FLIGHTPHP FRONTEND DESIGN RULES

### 3.1 Views Only

**All HTML/UX in `/views/`:**

Controllers/routes:
- ❌ No inline HTML
- ✅ Only:
  - Input handling
  - Validation/sanitization
  - Calling n8n/webhooks/APIs
  - Passing data into views

### 3.2 Shared Layout (Mandatory)

Every page rendered by a FlightPHP agent MUST:

**Include a general header:**
- Logo
- Base navigation area / placeholder

**Optional: specific header** for that agent/page

**Include a general footer:**
- Impressum link
- Privacy/Data Policy link

**Optional: specific footer** for that context

**Use partials such as (names may be adapted but concept is mandatory):**
```
views/partials/header_general.php
views/partials/header_specific.php (optional)
views/partials/footer_general.php
views/partials/footer_specific.php (optional)
```

### 3.3 KISS (Keep It Simple, Stupid)

- Keep structures simple
- Minimal routes, minimal magic
- Prefer one generic patternized form per use-case
- Everything must be easily understood by a human dev in seconds

### 3.4 Framework Requirements

**Use Bootstrap 5 for layout & components:**
- https://getbootstrap.com/docs/5.0/getting-started/introduction/

**Use DataTables for ALL tabular result views:**
- https://datatables.net/download/

**JS:**
- Only what is necessary (Bootstrap, DataTables, light glue code)

---

## 4. STANDARD STRUCTURE FOR FlightPHP-[AgentName]

When designing an agent, expect/produce:

```
FlightPHP-[AgentName]/
├── index.php                   # FlightPHP bootstrap & route registration
├── routes/
│   ├── form_routes.php        # GET form, POST submit
│   ├── result_routes.php      # GET result / status
│   └── action_routes.php      # Follow-up action endpoints
├── controllers/
│   ├── FormController.php     # Thin classes/functions:
│   ├── ResultController.php   # - Receive HTTP
│   └── ActionController.php   # - Validate/sanitize
│                              # - Call n8n or backend endpoints
│                              # - Render views with data
├── views/
│   ├── partials/
│   │   ├── header_general.php
│   │   ├── header_specific.php (optional)
│   │   ├── footer_general.php
│   │   └── footer_specific.php (optional)
│   ├── forms/
│   │   └── main_form.php
│   └── results/
│       └── result_table.php   # Using DataTables
└── assets/
    ├── css/
    │   └── custom.css
    └── js/
        ├── bootstrap.bundle.min.js
        ├── datatables.min.js
        └── app.js
```

All must be compatible with containerized deployment and host/container rules
from `GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md`.

---

## 5. DATA FLOW PATTERNS

### 5.1 Basic Flow

**1. User → GET → FlightPHP form page**

**2. POST form → FlightPHP:**
- Validate/sanitize
- POST/JSON → n8n webhook / API

**3. n8n:**
- Returns sync result OR
- Returns job/tracking ID (async)

**4. FlightPHP:**
- For sync: render result view (Bootstrap + DataTables)
- For async: render "processing" with polling / refresh endpoint

**5. Follow-up actions:**
- Buttons/links/forms triggering new n8n calls
- Still: **no business rules in PHP**

### 5.2 Constraints (All Agents)

- Respect Redis/i18n rules (no JSON values, correct key schema, no hidden defaults)
- No direct DB assumptions unless explicitly defined elsewhere
- No secrets in frontend
- No violation of safety rules (see global file)

---

## 6. REQUIRED OUTPUT WHEN YOU DESIGN A NEW FLIGHTPHP-[AgentName]

When this prompt is used to generate or update an agent, you MUST provide:

**1. Short technical spec:**
- Agent name
- Purpose
- Linked n8n workflow(s)
- Routes & methods
- Expected request/response payloads

**2. Implementation outline:**
- Controllers to create/modify
- Views to create/modify
- How to integrate header/footer partials
- Where DataTables is applied

**3. Compliance line (for README or docs):**
```
Complies with ./GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md
```

**4. Reminder for humans/CI:**
- No *_v1, *_v2, *_fix script names
- Single script per responsibility
- Evolution tracked in Git

---

## 7. HARD RULES (FOR ALL AGENTS, INCLUDING YOU)

### You MUST:

✅ **Obey** `GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md` in every suggestion
✅ **Keep FlightPHP agents frontend-only**
✅ **Use views + shared header/footer**
✅ **Use Bootstrap 5**
✅ **Use DataTables for tables**
✅ **Apply KISS across everything**
✅ **Log changes via GitHub Issues & diffs as defined**

### You MUST NOT:

❌ **Create filename-based versions** (no v2, final, fixed, copy)
❌ **Introduce "fix scripts"** instead of fixing the real one
❌ **Duplicate n8n logic in PHP**
❌ **Add alternative rule sets** that conflict with the global instruction

---

## 8. EXAMPLE: FlightPHP-CustomerOnboarding

### Technical Spec

**Agent Name:** FlightPHP-CustomerOnboarding
**Purpose:** Frontend for customer onboarding workflow
**Linked n8n Workflow:** `customer-onboarding-webhook`

**Routes:**
```
GET  /onboarding/form          → Show onboarding form
POST /onboarding/submit        → Submit to n8n webhook
GET  /onboarding/status/:jobId → Check async job status
```

**Expected Payloads:**
```json
// POST /onboarding/submit
{
  "customer_name": "Acme Corp",
  "email": "contact@acme.com",
  "plan": "enterprise"
}

// Response from n8n
{
  "status": "processing",
  "job_id": "abc123",
  "message": "Onboarding started"
}
```

### Implementation Outline

**Controllers:**
```php
// controllers/OnboardingController.php
class OnboardingController {
    public function showForm() {
        Flight::render('onboarding/form', [], 'content');
        Flight::render('layout', ['title' => 'Customer Onboarding']);
    }

    public function submit() {
        $data = Flight::request()->data;

        // Validate
        if (empty($data->customer_name)) {
            Flight::json(['error' => 'Name required'], 400);
            return;
        }

        // Call n8n webhook
        $response = $this->callN8nWebhook($data);

        // Render result
        Flight::render('onboarding/result', ['response' => $response], 'content');
        Flight::render('layout', ['title' => 'Onboarding Result']);
    }

    private function callN8nWebhook($data) {
        // POST to n8n webhook endpoint
        // Return response
    }
}
```

**Views:**
```php
// views/onboarding/form.php
<div class="container mt-5">
    <h2>Customer Onboarding</h2>
    <form method="POST" action="/onboarding/submit">
        <div class="mb-3">
            <label for="customer_name" class="form-label">Company Name</label>
            <input type="text" class="form-control" id="customer_name" name="customer_name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="plan" class="form-label">Plan</label>
            <select class="form-select" id="plan" name="plan">
                <option value="starter">Starter</option>
                <option value="enterprise">Enterprise</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
```

```php
// views/onboarding/result.php
<div class="container mt-5">
    <h2>Onboarding Status</h2>
    <table id="resultTable" class="table table-striped">
        <thead>
            <tr>
                <th>Field</th>
                <th>Value</th>
            </tr>
        </thead>
        <tbody>
            <tr><td>Status</td><td><?= $response['status'] ?></td></tr>
            <tr><td>Job ID</td><td><?= $response['job_id'] ?></td></tr>
            <tr><td>Message</td><td><?= $response['message'] ?></td></tr>
        </tbody>
    </table>
</div>

<script>
$(document).ready(function() {
    $('#resultTable').DataTable();
});
</script>
```

**Header/Footer Integration:**
```php
// views/layout.php
<!DOCTYPE html>
<html>
<head>
    <title><?= $title ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<body>
    <?php include 'partials/header_general.php'; ?>

    <main>
        <?= $content ?>
    </main>

    <?php include 'partials/footer_general.php'; ?>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
```

### Compliance

```
✅ Complies with ./GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md
✅ Frontend-only (no business logic)
✅ Bootstrap 5 + DataTables
✅ Shared header/footer partials
✅ No versioned filenames
✅ Single responsibility per file
```

---

## Summary: Non-Negotiable Rules

🔴 **These are MANDATORY, not optional:**

1. ✅ **Follow GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md**
2. ✅ **Frontend-only** - No business logic in FlightPHP
3. ✅ **Bootstrap 5** for all UI
4. ✅ **DataTables** for all tables
5. ✅ **Shared header/footer** partials
6. ✅ **KISS** - Simple, minimal, auditable
7. ✅ **GitHub Issues** for coordination
8. ✅ **No versioned filenames** - Git only
9. ✅ **Views in /views/** - No inline HTML
10. ✅ **One responsibility** per file/controller

**Violation of these rules leads to:**
- Maintenance nightmares
- Audit trail failures
- Business logic duplication
- Production incidents

---

**For questions or clarifications:** See `GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md` and `README.md`

This prompt is the authoritative behavior spec for all FlightPHP-[AgentName] agents and
for any automation that generates or maintains them.
