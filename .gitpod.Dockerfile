# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
# Ubuntu 20.04.4 LTS
FROM gitpod/workspace-full:2022-08-26-10-53-43
##FROM r-base:4.2.1

# Install R
# https://linuxize.com/post/how-to-install-r-on-ubuntu-20-04/

# Install the dependencies necessary to add a new repository over HTTPS:
RUN sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y

# Add the CRAN repository to your system sources’ list:
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
RUN sudo apt-get update

# Install R
RUN sudo apt-get install r-base -y

# Install build-essential to be able to compile packages
RUN sudo apt install build-essential -y

# Install language server to support vscode extension
RUN sudo R -e 'install.packages("languageserver", repos="https://cloud.r-project.org/")'