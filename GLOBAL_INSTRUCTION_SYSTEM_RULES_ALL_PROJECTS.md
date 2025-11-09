# 📌 GLOBAL INSTRUCTION — SYSTEM / NON-NEGOTIABLE RULES (Future-Only)

These rules apply to **all projects and organizations** (e.g. BPMspace, ICO, mITSM, partners, and all future environments).  
They are authoritative and replace all previous conventions.  
They apply in **DEV**, **TEST**, and **PROD**.

There is **exactly one** canonical rules file per repository:

- `./GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md` (this file)
- Optional alias (same content, same directory):
  - `./GLOBAL_INSTRUCTION_SYSTEM_RULES.md` → symlink or identical file

No other copies in subdirectories. No versioned variants of this file.

---

## 1. File & Directory Ownership

- **DEV:** after creating files or directories:
  ```bash
  sudo chown -R $USER:www-data .
  ```
- **TEST/PROD:** after creating files or directories:
  ```bash
  sudo chown -R www-data:www-data .
  ```

---

## 2. Sudo Policy

- Always run commands **without** `sudo` first.
- If a command fails due to permissions, rerun **immediately** with `sudo`.
- Do **not** invent alternative hacks before retrying with `sudo`.

---

## 3. Explicitly Approved Commands

Always allowed:

```bash
sudo docker compose -f docker-compose.DEV.yml ANYTHING_HERE
sudo gh issue ANYTHING_HERE
```

---

## 4. Scope Obedience

- Do **genau** what the task requires.
- Do **not** optimize, refactor, or reorganize unless explicitly requested.
- If something is ambiguous:
  - Choose the **smallest, safest** interpretation.
  - Document that assumption in the issue/PR.

---

## 5. Change Policy (NO SCRIPT VERSION ZOO)

- Prefer **edits over additions**.
- **No cloned variants** like:
  - `*_v1.sh`, `*_v2.sh`, `*_final.sh`, `*_fix.sh`, `*_copy.sh`
  - `script.old.php`, `script_new.php`, etc.
- **No extra “fix scripts”** that only exist to fix previous broken fix scripts.
- For each logical responsibility there should be **ONE script or ONE PHP entry**, named cleanly.
- If behavior changes:
  - Update the **existing** script.
  - Track history and versions in **Git**, not in the filename.
- Create a new file only if:
  - There is a **new distinct responsibility**, and
  - No suitable existing file can be cleanly extended.
  - The purpose is clearly documented.

This applies to:
- Bash scripts
- PHP scripts
- Any operational tooling

---

## 6. Execution Model (Host vs Container)

The Development AI Agent (e.g. Claude, Codex CLI) runs on the **Docker host**.

### 6.1 Host Scripts

- Location: `scripts/<service>/host/`
- Responsibilities:
  - Call container scripts via `sudo docker compose … exec …`
  - Or perform allowed **host-only** logic.

**Naming:**

- `cont_*.sh` → host wrapper that calls a container script.  
  Example: `cont_redisbackup.sh`
- `ext_*.sh` → pure host-only logic (e.g. curl checks).  
  Example: `ext_probe_frontend.sh`

### 6.2 Container Scripts

- Location: `scripts/<service>/container/`
- Invoked via:
  ```bash
  sudo docker compose -f docker-compose.DEV.yml exec <service> sh -lc "/var/script/<file>"
  # or
  sudo docker compose -f docker-compose.DEV.yml exec <service> sh -lc "/opt/scripts/<file>"
  ```
- **Main operational logic** should live here whenever possible.

### 6.3 Mount Rule

- Mount only the **lowest-level** `container/` folder into containers.
- Do not mount repo root into containers.

### 6.4 General Rule

- Default: logic in **container** scripts.
- Host scripts: **thin wrappers** that delegate into container scripts.

### 6.5 Exception: Host-only Logic

Allowed only if:

- Interacting from outside (health checks, DNS/CDN/CI/CD, packaging, backups).
- No assumptions about container internals.
- Uses only host tools.

Such scripts **must** start with:

```bash
# HOST-ONLY SCRIPT: runs on Docker host; no container equivalent.
```

### 6.6 Test Scripts

- Suffix: `.test.sh`
- Types:
  - `cont_*.test.sh` → host calling container logic.
  - `ext_*.test.sh` → external probes.
  - `*.test.sh` under `container/` → in-container checks.
- Must be:
  - lightweight
  - idempotent
  - non-destructive
- **Never** run test scripts in PROD.

Example:  
`/scripts/redis/host/redischangeworkflow.test.sh` tests:
`backup → copy → edit → delete → import → verify`.

---

## 7. Safety & Data Integrity

### Redis

- Never use `FLUSHALL`.
- In TEST/PROD: never use `FLUSHDB` (only allowed in controlled DEV scripts).
- Never use blocking `KEYS`:
  - Always use `SCAN` with `MATCH` + `COUNT`.
- Preserve tests unless explicitly removed.

---

## 8. Diff Hygiene

