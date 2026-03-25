# ============================================================
# setup_project.ps1 — Create a new empirical research project
# ============================================================
#
# Usage:
#   .\setup_project.ps1 -ProjectName <name> [-DestPath <path>]
#
# Examples:
#   .\setup_project.ps1 -ProjectName "My-New-Paper"
#   .\setup_project.ps1 -ProjectName "My-New-Paper" -DestPath "C:\Users\YourName\Dropbox\Research"
#
# If no destination path is given, the project is created in
# the current directory.
# ============================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectName,

    [Parameter(Mandatory=$false)]
    [string]$DestPath = "."
)

# ---- Build full project path ---------------------------------

$ProjectPath = Join-Path $DestPath $ProjectName

# ---- Check for conflicts -------------------------------------

if (Test-Path $ProjectPath) {
    Write-Host ""
    Write-Host "Error: Directory '$ProjectPath' already exists." -ForegroundColor Red
    Write-Host "Choose a different name or remove the existing directory."
    exit 1
}

# ---- Locate the template directory ---------------------------
# The script looks for the templates\ folder next to itself.

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$TemplateDir = Join-Path $ScriptDir "templates"

$HasTemplates = Test-Path $TemplateDir
if (-not $HasTemplates) {
    Write-Host "Warning: No templates\ directory found at $TemplateDir" -ForegroundColor Yellow
    Write-Host "The project structure will be created, but CLAUDE.md"
    Write-Host "and .gitignore will need to be added manually."
    Write-Host ""
}

# ---- Create directory structure ------------------------------

Write-Host ""
Write-Host "Creating project: $ProjectPath"
Write-Host ""

# Code directories
New-Item -ItemType Directory -Path "$ProjectPath\Code\_Archive" -Force | Out-Null
New-Item -ItemType Directory -Path "$ProjectPath\Code\_Claude Logs" -Force | Out-Null
New-Item -ItemType Directory -Path "$ProjectPath\Code\_Claude Scripts\_Archive" -Force | Out-Null

# Data directories
New-Item -ItemType Directory -Path "$ProjectPath\Data\Raw" -Force | Out-Null
New-Item -ItemType Directory -Path "$ProjectPath\Data\Processed\_Archive" -Force | Out-Null

# Output directories
New-Item -ItemType Directory -Path "$ProjectPath\Output\Tables\_Archive" -Force | Out-Null
New-Item -ItemType Directory -Path "$ProjectPath\Output\Figures\_Archive" -Force | Out-Null

# Supporting directories
New-Item -ItemType Directory -Path "$ProjectPath\Literature" -Force | Out-Null
New-Item -ItemType Directory -Path "$ProjectPath\Paper" -Force | Out-Null
New-Item -ItemType Directory -Path "$ProjectPath\Admin" -Force | Out-Null

# ---- Copy template files -------------------------------------

if ($HasTemplates) {

    $ClaudeMdTemplate = Join-Path $TemplateDir "CLAUDE.md"
    if (Test-Path $ClaudeMdTemplate) {
        Copy-Item $ClaudeMdTemplate -Destination "$ProjectPath\CLAUDE.md"
        Write-Host "  Copied CLAUDE.md template (fill in the XXXX placeholders)"
    }

    $GitignoreTemplate = Join-Path $TemplateDir "gitignore_template"
    if (Test-Path $GitignoreTemplate) {
        Copy-Item $GitignoreTemplate -Destination "$ProjectPath\.gitignore"
        Write-Host "  Copied .gitignore"
    }
}

# ---- Create starter README.md --------------------------------

$ReadmeContent = @"
# Project: XXXX

## Research Question

XXXX

## Authors

- XXXX

## Status

- [ ] Data cleaning
- [ ] Summary statistics
- [ ] Main estimation
- [ ] Robustness checks
- [ ] Paper draft
- [ ] Submission

## Directory Structure

``````
├── CLAUDE.md                  # Instructions for Claude Code sessions
├── README.md                  # This file — project overview
├── Code\
│   ├── _Archive\              # Superseded scripts
│   ├── _Claude Logs\          # Session progress logs
│   └── _Claude Scripts\       # Purled .R copies of Claude's .Rmd scripts
│       └── _Archive\
├── Data\
│   ├── Raw\                   # Original source data (read-only)
│   └── Processed\             # Cleaned and constructed datasets
│       └── _Archive\
├── Output\
│   ├── Tables\                # LaTeX tables, CSVs
│   │   └── _Archive\
│   └── Figures\               # PDFs, PNGs
│       └── _Archive\
├── Literature\                # Reference papers and documentation
├── Paper\                     # LaTeX paper and .bib files
└── Admin\                     # Notes, ideas, miscellaneous
``````

## Data Sources

| Dataset | Location | Description |
|---------|----------|-------------|
| XXXX    | ``Data\Raw\XXXX`` | XXXX |

## Pipeline

Scripts run in numbered order:

| Script | Input | Output | Description |
|--------|-------|--------|-------------|
| ``01_XXXX.Rmd`` | ``Data\Raw\XXXX`` | ``Data\Processed\XXXX`` | XXXX |


## Paper Workflow
The active paper lives in `Paper/`, which is a Git clone of:

```
INSERT LINK
```
This repository is linked to Overleaf. The workflow is:

1. Edit `.tex` files in `Paper/...`
2. `git add` + `git commit` + `git push` to GitHub
3. Changes automatically sync to Overleaf


## Notes

XXXX
"@

Set-Content -Path "$ProjectPath\README.md" -Value $ReadmeContent -Encoding UTF8
Write-Host "  Created README.md (fill in the project details)"

# ---- Create .gitkeep files -----------------------------------

$GitkeepDirs = @(
    "Code\_Archive",
    "Code\_Claude Logs",
    "Code\_Claude Scripts\_Archive",
    "Data\Raw",
    "Data\Processed\_Archive",
    "Output\Tables\_Archive",
    "Output\Figures\_Archive",
    "Literature",
    "Paper",
    "Admin"
)

foreach ($dir in $GitkeepDirs) {
    New-Item -ItemType File -Path "$ProjectPath\$dir\.gitkeep" -Force | Out-Null
}

Write-Host "  Added .gitkeep files to preserve empty directories in Git"

# ---- Summary -------------------------------------------------

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "  Project '$ProjectName' created successfully" -ForegroundColor Green
Write-Host "  Location: $ProjectPath" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. cd `"$ProjectPath`""
Write-Host "  2. Open CLAUDE.md and fill in the XXXX placeholders"
Write-Host "  3. Open README.md and fill in the project details"
Write-Host "  4. git init; git add -A; git commit -m 'Initial project structure'"
Write-Host "  5. Start Claude Code: claude"
Write-Host ""
