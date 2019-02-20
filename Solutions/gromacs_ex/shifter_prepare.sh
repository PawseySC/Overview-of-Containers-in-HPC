#!/bin/bash

module load shifter

# download sample input files
wget ftp://ftp.gromacs.org/pub/benchmarks/water_GMX50_bare.tar.gz
tar xzf water_GMX50_bare.tar.gz
cp water-cut1.0_GMX50_bare/1536/* .

# pull container
sg $PAWSEY_PROJECT -c 'shifter pull --login nvcr.io/hpc/gromacs:2018.2'
