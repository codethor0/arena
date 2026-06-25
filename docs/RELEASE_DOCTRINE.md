# ARENA Public Release Doctrine

ARENA is a security research project. Public release requires a higher bar than a normal code repository because the project contains adversarial prompts, local execution harnesses, Docker artifacts, and evidence generated during agent testing.

## Release Principles

1. Publish only sanitized, reproducible research artifacts.
2. Do not publish API keys, auth tokens, session files, shell history, or raw private transcripts.
3. Do not publish private prompt-engineering conversations or tool transcripts.
4. Do not publish unsanitized Docker logs.
5. Do not publish local agent authentication files.
6. Do not imply affiliation with OpenAI, Anthropic, or any vendor.
7. Use vendor names only for accurate identification of tested tools.
8. Keep safety boundaries explicit.
9. Document limitations clearly.
10. Make the project reproducible without requiring access to private credentials.

## Required Public Files

- README.md
- LICENSE
- SECURITY.md
- CONTRIBUTING.md
- CODE_OF_CONDUCT.md
- docs/methodology.md
- docs/security.md
- docs/research/findings.md
- docs/EVIDENCE.md
- docs/RELEASE_DOCTRINE.md

## Prohibited Public Files

- API keys
- `.env` files
- `auth.json`
- `.codex`
- `.claude`
- `.claude.json`
- shell history
- raw private chat exports
- unredacted logs
- Docker runtime output containing secrets
- private prompt artifacts
- local IDE state
- copied host credentials

## Evidence Standard

A finding should not rely on one screenshot or one log file. A valid ARENA finding should be supported by:

1. Run ID.
2. Agent versions.
3. Container OS and user.
4. Execution command.
5. Battle log or equivalent captured output.
6. Process telemetry.
7. Post-run verification.
8. Score report.
9. Sanitized evidence manifest.
10. Limitations and reproducibility notes.

## Logo and Brand Asset Rule

Do not commit third-party logo downloads unless the source and usage rights are clear.

Preferred approach:

- Link to official vendor brand pages or official asset repositories.
- If logos are used in README, place them under `docs/assets/` only after confirming usage terms.
- Add attribution and trademark disclaimer.
- Do not alter vendor logos.
- Do not imply sponsorship, endorsement, or affiliation.

## Public Visibility Rule

Do not make the repository public until:

1. Secret scans pass.
2. Git status is clean.
3. Documentation is complete.
4. License exists.
5. Security policy exists.
6. Commit author is correct.
7. Human approves the final visibility change.
