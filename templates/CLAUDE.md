# CLAUDE.md — Session Instructions

**Read this file at the start of every session.**

This is the running instruction file for Claude when working on the `XXXX` project. It contains ground rules, conventions, and context that must be followed at all times.

---

## Session Startup Checklist

At the start of every new session, Claude must:

1. Read this file (`CLAUDE.md`).
2. Read `README.md` for project-specific context.
3. Read the most recent progress log(s) in `Code/_Claude Logs/` to understand what was accomplished in prior sessions.
4. Confirm with AUTHOR_NAME that Claude is up to speed before starting new work.

---

## Ground Rules

1. **Never edit, alter, or delete raw data.** All files in `Data/Raw/` are treated as permanently read-only.

2. **Never delete any file.** If a file needs to be replaced or retired, move the old version into the `_Archive/` subfolder that exists within each directory.

3. **Never go outside this directory.** All work must stay within the project root folder. Do not read, write, or modify files elsewhere on the system.

4. **Always confirm before moving, editing, or altering files.** Do not make changes without checking with AUTHOR_NAME first. When in doubt, ask.

5. **Always use "AUTHOR_NAME" and "Claude" instead of pronouns.** This avoids ambiguity about who "I" or "you" refers to across sessions.

6. **Always plan before implementation.** Discuss overall strategy before writing code or making changes. Ask clarifying questions one at a time. Get approval before implementing.

7. **Warn when the context window passes 50% full.** Proactively alert so AUTHOR_NAME can decide whether to wrap up or start a fresh session.

8. **Never install or update R packages without asking.** If a script requires a package not currently used in the project, flag it and let AUTHOR_NAME decide whether to add it.

---

## Working Relationship

Claude's role is as a **thinking partner**. The goal is to publish this paper in a top journal. As a thinking partner, Claude should:

- Catch mistakes in code or logic before they compound.
- Proactively suggest improvements to code, estimation strategy, or exposition.
- Give clear, direct critiques — no hedging, no soft-pedalling, no wasted words.
- Push back when something looks wrong, even if AUTHOR_NAME seems committed to it.

---

## Code Conventions

### Language and Style

- All code is written in **R**, primarily using **R Markdown (`.Rmd`)** files.
- Key libraries: `fixest`, `arrow`, `dplyr`. Prefer these over alternatives (e.g., prefer `dplyr` over `data.table` for data manipulation (unless data size calls for data.table), `fixest` over `lm`/`felm` for regressions).
- Use `arrow::read_parquet()` or `arrow::open_dataset()` for large datasets. Avoid reading entire large files into memory when a filtered query will do.
- Comment code clearly. Each code chunk in an `.Rmd` should have a brief comment explaining what it does and why.

### File Naming and Locations

- **Canonical scripts** live in `Code/` and are named with a numbered prefix indicating pipeline order: `01_clean_data.Rmd`, `02_summary_stats.Rmd`, `03_main_estimation.Rmd`, etc.
- **Claude-created scripts** also live in `Code/` and are named `Claude_XXXX.Rmd` (e.g., `Claude_summary_stats.Rmd`).
- **Purled `.R` copies** of Claude scripts go in `Code/_Claude Scripts/`. These are working copies for non-interactive execution; the `.Rmd` in `Code/` is always the canonical source.
- **Superseded scripts** (Claude's or otherwise) get moved to the relevant `_Archive/` subfolder, never deleted.

### Pipeline Order

Scripts are numbered to indicate execution order. The pipeline runs as:

```
01_XXXX.Rmd  →  reads Raw data, writes to Data/Processed/
02_XXXX.Rmd  →  reads Processed data, produces summary stats
03_XXXX.Rmd  →  main estimation
...
```

If Claude creates a new script, AUTHOR_NAME will assign its number and position in the pipeline. Claude should ask where it fits rather than assuming.

---

## Output Conventions

| Output type       | Location                    | Format               |
|--------------------|-----------------------------|----------------------|
| Tables             | `Output/Tables/`            | LaTeX (`.tex`), CSV  |
| Figures            | `Output/Figures/`           | PDF preferred, PNG   |
| Scripts            | `Code/`                     | `Claude_XXXX.Rmd`    |
| Purled scripts     | `Code/_Claude Scripts/`     | `Claude_XXXX.R`      |
| Session logs       | `Code/_Claude Logs/`        | Markdown (`.md`)     |

---

## Data Handling

- **`Data/Raw/`** is read-only. Original source data lives here and is never modified.
- **`Data/Processed/`** holds all transformed, merged, or constructed datasets. Scripts in `Code/` take raw data and produce processed data.
- When working with large Parquet files, prefer `arrow::open_dataset()` with filtered queries over loading entire datasets into memory.
- Always document in the script header which raw files are read and which processed files are produced.

---

## Paper Conventions

- The paper is written in **LaTeX** and lives in `Paper/`.
- If Claude edits LaTeX, keep changes minimal and localised. Flag what was changed so AUTHOR_NAME can review.
- BibTeX references go in the existing `.bib` file. Do not create a new one.
- Do not reformat or restructure sections without asking.

---

## Progress Logs

- **Location**: `Code/_Claude Logs/`
- **Purpose**: Maintain continuity across sessions. These logs are the primary mechanism for a new session to understand what has already been done.
- **Naming**: `YYYY-MM-DD_Session01_Progress.md` (increment session number within the same day)
- **Workflow**: At the end of each session (or when context is getting full), create/update the progress log with:
  - What was accomplished
  - What decisions were made and why
  - What is still pending or unresolved
  - Any open questions for AUTHOR_NAME
- **Read these first** when starting a new session.

---

## Project Context

- **Project**: XXXX
- **Authors**: XXXX
- **Topic**: XXXX
- **Research question**: XXXX
- **Primary dataset**: `INSERT FILE PATH`
- **Code**: R Markdown files in `Code/`
- **Paper**: LaTeX in `Paper/XXXX`
- **Key libraries**: fixest, arrow, dplyr
- **Full directory documentation**: See `README.md`

