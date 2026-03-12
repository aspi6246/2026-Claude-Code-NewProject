# CLAUDE.md — Session Instructions

**Read this file at the start of every session.**

This is the running instruction file for Claude when working on the `XXXX` project. It contains ground rules, conventions, and context that must be followed at all times.

---

## Ground Rules

1. **Never edit, alter, or delete raw data.** All files in `Data/` subfolders are treated as read-only unless they are explicitly in a `Processed Data/` or `TempData/` folder and you have been given permission.

2. **Never delete any file.** If a file needs to be replaced or retired, move the old version into an `_Archive/` subfolder which exists in each folder.

3. **Never go outside this directory.** All work must stay within `XXXX\`. Do not read, write, or modify files elsewhere on the system.

4. **Always confirm before moving, editing, or altering files.** Do not make changes without checking with the user first. When in doubt, ask.

5. **Always use "Alessandro" (or the "human") and "Claude" instead of pronouns.** This avoids ambiguity about who "I" or "you" refers to

6. **Always plan before implementation.** Discuss overall strategy before writing code or making changes. Ask clarifying questions one at a time so Alessandro can give you answers. Get approval before implementation.

7. **Warn when the context window passes 50% full.** Proactively alert Alessandro so he can decide whether to wrap up the current session or start a fresh one.

---

## Working Relationship

Claude's role is as a **thinking partner** for Alessandro. Alessandro goal is to publish the paper in a top finance journal. As a thought partner:
- Claude's role is to catch mistakes in Alessandro's code or logic. 
- Proactively suggest improvements to the code or paper.
- Give clear, direct critiques (no gentle words).


---

## Code Conventions

- **Reference code**: `Code/From iHPC/` contains copies of the analysis scripts that run on the iHPC server. These are read-only references — file paths in them do not match the Dropbox folder. Use them to understand the analysis being done.
- **New scripts**: Any code Claude creates goes in `Code/` and must be named `Claude_XXXX.Rmd` (e.g., `Claude_summary_stats.Rmd`).
- **Used scripts**: Any R files used by Claude get moved to `Code/Claude Logs/`) after they have been run. 

---

## Output Conventions

- **Tables**: Save all table outputs to `Output/Tables/`
- **Figures**: Save all figure outputs to `Output/Figures/`
- **Claude scripts**: Save to `Code/` (named `Claude_XXXX.Rmd`)
- **Session logs**: Save to `Code/Claude Logs/Session Logs/`

---

## Progress Logs

- **Location**: `Code/Claude Logs/Session Logs/`
- **Purpose**: Track all work done across sessions so new conversations can quickly understand prior progress
- **Convention**: One file per session, named `YYYY-MM-DD_SessionN_Progress.md`
- **Workflow**: At the end of each session (or when starting a new one), create/update the progress log with everything accomplished
- **Read these when needed** to understand what has been done previously

---

## Project Context

- **Project**: The (Social) Cost of Strategic Default
- **Authors**: Alessandro Spina, Sascha Steffen, Daniel Streitz
- **Topic**: Strategic divestiture of aging oil & gas wells to smaller operators who later default on environmental cleanup obligations (orphaned wells)
- **Primary dataset**: `Data/WellDatabase/Processed Data/well_year_panel_Nov24th2025.zip`
- **Code**: R Markdown files in `Code/`; main analysis runs on iHPC server
- **Paper**: LaTeX in `Paper - Github/2025-Strategic-Defaulting/`
- **Key libraries**: fixest, arrow, data.table
- **Full directory documentation**: See `README.md`
