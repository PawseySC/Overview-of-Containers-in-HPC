#!/bin/bash --login

module load shifter

# download sample data
wget http://swcarpentry.github.io/r-novice-inflammation/data/r-novice-inflammation-data.zip
unzip -q r-novice-inflammation-data.zip

# pull container
sg $PAWSEY_PROJECT -c 'shifter pull rocker/rstudio:3.5.1'
