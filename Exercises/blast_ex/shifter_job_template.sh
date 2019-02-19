#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=onlinecourse
#SBATCH --job-name=Container_BLAST
#SBATCH --time=00:10:00
#SBATCH --export=NONE

module load shifter

# run BLAST with containers
srun --export=all 

srun --export=all 