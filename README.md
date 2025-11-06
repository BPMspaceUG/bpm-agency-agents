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

**Release Policy**: [n8n_release_policy.md](n8n/n8n_release_policy.md)

---

## 🔄 Standard Handoff Chain

```
Orchestrator → Solution Architect → Developer → Tester → Go/No-Go → Runbook Manager
                                                           │
                                                           └─ NO → Back to Developer
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

## 🎯 Use Cases

### Debug & Fix Workflow
**Problem:** Production workflow failing intermittently

**Team:**
1. **Orchestrator** - Assign debugging task
2. **Solution Architect** - Analyze logs, design fix
3. **Developer** - Implement fix (V+1)
4. **Tester** - Validate with evidence
5. **Orchestrator** - Go/No-Go decision
6. **Runbook Manager** - Activate, monitor production

**Result:** Validated fix with full audit trail

---

### Reverse Engineer & Rebuild
**Problem:** Ad-hoc workflow without documentation

**Team:**
1. **Reverse Prompt Developer** - Analyze & document existing workflow
2. **Orchestrator** - Assign rebuild project
3. **Solution Architect** - Design optimized architecture
4. **Developer** - Implement new workflow
5. **Tester** - Validate functional equivalency
6. **Runbook Manager** - Deploy & monitor

**Result:** Production-ready workflow with proper documentation

---

### Iterative Development
**Problem:** Build complex workflow from requirements

**Team:**
1. **Orchestrator** - Intake requirements
2. **Solution Architect** - Design architecture (Gate 1)
3. **Developer** - Implement specification (V+1)
4. **Tester** - Execute comprehensive tests
5. **Iteration Loop** - Developer fixes → Tester validates (repeat until pass)
6. **Orchestrator** - Review evidence (Gate 3), Go/No-Go
7. **Runbook Manager** - Activate & monitor

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
