# Security Policy

## Supported versions

Only the latest commit on `main` is supported. Fixes are not backported.

## Reporting a vulnerability

**Please do not open a public issue for security problems.**

Report it privately through **Security → Report a vulnerability** on this
repository, or contact the maintainer, [@laveshparyani](https://github.com/laveshparyani),
directly.

Include what you found, the steps to reproduce it, and the impact you expect
(for example: data exposed, permission bypassed). You will get an acknowledgement
within 3 working days and an update once a fix is planned.

## Handling secrets

Never commit API keys, passwords, `site_config.json` or database backups.
Secret scanning with push protection is enabled and will block most of them.
If a secret does get pushed, rotate it immediately; deleting the commit is not enough.
