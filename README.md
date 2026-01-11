# R_Roster

Personal application for managing teacher absenteeism and roster scheduling.

## Overview

R_Roster is a personal productivity application designed to help manage teacher absence tracking and substitution scheduling.

## Governance

This repository operates under **Maturion canonical governance** as defined in:
- **Governance Repository**: [APGI-cmy/maturion-foreman-governance](https://github.com/APGI-cmy/maturion-foreman-governance)
- **Build Philosophy**: See [`BUILD_PHILOSOPHY.md`](./BUILD_PHILOSOPHY.md) - QA-First Architecture-Driven Development
- **Governance Version**: See [`governance/alignment/GOVERNANCE_ALIGNMENT.md`](./governance/alignment/GOVERNANCE_ALIGNMENT.md)

### Key Governance Principles

- **100% GREEN Philosophy**: Every build must be fully functional with zero test debt
- **Architecture → Red QA → Build to Green**: Structured development workflow
- **Zero Test Debt**: No failing, skipped, or incomplete tests tolerated
- **Constitutional Sandbox**: Agent judgment within strict constitutional boundaries

## Repository Structure

```
R_Roster/
├── .github/
│   ├── agents/          # Agent contracts
│   └── workflows/       # CI/CD workflows
├── .architecture/       # Architecture documentation and evidence
├── .qa/                 # QA evidence and reports
├── governance/          # Governance alignment and evidence
├── docs/                # Project documentation
└── BUILD_PHILOSOPHY.md  # Canonical build philosophy
```

## Agent Roster

- **Foreman (FM)**: Orchestrator, architecture designer
- **Builders**: UI, API, Schema, Integration, QA specialists
- **Governance Liaison**: Ensures governance alignment
- **Codex Advisor**: Domain and architectural guidance

## Getting Started

*(Instructions to be added as application is developed)*

## License

*(License information to be determined)*
