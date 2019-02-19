#!/bin/bash

# pull the R container
docker pull bskjerven/oz_sc:latest

# run the R script
docker run --rm -v `pwd`:/data -w /data bskjerven/oz_sc:latest Rscript SC_Rscript.r
