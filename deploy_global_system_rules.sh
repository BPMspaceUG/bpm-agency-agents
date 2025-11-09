#!/usr/bin/env bash
# ===============================================================
# deploy_global_system_rules_v2.sh
#
# PURPOSE:
#   Create ONE canonical global rules file in the repo root and
#   create/update local symbolic links pointing to it.
#
# SCOPE:
#   Run this in the root of ANY project that must follow the
#   GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.
#
# RULES:
#   - Only ONE canonical file:
#       ./GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md
#   - All other references are symlinks to this file.
# ===============================================================

set -euo pipefail

echo "==> Deploying Global System Rules (single canonical file + links)"

CANONICAL_FILE="GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md"

# -------------------------------------------------------------------
# 1. Create canonical file in repo ROOT if missing
# -------------------------------------------------------------------
if [ -f "${CANONICAL_FILE}" ]; then
  echo "✓ Canonical file already exists: ${CANONICAL_FILE}"
else
  cat > "${CANONICAL_FILE}" <<'EOF'
# 📌 GLOBAL INSTRUCTION — SYSTEM / NON-NEGOTIABLE RULES (Future-Only)

This file is the single authoritative global rule set.
It applies to **all projects and organizations**, including BPMspace, ICO,
mITSM, partners, and any future environments.

Key areas it defines (non-exhaustive):
- File & directory ownership
- Sudo policy
- Host vs container execution model
- Script structure & naming
- Redis usage and migration rules
- GitHub Issue & diff logging requirements
- Safety & data integrity constraints
- Cross-agent coordination (n8n ↔ FlightPHP)
- Frontend standards (views, headers/footers, Bootstrap 5, DataTables, KISS)

Full maintained content MUST be managed in version control.
EOF
  echo "✓ Canonical file created in repo root: ${CANONICAL_FILE}"
fi

# Compute absolute path of canonical file for safe symlink targets
CANONICAL_ABS="$(cd "$(dirname "${CANONICAL_FILE}")" && pwd)/$(basename "${CANONICAL_FILE}")"

# -------------------------------------------------------------------
# 2. Define local symlink targets (within SAME repo)
#    No cross-repo assumptions. Keep it safe and minimal.
# -------------------------------------------------------------------
declare -a LINKS=(
  "GLOBAL_INSTRUCTION_SYSTEM_RULES.md"
  "docs/SYSTEM/GLOBAL_INSTRUCTION_SYSTEM_RULES_ALL_PROJECTS.md"
  "docs/SYSTEM/GLOBAL_INSTRUCTION_SYSTEM_RULES.md"
)

for LINK in "${LINKS[@]}"; do
  LINK_DIR="$(dirname "${LINK}")"
  # Create directory for link if not in root
  if [ "${LINK_DIR}" != "." ]; then
    mkdir -p "${LINK_DIR}"
  fi

  # If file or link exists, replace it
  if [ -L "${LINK}" ] || [ -f "${LINK}" ]; then
    rm -f "${LINK}"
  fi

  ln -s "${CANONICAL_ABS}" "${LINK}"
  echo "✓ Symlink created: ${LINK} -> ${CANONICAL_ABS}"
done

echo "==> Global System Rules deployment completed."
