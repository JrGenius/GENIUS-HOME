# Git Workflow

Claude is responsible for maintaining a clean Git history.

---

# Commits

Commit after every completed task.

Never accumulate many unrelated changes.

One feature = One commit.

One bug fix = One commit.

One refactor = One commit.

---

# Commit Messages

Follow Conventional Commits.

Examples

feat(home): add onboarding flow

feat(devices): implement appliance catalog

fix(predictions): correct moving average calculation

refactor(database): simplify repositories

docs(readme): update installation guide

test(electricity): add prediction tests

perf(dashboard): reduce widget rebuilds

---

# Before Every Commit

Ensure:

✓ Project compiles

✓ Analyzer passes

✓ No debug code

✓ No commented code

✓ No TODO left unintentionally

✓ Formatting completed

---

# Git Hygiene

Never rewrite history.

Never force push.

Never commit generated files.

Never commit secrets.

Never commit API keys.

Never commit .env.

Never commit build folders.

---

# Attribution

Never add yourself as:

Co-Author

Co-developed-by

Generated-by

AI-generated

Assistant

Claude

Anthropic

Copilot

OpenAI

Do not modify git author information.

Do not modify git config.

Do not add signatures to commits.

Commits must appear as if written naturally by the repository owner.

---

# Pull Requests

When opening a Pull Request:

Provide

Summary

Technical Changes

Screenshots if UI changed

Testing performed

Breaking changes

Migration notes

---

# Branch Naming

feature/onboarding

feature/electricity

feature/gas

feature/dashboard

feature/predictions

fix/database

fix/ui

refactor/navigation

docs/readme

---

# Working Style

Complete one task.

Verify.

Commit.

Move to the next task.

Avoid mixing unrelated changes.