# Shell scripts, launchers, and setup

Defaults for scripts the user or an agent will run more than once: dev launchers, setup, install, CI steps. A repo's existing scripts set the style; match them.

## The shape of a script

- **Bash with strict mode:** `#!/usr/bin/env bash` and `set -euo pipefail` at the top, unless the repo targets POSIX `sh`.
- **Quote every expansion** (`"$var"`, `"$(cmd)"`), and run `shellcheck` when it is available.
- **Resolve paths from the script's own location** (`$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)`), not from the caller's working directory.
- **Check prerequisites first, with a message that says what to do:** "Python venv not found at backend/.venv; create it with uv sync", not a stack trace three steps later.
- **Idempotent.** Running it again converges to the same state: create only what is missing, link only what is not linked, back up before replacing.
- **No interactive prompts** in scripts an agent runs; take input from arguments or environment variables with clear defaults.

## Launchers instead of remembered commands

When starting a service needs more than one environment variable, flag, or path, write a launcher script in the repo and make it the one supported way to start that service. A remembered command line gets retyped slightly differently each time, and each variant is a new way for it to break.

A good launcher also proves the service can work before it starts: it checks the database connection, the required files, or the port, and fails with the real reason.

> Example: a backend on macOS needed `DYLD_LIBRARY_PATH` pointing at OpenSSL for its database driver. It broke twice in one evening, both times because the server had been started through `nohup`. The first time the auto-reloader got the blame and was turned off for nothing; a two-line test later showed a Python child process keeps the variable and only `nohup` drops it. The fix was a launcher that exports the variable inside the script, right before `exec`ing the server, and runs a one-line database check first. After that, starting it through `nohup` worked too. Lesson: prove the cause with the smallest test before writing it down as a rule.

## macOS and portability

- **System Integrity Protection strips `DYLD_*` variables** from any process launched through a protected system binary such as `nohup` or `env`. A child process the program starts itself (a Python dev server's auto-reloader, for instance) keeps them. Set such variables inside the script that finally runs the program.
- **BSD and GNU tools differ.** `sed -i ''` on macOS vs `sed -i` on Linux, `date` flags, `readlink -f`. Write for the platform the script targets, or use a portable form.
- **`timeout` is not installed on macOS by default.** Do not depend on GNU coreutils unless the script checks for them.

## Long-running processes

- **Start servers directly in the background of the tool or terminal,** with output to a log file; avoid wrapping them in `nohup` or `env` on macOS for the reason above.
- **Stop by process id** (from the listening port or a pid file), never with a broad `pkill -f` that can kill someone else's process.
- **Leave other people's servers alone.** When you need your own instance for a check, run it on another port from a separate copy if the two would share a build or cache folder.
