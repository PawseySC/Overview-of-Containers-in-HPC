#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=courseq
#SBATCH --job-name=Container_BLAST
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load shifter

# run BLAST with containers
srun --export=all 

srun --export=all 
