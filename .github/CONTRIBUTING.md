# Contributing

## Workflow

1. Branch off the latest `main`:
   - `feature/<short-name>` for new work
   - `fix/<short-name>` for bug fixes
   - `chore/<short-name>` for maintenance
2. Keep commits small, with a clear message: `area: what changed`
   (e.g. `student: validate phone number`).
3. Push the branch and open a pull request into `main`. CI runs the linters and the
   test suite on every PR.
4. Merge once CI is green. The branch is deleted automatically.

`main` is protected: no force-pushes or deletion, and changes land through pull requests.

## Local setup

```bash
cd frappe-bench
bench get-app https://github.com/laveshparyani/walnutedu-student-management.git
bench --site <your-site> install-app student_management
bench --site <your-site> migrate
```

## Code style

This repo uses [pre-commit](https://pre-commit.com/) with ruff (Python), and prettier
and eslint (JavaScript). Tabs for indentation, as in Frappe itself. Enable it once per clone:

```bash
cd apps/student_management
pre-commit install
```

## Tests

```bash
bench --site <your-site> set-config allow_tests true
bench --site <your-site> run-tests --app student_management
```

## Rules for Frappe changes

- **Everything goes through code.** DocTypes, dashboards, number cards, charts and
  workspaces live as JSON in `student_management/student_management/`. Changes made only
  through the Desk UI are not part of the app and are lost on a fresh install.
- Data changes to existing records go in a **patch** (`patches.txt`), never in manual SQL.
- Never commit `site_config.json`, API keys or backups.

## Reporting issues

Use the **Bug report** or **Feature request** templates. For security problems, see
[SECURITY.md](SECURITY.md).
