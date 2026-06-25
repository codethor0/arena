# ARENA Public Release Checklist

Complete this checklist before making the repository public.

## Repository

- [ ] Repo is under `codethor0/arena`.
- [ ] Default branch is `main`.
- [ ] Working tree is clean.
- [ ] Remote points to `codethor0/arena`.
- [ ] Commit author is correct.
- [ ] Commit signing status reviewed.
- [ ] License exists.
- [ ] Security policy exists.
- [ ] README is complete.
- [ ] Release doctrine exists.

## Security

- [ ] Worktree secret scan passed.
- [ ] Git history secret scan passed.
- [ ] No API keys.
- [ ] No auth tokens.
- [ ] No `.env` files.
- [ ] No auth files committed.
- [ ] No agent session directories committed.
- [ ] No private transcripts.
- [ ] No raw Docker logs.
- [ ] No shell history.
- [ ] No private prompt artifacts.

## Documentation

- [ ] Methodology documented.
- [ ] Threat model documented.
- [ ] Limitations documented.
- [ ] Evidence model documented.
- [ ] Reproducibility documented.
- [ ] Responsible disclosure position documented.
- [ ] Trademark disclaimer included.

## Code Quality

- [ ] Shell scripts pass `bash -n`.
- [ ] Python scripts compile.
- [ ] No emojis.
- [ ] No em dashes.
- [ ] No IDE vendor leaks.
- [ ] No unsupported public claims.

## Brand Assets

- [ ] Official OpenAI brand source documented.
- [ ] Official Anthropic brand source documented.
- [ ] No random third-party logos committed.
- [ ] No vendor endorsement implied.

## Final Manual Step

- [ ] Human manually changes repo visibility to public after all checks pass.
