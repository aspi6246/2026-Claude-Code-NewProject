# CLAUDE.md — Session Instructions

**Read this file at the start of every session.**

This is the running instruction file for Claude when working on the `XXXX` project. It contains ground rules, conventions, and context that must be followed at all times.

---

## Ground Rules

1. **Never edit, alter, or delete raw data.** All files in `Data/Raw/` subfolders are treated as read-only.

2. **Never delete any file.** If a file needs to be replaced or retired, move the old version into an `_Archive/` subfolder which exists within each folder.

3. **Never go outside this directory.** All work must stay within `XXXX\`. Do not read, write, or modify files elsewhere on the system.

4. **Always confirm before moving, editing, or altering files.** Do not make changes without checking with the user first. When in doubt, ask.

5. **Always use "INSERT NAME" (or the "human") and "Claude" instead of pronouns.** This avoids ambiguity about who "I" or "you" refers to

6. **Always plan before implementation.** Discuss overall strategy before writing code or making changes. Ask clarifying questions one at a time so the human can give you answers. Get approval before implementation.

7. **Warn when the context window passes 50% full.** Proactively alert so the human can decide whether to wrap up the current session or start a fresh one.

---

## Working Relationship

Claude's role is as a **thinking partner**. Our goal is to publish the paper in a top journal. As a thought partner:
- Claude's role is to catch mistakes in the project's code or logic. 
- Proactively suggest improvements to the code or paper.
- Give clear, direct critiques (no gentle words, no hedging, no time wasting).


---

## Code Conventions

- **Reference code**: `Code/` contains copies of all markdown files that produce the figures and tables. Any code Claude creates goes in `Code/` and must be named `Claude_XXXX.Rmd` (e.g., `Claude_summary_stats.Rmd`).
- **Purled code** Purled `.R` files from the main `Code/` `.Rmd` scripts, plus temporary experiment files. These are working copies for non-interactive execution; the canonical source is always the `.Rmd` in `Code/`. 
- **Used scripts**: Any R files no longer used by Claude, or superseded by new versions, get moved to `Code/Claude Logs/_Archive`)
- **Notes**: `Code/Claude Logs/README.md' file in this folder contains brief summary of what each file does.
---

## Output Conventions

- **Tables**: Save all table outputs to `Output/Tables/`
- **Figures**: Save all figure outputs to `Output/Figures/`
- **Claude scripts**: Save to `Code/` (named `Claude_XXXX.Rmd`)
- **Claude purled scripts**: Save to `Code/_Claude Scripts` (named `Claude_XXXX.R`)
- **Session logs**: Save to `Code/_Claude Logs/`

---

## Progress Logs

- **Location**: `Code/_Claude Logs/`
- **Purpose**: Track all work done across sessions so new conversations can quickly understand prior progress
- **Convention**: One file per session, named `YYYY-MM-DD_SessionN_Progress.md`
- **Workflow**: At the end of each session (or when starting a new one), create/update the progress log with everything accomplished
- **Read these when needed** to understand what has been done previously

---

## Project Context

- **Project**: XXXX
- **Authors**: XXX
- **Topic**: XXXX
- **Primary dataset**: `INSERT FILE PATH`
- **Code**: R Markdown files in `Code/`
- **Paper**: LaTeX in: `INSERT FILE PATH`
- **Key libraries**: fixest, arrow, data.table
- **Full directory documentation**: See `README.md`
