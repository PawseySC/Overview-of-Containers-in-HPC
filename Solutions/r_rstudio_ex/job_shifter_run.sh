#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=onlinecourse
#SBATCH --job-name=Container_R
#SBATCH --time=03:00:00
#SBATCH --export=NONE

module load shifter

# run Rscript via a container
srun --export=all shifter run bskjerven/oz_sc:latest Rscript SC_Rscript.r
