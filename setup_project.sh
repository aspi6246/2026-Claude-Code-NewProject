#!/bin/bash

# ============================================================
# setup_project.sh — Create a new empirical research project
# ============================================================
#
# Usage:
#   bash setup_project.sh <project-name> [destination-path]
#
# Examples:
#   bash setup_project.sh My-New-Paper
#   bash setup_project.sh My-New-Paper ~/Dropbox/Research
#
# If no destination path is given, the project is created in
# the current working directory.
# ============================================================
 

set -e

# ---- Parse arguments ----------------------------------------

PROJECT_NAME="$1"
DEST_DIR="${2:-.}"

if [ -z "$PROJECT_NAME" ]; then
    echo ""
    echo "Usage: bash setup_project.sh <project-name> [destination-path]"
    echo ""
    echo "Examples:"
    echo "  bash setup_project.sh Oil-Gas-Production"
    echo "  bash setup_project.sh Oil-Gas-Production ~/Dropbox/Research"
    echo ""
    exit 1
fi

PROJECT_PATH="$DEST_DIR/$PROJECT_NAME"

# ---- Check for conflicts ------------------------------------

if [ -d "$PROJECT_PATH" ]; then
    echo "Error: Directory '$PROJECT_PATH' already exists."
    echo "Choose a different name or remove the existing directory."
    exit 1
fi

# ---- Locate the template directory --------------------------
# The script looks for the templates/ folder next to itself.
# This is where CLAUDE.md and .gitignore_template live.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/templates"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Warning: No templates/ directory found at $TEMPLATE_DIR"
    echo "The project structure will be created, but CLAUDE.md"
    echo "and .gitignore will need to be added manually."
    echo ""
    HAS_TEMPLATES=false
else
    HAS_TEMPLATES=true
fi

# ---- Create directory structure ------------------------------

echo "Creating project: $PROJECT_PATH"
echo ""

mkdir -p "$PROJECT_PATH"

# Code directories
mkdir -p "$PROJECT_PATH/Code/_Archive"
mkdir -p "$PROJECT_PATH/Code/_Claude Logs"
mkdir -p "$PROJECT_PATH/Code/_Claude Scripts/_Archive"

# Data directories
mkdir -p "$PROJECT_PATH/Data/Raw"
mkdir -p "$PROJECT_PATH/Data/Processed/_Archive"

# Output directories
mkdir -p "$PROJECT_PATH/Output/Tables/_Archive"
mkdir -p "$PROJECT_PATH/Output/Figures/_Archive"

# Supporting directories
mkdir -p "$PROJECT_PATH/Literature"
mkdir -p "$PROJECT_PATH/Paper"
mkdir -p "$PROJECT_PATH/Admin"

# ---- Copy template files -------------------------------------

if [ "$HAS_TEMPLATES" = true ]; then

    # Copy CLAUDE.md and replace project name placeholder
    if [ -f "$TEMPLATE_DIR/CLAUDE.md" ]; then
        cp "$TEMPLATE_DIR/CLAUDE.md" "$PROJECT_PATH/CLAUDE.md"
        echo "  Copied CLAUDE.md template (fill in the XXXX placeholders)"
    fi

    # Copy .gitignore
    if [ -f "$TEMPLATE_DIR/gitignore_template" ]; then
        cp "$TEMPLATE_DIR/gitignore_template" "$PROJECT_PATH/.gitignore"
        echo "  Copied .gitignore"
    fi

fi

# ---- Create starter README.md --------------------------------

cat > "$PROJECT_PATH/README.md" << 'READMEEOF'
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

```
├── CLAUDE.md                  # Instructions for Claude Code sessions
├── README.md                  # This file — project overview
├── Code/
│   ├── _Archive/              # Superseded scripts
│   ├── _Claude Logs/          # Session progress logs
│   └── _Claude Scripts/       # Purled .R copies of Claude's .Rmd scripts
│       └── _Archive/
├── Data/
│   ├── Raw/                   # Original source data (read-only)
│   └── Processed/             # Cleaned and constructed datasets
│       └── _Archive/
├── Output/
│   ├── Tables/                # LaTeX tables, CSVs
│   │   └── _Archive/
│   └── Figures/               # PDFs, PNGs
│       └── _Archive/
├── Literature/                # Reference papers and documentation
├── Paper/                     # LaTeX paper and .bib files
└── Admin/                     # Notes, ideas, miscellaneous
```

## Data Sources

| Dataset | Location | Description |
|---------|----------|-------------|
| XXXX    | `Data/Raw/XXXX` | XXXX |

## Pipeline

Scripts run in numbered order:

| Script | Input | Output | Description |
|--------|-------|--------|-------------|
| `01_XXXX.Rmd` | `Data/Raw/XXXX` | `Data/Processed/XXXX` | XXXX |

## Notes

XXXX
READMEEOF

echo "  Created README.md (fill in the project details)"

# ---- Create placeholder .gitkeep files -----------------------
# Git doesn't track empty directories. These files ensure the
# directory structure is preserved when you push to GitHub.

touch "$PROJECT_PATH/Code/_Archive/.gitkeep"
touch "$PROJECT_PATH/Code/_Claude Logs/.gitkeep"
touch "$PROJECT_PATH/Code/_Claude Scripts/_Archive/.gitkeep"
touch "$PROJECT_PATH/Data/Raw/.gitkeep"
touch "$PROJECT_PATH/Data/Processed/_Archive/.gitkeep"
touch "$PROJECT_PATH/Output/Tables/_Archive/.gitkeep"
touch "$PROJECT_PATH/Output/Figures/_Archive/.gitkeep"
touch "$PROJECT_PATH/Literature/.gitkeep"
touch "$PROJECT_PATH/Paper/.gitkeep"
touch "$PROJECT_PATH/Admin/.gitkeep"

echo "  Added .gitkeep files to preserve empty directories in Git"

# ---- Summary -------------------------------------------------

echo ""
echo "================================================"
echo "  Project '$PROJECT_NAME' created successfully"
echo "  Location: $PROJECT_PATH"
echo "================================================"
echo ""
echo "Next steps:"
echo "  1. cd $PROJECT_PATH"
echo "  2. Open CLAUDE.md and fill in the XXXX placeholders"
echo "  3. Open README.md and fill in the project details"
echo "  4. git init && git add -A && git commit -m 'Initial project structure'"
echo "  5. Start Claude Code: claude"
echo ""
