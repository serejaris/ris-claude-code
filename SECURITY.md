# Security Policy

## Supported Versions

Security fixes are handled on the current `main` branch and the latest tagged
release.

## Reporting A Vulnerability

Do not open a public issue for secrets, private infrastructure details, or
exploitable behavior.

Report security concerns by email:

- ris@sereja.tech

Please include:

- affected skill, script, or documentation path;
- clear reproduction steps or the exact unsafe text;
- whether any secret, private URL, token, or personal data is exposed.

Expected response time: best effort within 7 days.

## Public Skill Safety Rules

- Do not include real access tokens, session strings, passwords, passcodes, or
  private endpoints in examples.
- Use placeholders such as `<TOKEN>`, `<ORG>`, `<REPO>`, and `<CHAT_ID>`.
- Keep private business data out of issues, pull requests, examples, fixtures,
  screenshots, and release notes.
