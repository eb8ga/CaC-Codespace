# Workshop R Package Installation
# Installs all packages needed for the CaC-DATA workshop.
# This script is run automatically when the Codespace is created.
# You can also re-run it manually from the RStudio console if needed.

# Use Posit Package Manager for pre-compiled Linux binaries — much faster than
# building from source. The geospatial base image uses Ubuntu 22.04 (jammy).
options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/jammy/latest"))

packages <- c(
  "dplyr",           # data manipulation
  "ggplot2",         # data visualization
  "splitstackshape", # reshaping / stacking data frames
  "tidyr",           # tidying data
  "sf",              # spatial data (pre-installed in geospatial image)
  "plyr",            # data aggregation and transformation
  "scales"           # axis scales and formatting for ggplot2
)

install.packages(
  packages,
  dependencies = TRUE,
  Ncpus        = parallel::detectCores()
)

# Verify all packages load correctly
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    warning("Package failed to install: ", pkg)
  } else {
    message("OK: ", pkg)
  }
}
