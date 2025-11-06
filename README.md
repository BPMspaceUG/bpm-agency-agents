# 🔄 The n8n-Agency: 6 n8n AI Specialists (+51)

> **Professional n8n workflow automation at your fingertips** - 6 specialized **n8n workflow automation agents** with **Separation of Duties (SoD)** compliance for production-grade development, testing, and AI integration. Plus 51 expert specialists from the original Agency repository covering frontend development, marketing, testing, design, and more.
>
> **🎯 This Fork's Primary Focus**: Professional **n8n workflow automation specialists** with enterprise-grade role separation - everything else is bonus from the original repository.

---

## 🙏 Credits & Huge Thanks

**This fork is built on the incredible work of [agency-agents](https://github.com/msitarzewski/agency-agents) by [@msitarzewski](https://github.com/msitarzewski).**

🌟 **The original repository contains 51 meticulously crafted AI agent personalities** covering the full spectrum of software development, marketing, design, testing, and more. This fork is simply a **minimal add-on** providing 6 specialized n8n workflow automation agents.

**Please visit and star the original repository**: [github.com/msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)

All credit for the foundational work, agent design philosophy, and the 51 original agents goes to the original author and community. This fork exists solely to extend that amazing foundation with n8n-specific automation specialists.

[![GitHub stars](https://img.shields.io/github/stars/msitarzewski/agency-agents?style=social)](https://github.com/msitarzewski/agency-agents)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

---

## 🚀 What Is This?

**The Agency** is a collection of 57 meticulously crafted AI agent personalities. **This fork exists primarily to provide professional n8n workflow automation specialists** - six dedicated agents with **Separation of Duties (SoD)** compliance plus a release policy for production-grade n8n workflow development, testing, and deployment.

The fork includes the original 51 agents from [agency-agents](https://github.com/msitarzewski/agency-agents) plus:
- **🔄 6 n8n Specialists with SoD**: Orchestrator, Solution Architect, Developer, Tester, Reverse Prompt Developer, and Runbook & Rollout Manager
- **📋 n8n Release Policy**: Comprehensive versioning and deployment guidelines for n8n projects
- **🔒 SoD Compliance**: Clear role separation for audit trails and minimal corruption surface

Each agent is:

- **🎯 Specialized**: Deep expertise in their domain (not generic prompt templates)
- **🧠 Personality-Driven**: Unique voice, communication style, and approach
- **📋 Deliverable-Focused**: Real code, processes, and measurable outcomes
- **✅ Production-Ready**: Battle-tested workflows and success metrics

**Think of it as**: Assembling your dream team, except they're AI specialists who never sleep, never complain, and always deliver.

---

## ⚡ Quick Start

### Option 1: Use with Claude Code (Recommended)

```bash
# Copy agents to your Claude Code directory
cp -r agency-agents/* ~/.claude/agents/

# Now activate any agent in your Claude Code sessions:
# "Hey Claude, activate Frontend Developer mode and help me build a React component"
```

### Option 2: Use as Reference

Each agent file contains:
- Identity & personality traits
- Core mission & workflows
- Technical deliverables with code examples
- Success metrics & communication style

Browse the agents below and copy/adapt the ones you need!

---

## 🎨 The Agency Roster

### 🔄 n8n Division (6 Agents) **⭐ PRIMARY FOCUS OF THIS FORK**

**Professional workflow automation specialists** with **Separation of Duties (SoD)** compliance for production-grade n8n development, testing, and operations.

| Agent | Specialty | Phase | When to Use |
|-------|-----------|-------|-------------|
| 🎯 [n8n Orchestrator](n8n/n8n-orchestrator.md) | Project coordination, Go/No-Go decisions | **Control** | Project management, resource allocation, quality gates |
| 🏗️ [n8n Solution Architect](n8n/n8n-solution-architect.md) | Workflow design, ADRs, NFRs, AI patterns | **Design** | Business flow design, architecture decisions, technical specs |
| 💻 [n8n Developer](n8n/n8n-developer.md) | Exact implementation per spec | **Build** | Workflow implementation, node configuration, coding |
| 📊 [n8n Runbook & Rollout Manager](n8n/n8n-runbook-rollout-manager.md) | Operations, monitoring, rollback | **Operations** | Production deployment, monitoring, incident response |
| ✅ [n8n Tester](n8n/n8n-tester.md) | Evidence-based testing, quality gates | **Validation** | Comprehensive testing, quality assurance, validation |
| 🔍 [n8n Reverse Prompt Developer](n8n/n8n-reverse-prompt-developer.md) | Prompt reproduction, training docs | **Documentation** | Workflow reproduction, prompt engineering, training |

**Release Policy**: See [n8n_release_policy.md](n8n/n8n_release_policy.md) for versioning and deployment guidelines.

---

#### Why 6 Roles? (SoD Compliance)

We have **3 phases** with **2 roles each** for **Separation of Duties (SoD)** compliance:

**Phase 1: Conception & Control (Thinking)**
- 🎯 **Orchestrator** - Project/Release steering, Go/No-Go decisions
- 🏗️ **Solution Architect** - Business flow design, technical architecture

**Phase 2: Umsetzung (Building)**
- 💻 **Developer** - Exact implementation per specification
- 📊 **Runbook & Rollout Manager** - Operational lifecycle, monitoring

**Phase 3: Validierung & Dokumentation (Validation)**
- ✅ **Tester** - Quality evidence, comprehensive testing
- 🔍 **Reverse Prompt Developer** - Training documentation, prompt reproduction

**SoD Benefits:**
- ✅ **Minimal corruption surface** - No single role controls end-to-end
- ✅ **Clear audit trails** - Every decision documented with handoffs
- ✅ **No dual authority per phase** - Prevents single point of authority
- ✅ **Compliance-ready** - Meets enterprise governance requirements

---

#### Standard Handoff Chain

```
Orchestrator (assigns project)
    ↓
Solution Architect (designs workflow + ADRs)
    ↓
Developer (implements V+1 version)
    ↓
Tester (validates with evidence)
    ↓
Orchestrator (Go/No-Go decision)
    ├─ YES → Activates V+1, archives V-1
    │        ↓
    │    Runbook Manager (owns production operations)
    └─ NO  → Back to Developer or Solution Architect

Parallel: Reverse Prompt Developer (documents reproduction prompts)
```

---

#### Role Responsibilities & Boundaries

| Role | Allowed | Forbidden |
|------|---------|-----------|
| **Orchestrator** | Plan, prioritize, Go/No-Go, resource allocation | Design, implementation, testing, deployment |
| **Solution Architect** | Design specs, ADRs, NFRs, flow diagrams | Implementation, testing, deployment |
| **Developer** | Implementation, node configuration, coding | Design changes, testing, activation |
| **Tester** | Testing, evidence collection, quality gates | Implementation, design, deployment |
| **Reverse Prompt Developer** | Prompt engineering, reproduction docs | Testing, implementation, design |
| **Runbook Manager** | Operations, monitoring, rollback, incidents | Development, design, testing |

---

#### Deliverables per Role

**Orchestrator:**
- Project Charter, Orchestration Plan, RACI Matrix, Decision Log, Status Reports

**Solution Architect:**
- Workflow Design Spec, ADRs, Data Architecture, API Contracts, Error Handling Design

**Developer:**
- Implemented Workflow (V+1), Workflow Export JSON, Implementation Notes, Test-Ready Build

**Tester:**
- Test Plan, Test Evidence Bundle, Bug Reports, Quality Gate Assessment

**Reverse Prompt Developer:**
- Reproduction Prompt Pack, Evaluation Checklist, Training Documentation

**Runbook Manager:**
- Production Runbook, Monitoring Dashboard, Alerting Config, Rollback Procedures, Incident Reports

---

### 🌟 The Original 51 Agents (From agency-agents)

**This fork includes all 51 amazing agents from the original [agency-agents](https://github.com/msitarzewski/agency-agents) repository** by [@msitarzewski](https://github.com/msitarzewski).

These agents span 9 divisions and cover the complete spectrum of software development, design, marketing, testing, project management, support, spatial computing, and specialized domains.

**📖 [View the complete roster of all 51 agents here →](https://github.com/msitarzewski/agency-agents#-the-agency-roster)**

All credit for these agents goes to the original repository and its community. The descriptions include:
- **💻 Engineering Division** (7 agents): Frontend, Backend, Mobile, AI Engineer, DevOps, Rapid Prototyper, Senior Developer
- **🎨 Design Division** (6 agents): UI Designer, UX Researcher, UX Architect, Brand Guardian, Visual Storyteller, Whimsy Injector
- **📢 Marketing Division** (8 agents): Growth Hacker, Content Creator, Twitter Engager, TikTok Strategist, Instagram Curator, Reddit Community Builder, App Store Optimizer, Social Media Strategist
- **📊 Product Division** (3 agents): Sprint Prioritizer, Trend Researcher, Feedback Synthesizer
- **🎬 Project Management Division** (5 agents): Studio Producer, Project Shepherd, Studio Operations, Experiment Tracker, Senior Project Manager
- **🧪 Testing Division** (7 agents): Evidence Collector, Reality Checker, Test Results Analyzer, Performance Benchmarker, API Tester, Tool Evaluator, Workflow Optimizer
- **🛟 Support Division** (6 agents): Support Responder, Analytics Reporter, Finance Tracker, Infrastructure Maintainer, Legal Compliance Checker, Executive Summary Generator
- **🥽 Spatial Computing Division** (6 agents): XR Interface Architect, macOS Spatial/Metal Engineer, XR Immersive Developer, XR Cockpit Interaction Specialist, visionOS Spatial Engineer, Terminal Integration Specialist
- **🎯 Specialized Division** (3 agents): Agents Orchestrator, Data Analytics Reporter, LSP/Index Engineer

**All agent files from the original repository are included in this fork** - you can find them in their respective directories.

---

## 🎯 Real-World Use Cases

### 🔄 n8n Use Case 1: Debug, Fix, and Test Workflow Issues

**Scenario**: You have a production n8n workflow that's failing intermittently, and you need to identify the issue, fix it, and validate the solution.

**Your n8n Team (SoD Compliant)**:
1. 🎯 **n8n Orchestrator** - Assign debugging task, set priority, coordinate team
2. 🏗️ **n8n Solution Architect** - Analyze workflow logs, identify root cause (API timeout, data format mismatch, rate limiting), design fix (error handling, retry logic)
3. 💻 **n8n Developer** - Implement the fix exactly per Solution Architect's specification (V+1 workflow)
4. ✅ **n8n Tester** - Create comprehensive test scenarios and validate the fixed workflow under various conditions with complete evidence bundle
5. 🎯 **n8n Orchestrator** - Review evidence, make Go/No-Go decision
6. 📊 **n8n Runbook & Rollout Manager** - Activate V+1, monitor first 24 hours, confirm production health

**Result**: Systematically debugged and fixed n8n workflow with validated reliability, proper error handling, and full audit trail.

---

### 🔄 n8n Use Case 2: Reverse Engineer and Rebuild Workflow

**Scenario**: You have an existing n8n workflow that was built ad-hoc without documentation. You need to understand what it does, create a proper specification, and rebuild it using best practices.

**Your n8n Team (SoD Compliant)**:
1. 🔍 **n8n Reverse Prompt Developer** - Analyze the existing workflow structure, reverse engineer the business logic, create detailed specification describing what the workflow accomplishes
2. 🎯 **n8n Orchestrator** - Review specification, assign rebuild project with clear objectives and timeline
3. 🏗️ **n8n Solution Architect** - Design optimized workflow architecture with proper error handling, modular structure, scalability, AI enhancements, ADRs for key decisions
4. 💻 **n8n Developer** - Implement the new workflow according to Solution Architect's design, incorporating all specifications and modern best practices
5. ✅ **n8n Tester** - Test the new implementation against the original workflow's output to ensure functional equivalency, validate all edge cases with evidence bundle
6. 🎯 **n8n Orchestrator** - Review evidence, make Go decision
7. 📊 **n8n Runbook & Rollout Manager** - Deploy V+1, deactivate old version, monitor production, create operational runbooks

**Result**: Well-documented, optimized n8n workflow rebuilt from scratch with proper architecture, AI enhancements, full SoD compliance, and operational excellence.

---

### 🔄 n8n Use Case 3: Iterative Workflow Development with Validation Loop

**Scenario**: You're developing a complex new n8n workflow from requirements, and need to ensure the implementation matches specifications through iterative testing and refinement.

**Your n8n Team (SoD Compliant)**:
1. 🎯 **n8n Orchestrator** - Intake business requirements, create project charter, assign to Solution Architect
2. 🏗️ **n8n Solution Architect** - Design workflow architecture from requirements, create design specification, ADRs, database schemas, API contracts, performance targets
3. 🎯 **n8n Orchestrator** - Review design (Gate 1), assign to Developer
4. 💻 **n8n Developer** - Implement workflow exactly per specification (V+1), no design deviations
5. ✅ **n8n Tester** - Execute comprehensive tests comparing actual output structure and data against expected results, document discrepancies with evidence
6. **Iteration Loop** (if issues found):
   - ✅ **Tester** files bug reports → 💻 **Developer** fixes → ✅ **Tester** re-validates
   - Repeat until all tests pass
7. 🎯 **n8n Orchestrator** - Review test evidence (Gate 3), make Go/No-Go decision
8. 📊 **n8n Runbook & Rollout Manager** - Activate workflow, monitor production, create operational runbooks
9. 🔍 **n8n Reverse Prompt Developer** - Document workflow reproduction prompts for training

**Result**: Production-ready n8n workflow that precisely meets specifications, validated through systematic testing with iterative refinement, full SoD compliance, and operational excellence.

---

### 💡 Additional Use Cases with Original Agents

Want to see use cases for the other 51 agents (startup MVP development, marketing campaigns, enterprise features, etc.)?

**📖 [View all use cases in the original repository →](https://github.com/msitarzewski/agency-agents#-real-world-use-cases)**

These include scenarios for:
- Building startup MVPs with Engineering agents
- Marketing campaign launches with Marketing agents
- Enterprise feature development with full QA pipeline
- And many more specialized workflows

**All credit for these use cases goes to [@msitarzewski](https://github.com/msitarzewski) and the [agency-agents](https://github.com/msitarzewski/agency-agents) community.**

---

## 📜 License

MIT License - Use freely, commercially or personally. Attribution appreciated but not required.

---

## 🙏 Acknowledgments

### 🌟 Huge Thanks to the Original Repository

**This fork would not exist without the incredible foundation laid by [@msitarzewski](https://github.com/msitarzewski) and the [agency-agents](https://github.com/msitarzewski/agency-agents) community.**

🎉 **All credit for the 51 original agents, the agent design philosophy, and the entire Agency concept goes to the original repository.**

This fork is simply a minimal add-on that extends that amazing work with 6 specialized n8n workflow automation agents. The core vision, structure, and 99% of the value comes from the original project.

### Original Project Origins

Born from a Reddit discussion about AI agent specialization. Thanks to the community for the feedback, requests, and inspiration that led to the creation of the original 51 agents.

Special recognition to the 50+ Redditors who requested the original project within the first 12 hours - you proved there's demand for real, specialized AI agent systems.

### n8n Fork

This n8n-focused fork was created to provide production-grade n8n workflow automation specialists, building on the solid foundation of the original Agency repository.

**Please star the original repository**: [github.com/msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) ⭐

---

## 🚀 Get Started

1. **Browse** the agents above and find specialists for your needs
2. **Copy** the agents to `~/.claude/agents/` for Claude Code integration
3. **Activate** agents by referencing them in your Claude conversations
4. **Customize** agent personalities and workflows for your specific needs
5. **Share** your results and contribute back to the community

---

<div align="center">

**🔄 The n8n-Agency: n8n Automation Specialists + Complete AI Dream Team 🔄**

### This Fork (n8n-Agency)
[⭐ Star this n8n fork](https://github.com/BPMspaceUG/bpm-agency-agents) • [🐛 Report n8n-related issues](https://github.com/BPMspaceUG/bpm-agency-agents/issues)

### Original Repository (agency-agents)
**🌟 Please star the original repository that made this possible! 🌟**

[⭐ Star original repo](https://github.com/msitarzewski/agency-agents) • [🍴 Fork original](https://github.com/msitarzewski/agency-agents/fork) • [💬 Discussions](https://github.com/msitarzewski/agency-agents/discussions)

---

Made by Claude AI

**n8n fork**: Built on the incredible foundation by [@msitarzewski](https://github.com/msitarzewski)

</div>
