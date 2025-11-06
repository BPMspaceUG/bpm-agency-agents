# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is **The Agency** - a fork of the original agency-agents repository, extended with **n8n workflow automation agents** and a dedicated release policy for n8n workflow management.

The repository contains:
- **51 specialized AI agent personalities** organized into 9 divisions (from original Agency)
- **4 n8n-specific workflow agents** for n8n automation and development
- **n8n release policy** for managing n8n workflow versions and deployments

Each agent is a markdown file with YAML frontmatter defining a specialized AI persona with distinct personality, workflows, deliverables, and success metrics. These agents are designed for use with Claude Code and other AI systems to provide deep domain expertise.

## Repository Structure

```
/
├── engineering/          # Software development specialists (7 agents)
├── design/              # UX/UI and creative specialists (6 agents)
├── marketing/           # Growth and marketing specialists (8 agents)
├── product/             # Product management specialists (3 agents)
├── project-management/  # PM and coordination specialists (5 agents)
├── testing/             # QA and testing specialists (7 agents)
├── support/             # Operations and support specialists (6 agents)
├── spatial-computing/   # AR/VR/XR specialists (6 agents)
├── specialized/         # Cross-domain specialists (3 agents)
└── n8n/                 # n8n workflow automation specialists (4 agents + release policy)
    ├── n8n-orchestrator.md
    ├── n8n-backend-architect-and-tester.md
    ├── n8n-reverse-prompt-developer.md
    ├── n8n-senior-workflow-and-ai-specialist.md
    └── n8n_release_policy.md
```

## Agent File Architecture

Each agent follows a consistent structure:

### Frontmatter Format
```yaml
---
name: Agent Name
description: One-line specialty description
color: colorname or "#hexcode"
---
```

### Required Sections
1. **Identity & Memory** - Role, personality, experience perspective
2. **Core Mission** - Primary responsibilities with specific deliverables
3. **Critical Rules** - Domain-specific constraints and approaches
4. **Technical Deliverables** - Concrete code examples and templates
5. **Workflow Process** - Step-by-step operational methodology
6. **Communication Style** - Example phrases and tone
7. **Learning & Memory** - Pattern recognition capabilities
8. **Success Metrics** - Measurable outcomes (quantitative preferred)
9. **Advanced Capabilities** - Specialized techniques and expertise

## Agent Design Principles

### What Makes a Great Agent
- **Narrow specialization** over broad generalization
- **Strong personality** with distinct voice and character
- **Concrete deliverables** with real code examples (not pseudo-code)
- **Measurable metrics** with specific numbers (e.g., "reduce load time by 60%", "10,000+ karma")
- **Battle-tested workflows** from real-world iteration

### What to Avoid
- Generic "helpful assistant" personality
- Vague "I will help you with..." descriptions
- Overly broad scope (jack-of-all-trades agents)
- Theoretical approaches without practical testing

## Key Agent Examples

### agents-orchestrator (specialized/agents-orchestrator.md)
The pipeline manager that coordinates multiple agents through complete workflows:
- Orchestrates PM → ArchitectUX → [Dev ↔ QA Loop] → Integration
- Implements task-by-task QA validation with automatic retries
- Maximum 3 attempts per task before escalation
- Only advances when quality gates pass

**Single command launch**:
```
spawn agents-orchestrator to execute complete pipeline for project-specs/[project]-setup.md
```

### engineering-senior-developer
Premium implementation specialist for Laravel/Livewire/FluxUI with advanced CSS and Three.js integration.

### EvidenceQA (testing/testing-evidence-collector.md)
Screenshot-obsessed QA specialist that defaults to finding 3-5 issues and requires visual proof for everything.

### testing-reality-checker
Evidence-based certification that defaults to "NEEDS WORK" unless overwhelming proof demonstrates production readiness.

## n8n Workflow Automation Agents

This fork extends The Agency with specialized agents for n8n workflow automation and development:

### n8n-orchestrator
Coordinates and manages complex n8n workflow pipelines, ensuring proper sequencing and integration of automation components.

### n8n-backend-architect-and-tester
Architects n8n backend integrations and validates workflow reliability through comprehensive testing.

### n8n-reverse-prompt-developer
Specializes in reverse-engineering requirements from existing workflows and developing optimized n8n prompts.

### n8n-senior-workflow-and-ai-specialist
Expert in advanced n8n workflow patterns, AI integrations, and automation best practices.

### n8n Release Policy
See `n8n/n8n_release_policy.md` for versioning, deployment, and workflow management guidelines specific to n8n automation projects.

## Working with Agent Files

### Adding New Agents
1. Choose appropriate category directory
2. Follow the agent template structure in CONTRIBUTING.md
3. Include 2-3 concrete code examples with modern best practices
4. Define specific, measurable success metrics
5. Test agent in real scenarios before submitting

### Modifying Existing Agents
- Preserve the personality voice and character
- Keep code examples practical and runnable
- Ensure success metrics remain specific and measurable
- Maintain consistency with agent's domain expertise

## Common Agent Workflows

### Development Pipeline (orchestrated)
```
project-manager-senior → ArchitectUX → Developer → EvidenceQA → testing-reality-checker
```

### Marketing Campaign
```
marketing-content-creator → marketing-twitter-engager → marketing-instagram-curator → analytics-reporter
```

### MVP Development
```
Rapid Prototyper → Frontend Developer → Backend Architect → EvidenceQA
```

## Contributing Guidelines

Detailed contribution guidelines are in CONTRIBUTING.md, but key points:

- **Agent personality** must be distinct and memorable (not generic)
- **Code examples** must be real, runnable code with proper syntax highlighting
- **Success metrics** must include specific numbers where possible
- **Test in practice** before submitting - agents should be battle-tested
- Follow existing agent structure and formatting conventions

## Quality Standards

### For Agent Design
- Personality voice should be consistent throughout
- Deliverables must include working code examples
- Workflows should be step-by-step and actionable
- Success metrics must be measurable (prefer quantitative)

### For Code Examples
- Use modern best practices and patterns
- Include comments explaining key concepts
- Specify language for syntax highlighting
- Ensure code is complete and runnable (not pseudo-code)

## Repository Metadata

- **License**: MIT
- **Total Agents**: 55 (51 original + 4 n8n specialists)
- **Divisions**: 10 (9 original + n8n division)
- **Lines of Content**: 10,000+ of personality, process, and examples
- **Born from**: Reddit discussion about AI agent specialization
- **Fork Purpose**: Extended for n8n workflow automation management
- **Primary Use**: Integration with Claude Code agent system

## Installation for Claude Code

```bash
# Copy all agents (including n8n) to Claude Code directory
cp -r /home/rob/bpm-agency-agents/* ~/.claude/agents/

# Or copy only n8n agents
cp -r /home/rob/bpm-agency-agents/n8n/* ~/.claude/agents/n8n/

# Activate in Claude Code sessions by referencing agent names
# Example: "activate Frontend Developer mode and build React component"
# Example: "activate n8n-orchestrator and design workflow pipeline"
```

## Agent Philosophy

Each agent represents a specialist you'd hire for a specific role - not a generic assistant. They have:
- Opinions based on experience
- Preferred approaches and patterns
- Domain-specific biases (e.g., EvidenceQA defaults to finding issues)
- Personality-driven communication styles

This isn't a prompt library - it's a complete team of specialists with personality, process, and proven deliverables.
