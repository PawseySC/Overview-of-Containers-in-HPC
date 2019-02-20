#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=courseq
#SBATCH --job-name=Container_R_SC
#SBATCH --time=03:00:00
#SBATCH --export=NONE

module load shifter

# run Rscript via a container
srun --export=all shifter run bskjerven/oz_sc:latest Rscript SC_Rscript.r
