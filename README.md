# rocker-CmdStanR

A docker image for Bayesian modelling with Stan using the `cmdstanr` and `brms` R packages.
The image is based on the [rocker:tidyverse](https://rocker-project.org/images/versioned/rstudio.html) image which contains R, devtools, tidyverse, data.table, and Rstudio.
This image adds the Stan software along with the `cmdstanr`, `brms`, `tidybayes` `bayesplot` R packages.

## Instalation

This image can be built locally using:

```bash
docker build -t rocker-cmstanr https://github.com/willvieira/rocker-cmdstanr.git#main
```

The "rocker-cmdstanr" image should appear in the list of local images if the installation was successful:

```bash
docker images
```

## Usage

To run the docker image using the Rstudio server:

```bash
docker run --rm -ti -v $(pwd):/home/rstudio -e DISABLE_AUTH=true -p 127.0.0.1:8787:8787 rocker-cmdstanr
```

The running Rstudio enviroment will be available at the address [`localhost:8787`](http://localhost:8787/).

Note that the flag `-v $(pwd):/home/rstudio` is required to sync the container with the local working directory.
