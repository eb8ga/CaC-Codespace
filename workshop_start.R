# ============================================================
#  CaC-DATA Workshop — Start Here
#  Run this script first at the beginning of every session.
# ============================================================

# --- Load packages (order matters: plyr must come before dplyr) -------------
library(plyr)            # must load before dplyr to avoid function conflicts
library(dplyr)
library(ggplot2)
library(tidyr)
library(splitstackshape)
library(scales)
library(sf)

# --- Load the workshop dataset ----------------------------------------------
survey <- read.csv("Results 1.5.26.csv", na.strings = "", header = TRUE)

# Quick check — should print number of rows and columns
cat("Data loaded:", nrow(survey), "rows,", ncol(survey), "columns\n")
