FROM rocker/tidyverse:4.2.2

LABEL maintainer = 'Willian Vieira'

# Missing libraries
RUN apt-get update && apt-get install -y \
    libglpk40

# where to install cmdstan
ENV CMDSTAN /usr/share/.cmdstan
RUN mkdir -p ${CMDSTAN}

# Install cmdstanr R package
RUN Rscript -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")));'

# Install cmdstan
RUN Rscript -e 'library(cmdstanr); install_cmdstan(dir = Sys.getenv("CMDSTAN"), cores = 2)'

# Install extra R packages
RUN install2.r --error --skipinstalled brms tidybayes bayesplot
