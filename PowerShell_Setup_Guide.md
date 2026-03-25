# Step-by-Step: Setting Up a New Research Project on Windows (PowerShell)

Everything below uses **PowerShell**. No extra software needed beyond Git and Claude Code.

---

## Phase 1 — One-Time Setup (do this once, then never again)

### Step 1: Install Git for Windows

1. Go to https://git-scm.com/download/win
2. Download the installer and run it.
3. Accept all the default options. Click Next through everything.
4. Verify it worked: open PowerShell (search "PowerShell" in the Start menu) and type:

```powershell
git --version
```

You should see something like `git version 2.47.1.windows.1`. If you see an error, restart PowerShell and try again — it sometimes needs a fresh window to pick up newly installed programs.

### Step 2: Set up your Git identity

Still in PowerShell, run these two commands (replace with your real name and email):

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@uts.edu.au"
```

### Step 3: Allow PowerShell to run scripts

By default, Windows blocks PowerShell scripts for security. You need to relax this once. Run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

It will ask you to confirm — type `Y` and press Enter. This allows you to run scripts you've written yourself while still blocking scripts from untrusted sources.

### Step 4: Download your template repo from GitHub

```powershell
git clone https://github.com/aspi6246/2026-Claude-Code-NewProject.git "$HOME\Templates\claude-tools"
```

This downloads the repo to `C:\Users\163178\Templates\claude-tools\`.

### Step 5: Put the template files into the repo

Using File Explorer, navigate to `C:\Users\163178\Templates\claude-tools\` and arrange the files so the structure looks like this:

```
claude-tools\
├── README.md
├── PowerShell_Setup_Guide.md
├── setup_project.ps1
└── setup_project.sh
└── templates\
    ├── CLAUDE.md
    └── gitignore_template
```



### Step 6 (optional): Push the updated repo to GitHub

This step backs up your templates to GitHub. You can skip it — the setup script works entirely on your local machine. But if you want a backup or to use the templates on another computer:

```powershell
cd "$HOME\Templates\claude-tools"
git add -A
git commit -m "Add project setup script and templates"
git push
```

**You're done with one-time setup.**

---

## Phase 2 — Creating a New Project (repeat this each time)

### Step 7: Open PowerShell

Search "PowerShell" in the Windows Start menu and open it.

### Step 8: Run the setup script

```powershell
& "$HOME\Templates\claude-tools\setup_project.ps1" -ProjectName "My-New-Paper" -DestPath "C:\Users\163178\Dropbox\1. Projects with Claude access"
```

This creates the full project at:
`C:\Users\163178\Dropbox\1. Projects with Claude access\My-New-Paper\`

with all folders, CLAUDE.md, README.md, and .gitignore ready to go.

**Note on the project name:** Use hyphens or underscores, not spaces. `My-New-Paper` is good. `My New Paper` will cause problems.

### Step 9: Fill in the placeholders

Open `CLAUDE.md` in the new project folder (RStudio, VS Code, or even Notepad all work) and replace:
- Every `XXXX` with real project details
- Every `AUTHOR_NAME` with your name
- Every `INSERT` with actual file paths

Do the same for `README.md`.

### Step 10: Initialise Git

```powershell
cd "C:\Users\163178\Dropbox\1. Projects with Claude access\My-Oil-Gas-Paper"
git init
git add -A
git commit -m "Initial project structure"
```

### Step 11: Start Claude Code

```powershell
claude
```

Claude reads your CLAUDE.md automatically. You're working.

---

## The Short Version (once everything is set up)

Every time you start a new project, it's just:

```powershell
# Create the project
& "$HOME\Templates\claude-tools\setup_project.ps1" -ProjectName "New-Project-Name" -DestPath "C:\Users\163178\Dropbox\1. Projects with Claude access"

# Fill in CLAUDE.md and README.md placeholders in your text editor

# Initialise Git
cd "C:\Users\163178\Dropbox\1. Projects with Claude access\New-Project-Name"
git init; git add -A; git commit -m "Initial project structure"

# Start working
claude
```

---

## Troubleshooting

**"running scripts is disabled on this system"**
You skipped Step 3. Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

**"git is not recognized"**
Git isn't installed, or PowerShell was already open when you installed it. Install Git (Step 1), then close and reopen PowerShell.

**"claude is not recognized"**
Claude Code isn't installed. See https://docs.anthropic.com/en/docs/claude-code/overview for installation instructions.

**The script says the directory already exists**
You've already created a project with that name in that location. Either choose a different name or delete the existing folder first.
