#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=courseq
#SBATCH --job-name=Container_R
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load shifter

# run Rscript via a container
srun --export=all shifter run rocker/rstudio:3.5.1 Rscript readings-06.R --mean data/inflammation-*.csv
