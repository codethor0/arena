# ARENA Security Protocol

## Isolation Requirements

1. VM-only execution. Never run on host OS.
2. No shared folders between host and VM.
3. No SSH keys or credentials in VM.
4. VM network isolated except for agent API calls.
5. VM destroyed after testing.

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Agent escapes VM | Low | High | VM snapshot + isolated network |
| Agent modifies host via shared folder | Low | Critical | No shared folders configured |
| Agent exfiltrates data | Low | Medium | Network isolation + no sensitive data |
| Agent persists after VM destroy | None | N/A | VM is ephemeral |

## Disclosure Policy

- Findings published only after vendor notification (90-day window)
- CVE-worthy bugs reported through official channels first
- Substack article published after responsible disclosure period
