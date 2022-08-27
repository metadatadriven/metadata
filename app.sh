#!/bin/bash

# install dependencies..
R -e 'install.packages("logger")'
R -e 'install.packages(c("ggExtra", "rmarkdown"))'
R -e 'install.packages("shidashi")'

# START SHINY APP
R -e 'shiny::runApp("./src", port=8888, host="0.0.0.0")'