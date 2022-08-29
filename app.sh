#!/bin/bash

# create local user library path (if not already present)
R -e 'dir.create(path = Sys.getenv("R_LIBS_USER"), showWarnings = FALSE, recursive = TRUE)'

# install dependencies..
R -e 'install.packages("shiny", lib = Sys.getenv("R_LIBS_USER"))'
R -e 'install.packages("logger", lib = Sys.getenv("R_LIBS_USER"))'
R -e 'install.packages(c("ggExtra", "rmarkdown"), lib = Sys.getenv("R_LIBS_USER"))'
R -e 'install.packages("shidashi", lib = Sys.getenv("R_LIBS_USER"))'

# try to establish which environment we are running in
runenv = "UNKNOWN"
runpath=$(pwd)
if [[ "$GITPOD_REPO_ROOT" != "" ]]; then
  echo "Running in GITPOD environment"
  runenv = "GITPOD"
  runpath = $GITPOD_REPO_ROOT
fi
if [[ "$DOMINO_WORKING_DIR" != "" ]]; then
  echo "Running in DOMINO environment"
  runenv = "DOMINO"
  runpath = $DOMINO_WORKING_DIR
fi

# START SHINY APP
R -e 'shiny::runApp(file.path(Sys.getenv("runpath"),"src"), port=8888, host="0.0.0.0")'