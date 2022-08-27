#!/bin/bash

# create local user library path (if not already present)
R -e 'dir.create(path = Sys.getenv("R_LIBS_USER"), showWarnings = FALSE, recursive = TRUE)'

# install dependencies..
R -e 'install.packages("shiny", lib = Sys.getenv("R_LIBS_USER"))'
R -e 'install.packages("logger", lib = Sys.getenv("R_LIBS_USER"))'
R -e 'install.packages(c("ggExtra", "rmarkdown"), lib = Sys.getenv("R_LIBS_USER"))'
R -e 'install.packages("shidashi", lib = Sys.getenv("R_LIBS_USER"))'

# START SHINY APP
R -e 'shiny::runApp("./src", port=8888, host="0.0.0.0")'