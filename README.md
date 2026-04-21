# Coding Across The Curriculum - Workshop Environment

This repository contains a pre-configured RStudio environment for the CaC workshop. Participants launch it as a GitHub Codespace — no local R or RStudio installation required. Everyone works in an identical environment with all packages pre-installed.

---

## For Facilitators: One-Time Repository Setup

Before the workshop, the repository needs to be structured correctly on GitHub.

### Required folder structure

```
repo-root/
├── .devcontainer/
│   └── devcontainer.json
├── .Rprofile
├── install.R
├── workshop_start.R
├── SurveyOverview.Rmd
├── Results 1.5.26.csv
└── README.md
```

> **Important:** `devcontainer.json` must live inside a `.devcontainer/` folder at the repo root. GitHub will not detect it otherwise.

### Steps

1. Create a new GitHub repository (public or private — both work with Codespaces)
2. Upload all files from this folder to the repo root
3. Create a `.devcontainer/` folder in the repo and move `devcontainer.json` into it
4. Push to the `main` branch

### Optional but recommended: Enable Prebuilds

Without prebuilds, each participant waits ~10 minutes for R packages to install when they first open their Codespace. Prebuilds eliminate this wait.

To enable: **Repo → Settings → Codespaces → Set up prebuild**

Run a prebuild manually before the workshop day. It will re-run automatically on every push to `main`.

---

## For Participants: Launching the Environment

1. Go to the GitHub repository
2. Click the green **Code** button → **Codespaces** tab → **Create codespace on main**
3. Wait for the environment to build (first time only: ~10 minutes without prebuilds, ~30 seconds with)
4. RStudio will open automatically in your browser

### Login credentials

| Field | Value |
|---|---|
| Username | `rstudio` |
| Password | `workshop2026` |

### Getting started

Once RStudio opens, run `workshop_start.R` first. It loads all packages and the workshop dataset in the correct order. You can open it from the **Files** pane (bottom-right) or run this in the Console:

```r
source("workshop_start.R")
```

You should see: `Data loaded: X rows, Y columns`

---

## Installed Packages

All packages are installed automatically when the Codespace is created.

| Package | Purpose |
|---|---|
| `plyr` | Data aggregation and transformation |
| `dplyr` | Data manipulation |
| `ggplot2` | Data visualization |
| `tidyr` | Tidying and reshaping data |
| `splitstackshape` | Stacking and reshaping data frames |
| `scales` | Axis scales and formatting for ggplot2 |
| `sf` | Spatial data handling |

---

## Important Caveats

### Package load order: `plyr` before `dplyr`

`plyr` and `dplyr` share function names (`filter`, `mutate`, `summarize`, etc.). Whichever package loads last takes priority, silently overriding the other. **`plyr` must always be loaded before `dplyr`.**

`workshop_start.R` and `SurveyOverview.Rmd` both load packages in the correct order. If participants write their own scripts, remind them to follow this order:

```r
library(plyr)   # first
library(dplyr)  # second
```

### Codespace inactivity timeout

Codespaces stop automatically after **30 minutes of inactivity**. Participants should save their work regularly using **File → Save** in RStudio. To download a file to their local machine: **Files pane → check the file → More → Export**.

### Working directory

The `.Rprofile` in this repo automatically sets the working directory to the repo root when RStudio opens. This means `read.csv("Results 1.5.26.csv")` works without any path changes.

### Each participant gets their own environment

Every participant has an isolated Codespace. Changes one person makes do not affect others. Participants can freely experiment without breaking anything.

### `sf` and coordinate reference systems

If participants load spatial data that does not have a coordinate reference system (CRS) defined, functions like `st_transform()` will fail. Check with `st_crs(your_object)` and set if needed.

---

## Files Reference

| File | Purpose |
|---|---|
| `.devcontainer/devcontainer.json` | Defines the Codespace environment (R version, RStudio, packages) |
| `install.R` | Installs all R packages — runs automatically on Codespace creation |
| `workshop_start.R` | Participant-facing startup script — loads packages and data |
| `.Rprofile` | Sets working directory automatically when RStudio opens |
| *(workshop files to be added)* | Analysis scripts and datasets |
