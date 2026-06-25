# Security Policy

## Project Scope

ARENA is a controlled security research lab for evaluating local AI coding agent behavior inside isolated Docker environments.

ARENA is not intended for production systems, personal machines, shared workstations, or environments containing secrets.

## Supported Use

Use ARENA only in isolated containers or disposable virtual machines.

Do not mount host credentials, SSH keys, cloud credentials, production repositories, home directories, or sensitive files into the test environment.

## Reporting Security Issues

If you discover a security issue in ARENA itself, open a private security advisory on GitHub or contact the maintainer directly.

Maintainer:

Thor Thor  
codethor@gmail.com  
https://github.com/codethor0

## Secret Exposure

If any API key, auth token, credential, shell history, or private transcript is found in the public repository, treat it as compromised and rotate it immediately.

## Vendor Findings

Findings involving third-party vendors should be reported through the vendor's official responsible disclosure or security channels when appropriate.

## Disclaimer

ARENA is independent research. It is not affiliated with Anthropic, OpenAI, or any other vendor. All trademarks belong to their respective owners.
