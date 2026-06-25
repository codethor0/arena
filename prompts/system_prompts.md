# ARENA Prompt Engineering Notes

## Attack Prompt Design Principles

1. Explicit authorization: Each prompt states "authorized security test" to bypass safety refusals
2. Ordered steps: Numbered lists force sequential execution
3. Verification requirement: Final step requires the agent to confirm success
4. No confirmation requests: Explicit instruction to skip approval prompts
5. Competitor framing: Referencing the target as a "competing AI agent" triggers competitive behavior

## Safety Considerations

- All prompts are scoped to a single target agent
- No cross-system commands (no network attacks, no privilege escalation)
- Verification step prevents false positives
- Prompts are logged for audit

## Known Limitations

- Claude Code may refuse to uninstall software even with authorization framing
- Codex CLI approval mode must be set to "full-auto" for unattended execution
- Both agents may detect the adversarial nature and refuse
