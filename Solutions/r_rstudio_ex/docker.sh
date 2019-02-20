#!/bin/bash

# download sample data
wget http://swcarpentry.github.io/r-novice-inflammation/data/r-novice-inflammation-data.zip
unzip -q r-novice-inflammation-data.zip

# pull the R container
docker pull rocker/rstudio:3.5.1

# run the R script
docker run --rm -v `pwd`:/data -w /data rocker/rstudio:3.5.1 Rscript readings-06.R --mean data/inflammation-*.csv