- Minimal diffs only.
- No cosmetic-only reformatting unless requested.
- No broad renames.
- Follow existing style in each repo.

---

## 9. Output Discipline

Each change (by human or AI) must:

- Summarize:
  - **WHAT** was changed.
  - **WHY** it was changed.
- If a new file is added:
  - Explicitly mention it.
  - Justify its existence.

---

## 10. GitHub Issue & Diff Logging (Mandatory)

Every non-trivial change must be backed by a GitHub Issue.

**Template:**

```text
Title: Task: <short summary>
Labels: test (and others as needed)

1. Initial prompt / requirement
2. Scope & assumptions
3. Machine outputs:
   - git status --porcelain
   - git diff --name-status
   - git log -1 --pretty=fuller
4. Diff/PR reference:
   - gh pr diff --patch OR git diff -U0
5. Verification checklist (commands + expected results)
6. Rollback notes (backup branch + revert/reset commands)
```

---

## 11. Redis Usage Policy

### Purpose

- **Content/i18n store:**
  - All UI text & templates go into Redis.
  - No file-based i18n in runtime code.
- **Runtime store:**
  - Sessions, tokens, enrollments.
  - Logs and metrics (with TTL/rotation as needed).

### Strict Rules

- **No JSON values.**  
  Flatten everything into scalar keys.
- **No hardcoded fallbacks.**  
  Missing keys must trigger visible errors.
- **No org separation in key names.**  
  Org separation is infra-level (DB/container), not key-level.
- Values are:
  - plain strings
  - or HTML blobs

### Example Key Patterns

Shared:

```text
i18n:shared:header:<lang>:html
i18n:shared:footer:<lang>:html
```

Service-scoped `<servicename>`:

```text
i18n:svc:<servicename>:mail:<tpl>:<lang>:subject
i18n:svc:<servicename>:mail:<tpl>:<lang>:text
i18n:svc:<servicename>:mail:<tpl>:<lang>:html

i18n:svc:<servicename>:login_form:<lang>:title
i18n:svc:<servicename>:login_form:<lang>:label.email
i18n:svc:<servicename>:login_form:<lang>:cta.login

i18n:svc:<servicename>:token_request_form:<lang>:html
```

Runtime:

```text
sess:<servicename>:<user_or_device_id>
tok:<servicename>:enrollment:<token>
auth:<servicename>:user:<email>
log:<servicename>:<yyyy-mm-dd>:<uuid>
met:<servicename>:<name>
```

### Migration

- Flatten all legacy JSON/org-based keys.
- No silent defaults.
- Update only the **single authoritative seed/bootstrap**.

### Verification

- Test at least 2 languages.
- Confirm:
  - no JSON
  - TTLs on runtime keys
  - no `:org:` in keys

---

## 12. Redis Content Change Procedure

Standard workflow (all envs):

1. **Backup**:
   - Run `redisbackup.sh` → creates `seed.redis` + timestamped copy.
2. **Copy**:
   - Duplicate `seed.redis` → `seed.edit.redis`.
3. **Edit**:
   - Modify via valid Redis commands:
     - `SET`, `DEL`, `EXPIRE`
   - No JSON, no defaults.
4. **Delete**:
   - Run `redisdelete.sh` (rules per env: no `FLUSHALL`, `FLUSHDB` only in allowed cases).
5. **Import**:
   - Run `rediswrite.sh` to load `seed.edit.redis`.
6. **Verify**:
   - Run `redisverify.sh` or manual:
     - DBSIZE
     - Sample `GET`s
     - no JSON
     - no `:org:`
     - correct TTLs

**Guardrails:**

- CI fails if required wrapper scripts are missing or bypassed.
- No manual `redis-cli` in PROD.
- Rollback = import last good timestamped backup via same scripts.

---

## 13. Cross-Agent Coordination (n8n ↔ FlightPHP)

### Roles

- **n8n agents**:
  - Own workflows & logic.
- **FlightPHP agents**:
  - Own forms, views, and result presentation.

### Collaboration Rules

- n8n opens GitHub Issue when a frontend is needed.
- FlightPHP agent:
  - defines routes
  - implements views
  - calls n8n webhooks
  - responds in same Issue with details.

### FlightPHP Standards

- ALWAYS use views (`/views/`).
- NEVER echo HTML directly from controllers.
- Use shared partials:
  ```text
  views/partials/header_general.php
  views/partials/header_specific.php (optional)
  views/partials/footer_general.php
  views/partials/footer_specific.php (optional)
  ```
- Every page:
  - general header with logo/nav
  - general footer with Impressum & privacy
- Use:
  - **Bootstrap 5**
  - **DataTables** for all tables
- Apply **KISS**:
  - minimal, clear, auditable.

---

## 14. Enforcement

- Applies to all contributors (humans, scripts, AI agents).
- No filename-based versioning for scripts.
- No rule forks per repo.
- Violations must be corrected by:
  - updating the **one** canonical script/file
  - documenting the fix in Git.

This file is the **single source of truth** for system behavior and expectations.
