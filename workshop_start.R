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
# Update the filename below when the workshop data file is added to the repo.
# survey <- read.csv("your-data-file.csv", na.strings = "", header = TRUE)
# cat("Data loaded:", nrow(survey), "rows,", ncol(survey), "columns\n")
