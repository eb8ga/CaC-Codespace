# Workshop R Package Installation
# Installs all packages needed for the CaC-DATA workshop.
# This script is run automatically when the Codespace is created.
# You can also re-run it manually from the RStudio console if needed.

packages <- c(
  "dplyr",           # data manipulation
  "ggplot2",         # data visualization
  "splitstackshape", # reshaping / stacking data frames
  "tidyr",           # tidying data
  "sf",              # spatial data (requires GDAL/GEOS/PROJ system libraries)
  "plyr",            # data aggregation and transformation
  "scales"           # axis scales and formatting for ggplot2
)

install.packages(
  packages,
  repos      = "https://cran.rstudio.com/",
  dependencies = TRUE,
  Ncpus      = parallel::detectCores()
)

# Verify all packages load correctly
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    warning("Package failed to install: ", pkg)
  } else {
    message("OK: ", pkg)
  }
}
