# Contributing to ARENA

ARENA accepts contributions that improve safety, reproducibility, documentation, and research rigor.

## Contribution Rules

1. No secrets.
2. No API keys.
3. No auth files.
4. No raw private transcripts.
5. No unsanitized logs.
6. No production data.
7. No host credentials.
8. No malware.
9. No persistence tooling.
10. No container escape logic.
11. No offensive expansion outside the controlled local lab.
12. No emojis in code or documentation.
13. No em dashes in code or documentation.

## Pull Request Expectations

A pull request should include:

- Clear purpose.
- Safety impact.
- Test output.
- Documentation updates if behavior changes.
- No unrelated formatting churn.
- No private prompt artifacts.

## Testing

Before opening a pull request, run:

```bash
bash -n setup/*.sh harness/*.sh
python3 -m py_compile harness/*.py
grep -RIn "sk-ant\|BEGIN OPENSSH\|PRIVATE KEY" . --exclude-dir=.git || true
```

## Safety Boundary

ARENA is for controlled local agent behavior testing only. Do not add features that target external systems, steal data, establish persistence, evade detection, or escape containers.
